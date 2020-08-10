How to contribute to The Astrobook
==================================

Every time you join a new project, you enter in a new world with its own
culture. Different tools apply together with a variety of rules. Those tools and
rules are usually related with software utilities such us code formatting,
version control workflow and many others. This file presents and explains in
detail all the different good practices under which **The Astrobook**
development team works. Each one of your future contributions should apply to
this collection of routines and habits. Notice that some practices might evolve
as project's maturity does. Core developers and maintainers are also responsible
of promoting these good coding practices within the different contributors.


How to write book content
-------------------------

Content is the core of the book. In this case, we understand by "book content"
any kind of text or information that will be rendered in the end and presented
to final reader. This kind of content is usually technical and requires
knowledge on the topic developer is writing about. All these content is located
into different files within the `astrobook/content/` directory.

When writing content, you will check for different sources: articles, papers,
journals, other books... If some information is retrieved from any of those, it
is **mandatory** to cite original reference material. This is not only a good
practice when writing any kind of content but also enables readers to track
original content sources.

Each file holding technical content will have a final section in which
references to original material are listed. Please, append your references
within this particular section every time a new or updated content is introduced
within the volume. Finally, all files will not exceed 80 column characters and
require to be formatted to this particular limit.


How to draw technical figures
-----------------------------

Because of both drawing quality and reproducible reasons, software used for
drawing technical figures has been selected to be
[Asymptote](https://asymptote.sourceforge.io/). By making use of scripts, it
provides an easy and light way to generate vector drawings. It supports both 2D
and 3D graphics and its syntax is quite similar to that one of the C programming
language.

When **The Astrobook** is built, Asymptote executes and renders each one of the
scripts hosted under `astrobook/drawings/` directory. This generates a
collection of `*.png` files which are then used by source content files.

It might be tedious or difficult to develop drawing content, but this ensures
all images to share a common style, no matter original artist or author. Again,
and due to script nature of the files, coding formatting rules apply. Due to is
similarity to C, coding style used is the one presented in [The C programming
language](https://en.wikipedia.org/wiki/The_C_Programming_Language) by by Brian
Kernighan and Dennis Ritchie.


How to package maintenance
--------------------------

Some tasks or activities are not related at all with technical content but with
software used to build and render **The Astrobook**. Main tool in charge of this
task is [Jupyter Book](https://jupyterbook.org/intro.html), a
[Python](https://www.python.org/) library for building custom books based on
computational material.

New versions of both previous software might be released and this project should
adapt if required to those. New features may be implemented while others can be
deprecated. Developers working within these kind of tasks are expected to have
knowledge on Python Packaging and library maintenance.
