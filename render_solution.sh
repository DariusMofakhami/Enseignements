#!/bin/bash
# Compile un fichier .qmd (TD, colle...) en deux PDF : l'énoncé et le corrigé.
#
# Usage :
#   ./render_solution.sh <fichier.qmd>
#
# Produit, à côté du .qmd :
#   <nom>.pdf            énoncé seul          (solution: false)
#   <nom>_solution.pdf   énoncé + solutions   (solution: true)
#
# Le corrigé est compilé en premier : avec -o, quarto écrit d'abord le PDF sous
# son nom par défaut (<nom>.pdf) puis le renomme, ce qui supprimerait un énoncé
# déjà produit. L'énoncé, compilé en dernier, reprend donc sa place.

set -euo pipefail

if [ $# -ne 1 ]; then
  echo "Usage: $0 <fichier.qmd>" >&2
  exit 1
fi

if [ ! -f "$1" ]; then
  echo "Fichier introuvable : $1" >&2
  exit 1
fi

cd "$(dirname "$1")"
QMD="$(basename "$1")"
BASENAME="${QMD%.qmd}"

quarto render "$QMD" --to pdf --metadata solution:true -o "${BASENAME}_solution.pdf"
quarto render "$QMD" --to pdf --metadata solution:false

echo "-> ${BASENAME}.pdf"
echo "-> ${BASENAME}_solution.pdf"
