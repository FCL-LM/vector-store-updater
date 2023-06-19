FROM python:3.10
WORKDIR /vsu

RUN apt-get update && \
    apt-get -y install cron

COPY requirements.txt .
RUN pip3 install -r requirements.txt

COPY . .

RUN echo "51 * * * * /vsu/ingest.sh > /proc/1/fd/1 2>&1" > /etc/cron.d/vsu && \
    chmod 0644 /etc/cron.d/vsu && \
    crontab /etc/cron.d/vsu

ENTRYPOINT [ "/vsu/entrypoint.sh" ]