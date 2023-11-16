#import "@preview/codly:0.1.0": *
#import "@preview/tablex:0.0.6": *
#import "ugent-template.typ": *
#import "../common/typstguy.typ": typstguy

// This can be removed if you don't include code:
#let code-icon(icon) = text(
  font: "tabler-icons",
  fallback: false,
  weight: "regular",
  size: 8pt,
  icon,
)

// Instantiate the template
#show: ugent-template.with(
  authors: ( "Sébastien d'Herbais", ),
  title: "Demo of the UGhent template",
  // This can be removed if you don't include code:
  languages: (
    yaml: (name: gloss("yaml", short: true), icon: code-icon("\u{f029}"), color: red),
    typc: (name: "Typst", icon: typstguy, color: rgb("#239DAD"))
  )
)

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