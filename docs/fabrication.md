# Fabrication d'une présentation

## Première slide

Le bloc de métadonnées en YAML au début du fichier Markdown permet de fournir les éléments de la première slide, qui est créée automatiquement. Il peut aussi contenir des options propres à Pandoc.

## Slides

Un titre signale le début d'une nouvelle slide. Un seul niveau de titre dans tout le document crée une présentation linéaire ; utiliser deux niveaux différents crée une présentation en deux dimensions, avec un défilement horizontal et vertical.

Si on ne met que les croisillons, cela crée un élément titre mais sans contenu textuel, donc une nouvelle slide mais non titrée.

Pour une présentation à deux niveaux de titre, il faut respecter une règle assez précise. Au niveau de titre le plus élevé des deux, il ne faut mettre que des titres, aucun contenu (texte, image, etc.) : il faut imaginer une règle disant qu'un titre de section doit toujours être suivi directement d'un titre de sous-section.

Cette disposition se justifie surtout dans deux cas : pour faciliter les aller-retours dans un long diaporama ; pour produire une version à distribuer (PDF, docx…) un peu structurée.

À noter que le public peut ignorer totalement que la présentation est sur deux niveaux si les effets de transition et les boutons sont masqués, et que l'orateur ne bascule jamais l'affichage en mode *overview* (touche O).

## Contenu

Toute la syntaxe Markdown est utilisable. On peut également inclure du HTML pour certains éléments rares mais utiles (*iframe*, *kbd*, etc.).

## Attributs de slide

`# Titre {data-background-color="#000000"}`

Ils viennent modifier le fond d'une slide en y affichant une couleur, image, vidéo ou *iframe* indiquée entre accolades.

L'*iframe* en fond est particulièrement intéressante pour montrer des ressources web en tirant parti de la totalité de l'écran (voir slide suivante).

Les couleurs peuvent être identifiées par un nom dans le cas des couleurs nommées (ex : blue, red) et par leurs différents codes dans tous les cas (hexadécimal, rgb, rgba…). Les autres ressources sont incluses via leur URL (local ou distant).

Lorsqu'on inclut une *iframe* qui prend toute la taille de l'écran avec `data-background-iframe`, il peut être une bonne idée de laisser les contrôles Reveal apparents avec l'option `-V controls=true` de Pandoc. En effet, interagir avec le contenu de l'iframe déplace le cadre de l'interaction : les touches du clavier ne déclenchent alors plus les fonctions de Reveal, comme le défilement des slides. Laisser les boutons visibles permet de passer à la slide suivante et de reprendre le cours normal de la présentation.

## *Spans* et *divs*

Pandoc propose une syntaxe raccourcie pour appliquer des attributs (classes et identifiants CSS) à certains éléments ou groupe d'éléments. Ceci crée des *spans* et des *divs* en HTML.

`[texte]{attribut}`  
`![légende](image.jpg){attribut}`

```
::: {.attribut}
Contenu (texte, image, etc.)
```

Exemple : [css]{.smallcaps} est en petites capitales car Pandoc rajoute la déclaration suivante pendant la conversion :

```css
.smallcaps { font-variant: small-caps; }
```

Partant de ce principe, on peut introduire ses propres règles de mise en forme ou réutiliser un jeu de règles existantes.

Par exemple, la CSS appliquée à cette présentation ajoute une bordure et une ombre aux images, ainsi qu'une classe *borderless* à appliquer manuellement aux exceptions. On pourrait très bien faire l'inverse.

C'est le principe des macros dans les traitements de texte ou dans LaTeX.

## Édition multicanal

![](img/multicanal.png)

Dans Reveal, le contenu du *div* notes ne s'affiche que dans le mode présentateur. Mais si on convertit le fichier source en Markdown dans un autre format, ce dernier affichera les notes sans aucun traitement spécifique, car un *div* n'a de sens qu'en HTML et CSS – Pandoc ne le prend en compte que lorsqu'on fabrique une présentation Reveal. En s'appuyant sur ce constat, on peut utiliser une autre commande Pandoc sur le même fichier pour créer un document distribuable (*handout*) reprenant tout le contenu (en PDF, docx, etc.).

