FROM mgahan/plumber
LABEL maintainer="mgahan"
RUN ["install2.r", "-r 'https://cloud.r-project.org'", "knitr"]
RUN ["installGithub.r", "mgahan/SeatGeekR"]
WORKDIR /payload/
COPY [".", "./"]

EXPOSE 8080
ENTRYPOINT ["R", "-e", "pr <- plumber::plumb('schedule.R'); pr$run(host='0.0.0.0', port=8080)"]
CMD ["schedule.R"]

# docker build -t metabiota/seatgeek .
#docker run -p 8080:8081 -d \
#-e GCE_SERVICE_ACCOUNT="mike@mike-personal.iam.gserviceaccount.com" \
#-e GCE_AUTH_FILE="mike-mike-personal.json" \
#-e SEATGEEK_CLIENT_ID="BLAHBLAHBALH" \
#-e SEATGEEK_CLIENT_SECRET="BLAHBLAHBALH" \
#-e TZ="America/Los_Angeles" metabiota/seatgeek