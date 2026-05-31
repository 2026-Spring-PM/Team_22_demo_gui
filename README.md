# Team 22 Demo GUI

This demo package contains only the compiled executable, assets, Docker runtime, and launch scripts. Source files are intentionally not included.

## Run on Windows

1. Start Docker Desktop.
2. Double-click `run_docker.bat`.
3. Open:

```text
http://localhost:6080/vnc.html?autoconnect=true&resize=scale
```

## Run from Git Bash or WSL

```bash
bash scripts/run.sh
```

The first run builds the local Docker image `team22-demo-gui:0.1.0`. Later runs reuse it.

If the package was copied through a system that strips Linux executable bits, the launcher fixes `build/main` automatically. You can also restore permissions manually:

```bash
chmod +x build/main scripts/*.sh
```
