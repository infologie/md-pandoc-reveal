# Composants du système

## Markdown

Markdown est un langage de balisage léger, inventé pour écrire plus facilement en HTML. Volontairement basique, sa syntaxe contient :

- des éléments en ligne comme *emphase simple*, **emphase forte**, [lien](https://artorig.github.io/tutomd/), `code` ;
- des éléments en bloc comme liste, citation, code, etc.

Il existe de multiples variantes qui étendent Markdown dans différentes directions, ainsi qu'une spécification de la syntaxe de base : [CommonMark](https://commonmark.org/). J'ai traduit le tutoriel Markdown de CommonMark, à cette adresse : <https://artorig.github.io/tutomd/>.

## CSS

CSS est le langage de mise en forme du web. C'est un outil simple mais puissant. Son principal défaut est indirect : les navigateurs n'appliquent pas toujours toutes les fonctionnalités CSS, ni de manière identique.

Il faut absolument lire et intégrer [les principes de cascade et d'héritage](https://developer.mozilla.org/fr/docs/Apprendre/CSS/Building_blocks/Cascade_et_heritage) pour comprendre comment ça marche et résoudre d'éventuels problèmes.

Reveal fait coexister plusieurs feuilles de style (CSS de base, thème prédéfini) auxquelles on rajoute souvent sa propre CSS. Comprendre laquelle s'applique où et pourquoi est indispensable en cas de problème.

Le rendu varie en fonction du navigateur. Je recommande Firefox.

## Reveal

Reveal est une collection de fichiers CSS et Javascript qui permettent de représenter un fichier HTML sous forme de présentation interactive.

Ceci permet de combiner les fonctionnalités classiques des logiciels de présentation (transitions, affichage avec notes…) avec celles du web.

Le code de Reveal est *open source* : <https://github.com/hakimel/reveal.js/>

Le *div* notes est spécial : c'est un *div* prédéfini, qui ne se note pas avec des accolades, et qui permet de produire des notes d'intervenant pour le mode présentation de Reveal. Son contenu peut être formaté en Pandoc Markdown. C'est une *pop-up* qu'on peut faire apparaître via la touche S du clavier, sous réserve d'autoriser dans son navigateur les *pop-ups* en provenance du fichier de présentation.

Un argument phare de la présentation en HTML est la **transclusion** : on peut y inclure presque n'importe quel contenu web via un cadre interactif (*iframe*).

<iframe src="https://fr.wikipedia.org/wiki/Transclusion" width="100%" height="300px"><https://fr.wikipedia.org/wiki/Transclusion></iframe>

Un site peut être configuré pour qu'il ne soit pas possible de l'inclure dans des *iframes*. Ce n'est pas courant mais cela existe.

Notez la classe *stretch* appliquée à l'*iframe*. Elle est définie dans la CSS de Reveal et étire l'élément pour qu'il occupe la hauteur et la largeur disponible relativement au reste de la slide. On peut aussi l'appliquer aux images en tirant parti d'une syntaxe plus légère grâce à Pandoc (voir plus loin).

## Pandoc

Pandoc est un logiciel de conversion entre langages de balisage. On l'utilise ici pour transformer du Markdown en présentation HTML Reveal.

Pandoc permet de pousser très loin le compromis entre simplicité et fonctionnalité inhérent à Markdown grâce à des extensions de la syntaxe de base, ainsi que des options de paramétrage de Reveal.

## Ajouts de Pandoc à Markdown

Des **modifications** ou **extensions** des éléments existants.

Des **éléments nouveaux** : maths, notes de bas de page, références bibliographiques, liste de définitions…

De la **mise en forme** : coloration syntaxique du code mais surtout une syntaxe raccourcie pour les *div* et *span* qui permet d'introduire de la mise en forme facilement.

Les spécificités du Pandoc Markdown introduisent de la dette technique. Mais elles répondent utilement à des besoins importants sans trop retrancher aux avantages du langage de base. Et l'auteur de Pandoc est au centre de l'initiative CommonMark.

Un exemple d'ajout, l'intégration d'une gestion automatisée des références bibliographiques :

> « PowerPoint offre une vision simplifiée et fragmentée pour être accessible et reproductible ; il donne l'illusion de produire du spectaculaire pour séduire ; il est minimaliste pour esquiver la critique. » [@frommer2010, 252]

Pandoc place la liste des références citées dans un *div* avec l'identifiant *refs*. Si l'auteur ne le positionne pas lui-même, Pandoc l'ajoute automatiquement à la fin du document.

## Paramétrage de Reveal via Pandoc

Dans le fichier : notes d'intervenant, attributs de slide.

À la conversion : numérotation des slides, visibilité des boutons, type de transition, thème graphique, etc.

```
pandoc -f markdown in.md -o out.html -t revealjs -s -c prez.css
--filter=pandoc-citeproc --bibliography biblio.bib --csl apa-fr.csl
-V theme=white -V history=false -V transition=none
```

Dans la commande ci-dessus : l'ordre des différentes options n'a pas d'importance et la séparation en lignes distinctes est faite uniquement par commodité visuelle. Première ligne : fichiers en entrée et en sortie. Deuxième ligne : concerne les références bibliographiques, s'il y en a. Troisième ligne : options de Reveal.

La liste complète des options est ici : <https://github.com/hakimel/reveal.js#configuration>. `history=false` évite de peupler l'historique du navigateur avec chaque passage de slide. `transition=none` économise du temps et de l'énergie.

Les thèmes prédéfinis sont globalement assez vilains. Le thème *white* (noir sur fond blanc) fournit une meilleure base pour personnaliser que le thème par défaut. Certains recommandent de tout jeter et repartir de zéro, cf. <https://www.chenhuijing.com/blog/customising-revealjs-beyond-theming/>

## Assemblage du système

Plutôt qu'exécuter Pandoc manuellement, mieux vaut écrire un script ou utiliser un logiciel. Exemple (macOS) :

- outils système (Automator, AppleScript) ;
- éditeur de texte généraliste scriptable (ex : BBEdit) ;
- éditeur spécialisé bâti autour de Pandoc (ex : Zettlr).

Un script Shell ainsi qu'un script pour BBEdit sont inclus dans le dépôt à titre d'exemple.