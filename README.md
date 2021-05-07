# FFC AXE

Docker image for running [axe-core/cli](https://www.npmjs.com/package/@axe-core/cli)

## Usage

This image was built to support running AXE acceptance tests against a containerised web application orchestrated by Docker Compose. Example:

```
version: '3.7'

services:
  ffc-demo-web:
    command: npm run start:watch
    build:
      target: development
    image: ffc-demo-web-development
    environment:
      NODE_ENV: test
    volumes:
      - ./test-output/:/home/node/test-output/

  axe:
    image: defradigital/ffc-axe
    depends_on:
      - ffc-demo-web
    command: sh -c "/scripts/wait ffc-demo-web:3000 -- axe --chrome-options="no-sandbox,disable-setuid-sandbox,disable-dev-shm-usage" --chromedriver-path=/usr/bin/chromedriver --exit ffc-demo-web:3000, ffc-demo-web:3000/claim/name, ffc-demo-web:3000/claim/property, ffc-demo-web:3000/claim/accessible, ffc-demo-web:3000/claim/mine-type, ffc-demo-web:3000/claim/date-of-subsidence, ffc-demo-web:3000/claim/email, ffc-demo-web:3000/claim/confirmation"
    volumes:
      - ./test-output/:/test-output/
      - ./scripts/:/scripts/
```

## Licence

THIS INFORMATION IS LICENSED UNDER THE CONDITIONS OF THE OPEN GOVERNMENT
LICENCE found at:

<http://www.nationalarchives.gov.uk/doc/open-government-licence/version/3>

The following attribution statement MUST be cited in your products and
applications when using this information.

> Contains public sector information licensed under the Open Government license
> v3

### About the licence

The Open Government Licence (OGL) was developed by the Controller of Her
Majesty's Stationery Office (HMSO) to enable information providers in the
public sector to license the use and re-use of their information under a common
open licence.

It is designed to encourage use and re-use of information freely and flexibly,
with only a few conditions.
