FROM python:3.10
WORKDIR /vsu

RUN apt-get update && \
    apt-get -y install cron

COPY . .
RUN pip install -r requirements.txt

RUN cp vsu-cron /etc/cron.d/ && \
    crontab /etc/cron.d/vsu-cron

ENTRYPOINT [ "cron", "-f" ]