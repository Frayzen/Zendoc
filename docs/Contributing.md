---
title: Contributing 😎
---

If you want to contribute to this repo, please read this few tips before opening your PR:

The `page` and `file` can be considered identical in the following explanations. They are both related to a **markdown file**.

## Section system

Every **folder** will be associated with a **page** in the hierarchy.
It acts as a **section** and will be collapsable if it contains more than a single file, otherwise, the whole folder is reduced to this single page.
The page the folder is associated with is always found directly within it. 

> [!important] Please make sure that every folder contains at least one markdown file

The associated page is (in order of priority):

1. The markdown file named just like the folder (*example: docs/my/path/section/section.md*) 
1. The markdown file named `index.md` (*example: docs/my/path/section/index.md*) 
3. The first markdown file found (*by alphabetical order*) 

## Page naming

Every page needs a name. If a page is created without any name specified, the default name will be the file name (without the extension, obviously).
You can specify a page name by adding a header to your markdown file: 
```md
---
title: Whatever title
---

here is your page content

```

This title can be found very useful in case you want a fancy name for your section ([[#Section system]]).

> [!important] If the page does not contain any header 1 (denoted with a single #), the name of the page will automatically be added as a header 1 at the very top of the page.

## Page linking

This repo uses obsidian syntax. In order to create a link to another page, use the following syntax:
```md
 [[Name Of The File]]
```
Where a file `Name Of The File.md` can be found anywhere in the repository.

### Name Colission

Please be careful about **name collisions** as some page name can be pretty common (*such as Example.md*).
In case of name collision, specify a bit more of context to link the page. For example, if there exists two files `docs/my/path/a/file.md` and `docs/my/path/b/file.md`, you can specify `b/file.md` or `a/file.md` to clarify.

## Embed pdf / Images

In order to embed pdf or add images, you can use the folling syntax:
```md
Example of an image:
![[YourImage.png]]
Example of an embeded pdf:
![[YourPdfName.pdf]]{ type=application/pdf }
Example of a pdf link:
![[YourPdfName.pdf]
```
Where a file `YourPdfName.pdf` and a file `YourImage.png` can be found anywhere in the repository. However, please try to keep the repo clean and either put your pdf files next to your markdown file or inside of the `docs/assets/` folder.
Check out [[#Name Colission]] in case a pdf/image file already exists in the repo with a similar name.
