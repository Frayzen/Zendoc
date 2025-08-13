---
Owner: "Florian "
---
- Trouver la ligne de commande de votre kernel et expliquer ce qu'elle contient
- Enumerer le nom des differentes partitions ainsi que le systeme de fichier qu'elle contiennent.
`BOOT_IMAGE=/vmlinuz-linux root=UUID=90eb239d-d824-4eb5-8734-7eb564ded65f rw rootflags=subvol=@ zswap.enabled=0 rootfstype=btrfs loglevel=3 quiet`
`**BOOT_IMAGE=/vmlinuz-linux**` **specify l’image kernel a charger**
`**root=UUID=90eb239d-d824-4eb5-8734-7eb564ded65f**` **definie l’UUID de la partition root**
`**rw**` **specifie de monter la partition en lecture / ecriture**
`**rootflags=subvol=@**` **est une option specifique a btrfs**
`**zswap.enabled=0**` **desactive le swap par defaut**
`**rootfstype=btrfs**` **fourni le file system de la partition root**
`**loglevel=3**` **specifie la verbosite (KER_ERR)**
`**quiet**` **masque la plupart des messages de log**
- Trouvez votre _initramfs_, ou se situe t'il sur votre système ?
    
    ```Bash
    ❯ ls /boot
    grub  initramfs-linux-fallback.img  initramfs-linux.img  vmlinuz-linux
    ```
    
    **mon initramfs se situe dans** `**/boot**`
    
- Decrivez le contenu de ce dernier en quelques lignes.
    - **des objets kernels** `**.ko.zst**`
    - **des binaires dans** `**/usr/bin/**`
    - **des shared libraires dans** `**/usr/lib/**`
- Trouvez votre noyau sur votre système. Quel est le format du fichier ? Donnez une justification du format de fichier.
    
    **Le noyau linux se trouve dans** `**/boot/vmlinuz-linux**` **. Son type est** `**Linux kernel x86 boot executable, bzImage, version 6.14.6-arch1-1**`**.**
    
  
Pour l'étape suivante nous allons avoir besoin des sources de linux, vous pouvez les récupérer depuis le miroir github.
- Extrayez l’archive de votre noyau, sous linux vous pouvez utiliser le script `extract-vmlinux` présent dans ses sources. Quel est le format du fichier obtenu ?
    
    **Le format de sortie est** `**ELF 64-bit LSB executable, x86-64**`**.**
    
- Utilisez l’outil _readelf_ et observez les segments. Quelles différences observez vous par rapport a un binaire classique comme _sh_ ?
    
    **On retrouve bien des sections comme** `**.text**` `**.rodata**` **ou** `**.data**` **mais aussi des sections plus exotiques comme** `**.apicdrivers**` **ou** `**.init.scratch**`**.**
    
  
Que se passe t'il après 30 secondes ? Pourquoi ?
**Apres 30 secondes, on recoit un Kernel Panic avec un message “**_**Attempted to kill init**_**”. Cela se produit car le processus init arrive a la fin de son execution. Cela ne devrait jamais arrive.**
Que se passe t'il ? Donner votre comprehension du message d'erreur.
**Le système échoue au démarrage avec l’erreur :**
`**Kernel panic - not syncing: No working init found.**`
**Le noyau cherche un exécutable** `**init**` **(ici, un lien vers** `**/bin/sh**`**), mais** `**/bin/sh**` **n’existe pas dans l’initramfs. Sans programme valide pour démarrer l’espace utilisateur, le kernel panique et s’arrête.**
Regardez sur votre système le format de ce fichier. Combien comporte t il de colonnes ? Donner leur significations.
**Le format du fichier est ASCII text.**
**Il comporte 6 colonnes (<file system> <dir> <type> <options> <dump> <pass>)**