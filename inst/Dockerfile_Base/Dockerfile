FROM trestletech/plumber
LABEL maintainer="mgahan"
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
	zlib1g-dev
RUN ["install2.r", "-r 'https://cloud.r-project.org'", "readr", "googleCloudStorageR", "Rcpp", "digest", "crayon", "withr", "mime", "R6", "jsonlite", "xtable", "magrittr", "httr", "curl", "testthat", "devtools", "hms", "shiny", "httpuv", "memoise", "htmltools", "openssl", "tibble", "remotes", "rtweet", "anytime"]
RUN ["installGithub.r", "MarkEdmondson1234/googleAuthR", "tidyverse/rlang", "Rdatatable/data.table"]ls
CMD ["/bin/bash"]

# docker build -t mgahan/plumberbase .
# docker push mgahan/plumberbase