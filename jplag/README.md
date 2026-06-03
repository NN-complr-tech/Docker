# JPlag Docker

## Build Image

```bash
docker buildx build --platform linux/amd64 -t jplag:6.3.0 -f Dockerfile .
```

With custom versions:
```bash
docker buildx build --platform linux/amd64 \
  --build-arg JPLAG_VERSION=v6.3.0 \
  --build-arg NODE_VERSION=20 \
  -t jplag:6.3.0 -f Dockerfile .
```

## Run Container

```bash
docker run --rm -it --network host -v $PWD:/home/user/data jplag:6.3.0
```

- `--network host` — Report Viewer available at http://localhost:1996
- `-v $PWD:/home/user/data` — mounts current directory

## Plagiarism Detection

```bash
java -jar jplag/cli/target/jplag-6.3.0-jar-with-dependencies.jar \
  -l cpp \
  -p .cpp,.h,.hpp \
  -r results \
  -bc data/base_code/ \
  -m 0.5 \
  -t 12 \
  data/submissions/
```

Where:
- `-l cpp` — programming language
- `-p .cpp,.h,.hpp` — file extensions
- `-r results` — report name
- `-bc data/base_code/` — base code (optional)
- `-m 0.5` — similarity threshold [0.0-1.0], only save comparisons above this threshold
- `-t 12` — minimum tokens required for a match
- `data/submissions/` — submissions directory

## View Report

Open http://localhost:1996 in browser
