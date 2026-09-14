#!/bin/bash
# Rend un fichier .qmd de TD en PDF, en ajoutant automatiquement le suffixe
# "_solution" au nom de sortie lorsque le document est compilé avec les
# solutions (solution: true).
#
# Usage :
#   ./render_td.sh TD_optique.qmd                  # respecte le "solution:" du fichier
#   ./render_td.sh TD_optique.qmd --solution        # force solution:true
#   ./render_td.sh TD_optique.qmd --no-solution     # force solution:false
#
# Dans tous les cas, produit :
#   TD_optique.pdf            si solution=false
#   TD_optique_solution.pdf   si solution=true

set -euo pipefail

if [ $# -lt 1 ]; then
  echo "Usage: $0 <fichier.qmd> [--solution|--no-solution]" >&2
  exit 1
fi

QMD="$1"
MODE="${2:-}"

if [ ! -f "$QMD" ]; then
  echo "Fichier introuvable : $QMD" >&2
  exit 1
fi

BASENAME="$(basename "$QMD" .qmd)"

case "$MODE" in
  --solution)
    SOLUTION=true
    ;;
  --no-solution)
    SOLUTION=false
    ;;
  "")
    # Lit la valeur "solution:" déclarée dans l'en-tête YAML du fichier.
    SOLUTION="$(awk -F': *' '/^solution:/{print $2; exit}' "$QMD" | tr -d '[:space:]')"
    if [ -z "$SOLUTION" ]; then
      SOLUTION=false
    fi
    ;;
  *)
    echo "Option inconnue : $MODE (attendu --solution ou --no-solution)" >&2
    exit 1
    ;;
esac

if [ "$SOLUTION" = "true" ]; then
  OUT="${BASENAME}_solution.pdf"
else
  OUT="${BASENAME}.pdf"
fi

quarto render "$QMD" --to pdf --metadata "solution:${SOLUTION}" -o "$OUT"
echo "-> $OUT"
