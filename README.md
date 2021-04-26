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
    image: ffc-axe
    depends_on:
      - ffc-demo-web
    command: http://ffc-demo-web:3000/, http://ffc-demo-web:3000/claim/name, http://ffc-demo-web:3000/claim/property, http://ffc-demo-web:3000/claim/accessible, http://ffc-demo-web:3000/claim/mine-type, http://ffc-demo-web:3000/claim/date-of-subsidence, http://ffc-demo-web:3000/claim/email, http://ffc-demo-web:3000/claim/confirmation
    volumes:
      - ./test-output/:/home/node/test-output/
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
