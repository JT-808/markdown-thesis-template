# 📚 Thesis-Erstellung mit Markdown & LaTeX

![Pandoc](https://img.shields.io/badge/Made_with-Pandoc-1a162d?logo=pandoc&logoColor=white)
![LaTeX](https://img.shields.io/badge/PDF-LaTeX-008080?logo=latex)
[![License: CC BY-SA 4.0](https://img.shields.io/badge/License-CC_BY--SA_4.0-lightgrey.svg)](https://creativecommons.org/licenses/by-sa/4.0/)
[![Contributor Covenant](https://img.shields.io/badge/Contributor%20Covenant-2.1-4baaaa.svg)](CODE_OF_CONDUCT.md)
![Contributors](https://img.shields.io/github/contributors/JT-808/Bachelor_vorlage)


Modernes Template für wissenschaftliche Arbeiten mit Markdown-Pandoc-LaTeX-Workflow.
- Markdown-basiertem Workflow
- Automatisierter PDF-Generierung
- Zitierverwaltung via BibTeX
- CI/CD-Unterstützung (GitHub Actions)

## 🚀 Schnellstart

### 📋 Voraussetzungen
- [Pandoc](https://pandoc.org/installing.html) ≥ 3.0
- LaTeX-Distribution:
  ```bash
  # Minimalinstallation
  sudo apt-get install texlive-latex-base texlive-fonts-recommended
  
  # Vollversion (empfohlen)
  sudo apt-get install texlive-full

  - Git


### Installation
```bash
git clone https://github.com/JT-808/markdown-thesis-template.git
cd bachelorarbeit-template
chmod +x compile.sh
./compile.sh  # Generiert output/Bachelorarbeit.pdf
```

## 📂 Projektstruktur
```
.
├── 00_Deckblatt.md          
├── 01_Einleitung.md         
├── 02_Grundlagen.md         
├── 03_Methodik.md           
├── 04_Ergebnisse.md         
├── 05_Diskussion.md        
├── 06_Anhang.md             # Optional
├── assets/                  # Bilder/Daten
│   ├── diagramme/           # 
│   └── bilder/              # 
├── Literatur.bib            # BibTeX-Literaturdatenbank
├── metadata.yaml            # Globale Einstellungen
└── compile.sh               # Build-Skript (angepasst)
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
---
🔍 Empfohlene Tools:

Zotero (Literaturverwaltung)
VS Code mit Pandoc-Erweiterung

🔍 **Tipp**: Für VS-Code-Nutzer empfiehlt sich die Extension [Markdown All in One](https://marketplace.visualstudio.com/items?itemName=yzhang.markdown-all-in-one) mit Pandoc-Integration.

---
## 📜 Lizenz
Creative Commons Attribution-ShareAlike 4.0 (CC BY-SA 4.0)
Dieses Template darf:
- Frei genutzt werden für nicht-kommerzielle Projekte
- Modifiziert werden (mit Namensnennung)

Kommerzielle Nutzung nur mit schriftlicher Genehmigung.
Volltext: https://creativecommons.org/licenses/by-nc-sa/4.0/

Ausgenommen:
Generierte PDF-Dateien (diese unterliegen Ihrer eigenen Urheberschaft)
Externe Bibliotheken (siehe Drittlizenzen)

