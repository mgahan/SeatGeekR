FROM mgahan/plumber
LABEL maintainer="mgahan"
RUN ["install2.r", "-r 'https://cloud.r-project.org'", "knitr"]
RUN ["installGithub.r", "mgahan/SeatGeekR"]
WORKDIR /payload/
COPY [".", "./"]

EXPOSE 8080
ENTRYPOINT ["R", "-e", "pr <- plumber::plumb('schedule.R'); pr$run(host='0.0.0.0', port=8080)"]
CMD ["schedule.R"]

# docker build -t mgahan/seatgeek .
#docker run -p 8081:8080 -d --restart always \
#-e GCE_SERVICE_ACCOUNT="mike-personal-account@mike-personal.iam.gserviceaccount.com" \
#-e GCE_AUTH_FILE="mike-personal-3567894f5d77.json" \
#-e SEATGEEK_CLIENT_ID="blah" \
#-e SEATGEEK_CLIENT_SECRET="blah" \
#-e TZ="America/Los_Angeles" mgahan/seatgeek
