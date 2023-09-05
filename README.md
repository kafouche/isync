# isync
This image is based on *Alpine Linux* latest stable image.

## Image
### Environment
| Parameter | Description                                          |
|-----------|------------------------------------------------------|
| `TZ`      | Set container's timezone (*default*: `Europe/Paris`) |

### Mount / Volume
| Volume  | Description                  |
|---------|------------------------------|
| `/main` | Target folder for local backup. |

## Build
```
docker build -t kafouche/isync:latest .
```


## Run (standalone)
The following `code blocks` are only there as **examples**.
### Manual
```
docker run --detach \
    --name isync \
    --network bridge \
    --mount type=bind,src=$(pwd)/mail,dst=/mail \
    kafouche/isync:latest
```

### Composer
```
---
version: "3"

services:
    isync:
        container_name: "isync"
        image: "kafouche/transmission:latest"
        network_mode: bridge
        volumes:
          - "./mail:/mail"
```