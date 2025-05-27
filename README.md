# 📚 Bachelorarbeit Template mit Pandoc

![Pandoc](https://img.shields.io/badge/Made_with-Pandoc-1a162d?logo=pandoc&logoColor=white)
![LaTeX](https://img.shields.io/badge/PDF-LaTeX-008080?logo=latex)
[![CC BY-SA 4.0](https://img.shields.io/badge/License-CC_BY--SA_4.0-lightgrey.svg)](https://creativecommons.org/licenses/by-sa/4.0/)

Modernes Template für wissenschaftliche Arbeiten (Bachelor/Master) mit:
- **Markdown**-basiertem Workflow  
- Automatisierter **PDF-Generierung**  
- Zitierverwaltung via **BibTeX**  
- CI/CD-Unterstützung (GitHub Actions)  

## 🚀 Schnellstart

### Voraussetzungen
- [Pandoc](https://pandoc.org/installing.html) ≥ 3.0  
- LaTeX-Distribution (z.B. [TeX Live](https://www.tug.org/texlive/))
- Git

### Installation
```bash
git clone https://github.com/deinusername/bachelorarbeit-template.git
cd bachelorarbeit-template
```

### Kompilierung
```bash
chmod +x compile.sh
./compile.sh
```
➡ Output: `output/Bachelorarbeit.pdf`

## 📂 Projektstruktur
```
.
├── 00_Deckblatt.md          # Titelblatt (YAML-Metadaten)
├── 01_Einleitung.md         # 
├── 02_Grundlagen.md         # Theoretischer Hintergrund
├── 03_Methodik.md           # 
├── 04_Ergebnisse.md         # 
├── 05_Diskussion.md         # 
├── metadata.yaml            # Globale Einstellungen
├── Literatur.bib            # BibTeX-Literaturdatenbank
├── compile.sh               # Build-Skript
└── assets/                  # Bilder/Daten
```

## 🔧 Konfiguration
### Anpassungen in `metadata.yaml`
```yaml
title: "Titel der Arbeit"
author: "Max Mustermann"
date: "\today"              # Autom. Datum
documentclass: scrreprt     # KOMA-Script
toc: true                   # Inhaltsverzeichnis
highlight-style: pygments   # Code-Formatierung
```

### Eigene Kapitel hinzufügen
1. Neue Markdown-Datei erstellen (z.B. `06_Anhang.md`)
2. In `compile.sh` ergänzen:
```bash
INPUT_FILES=(
  ...
  "06_Anhang.md"
)
```

## 🌟 Features
- **Plattformunabhängig** (Windows/macOS/Linux)  
- **Versionierung** aller Änderungen  
- **Modularer Aufbau** pro Kapitel  
- **Dynamische Referenzen**  
  ```markdown
  Siehe @mustermann2020 [S. 42].
  ```

## 🤝 Mitwirken
1. Fork dieses Repository
2. Erstelle einen Branch (`git checkout -b feature/neues-kapitel`)
3. Commit deine Änderungen (`git commit -m 'Add xyz'`)
4. Push zum Branch (`git push origin feature/neues-kapitel`)
5. Öffne einen Pull Request

## 📜 Lizenz
Creative Commons Attribution-ShareAlike 4.0 (CC BY-SA 4.0)

---

🔍 **Tipp**: Für VS-Code-Nutzer empfiehlt sich die Extension [Markdown All in One](https://marketplace.visualstudio.com/items?itemName=yzhang.markdown-all-in-one) mit Pandoc-Integration.