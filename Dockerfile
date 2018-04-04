FROM golang:1.10.1-alpine3.7 AS build

# Setting the Maintainer
LABEL maintainer "Richard11.Lowery@nttdata.com"

# Install tools required to build the project
# We need to run 'docker build --no-cache .` to update those dependencies

RUN apk add --no-cache git
RUN apk add --no-cache make
RUN go get github.com/golang/dep/cmd/dep
RUN go get -u golang.org/x/lint/golint
RUN go get -u github.com/DATA-DOG/godog/...

# Gopkg.toml and Gopkg.lock lists project dependencies
# These layers are only re-build when Gopkg files are updated
COPY Gopkg.lock Gopkg.toml /go/src/project/
WORKDIR /go/src/project

#Install library dependencies
RUN dep ensure -vendor-only

# Copy all project nd build it
# This layer is rebuilt whenever a file has changed in the project directory
COPY . /go/src/project/
RUN make

# This results in a single-layer image
FROM golang:1.10.1-alpine3.7 as scratch
COPY --from=build ./go/src/project/bin/* /bin
ENTRYPOINT ["/bin/hello"]
CMD ["version"]
