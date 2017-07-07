# API [![Build Status](https://travis-ci.org/betalotest/api.svg?branch=master)](https://travis-ci.org/betalotest/api)

## WHATIS

The API repository contains an implementation for a simple RESTful API written in GO, with a single endpoint for validating International Banking Numbers (IBAN), which are used for international transactions.

The validation of the IBAN provided by the user is performed by the OPENIBAN API. This implementation does not guarantee any reliability on the data returned by the external service.

## HOWTO

### `make editor/run`

Starts a Docker container from Swagger Editor image accessible at `http://127.0.0.1:8080/`, where it is possible to edit the API specification and generate a development (stub) API.

From the Swagger Editor interface, you can import the current API specification located at `/swagger/api/stub/api/swagger.yaml`, add new changes, and generate a new stub API in the `Generate Server` menu. Note that this implementation uses NODEJS as stub server.

After downloading the source code for the stub API, place it at `/swagger/stub/` directory, replacing all existing files. Run `make editor/stop` for stopping and removing the Swagger Editor container.

### `make run`

Build and start services for reverse proxying, documentation, stub and production API.

#### Using the services:

- `http://localhost/v1/validate/DE44500105175407324931`      : a request for the prod api
- `http://localhost/stub/v1/validate/DE44500105175407324931` : a request for the stub api
- `http://localhost/docs`                                    : api documentation. type `/spec`in the text field to see the api specification

To stop all services and clean the environment run `make stop`.

## AVAILABLE COMMANDS:
```
------------------------------------------------------------------------
BETALOTEST API
------------------------------------------------------------------------
editor/run                     start swagger editor container
editor/stop                    stop and remove swagger editor container
publish                        publish images on docker hub
run                            start api, stub_api and nginx as reverse proxy
stop                           stop and remove services containers
test                           run api unit tests
```
