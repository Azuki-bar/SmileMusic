FROM python:3.10.2-buster
USER root

ENV SMILEMUSIC_PREFIX=?
ENV SMILEMUSIC_ENV=Prod

ENV TZ JST-9

COPY ./requirements.txt /opt
COPY ./python /opt
WORKDIR /opt

RUN apt-get update --no-install-recommends && apt-get install -y libpq-dev ffmpeg
RUN pip install -r requirements.txt

CMD ["python", "smile_music.py"]
