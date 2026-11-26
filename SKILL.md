---
name: homelab-shorts-builder
description: Automatyczny montaż pionowych filmów edukacyjnych YouTube Shorts (20-30s, 1080x1920, 60fps) z klipów wideo wgranych przez użytkownika, z polskim lektorem i dynamicznymi napisami.
---

# Instrukcja Montażu Wideo (Home Lab & Fix)

Zawsze używaj narzędzi z `/workspace/.venv/bin/`.

Gdy użytkownik wgra 2 lub 3 klipy wideo oraz poda tekst lektora:
1. **Lektor PL:** Wygeneruj ścieżkę `voice.mp3` przez `/workspace/.venv/bin/edge-tts` (`pl-PL-MarekNeural`, `--rate=+12%`) i wytnij pauzy dłuższe niż 0.2s (`silenceremove`), aby uzyskać dynamiczne tempo (20-28 sekund).
2. **Montaż klipów (FFmpeg):**
   - Przeskaluj i przytnij wszystkie klipy do pełnego pionu `1080x1920` (crop do wypełnienia ekranu, zero czarnych pasów).
   - Dopasuj długość klipów do czasu trwania lektora i połącz je płynnym przejściem (crossfade 0.15s lub dynamiczny zoom-cut).
3. **Napisy (Styl edukacyjny z wzorca):**
   - Wygeneruj znaczniki słów przez `faster-whisper`.
   - Wypal napisy na środku ekranu (ok. 60% wysokości od góry): biała, pogrubiona czcionka bezszeryfowa na ciemnym, półprzezroczystym zaokrąglonym prostokącie (krycie 80%), maksymalnie 2-4 słowa na raz.
4. **Wynik:** Zapisz gotowy plik jako `final_short.mp4` i udostępnij do pobrania.
