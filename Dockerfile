FROM ubuntu:latest
LABEL authors="bprado"

ENTRYPOINT ["top", "-b"]