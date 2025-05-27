#!/bin/bash

# =============================================
# BACHELORARBEIT KOMPILIERUNGSSKRIPT (Pandoc 3.7+)
# =============================================
#
# Features:
# - Unterstützt Pandoc 3.7+ mit --citeproc
# - Automatische Fehlerbehandlung
# - LaTeX-Check
# - Cleaner Build-Prozess

# --- Konfiguration ---
INPUT_FILES=(
  "00_Deckblatt.md"
  "01_Einleitung.md"
  "02_Grundlagen.md"
  "03_Implementierung.md"
  "04_Evaluation.md"
  "05_Fazit.md"
)
METADATA="metadata.yaml"
BIBLIOGRAPHY="Literatur.bib"
OUTPUT="Bachelorarbeit.pdf"
PDF_ENGINE="pdflatex"
TEMPLATE="default"  # oder Pfad zu custom template

# --- Systemchecks ---
check_requirements() {
  local missing=()
  
  # Pandoc Check
  if ! command -v pandoc &> /dev/null; then
    echo "❌ Pandoc nicht installiert!"
    echo "Download: https://pandoc.org/installing.html"
    missing+=("pandoc")
  else
    echo "✓ Pandoc $(pandoc --version | head -n 1 | cut -d' ' -f2) gefunden"
  fi

  # LaTeX Check
  if ! command -v $PDF_ENGINE &> /dev/null; then
    echo "❌ $PDF_ENGINE nicht installiert!"
    echo "Installiere mit: sudo apt install texlive-latex-base texlive-latex-extra"
    missing+=("latex")
  else
    echo "✓ $PDF_ENGINE gefunden"
  fi

  # Datei Checks
  for file in "${INPUT_FILES[@]}" "$METADATA" "$BIBLIOGRAPHY"; do
    if [ ! -f "$file" ]; then
      echo "❌ Datei nicht gefunden: $file"
      missing+=("$file")
    fi
  done

  if [ ${#missing[@]} -ne 0 ]; then
    echo ""
    echo "🔧 Fehlende Abhängigkeiten:"
    printf " - %s\n" "${missing[@]}"
    exit 1
  fi
}

# --- Build-Prozess ---
build_thesis() {
  echo ""
  echo "🛠 Starte Kompilierung..."
  echo "📄 Eingabedateien: ${INPUT_FILES[*]}"
  echo "📑 Metadaten: $METADATA"
  echo "📚 Literatur: $BIBLIOGRAPHY"
  echo "🎯 Ausgabe: $OUTPUT"

  local start_time=$(date +%s)

  pandoc \
    "${INPUT_FILES[@]}" \
    --metadata-file="$METADATA" \
    --output="$OUTPUT" \
    --pdf-engine="$PDF_ENGINE" \
    --standalone \
    --table-of-contents \
    --toc-depth=2 \
    --citeproc \
    --bibliography="$BIBLIOGRAPHY" \
    --template="$TEMPLATE" \
    --fail-if-warnings

  local status=$?
  local end_time=$(date +%s)
  local duration=$((end_time - start_time))

  if [ $status -eq 0 ]; then
    echo ""
    echo "✅ Erfolgreich kompiliert in ${duration}s"
    echo "📄 Ausgabedatei: $(pwd)/$OUTPUT"
  else
    echo ""
    echo "❌ Kompilierung fehlgeschlagen (Dauer: ${duration}s)"
    echo "Mögliche Ursachen:"
    echo "1. Syntaxfehler in Markdown"
    echo "2. Fehlende LaTeX-Pakete"
    echo "3. Ungültige Zitate in $BIBLIOGRAPHY"
    exit $status
  fi
}

# --- Hauptprogramm ---
clear
echo "📝 Bachelorarbeit Kompilierung"
echo "============================="
check_requirements
build_thesis