# Dev Environment Exercise

##

## Ubuntu 16.04 Development workstation setup:
Run sudo ./setupLinux

To start both auth & data services:
Run ./startServices

Alternatively, to run 'auth' or 'data' services (independently):
cd auth_service && ./startService
cd data_service && ./startService

## Docker Development workstation setup:
 *In progress, needs some more testing*

Run 'docker-compose up' This should start up 3 containerized services: auth, data, and web.

## Accessing the API:
There are currently 4 endpoints that can be accessed from localhost:

/api/data/accounts

/api/data/health

/api/auth/token

/api/auth/health
