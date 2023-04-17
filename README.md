# NGINX Basic authentication

Allows to protect your Web application by placing NGINX in front of it. NGINX is configured to use Basic authentication.

## Example of using with docker-compose
```yaml
version: "3"

services:
  web:
    image: <web_image>
    restart: always

  web-basic-auth:
    image: iamcerba/nginx-basic-auth:latest
    restart: always
    ports:
      - 80:80
    depends_on:
      - web
    environment:
      FORWARD_URL: "http://web:80"
      USER: "<username>"
      PASS: "<password>"

```

## Authentication options
1. By visiting Web UI ```http://web-basic-auth:80``` and entering credentials.
2. Via "Authorization" header in HTTP request:
```
GET http://web-basic-auth:80 HTTP/1.1
Authorization: Basic <base64({username}:{password})>
```
