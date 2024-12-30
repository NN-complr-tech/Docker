# Compiler course images

## 0. Clone repository
```bash
git clone https://github.com/NN-complr-tech/Docker.git
cd Docker/compiler-course/
```

## 1. Build
```bash
docker buildx build --platform linux/amd64 -t ghcr.io/nn-complr-tech/compiler-course/dev:latest -f dev.Dockerfile .
```
