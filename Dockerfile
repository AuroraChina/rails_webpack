FROM ruby:2.3
MAINTAINER Aurora System <it@aurora-system.com>

# see update.sh for why all "apt-get install"s have to stay as one long line
ENV PYTHON_VERSION 3.6.2
# Bundle
COPY ./Gemfile Gemfile
COPY ./Gemfile.lock Gemfile.lock

ENV GPG_KEY 0D96DF4D4110E5C43FBFB17F2D347EA6AA65421D

# if this is called "PIP_VERSION", pip explodes with "ValueError: invalid truth value '<VERSION>'"
ENV PYTHON_PIP_VERSION 9.0.1

RUN set -ex \
	&& buildDeps=' \
		dpkg-dev \
		tcl-dev \
		tk-dev \
	' \
	&& apt-get update && apt-get install -y $buildDeps --no-install-recommends && rm -rf /var/lib/apt/lists/* \
	\
	&& wget -O python.tar.xz "https://www.python.org/ftp/python/${PYTHON_VERSION%%[a-z]*}/Python-$PYTHON_VERSION.tar.xz" \
	&& wget -O python.tar.xz.asc "https://www.python.org/ftp/python/${PYTHON_VERSION%%[a-z]*}/Python-$PYTHON_VERSION.tar.xz.asc" \
  	&& export GNUPGHOME="$(mktemp -d)" \
	&& gpg --keyserver ha.pool.sks-keyservers.net --recv-keys "$GPG_KEY" \
	&& gpg --batch --verify python.tar.xz.asc python.tar.xz \
	&& rm -rf "$GNUPGHOME" python.tar.xz.asc \
	&& mkdir -p /usr/src/python \
	&& tar -xJC /usr/src/python --strip-components=1 -f python.tar.xz \
	&& rm python.tar.xz \
	\
	&& cd /usr/src/python \
	&& gnuArch="$(dpkg-architecture --query DEB_BUILD_GNU_TYPE)" \
	&& ./configure \
		--build="$gnuArch" \
		--enable-loadable-sqlite-extensions \
		--enable-shared \
		--with-system-expat \
		--with-system-ffi \
		--without-ensurepip \
	&& make -j "$(nproc)" \
	&& make install \
	&& ldconfig \
	\
	&& apt-get purge -y --auto-remove $buildDeps \
	\
	&& find /usr/local -depth \
		\( \
			\( -type d -a \( -name test -o -name tests \) \) \
			-o \
			\( -type f -a \( -name '*.pyc' -o -name '*.pyo' \) \) \
		\) -exec rm -rf '{}' + \
	&& rm -rf /usr/src/python &&\
##
# make some useful symlinks that are expected to exist
  cd /usr/local/bin \
	&& ln -s idle3 idle \
	&& ln -s pydoc3 pydoc \
	&& ln -s python3 python \
	&& ln -s python3-config python-config &&\

  set -ex; \
	\
	wget -O get-pip.py 'https://bootstrap.pypa.io/get-pip.py'; \
	\
	python get-pip.py \
		--disable-pip-version-check \
		--no-cache-dir \
		"pip==$PYTHON_PIP_VERSION" \
	; \
	pip --version; \
	\
	find /usr/local -depth \
		\( \
			\( -type d -a \( -name test -o -name tests \) \) \
			-o \
			\( -type f -a \( -name '*.pyc' -o -name '*.pyo' \) \) \
		\) -exec rm -rf '{}' +; \
	rm -f get-pip.py &&\
  
  apt-get update && apt-get install -y bzip2 nodejs && \
  # see http://guides.rubyonrails.org/command_line.html#rails-dbconsole
  apt-get update && apt-get install -y mysql-client postgresql-client sqlite3 --no-install-recommends && \

  curl -sL https://deb.nodesource.com/setup_6.x | bash - && apt-get install -y nodejs --no-install-recommends && \
  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg |  apt-key add - && \
  echo "deb https://dl.yarnpkg.com/debian/ stable main" |  tee /etc/apt/sources.list.d/yarn.list && \
  apt-get update && apt-get install yarn --no-install-recommends && \
  # Libzmq3-dev, for MySQL
  apt-get update && apt-get install -y libzmq3-dev --no-install-recommends && \
  # install dependencies
  apt-get update && apt-get install -y \
    python-tk && \
    rm -rf /var/lib/apt/lists/* &&\
  # install python-pptx
  pip install python-pptx &&\
  pip install numpy &&\
  pip install matplotlib &&\

  #install phantomjs
  npm install -g phantomjs &&\
  # bundler
  gem install bundler --no-doc --no-ri && \
  # add libreoffice
  # apt-get update && apt-get -y -q install libreoffice libreoffice-writer ure libreoffice-java-common libreoffice-core libreoffice-common openjdk-7-jre fonts-opensymbol hyphen-fr hyphen-de hyphen-en-us hyphen-it hyphen-ru fonts-dejavu fonts-dejavu-core fonts-dejavu-extra fonts-droid fonts-dustin fonts-f500 fonts-fanwood fonts-freefont-ttf fonts-liberation fonts-lmodern fonts-lyx fonts-sil-gentium fonts-texgyre fonts-tlwg-purisa && apt-get -q -y remove libreoffice-gnome &&\
  # add libreoffice
  apt-get update && apt-get -y -q install libreoffice libreoffice-writer ure libreoffice-java-common libreoffice-core libreoffice-common openjdk-7-jre fonts-opensymbol hyphen-fr hyphen-de hyphen-en-us hyphen-it hyphen-ru fonts-dejavu fonts-dejavu-core fonts-dejavu-extra fonts-droid fonts-dustin fonts-f500 fonts-fanwood fonts-freefont-ttf fonts-liberation fonts-lmodern fonts-lyx fonts-sil-gentium fonts-texgyre fonts-tlwg-purisa && apt-get -q -y remove libreoffice-gnome &&\
  wget -O libreoffice.tar.gz 'http://free.nchc.org.tw/tdf/libreoffice/stable/5.4.2/deb/x86_64/LibreOffice_5.4.2_Linux_x86-64_deb.tar.gz' &&\
  tar -xvf libreoffice.tar.gz &&\
  cd cd LibreOffice_5.4.2.2_Linux_x86-64_deb/DEBS &&\
  dpkg -i *.deb &&\
  # clean
  apt-get clean && rm -rf /var/lib/apt/lists/* && \
  bundle install && \
  yarn install && \
  mkdir -p /app/


WORKDIR /app


# yarn install
COPY ./yarn.lock /app/yarn.lock
COPY ./package.json /app/package.json

RUN \
  cd /app && \
  yarn install

