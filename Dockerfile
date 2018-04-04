FROM golang:1.10-alpine3.7 AS build

# Setting the Maintainer
LABEL maintainer "Richard11.Lowery@nttdata.com"

# Copy all project nd build it
# This results in a single layer image
COPY ./bin/* /bin
ENTRYPOINT ["/bin/hello"]
CMD ["version"]
