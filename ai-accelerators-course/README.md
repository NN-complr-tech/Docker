# Ascend Docker images

1. Download CANN toolkit `.run` file from the official website: https://www.hiascend.com/developer/download/community/result?module=cann
1. Create `cann_dir` directory in current directory and move `.run` file there
   ```bash
   mkdir cann_dir
   mv <path-to-run-file> cann_dir/
   ```
1. Build Docker image:
   ```bash
   docker build -t ghcr.io/nn-complr-tech/ascendc-community-cann:<cann-version> -f ascend.Dockerfile . --build-arg CANN_VERSION="<cann-version>"
   ```
   Using buildx to build for x86 and aarch64:
   - x86
     ```bash
     docker buildx build --platform linux/amd64 -t ghcr.io/nn-complr-tech/ascendc-community-cann:<cann-version>-x86_64 -f ascend.Dockerfile . --build-arg CANN_VERSION="<cann-version>" --load
     ```
   - aarch64
     ```bash
     docker buildx build --platform linux/aarch64 -t ghcr.io/nn-complr-tech/ascendc-community-cann:<cann-version>-aarch64 -f ascend.Dockerfile . --build-arg CANN_VERSION="<cann-version>" --load
     ```
