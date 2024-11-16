FROM chambm/pwiz-skyline-i-agree-to-the-vendor-licenses

RUN apt-get update && apt-get install -yq parallel

COPY ./ /
