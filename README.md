# hello-world API

Simple Web API container that just returns "hello-world" on HTTP request.

- Listen Port: 8080

## Local Usage

### build

```bash
docker build -t hello-world . && docker image prune -f
```

For ARM32v6 architecture. (RaspberryPi Zero)

```bash
docker build -f ./Dockerfile.arm32v6 -t hello-world . && docker image prune -f
```

### Run

```bash
docker run --rm -d -p 8888:8080 --name hello hello-world
```

### Action

```bash
curl http://localhost:8888/
```
