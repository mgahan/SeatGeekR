FROM trestletech/plumber

LABEL maintainer="mgahan"

## Update & upgrade
RUN apt-get update && \
    apt-get upgrade -y

RUN export DEBIAN_FRONTEND=noninteractive; apt-get -y update \
 && apt-get install -y libcairo2-dev \
	libcurl4-openssl-dev \
	libgmp-dev \
	libpng-dev \
	libssl-dev \
	libxml2-dev \
	make \
	pandoc \
	pandoc-citeproc \
	zlib1g-dev \
	less \
  man \
  python \
  python-pip \
  python-virtualenv \
  nano \
  lzop \
  openssl \
  sudo \
  gdebi-core \
  pandoc \
  pandoc-citeproc \
  curl \
  p7zip-full \
  pigz
  
RUN ["install2.r", "-r 'https://cloud.r-project.org'", "readr", "googleCloudStorageR", "Rcpp", "digest", "crayon", "withr", "mime", "R6", "jsonlite", "xtable", "magrittr", "httr", "curl", "testthat", "devtools", "hms", "shiny", "httpuv", "memoise", "htmltools", "openssl", "tibble", "remotes", "rtweet", "anytime"]

RUN ["installGithub.r", "MarkEdmondson1234/googleAuthR", "tidyverse/rlang", "Rdatatable/data.table"]

# Set timezone
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Install Google Cloud Kit
RUN curl -sSL https://sdk.cloud.google.com | bash
ENV PATH $PATH:/root/google-cloud-sdk/bin

# Install AWS CLI
ENV PYTHONIOENCODING=UTF-8
RUN pip install awscli

# So nano and top work
RUN export TERM=xterm

CMD ["/bin/bash"]

# docker build -t mgahan/plumber .
# docker push mgahan/plumber
