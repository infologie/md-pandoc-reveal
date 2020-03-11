---
title: Le diaporama au temps du balisage
subtitle: Markdown, Pandoc, Reveal
author: Arthur Perret
date: Février 2020
nocite: |
  @tufte2003, @frommer2010, @roblesanderson2016
...

# Introduction {data-background="#8DA0CB"}

## Remarque préalable

Une présentation scientifique doit se penser en termes de raison graphique, à contre-courant de la culture présentationnelle dominante façonnée par PowerPoint. Ne pas le faire, c'est saboter sa propre énonciation.

::: {#refs}
:::

::: notes
À ces trois références, on peut ajouter les nombreux travaux de l'équipe d'Yves Jeanneret et Emmanuël Souchier, avec les concepts d'architexte, de plastigramme, etc.
:::

## Deux points de vigilance

La liste à puces est souvent une béquille creuse qui tend à effacer les liens entre les étapes d'un raisonnement.

Pour représenter efficacement de l'information, il faut acquérir des notions de composition, d'édition, de design (hiérarchie, blanc, densité, résolution, etc.) sous peine de contre-productivité fatale (« *Death by PowerPoint* »).

C'est là que la courbe d'apprentissage est la plus pentue, et le bénéfice intellectuel le plus grand.

::: notes
Ce fichier a pour vocation de servir d'exemple technique. Il en découle donc une présentation qui contient des slides avec un mur de texte, des images vides de sens, des listes à puces, des titres trop longs, etc. C'est normal. La feuille de style incluse est imparfaite. Tout le monde ne peut pas être l'enfant caché d'Edward Tufte et Jen Simmons.
:::

## *Desiderata*

- **Pérennité** : travailler avec un format léger, ouvert, facile à lire et à écrire.
- **Efficacité** : automatiser, éditer précisément, reproduire rapidement et sûrement.
- **Fonctionnalité** : bénéficier des innovations du web – mise en page adaptative, défilement, transclusion, etc.
- **Liberté** : accroître son agilité informatique, choisir ses dépendances logicielles en toute conscience.

::: notes
La suite Office (Word, Excel, PowerPoint) et la suite Google (Docs, Sheets, Slides) ne nous apprennent strictement rien sur la fabrique du Web. Ce qu’on peut réaliser avec quelques lignes de texte brut me paraît bien plus intéressant dans une perspective de culture numérique. Les compétences de mise en page qu’on apprend pour styler une présentation en Reveal.js, par exemple, sont transférables à toute autre projet qui utilise les technologies du Web – notamment l'édition.
:::

## Solution proposée

- Écriture en Markdown (avec les ajouts de Pandoc).
- Mise en forme via CSS.
- Conversion en HTML (avec Reveal.js) via Pandoc.

::: notes
Pourquoi Markdown avec Pandoc, et pas Asciidoc avec Asciidoctor ? C'est une question de complexité : la sémantique d'Asciidoc (héritée de DocBook XML) et l'univers logiciel d'Asciidoctor (Ruby, NodeJS) sont trop lourds pour mes besoins. Je pense que ces outils parlent plus facilement aux développeurs, aux ingénieurs, ainsi qu'aux documentalistes techniques.
:::

# Composants du système {data-background="#66C2A5"}

## Markdown

Markdown est un langage de balisage léger, inventé pour écrire plus facilement en HTML. Volontairement basique, sa syntaxe contient :

- des éléments en ligne comme *emphase simple*, **emphase forte**, [lien](https://artorig.github.io/tutomd/), `code` ;
- des éléments en bloc comme liste, citation, code, etc.

::: notes
Il existe de multiples variantes qui étendent Markdown dans différentes directions, ainsi qu'une spécification de la syntaxe de base : [CommonMark](https://commonmark.org/). J'ai traduit le tutoriel Markdown de CommonMark, à cette adresse : <https://artorig.github.io/tutomd/>.
:::

## CSS

CSS est le langage de mise en forme du web. C'est un outil simple mais puissant. Son principal défaut est indirect : les navigateurs n'appliquent pas toujours toutes les fonctionnalités CSS, ni de manière identique.

Il faut absolument lire et intégrer [les principes de cascade et d'héritage](https://developer.mozilla.org/fr/docs/Apprendre/CSS/Building_blocks/Cascade_et_heritage) pour comprendre comment ça marche et résoudre d'éventuels problèmes.

::: notes
Reveal fait coexister plusieurs feuilles de style (CSS de base, thème prédéfini) auxquelles on rajoute souvent sa propre CSS. Comprendre laquelle s'applique où et pourquoi est indispensable en cas de problème.

Le rendu varie en fonction du navigateur. Je recommande Firefox.
:::

## Reveal

Reveal est une collection de fichiers CSS et Javascript qui permettent de représenter un fichier HTML sous forme de présentation interactive.

Ceci permet de combiner les fonctionnalités classiques des logiciels de présentation (transitions, affichage avec notes…) avec celles du web.

::: notes
Le code de Reveal est *open source* : <https://github.com/hakimel/reveal.js/>

Le *div* notes est spécial : c'est un *div* prédéfini, qui ne se note pas avec des accolades, et qui permet de produire des notes d'intervenant pour le mode présentation de Reveal. Son contenu peut être formaté en Pandoc Markdown. C'est une *pop-up* qu'on peut faire apparaître via la touche S du clavier, sous réserve d'autoriser dans son navigateur les *pop-ups* en provenance du fichier de présentation.
:::

##

Un argument phare de la présentation en HTML est la **transclusion** : on peut y inclure presque n'importe quel contenu web via un cadre interactif (*iframe*).

<iframe src="https://fr.wikipedia.org/wiki/Transclusion" class="stretch"></iframe>

::: notes
Un site peut être configuré pour qu'il ne soit pas possible de l'inclure dans des *iframes*. Ce n'est pas courant mais cela existe.

Notez la classe *stretch* appliquée à l'*iframe*. Elle est définie dans la CSS de Reveal et étire l'élément pour qu'il occupe la hauteur et la largeur disponible relativement au reste de la slide. On peut aussi l'appliquer aux images en tirant parti d'une syntaxe plus légère grâce à Pandoc (voir plus loin).
:::

## Pandoc

Pandoc est un logiciel de conversion entre langages de balisage. On l'utilise ici pour transformer du Markdown en présentation HTML Reveal.

Pandoc permet de pousser très loin le compromis entre simplicité et fonctionnalité inhérent à Markdown grâce à des extensions de la syntaxe de base, ainsi que des options de paramétrage de Reveal.

## Ajouts de Pandoc à Markdown

Des **modifications** ou **extensions** des éléments existants.

Des **éléments nouveaux** : maths, notes de bas de page, références bibliographiques, liste de définitions…

De la **mise en forme** : coloration syntaxique du code mais surtout une syntaxe raccourcie pour les *div* et *span* qui permet d'introduire de la mise en forme facilement.

::: notes
Les spécificités du Pandoc Markdown introduisent de la dette technique. Mais elles répondent utilement à des besoins importants sans trop retrancher aux avantages du langage de base. Et l'auteur de Pandoc est au centre de l'initiative CommonMark.
:::

##

Un exemple d'ajout, l'intégration d'une gestion automatisée des références bibliographiques :

> « PowerPoint offre une vision simplifiée et fragmentée pour être accessible et reproductible ; il donne l'illusion de produire du spectaculaire pour séduire ; il est minimaliste pour esquiver la critique. » [@frommer2010, 252]

::: notes
Pandoc place la liste des références citées dans un *div* avec l'identifiant *refs*. Si l'auteur ne le positionne pas lui-même, Pandoc l'ajoute automatiquement à la fin du document. Dans cette présentation par exemple, le *div* a été mis au début.
:::

## Paramétrage de Reveal via Pandoc

Dans le fichier : notes d'intervenant, attributs de slide.

À la conversion : numérotation des slides, visibilité des boutons, type de transition, thème graphique, etc.

```
pandoc -f markdown in.md -o out.html -t revealjs -s -c prez.css
--filter=pandoc-citeproc --bibliography biblio.bib --csl apa-fr.csl
-V theme=white -V history=false -V transition=none
```

::: notes
Dans la commande ci-dessus : l'ordre des différentes options n'a pas d'importance et la séparation en lignes distinctes est faite uniquement par commodité visuelle. Première ligne : fichiers en entrée et en sortie. Deuxième ligne : concerne les références bibliographiques, s'il y en a. Troisième ligne : options de Reveal.

La liste complète des options est ici : <https://github.com/hakimel/reveal.js#configuration>. `history=false` évite de peupler l'historique du navigateur avec chaque passage de slide. `transition=none` économise du temps et de l'énergie.

Les thèmes prédéfinis sont globalement assez vilains. Le thème *white* (noir sur fond blanc) fournit une meilleure base pour personnaliser que le thème par défaut. Certains recommandent de tout jeter et repartir de zéro, cf. <https://www.chenhuijing.com/blog/customising-revealjs-beyond-theming/>
:::

## Assemblage du système

Plutôt qu'exécuter Pandoc manuellement, mieux vaut écrire un script ou utiliser un logiciel. Exemple (macOS) :

- outils système (Automator, AppleScript) ;
- éditeur de texte généraliste scriptable (ex : BBEdit) ;
- éditeur spécialisé bâti autour de Pandoc (ex : Zettlr).

::: notes
Un script pour BBEdit est fourni avec ce fichier à titre d'exemple.
:::

# Fabrication d'une présentation {data-background="#FC8D62"}

## Première slide

Le bloc de métadonnées en YAML au début du fichier Markdown permet de fournir les éléments de la première slide, qui est créée automatiquement. Il peut aussi contenir des options propres à Pandoc.

## Slides

Un titre signale le début d'une nouvelle slide. Un seul niveau de titre dans tout le document crée une présentation linéaire ; utiliser deux niveaux différents crée une présentation en deux dimensions, avec un défilement horizontal et vertical.

Si on ne met que les croisillons, cela crée un élément titre mais sans contenu textuel, donc une nouvelle slide mais non titrée.

::: notes
Pour une présentation à deux niveaux de titre, il faut respecter une règle assez précise. Au niveau de titre le plus élevé des deux, il ne faut mettre que des titres, aucun contenu (texte, image, etc.) : il faut imaginer une règle disant qu'un titre de section doit toujours être suivi directement d'un titre de sous-section.

Cette disposition se justifie surtout dans deux cas : pour faciliter les aller-retours dans un long diaporama ; pour produire une version à distribuer (PDF, docx…) un peu structurée.

À noter que le public peut ignorer totalement que la présentation est sur deux niveaux si les effets de transition et les boutons sont masqués, et que l'orateur ne bascule jamais l'affichage en mode *overview* (touche O).
:::

## Contenu

Toute la syntaxe Markdown est utilisable. On peut également inclure du HTML pour certains éléments rares mais utiles (*iframe*, *kbd*, etc.).

## Attributs de slide

`# Titre {data-background-color="#000000"}`

Ils viennent modifier le fond d'une slide en y affichant une couleur, image, vidéo ou *iframe* indiquée entre accolades.

L'*iframe* en fond est particulièrement intéressante pour montrer des ressources web en tirant parti de la totalité de l'écran (voir slide suivante).

::: notes
Les couleurs peuvent être identifiées par un nom dans le cas des couleurs nommées (ex : blue, red) et par leurs différents codes dans tous les cas (hexadécimal, rgb, rgba…). Les autres ressources sont incluses via leur URL (local ou distant).

Lorsqu'on inclut une *iframe* qui prend toute la taille de l'écran avec `data-background-iframe`, il peut être une bonne idée de laisser les contrôles Reveal apparents avec l'option `-V controls=true` de Pandoc. En effet, interagir avec le contenu de l'iframe déplace le cadre de l'interaction : les touches du clavier ne déclenchent alors plus les fonctions de Reveal, comme le défilement des slides. Laisser les boutons visibles permet de passer à la slide suivante et de reprendre le cours normal de la présentation.
:::

## {data-background-iframe="https://pandoc.org/MANUAL.html"}

## *Spans* et *divs*

Pandoc propose une syntaxe raccourcie pour appliquer des attributs (classes et identifiants CSS) à certains éléments ou groupe d'éléments. Ceci crée des *spans* et des *divs* en HTML.

`[texte]{attribut}`  
`![légende](image.jpg){attribut}`

```
::: {.attribut}
Contenu (texte, image, etc.)
:::
```

##

Exemple : [css]{.smallcaps} est en petites capitales car Pandoc rajoute la déclaration suivante pendant la conversion :

```css
.smallcaps { font-variant: small-caps; }
```

Partant de ce principe, on peut introduire ses propres règles de mise en forme ou réutiliser un jeu de règles existantes.

::: notes
Par exemple, la CSS appliquée à cette présentation ajoute une bordure et une ombre aux images, ainsi qu'une classe *borderless* à appliquer manuellement aux exceptions. On pourrait très bien faire l'inverse.

C'est le principe des macros dans les traitements de texte ou dans LaTeX.
:::

## Édition multicanal

![](img/multicanal.png){.borderless}

::: notes
Dans Reveal, le contenu du *div* notes ne s'affiche que dans le mode présentateur. Mais si on convertit le fichier source en Markdown dans un autre format, ce dernier affichera les notes sans aucun traitement spécifique, car un *div* n'a de sens qu'en HTML et CSS – Pandoc ne le prend en compte que lorsqu'on fabrique une présentation Reveal. En s'appuyant sur ce constat, on peut utiliser une autre commande Pandoc sur le même fichier pour créer un document distribuable (*handout*) reprenant tout le contenu (en PDF, docx, etc.).

Grâce aux attributs rajoutés à Markdown par Pandoc, on peut même aller un cran plus loin. CSS permet d'afficher ou masquer des éléments grâce à la propriété `display`, ce qui signifie qu'on peut rédiger le fichier source de manière à masquer une partie du contenu côté présentation (blocs entiers via *divs* et fragments intra-blocs via *spans*) et générer d'autre part un PDF qui affiche tout.

Il faut que le contenu s'y prête et cela nécessite de la gymnastique. Dans une certaine mesure, il s'agit d'emprunter une certaine conception lettrée de la programmation (*literate programming*, Donald Knuth) et de l'appliquer à Pandoc : ce dernier étant capable de tisser (*weave*) différents documents à partir d'un même fichier, on peut jouer sur les différences entre formats pour mettre en œuvre un processus d'édition multicanal.
:::

## Recommandations sur les images

![](img/paysage.005.png)

Résolution élevée, grande taille et zoom <kbd>Alt</kbd>+<kbd>clic</kbd>

::: notes
Un bon début consiste à définir les dimensions maximales d'affichage des images proportionnellement à la taille de l'écran. C'est plus facile à dire qu'à faire. Il faut par exemple considérer qu'une image dans une figure devrait être moins grande qu'une image standard, pour accommoder la légende positionnée dessous.
:::

## Juxtaposition horizontale {.long}

![](img/paysage.002.png)

![](img/paysage.004.png)

::: notes
La comparaison est un bon outil analytique. Il est facile de juxtaposer des images si elles sont au format paysage et de ratio équivalent : on les inclut normalement, séparées par deux retours à la ligne.

Par défaut, Reveal ne propose pas de solution pour afficher du contenu qui dépasserait la hauteur de la slide. Quelques lignes de CSS suffisent toutefois à créer une classe qui vient ajouter du défilement en cas de besoin (ici la classe *long*).
:::

## Juxtaposition verticale
![](img/portrait.001.png)
![](img/portrait.003.png)

::: notes
Pour juxtaposer deux images au format portrait, il faut juste les séparer par un retour à la ligne. En Markdown, il faut deux retours à la ligne pour séparer deux paragraphes. En séparant des images par un seul retour à la ligne, elles appartiennent au même paragraphe et sont donc positionnées sur une même ligne.

Assembler deux images et afficher le résultat en image de fond constitue une bonne option pour occuper exactement l'espace maximum disponible, si on n'a pas besoin de légende et si on maîtrise la résolution d'affichage.
:::

## Alignement d'images

![](img/carré.001.png)
![](img/carré.002.png)
![](img/carré.003.png)
![](img/carré.004.png)
![](img/carré.005.png)
![](img/carré.006.png)

::: notes
Un retour à la ligne automatique (*wrap*) intervient lorsque les images mises bout à bout excèdent la largeur de l'écran.
:::

## Figures

![Légende](img/portrait.003.png)

::: notes
Pandoc traite les images contenant du texte alternatif comme une figure avec image et légende.
:::

## Plusieurs figures

::: {.flex}
![Légende](img/carré.002.png)

![Légende](img/carré.004.png)

![Légende](img/carré.006.png)
:::

::: notes
Contrairement aux images simples, Pandoc traite les figures comme des blocs. <https://pandoc.org/MANUAL.html#extension-implicit_figures>

Pour juxtaposer plusieurs figures en ligne, il faut reproduire la situation des images contenues dans un paragraphe, en enveloppant les figures avec un élément *div* sur lequel on applique une classe CSS contenant les déclarations utiles : retour automatique, espacement, alignement, etc. Les détails sont une question de choix mais le standard Flexbox offre a priori exactement les outils souhaités.
:::

## Légende sur le côté

::: {.sidecaption}
![Une figure contient une image *(img)* et une légende *(figcaption)* positionnée dessous. Pour tirer le meilleur parti des contraintes spatiales de l'écran, on peut vouloir modifier leur disposition, par exemple en mettant la légende sur le côté quand l'image s'y prête.](img/paysage.001.png)
:::

## {background="black"}

![Art génératif via Processing, Étienne Jacob, 2018](img/EtienneJacob2018.webp){.borderless .stretch}

::: notes
On peut combiner les attributs de section à des attributs d'élément, ici sur une image, pour des effets visuels particulièrement prononcés. <https://pandoc.org/MANUAL.html#extension-link_attributes>

Source : <https://necessary-disorder.tumblr.com/post/180757120663>
:::

# Crédits {data-background="#E78AC3"}

##

::: {#credits}
- [Texte et présentation]{} [Arthur Perret – CC BY]{}
- [Markdown]{} [John Gruber – BSD]{}
- [CSS]{} [W3C – BSD]{}
- [Reveal]{} [Hakim El Hattab – BSD]{}
- [Pandoc]{} [John McFarlane – GPL]{}
- [EB Garamond]{} [Georg Duffner, Octavio Pardo – OFL]{}
- [Art génératif]{} [Étienne Jacob]{}
:::