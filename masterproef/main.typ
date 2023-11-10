#import "@preview/codly:0.1.0": *
#import "@preview/tablex:0.0.6": *
#import "ugent-template.typ": *

// Instantiate the template
#show: ugent-template.with(
  authors: ( "Sébastien d'Herbais", ),
  title: "Demo of the UGhent template",
)

// Here we can define out glossary entries, go and edit it!
#include "./parts/glossary.typ"

// Here we include your preface, go and edit it!
#include "./parts/preface.typ"

// Here we now enter the *real* document
#show: ugent-body

// Here we include your chapters, go and edit them!
#include "./parts/0_introduction.typ"

// Here we display the bibliography loaded from `references.bib`
#ugent-bibliography()

// Here begins the appendix, go and edit it!
#include "./parts/appendix.typ"