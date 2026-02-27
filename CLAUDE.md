# Whisper Transcription Project — Claude Guide

## Project Overview

A self-learning project for local video/audio transcription using OpenAI Whisper, with a focus on Turkish language support. Follows a structured folder layout mapped to Lacan's triad concepts.

## Folder Structure

| Folder | Purpose |
|--------|---------|
| `1_Journey/` | Learning journey documentation and notes |
| `2_Real/` | Objectives, key results, real goals |
| `3_Environment/` | Setup, runtimes, Python installs |
| `4_UI/` | Screenshots, UI previews, process visuals |
| `5_Formula/` | Step-by-step guides and how-tos |
| `6_Symbols/` | Code: scripts, transcription tools |
| `7_Semblance/` | Errors encountered and their fixes |

## Key Files

- `6_Symbols/test.py` — basic Whisper transcription test
- `6_Symbols/tensorrt.py` — TensorRT-accelerated transcription
- `6_Symbols/turkish_transcribe.md` — Turkish-specific transcription notes
- `6_Symbols/vrollprocess_single.pl` — single file processing pipeline
- `5_Formula/5.6.2_video_file_to_text.md` — MP4 to text guide
- `5_Formula/5.7_local_turkish_transcription.md` — Local Turkish transcription guide

## Tech Stack

- **Whisper** (openai-whisper) — core transcription engine
- **FFmpeg** — audio extraction from video files
- **Python 3** — scripting and automation
- **Perl** — batch processing scripts
- **GitHub Actions** — static site deployment (`.github/workflows/`)

## Common Commands

```bash
# Install Whisper
pip install openai-whisper

# Transcribe a file in Turkish (best accuracy)
whisper input.mp4 --model medium --language Turkish

# Extract audio first for large files
ffmpeg -i input.mp4 -q:a 0 -map a output.wav
whisper output.wav --model large --language Turkish --output_format srt

# Git workflow
git pull; git add . ; git commit -m "updates"; git push
```

## Hardware Requirements

- **Minimum:** 8GB RAM (medium model)
- **Recommended:** 16GB RAM or GPU with 6GB+ VRAM (large model)
- Apple Silicon (M1/M2/M3) works well with CoreML acceleration

## Language Notes

Turkish is morphologically rich — always prefer `--model medium` or `--model large` over `base` for accurate results. Export as `.srt` or `.txt` for manual review of edge cases.
