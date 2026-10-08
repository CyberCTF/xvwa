# XVWA

[XVWA](https://github.com/s4n7h0/xvwa) (Xtreme Vulnerable Web Application) by @s4n7h0 and
@samanL33T: a badly coded PHP/MySQL web application with modules for SQL injection, XPath injection,
command injection, PHP object injection, file upload, XSS, SSRF, SSTI and more. This repository
runs it with [Isoloom](https://www.isoloom.com): [`isoloom.yml`](isoloom.yml) describes the
machines, and the upstream source in [`build/xvwa/app/`](build/xvwa/app) is served by a PHP 5.6 /
Apache image written for it (upstream ships no Dockerfile), with the database set up at first
start.

| Machine | Service |
| --- | --- |
| xvwa | XVWA (PHP 5.6, Apache) on port 80, published on 8024 |
| db | MariaDB 10.11 on port 3306 |

## Run it

```bash
isoloom generate
isoloom run docker
```

Then open http://localhost:8024/xvwa/ and log in as `admin` / `admin`. The database is already
set up; Setup / Reset in the side panel puts it back to its first state. The same spec runs as
Docker on a local VM (`docker-vm`), on a cloud VM (`cloud-docker`) or on Kubernetes. Lab guide:
the [XVWA README](https://github.com/s4n7h0/xvwa#readme) and the Instructions page of the app.

Upstream version and commit: [UPSTREAM.md](UPSTREAM.md).

## Licence

GPL-3.0, as XVWA ([LICENSE](LICENSE)). This application is deliberately vulnerable: keep it
isolated.
