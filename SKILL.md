---
name: homelab-shorts-builder
description: Tworzenie i montaż pionowych filmów YouTube Shorts (20-30s, 1080x1920, 60fps) dla kanału Home Lab & Fix w Stylu A (3D Cutaway + Google Flow Omni 1.1 Flash) lub Stylu B (Wektorowa infografika inżynieryjna 2D z animowanymi strzałkami, etykietami i ruchem kamery).
---

# Instrukcja Produkcji Wideo (Home Lab & Fix)

Zawsze używaj narzędzi zainstalowanych w wirtualnym środowisku `/workspace/.venv/bin/` (np. `/workspace/.venv/bin/python`, `/workspace/.venv/bin/manim`, `/workspace/.venv/bin/edge-tts`, `/workspace/.venv/bin/whisper`).

## Tryby pracy

### TRYB A: Montaż klipów z Google Flow Omni 1.1 Flash (3D Cutaway + Akcja)
Gdy użytkownik wgra 2 lub 3 klipy wideo (8-10s każdy):
1. **Analiza i czas:** Sprawdź długość klipów za pomocą `ffprobe` i dostosuj ich prędkość (`setpts`), aby całość trwała 20-30 sekund zgodnie z czasem czytania lektora.
2. **Kadrowanie:** Upewnij się, że wideo ma pełną rozdzielczość pionową `1080x1920` (9:16, 60 FPS) bez czarnych pasów.
3. **Cięcia i przejścia:** Połącz klipy dynamicznym cięciem lub szybkim przejściem typu zoom/crossfade (0.15s).
4. **Napisy i etykiety:** Nałóż dynamiczne napisy w centralnej bezpiecznej strefie YouTube Shorts oraz (jeśli wskazano w scenariuszu) statyczne lub animowane etykiety techniczne.

### TRYB B: Generowanie pełnej animacji technicznej 2D od zera (Styl Wektorowy)
Gdy użytkownik poprosi o animację techniczną w stylu infografiki 2D (bez wgrywania zewnętrznych klipów wideo):
1. **Silnik:** Napisz skrypt w Pythonie przy użyciu `/workspace/.venv/bin/manim` (klasa `MovingCameraScene`, rozdzielczość `-r 1080,1920`, 60 FPS).
2. **Kompozycja:** Rysunek techniczny musi wypełniać całą wysokość pionowego ekranu 9:16 (brak pustych marginesów). Używaj czystych, płaskich kształtów z wyraźnym ciemnym obrysem (grubość 3-4 px).
3. **Obowiązkowe elementy wizualne:**
   - **Animowane strzałki przepływu:** Poruszające się wzdłuż rur/kanałów ciągi małych strzałek lub cząsteczek (niebieski `#2980B9` dla zimnej wody/powietrza, pomarańczowo-czerwony `#E67E22` / `#E74C3C` dla ciepła, spalin lub błędu).
   - **Etykiety techniczne (Callouts):** Białe zaokrąglone prostokąty z ciemnym obrysem i pogrubionym ciemnym tekstem (np. `SPADEK 2%`, `ZATOR`, `TEMPERATURA`), pojawiające się z lekkim efektem sprężyny (scale-up).
   - **Wskaźniki poprawności:** Zielone kółko z białym znakiem wyboru (`✅`) oraz czerwone kółko z białym krzyżykiem (`❌`).
   - **Ruch kamery (Camera Rig):** Płynne najazdy (`zoom-in`) na omawiany detal instalacji oraz przesuwanie kadru (`pan`) wzdłuż przebiegu rury, kanału lub warstwy gruntu.

## Audio i Napisy (wspólne dla obu trybów)
1. **Lektor PL:** Wygeneruj ścieżkę dźwiękową `voice.mp3` za pomocą `/workspace/.venv/bin/edge-tts` z głosem `pl-PL-MarekNeural` oraz tempem `--rate=+12%`.
2. **Dynamika audio:** Usuń pauzy dłuższe niż 0.25s za pomocą FFmpeg (`silenceremove`), aby utrzymać szybkie tempo YouTube Shorts.
3. **Styl napisów wiralowych:**
   - Wygeneruj dokładne znaczniki czasu słów z pliku `voice.mp3` przy użyciu `faster-whisper`.
   - Wypal napisy przez FFmpeg na środku ekranu w bezpiecznej strefie YouTube Shorts (ok. 55-65% wysokości od góry).
   - Format: biała, pogrubiona czcionka bezszeryfowa umieszczona na półprzezroczystym czarnym zaokrąglonym prostokącie (krycie ok. 75%), maksymalnie 2-4 słowa na ekranie naraz.

## Wynik końcowy
- Zapisz gotowy plik wideo jako `final_short.mp4`.
- Wygeneruj i pokaż w czacie 3 zrzuty kontrolne (początek, środek, koniec filmu), aby użytkownik mógł od razu ocenić układ na telefonie.
