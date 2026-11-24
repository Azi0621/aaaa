# D5Data Backend Written Examination

A minimal Spring Boot 3.2.0 application that provides:

- a username/password login API;
- a session-protected `GET /api/hello` API;
- a BCrypt-encoded in-memory demo user;
- integration tests for successful authentication, rejected credentials, and access control.

## Requirements

- JDK 17 or later
- Maven 3.6.3 or later

## Run

```bash
mvn spring-boot:run
```

The application starts at `http://localhost:8080`.

## API usage

The demo credentials are:

- username: `test`
- password: `123456`

First, log in and store the returned session cookie:

```bash
curl -i -c cookies.txt \
  -H "Content-Type: application/json" \
  -d '{"username":"test","password":"123456"}' \
  http://localhost:8080/api/auth/login
```

Then call the protected endpoint with that cookie:

```bash
curl -b cookies.txt http://localhost:8080/api/hello
```

Expected response:

```text
Hello World
```

Calling `/api/hello` without an authenticated session returns HTTP `401 Unauthorized`.

## Test

```bash
mvn test
```

## Design notes

The login endpoint authenticates credentials through Spring Security's `AuthenticationManager`. On success, it saves the resulting `SecurityContext` in the HTTP session. Subsequent requests carrying the `JSESSIONID` cookie are authenticated by Spring Security. Passwords are never stored in plain text at runtime: the configured demo password is encoded with BCrypt when the application starts.

For a production deployment, credentials should come from a database or identity provider, CSRF protection should be configured according to the client architecture, and HTTPS plus secure cookie attributes should be enabled.
