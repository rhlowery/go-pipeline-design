FROM golang:1.10-alpine3.7 AS build

# Install tools required to build the project
# We need to run 'docker build --no-cache .` to update those dependencies

RUN apk add --no-cache git
RUN go get github.com/golang/dep/cmd/dep
RUN go get -u golang.org/x/lint/golint

# Gopkg.toml and Gopkg.lock lists project dependencies
# These layers are only re-build when Gopkg files are updated
COPY Gopkg.lock Gopkg.toml /go/src/project/
WORKDIR /go/src/project

#Install library dependencies
RUN dep ensure -vendor-only

# Copy all project nd build it
# This layer is rebuilt whenever a file has changed in the project directory
COPY . /go/src/project/
RUN go build -o bin/project

# This results in a single layer image
FROM build AS scratch
COPY --from=build /go/src/project/bin/project /bin/project
ENTRYPOINT ["/bin/project"]
CMD ["version"]
