FROM python:3.10
WORKDIR /vsu

RUN apt-get update && \
    apt-get -y install cron \
    poppler-utils \
    libsm6 \
    libxext6 \
    libgl1 \
    tesseract-ocr

COPY requirements.txt .
RUN pip3 install -r requirements.txt
RUN python -m pip install 'git+https://github.com/facebookresearch/detectron2.git'

COPY . .

RUN echo "00 * * * * /vsu/ingest.sh > /proc/1/fd/1 2>&1" > /etc/cron.d/vsu && \
    chmod 0644 /etc/cron.d/vsu && \
    crontab /etc/cron.d/vsu

ENTRYPOINT [ "/vsu/entrypoint.sh" ]