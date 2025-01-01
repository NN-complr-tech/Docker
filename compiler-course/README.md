# Compiler course images

## 0. Clone repository
```bash
git clone https://github.com/NN-complr-tech/Docker.git
cd Docker/compiler-course/
```

## 1. Build
### platforms:
- linux/amd64 - X86
- linux/arm64 - ARM

```bash
docker buildx build --platform <platforms> -t ghcr.io/nn-complr-tech/compiler-course/dev:latest -f dev.Dockerfile .
```
