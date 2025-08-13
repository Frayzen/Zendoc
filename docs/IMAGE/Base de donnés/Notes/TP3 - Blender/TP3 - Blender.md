---
Matière:
  - "[[Introduction à la synthèse d’image]]"
Type: TP/TD
Date du cours: 2025-03-24
Supports:
  - "[[isim_tp3_1.pdf.crdownload]]"
---
![[bn-header-44.jpg]]
  
# Conseils
  

> [!important] Bonne chaine Youtube :
> 
> > [!info] Blender Guru  
> > Andrew Price creates tutorials for the free open source 3D software "Blender".  
> > [https://www.youtube.com/@blenderguru](https://www.youtube.com/@blenderguru)  
  
Dans view cocher “Camera to view” pour placer la camera facilement en mode “0”.
## Objets
  
# [Controls](http://quickref.me/blender.html)
  
petite croix en haut a doirte : faire 2 vues
## [Shortcuts](https://docs.blender.org/manual/en/latest/interface/keymap/introduction.html)
  
transleter l’objet : `g` → valider avec clic gauche, anuler clic droit
`gz1` : translation sur axe z de 1, `gz` : translation sur l’axe z
`gr5` : rotation de 5
`Shift+a` : ajouter quelque chose
numpad `0` : vu de la camera
`tab` : mode edition d’objet
- mode selection :
    - `ctrl + +` : propage la selection
    - `c` :
`x` : supprimer object
`Shift + b` : dupliquer un objet
  
# [Edit mode](https://docs.blender.org/manual/en/latest/editors/3dview/modes.html)
  
Faire `tab` pour passer en edit mode.
On peut y modifier l’objet par les :
- sommets
- arretes
- faces
## [Extrude](https://docs.blender.org/manual/en/latest/modeling/meshes/editing/mesh/extrude.html)
`E` en mode edit sur une face de l’objet.
Permet de “tirer” la face d’un objet.
### [Spin](https://docs.blender.org/manual/en/latest/modeling/meshes/tools/spin.html)
Placer le centre de rotation avec `Shift + clic droit` et l’axe de rotation avec spin puis extrude.
  
# [Modifiers](https://docs.blender.org/manual/en/latest/modeling/modifiers/index.html)
  
On peut en ajouter autant qu’on veut, on peut les chainer et les ordonner pour definier les importances l’ordre d’application).
## [Particule system](https://docs.blender.org/manual/en/latest/modeling/modifiers/physics/particle_system.html)
Pour faire des poils ou cheveux.
## [Array](https://docs.blender.org/manual/en/latest/modeling/modifiers/generate/array.html)
array : permet de dupliquer en indiquant la transformation (rotation, translation…). On peut indiqeur le nombre de fois que l’on veut duppliquer. ==Utile pour faire des escalier en colimacon.==
![[xofun.jpg]]
  
# [Shading](https://docs.blender.org/manual/en/latest/render/shader_nodes/shader/index.html) - Textures
  
![[Blender_shader_node_editor_showcasing_a_Moldy_Gold_Materiel.png]]
![[uploads_1598553133983-1598553133983.png]]
En haut passer en mode shading.
Les controles sont les memes pour la vue.
Permet d’ajouter des textures.
### [Color Ramp](https://docs.blender.org/manual/en/latest/render/shader_nodes/converter/color_ramp.html)
Degrade.
![[compositing_types_converter_color-ramp_colorizing-image.png]]
### [Combiner des textures](https://docs.blender.org/manual/en/latest/render/shader_nodes/shader/mix.html)
Soit on aditionnne les couleurs. Soit on mixe les shaders.
On peut deteminer quel shader a la plus d’effet (importantce).
### [Displacement](https://docs.blender.org/manual/en/latest/render/materials/components/displacement.html)
Permet de faire des reliefs aux textures.
![[maxresdefault.jpg]]
  
## [UV Map](https://docs.blender.org/manual/en/latest/modeling/meshes/uv/applying_image.html)
![[vK9zPh1BdiKOkSAvypv3zw635CQ.avif]]
On map les valeurs de la texture sur la surface du mesh.
On va ouvrir (déplier l’objet) dans le repère texture.
  
# [Rendu](https://docs.blender.org/manual/fr/dev/render/index.html)
F11 : vu du resultat du rendu
F12 : lancer le rendu
## Renderer view
`z + 8`
# [Animation](https://docs.blender.org/manual/en/latest/animation/index.html)
## [Frame](https://docs.blender.org/manual/en/latest/animation/keyframes/editing.html)
i : sauvegarder une frame
Shift + i : pour enlever la frame
On peut sauvegarder plein de parametre avec i dans une frame.
## [Interpolation](https://docs.blender.org/manual/en/latest/animation/keyframes/introduction.html#interpolation)
Le logiciel interpolera tout seul le mouvement (rotation, translation).
On peut modifier la courbe d’acceleration du mouvement. ==Ouvrir le graph editor.==
## [Armature](https://docs.blender.org/manual/en/latest/animation/armatures/index.html)
Shift+a sur un objet en object mode puis selctionner armature. Pour ajouter des os faire extrude sur le bout d’un autre os.
On indique que le cilidre est un parent de l’armature : selectione les deux en object mode . Si on bouge le skelette on bouge le cylindre.
On peut changer les poids en weight ode.
### [Pose](https://docs.blender.org/manual/en/latest/animation/constraints/tracking/ik_solver.html)
Inverse kinematics dans l’onglet pose, bone.
### [Empties](https://docs.blender.org/manual/en/latest/modeling/empties.html)
On peut créer un objet vide, on va le selectionner tou les objet et l’empty en dernier. Cela va faire nue hiérarchie automatiquement. On va appliquer les transformation à l’empty pour animer centrer sur l’empty.
  
# Modification d’objet
## [Création de face / arrête](https://docs.blender.org/manual/fr/2.91/modeling/meshes/editing/vertex/make_face_edge.html)
Edit mode, selection d’une face, inset une “sous face”.
`Shift + clic gauche` pour selctionner les bord a relier, puis `f` crée une arrête.
Fill in un contour vide avec `f`. Apres avoir selectionner les bords.
## [Subdivision](https://docs.blender.org/manual/en/latest/modeling/modifiers/generate/subdivision_surface.html)
Slectionner tous les côtés du cylindre. Avec `ctrl + r` et la `molette` on peut subdiviser l’objet suivant une direction.
En edit mode il est possible de subdiviser la face en $n$ sub faces avec `clic droit + subdivide`.
## [Peinture](https://docs.blender.org/manual/en/latest/sculpt_paint/texture_paint/index.html)
En UV mode on peut directement peindre sur la texture de l’objet.
Il faut mettre en entrée de la texture dans le shader, l’image texture créée.
## [Geometry Node](https://docs.blender.org/manual/en/latest/modeling/geometry_nodes/index.html)
Il est possible de transformer un cube en collection de spehere.
On peut egalement ajouter une sphere a des endroit aléatoires.
# Objets
Penser a mettre des noms explixcite au objets et a les regrouper.
Nommer des selections d’objets. Tres utile pour les bjets complexes.
## [Metaballs](https://docs.blender.org/manual/en/latest/modeling/metas/index.html)
Elle s’attachent ensembles si elles ont le même nom.