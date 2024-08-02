FROM python:3.12-slim

RUN apt update && \
    apt upgrade -y && \
    apt install -y \
        ffmpeg && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /root/.cache/

RUN pip install -U spotdl yt-dlp

# Create music directory
RUN mkdir /music

# Create a volume for the output directory
VOLUME /music

# Change CWD to /music
WORKDIR /music

# Entrypoint command
ENTRYPOINT ["python3", "-m", "spotdl"]
