FROM openjdk:11
# Copy fat-jar
ADD tools/cqlsh-6.8.3-bin.tar.gz /usr/lib/dgig/cqlsh
ADD tools/dsbulk-1.7.0.tar.gz /usr/lib/dgig/dsbulk
COPY ./common /usr/lib/dgig/common
COPY ./migrations /usr/lib/dgig/migrations
# Run task-executor
CMD tail -f /dev/null