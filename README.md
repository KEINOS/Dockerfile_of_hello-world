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

## Troubleshoot

### `port is already allocated` error

If you get the below error on `docker run`, change the port to another such like `-p 8889:8080`. The port `8888` is already in use.

```bash
docker: Error response from daemon: driver failed programming external connectivity on endpoint hello (...): Bind for 0.0.0.0:8888 failed: port is already allocated.
```
