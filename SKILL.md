---
name: homelab-shorts-builder
description: Tworzenie i montaż pionowych filmów YouTube Shorts (20-30s, 1080x1920) dla kanału Home Lab & Fix.
---

# Instrukcja Produkcji Wideo (Home Lab & Fix)

Zawsze uruchamiaj narzędzia środowiska projektu za pomocą pełnych ścieżek z `/workspace/.venv/bin/`, np. `/workspace/.venv/bin/manim`, `/workspace/.venv/bin/edge-tts` i `/workspace/.venv/bin/python`.

Gdy użytkownik wgra 2 lub 3 klipy wideo (wygenerowane w Google Flow Omni 1.1 Flash) oraz poda tekst lektora (lub poprosi o wygenerowanie animacji technicznej od zera), wykonaj zawsze poniższe kroki w terminalu:

1. **Analiza i czas (20-30s):**
   - Upewnij się, że całkowita długość wideo wynosi od 20 do 30 sekund (1080x1920, 60 FPS).
   - Jeśli użytkownik wgrał klipy, sprawdź ich długość (`ffprobe`) i dostosuj ich prędkość (`setpts`), aby idealnie pasowały do czasu czytania lektora.

2. **Generowanie animacji technicznych (gdy brakuje klipu lub potrzebny jest schemat):**
   - Napisz skrypt w Pythonie przy użyciu biblioteki `manim` (rozdzielczość `-r 1080,1920`).
   - Styl graficzny: tło ciemnobrązowe/grafitowe (`#1C1613`), elementy miedziane (`#C87533`), ciepłe beże (`#E6D5B8`), strzałki przepływu wody (niebieski `#3498DB`) lub ciepła/prądu (pomarańczowy `#E74C3C`). Zero zbędnego tekstu, czyste linie techniczne.

3. **Lektor PL (`edge-tts`):**
   - Wygeneruj plik audio `voice.mp3` głosem `pl-PL-MarekNeural` (tempo `+12%`).
   - Usuń długie cisze między zdaniami za pomocą FFmpeg (`silenceremove`), aby zachować szybkie tempo YouTube Shorts.

4. **Montaż i dynamiczne napisy (FFmpeg + Whisper):**
   - Wygeneruj napisy czasowe z pliku `voice.mp3` za pomocą `faster-whisper` (maksymalnie 3 słowa na ekranie naraz).
   - Połącz klipy wideo z lekkim przejściem (crossfade 0.2s) oraz nałóż bardzo cichy dźwięk tła warsztatowego, jeśli dostępny.
   - Wypal napisy w bezpiecznej strefie YouTube Shorts (na wysokości 65% od góry ekranu, czcionka biała z grubym czarnym obrysem i żółtym podświetleniem kluczowych słów).

5. **Wynik:**
   - Zapisz finalny plik jako `final_short.mp4` i wyświetl w czacie podgląd 3 klatek kontrolnych (początek, środek, koniec) oraz link do pobrania pliku MP4.
