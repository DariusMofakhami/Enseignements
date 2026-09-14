# Enseignements — TD de physique (PC, IPESUP)

Planches de TD et corrections, rédigées en [Quarto](https://quarto.org).

## Contenu du dépôt

- `TD/` — planches de TD et corrections
- `TP/` — travaux pratiques
- `Cours/` — cours
- `Colles/` — supports de colles
- `Ressources_TD/` — ressources tierces (non publiées, voir `.gitignore`)

## TD n°1 — Optique

- 📄 [Énoncé (PDF)](https://dariusmofakhami.github.io/Enseignements/TD/TD_optique.pdf)
- ✅ [Corrigé (PDF)](https://dariusmofakhami.github.io/Enseignements/TD/TD_optique_solution.pdf)
- 🖥️ [Solutions interactives (slides)](https://dariusmofakhami.github.io/Enseignements/TD/TD_optique_solutions_interactives.html)

### Fichiers

- `TD/TD_optique.qmd` — planche de TD (PDF), avec un interrupteur `solution:`
  dans l'en-tête pour générer soit l'énoncé seul, soit l'énoncé corrigé.
  Voir `TD/render_td.sh` pour compiler les deux versions.
- `TD/TD_optique_solutions_interactives.qmd` — solutions interactives (HTML,
  revealjs + Python + Observable JS) : pour chaque exercice, le résultat
  théorique, sa transcription en Python, puis une simulation où les
  paramètres deviennent des curseurs ajustables dans le navigateur.
- `TD/td-template.tex` — gabarit LaTeX commun (mise en page, en-tête/pied de
  page) utilisé par les rendus PDF.

### Compiler soi-même

```bash
cd TD
quarto render TD_optique.qmd                          # énoncé
quarto render TD_optique.qmd --metadata solution:true  # avec corrigé
quarto render TD_optique_solutions_interactives.qmd     # solutions interactives (HTML)
```
