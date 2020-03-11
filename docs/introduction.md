# Pourquoi ce système ?

Une présentation scientifique doit se penser en termes de raison graphique, à contre-courant de la culture présentationnelle dominante façonnée par PowerPoint. Ne pas le faire, c'est saboter sa propre énonciation.

- Tufte, E. R. (2003). *The Cognitive Style of PowerPoint: Pitching Out Corrupts Within.* Cheshire : Graphics Press.
- Haladjian, R. (2003). *Devenez beau, riche et intelligent, avec PowerPoint, Excel et Word.* Paris : Éditions d’Organisation. <http://pauillac.inria.fr/~weis/info/haladjian.pdf> (merci à Henri Sergent)
- Frommer, F. (2010). *La pensée Powerpoint : enquête sur ce logiciel qui rend stupide.* Paris : La Découverte.
- Robles-Anderson, E., & Svensson, P. (2016). « One Damn Slide After Another »: PowerPoint at Every Occasion for Speech. *Computational Culture*, (5). <http://computationalculture.net/one-damn-slide-after-another-powerpoint-at-every-occasion-for-speech/>

À ces trois références, on peut ajouter les nombreux travaux de l'équipe d'Yves Jeanneret et Emmanuël Souchier, avec les concepts d'architexte, de plastigramme, etc.

## Deux points de vigilance

La liste à puces est souvent une béquille creuse qui tend à effacer les liens entre les étapes d'un raisonnement.

Pour représenter efficacement de l'information, il faut acquérir des notions de composition, d'édition, de design (hiérarchie, blanc, densité, résolution, etc.) sous peine de contre-productivité fatale (« *Death by PowerPoint* »).

C'est là que la courbe d'apprentissage est la plus pentue, et le bénéfice intellectuel le plus grand.


## *Desiderata*

- **Pérennité** : travailler avec un format léger, ouvert, facile à lire et à écrire.
- **Efficacité** : automatiser, éditer précisément, reproduire rapidement et sûrement.
- **Fonctionnalité** : bénéficier des innovations du web – mise en page adaptative, défilement, transclusion, etc.
- **Liberté** : accroître son agilité informatique, choisir ses dépendances logicielles en toute conscience.

La suite Office (Word, Excel, PowerPoint) et la suite Google (Docs, Sheets, Slides) ne nous apprennent strictement rien sur la fabrique du Web. Ce qu’on peut réaliser avec quelques lignes de texte brut me paraît bien plus intéressant dans une perspective de culture numérique. Les compétences de mise en page qu’on apprend pour styler une présentation en Reveal.js, par exemple, sont transférables à toute autre projet qui utilise les technologies du Web – notamment l'édition.

## Solution proposée

- Écriture en Markdown (avec les ajouts de Pandoc).
- Mise en forme via CSS.
- Conversion en HTML (avec Reveal.js) via Pandoc.

Pourquoi Markdown avec Pandoc, et pas Asciidoc avec Asciidoctor ? C'est une question de complexité : la sémantique d'Asciidoc (héritée de DocBook XML) et l'univers logiciel d'Asciidoctor (Ruby, NodeJS) sont trop lourds pour mes besoins. Je pense que ces outils parlent plus facilement aux développeurs, aux ingénieurs, ainsi qu'aux documentalistes techniques.