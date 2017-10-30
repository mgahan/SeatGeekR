FROM mgahan/plumberbase
LABEL maintainer="mgahan"
RUN ["installGithub.r", "mgahan/SeatGeekR"]
WORKDIR /payload/
COPY [".", "./"]

EXPOSE 8080
ENTRYPOINT ["R", "-e", "pr <- plumber::plumb(commandArgs()[4]); pr$run(host='0.0.0.0', port=8080)"]
CMD ["schedule.R"]