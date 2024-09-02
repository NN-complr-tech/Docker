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
