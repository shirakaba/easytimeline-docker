
# We use an older version of Linux purely to get a system-wide version
# of Perl old enough to support the deprecated `defined(@array)` usages.
FROM ubuntu:14.04
LABEL org.opencontainers.image.authors="Jamie Birch"

RUN apt-get update \
  && apt-get install --yes libtime-local-perl \
  && apt-get autoremove --yes \
  && rm -rf /var/lib/apt/lists/* \
  && mkdir -vp /root/input /root/output

COPY easytimeline/EasyTimeline.pl /root/EasyTimeline.pl
COPY ploticus/pl /usr/local/bin/pl

WORKDIR /root

# -X is to suppress the warning for `defined(@array)` usages.
CMD ["perl", "-X", "EasyTimeline.pl"]