Grâce aux attributs rajoutés à Markdown par Pandoc, on peut même aller un cran plus loin. CSS permet d'afficher ou masquer des éléments grâce à la propriété `display`, ce qui signifie qu'on peut rédiger le fichier source de manière à masquer une partie du contenu côté présentation (blocs entiers via *divs* et fragments intra-blocs via *spans*) et générer d'autre part un PDF qui affiche tout.

Il faut que le contenu s'y prête et cela nécessite de la gymnastique. Dans une certaine mesure, il s'agit d'emprunter une certaine conception lettrée de la programmation (*literate programming*, Donald Knuth) et de l'appliquer à Pandoc : ce dernier étant capable de tisser (*weave*) différents documents à partir d'un même fichier, on peut jouer sur les différences entre formats pour mettre en œuvre un processus d'édition multicanal.

## Recommandations sur les images

```
![](img/paysage.005.png)
```

Résolution élevée, grande taille et zoom <kbd>Alt</kbd>+<kbd>clic</kbd>

Un bon début consiste à définir les dimensions maximales d'affichage des images proportionnellement à la taille de l'écran. C'est plus facile à dire qu'à faire. Il faut par exemple considérer qu'une image dans une figure devrait être moins grande qu'une image standard, pour accommoder la légende positionnée dessous.

## Juxtaposition horizontale 

```
![](img/paysage.002.png)

![](img/paysage.004.png)
```

La comparaison est un bon outil analytique. Il est facile de juxtaposer des images si elles sont au format paysage et de ratio équivalent : on les inclut normalement, séparées par deux retours à la ligne.

Par défaut, Reveal ne propose pas de solution pour afficher du contenu qui dépasserait la hauteur de la slide. Quelques lignes de CSS suffisent toutefois à créer une classe qui vient ajouter du défilement en cas de besoin (ici la classe *long*).

## Juxtaposition verticale

```
![](img/portrait.001.png)
![](img/portrait.003.png)
```

Pour juxtaposer deux images au format portrait, il faut juste les séparer par un retour à la ligne. En Markdown, il faut deux retours à la ligne pour séparer deux paragraphes. En séparant des images par un seul retour à la ligne, elles appartiennent au même paragraphe et sont donc positionnées sur une même ligne.

Assembler deux images et afficher le résultat en image de fond constitue une bonne option pour occuper exactement l'espace maximum disponible, si on n'a pas besoin de légende et si on maîtrise la résolution d'affichage.

## Alignement d'images

```
![](img/carre.001.png)
![](img/carre.002.png)
![](img/carre.003.png)
![](img/carre.004.png)
![](img/carre.005.png)
![](img/carre.006.png)
```

Un retour à la ligne automatique (*wrap*) intervient lorsque les images mises bout à bout excèdent la largeur de l'écran.

## Figures

```
![Légende](img/portrait.003.png)
```

Pandoc traite les images contenant du texte alternatif comme une figure avec image et légende.

## Plusieurs figures

```
![Légende](img/carre.002.png)

![Légende](img/carre.004.png)

![Légende](img/carre.006.png)
```

Contrairement aux images simples, Pandoc traite les figures comme des blocs. <https://pandoc.org/MANUAL.html#extension-implicit_figures>

Pour juxtaposer plusieurs figures en ligne, il faut reproduire la situation des images contenues dans un paragraphe, en enveloppant les figures avec un élément *div* sur lequel on applique une classe CSS contenant les déclarations utiles : retour automatique, espacement, alignement, etc. Les détails sont une question de choix mais le standard Flexbox offre a priori exactement les outils souhaités.

## Légende sur le côté

Une figure contient une image *(img)* et une légende *(figcaption)* positionnée dessous. Pour tirer le meilleur parti des contraintes spatiales de l'écran, on peut vouloir modifier leur disposition, par exemple en mettant la légende sur le côté quand l'image s'y prête.

## Combinaisons

On peut combiner les attributs de section à des attributs d'élément pour des effets visuels particulièrement prononcés. <https://pandoc.org/MANUAL.html#extension-link_attributes>