# Enseignements — TD de physique (PC, IPESUP)

Planches de TD et corrections, rédigées en [Quarto](https://quarto.org).

## Contenu

- `TD_optique.qmd` — planche de TD (PDF), avec un interrupteur `solution:` dans
  l'en-tête pour générer soit l'énoncé seul, soit l'énoncé corrigé.
  Voir `render_td.sh` pour compiler les deux versions.
- `TD_optique_solutions_interactives.qmd` — solutions interactives (HTML,
  revealjs + Python + Observable JS) : pour chaque exercice, le résultat
  théorique, sa transcription en Python, puis une simulation où les
  paramètres deviennent des curseurs ajustables dans le navigateur.
- `td-template.tex` — gabarit LaTeX commun (mise en page, en-tête/pied de
  page) utilisé par les rendus PDF.

## Consulter les solutions interactives

Les pages HTML sont publiées via GitHub Pages : voir les réglages du dépôt
pour le lien exact une fois Pages activé.

## Compiler soi-même

```bash
quarto render TD_optique.qmd                          # énoncé
quarto render TD_optique.qmd --metadata solution:true  # avec corrigé
quarto render TD_optique_solutions_interactives.qmd     # solutions interactives (HTML)
```
