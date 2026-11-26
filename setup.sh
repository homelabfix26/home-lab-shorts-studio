#!/usr/bin/env bash
set -euo pipefail
cd -- "$(dirname -- "$0")"

if (( EUID == 0 )) || command -v sudo >/dev/null; then
    admin=()
    if (( EUID != 0 )); then admin=(sudo); fi
    "${admin[@]}" apt-get update
    "${admin[@]}" apt-get install -y ffmpeg imagemagick build-essential pkg-config \
        libcairo2-dev libpango1.0-dev python3-dev python3-venv
    /usr/bin/python3 -m venv .venv
else
    # Bez uprawnień administratora pobierz zależności binarne z conda-forge.
    case "$(uname -m)" in
        x86_64) platform=linux-64 ;;
        aarch64) platform=linux-aarch64 ;;
        *) echo "Nieobsługiwana architektura" >&2; exit 1 ;;
    esac
    export MAMBA_ROOT_PREFIX="$PWD/.mamba"
    mkdir -p "$MAMBA_ROOT_PREFIX"
    mamba="$MAMBA_ROOT_PREFIX/bin/micromamba"
    if [[ ! -x "$mamba" ]]; then
        curl -fsSL "https://micro.mamba.pm/api/micromamba/$platform/latest" |
            tar -xj -C "$MAMBA_ROOT_PREFIX" bin/micromamba
    fi
    packages=(python=3.12 pip manimpango pycairo)
    if ! command -v ffmpeg >/dev/null || ! command -v ffprobe >/dev/null; then packages+=(ffmpeg); fi
    if ! command -v magick >/dev/null && ! command -v convert >/dev/null; then packages+=(imagemagick); fi
    action=create
    if [[ -d .venv/conda-meta ]]; then action=install; fi
    "$mamba" "$action" -y -p "$PWD/.venv" -c conda-forge "${packages[@]}"
fi

export PATH="$PWD/.venv/bin:$PATH"
python -m pip install manim edge-tts faster-whisper moviepy pillow numpy
python -m pip check
python -c 'import manim, edge_tts, faster_whisper, moviepy, PIL, numpy'
