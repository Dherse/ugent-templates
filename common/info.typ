#import "./colors.typ": *

#let info-settings = (
  info: (
    prefix: none,
    icon: "circle-info",
    fill_color: ugent-blue.lighten(90%),
    stroke_color: ugent-blue,
  ),
  definition: (
    prefix: [#underline(smallcaps[*Definition*])#smallcaps[:]],
    icon: "highlighter-solid",
    fill_color: caribbean-current.lighten(90%),
    stroke_color: caribbean-current,
  ),
  question: (
    prefix: none,
    icon: "circle-question",
    fill_color: proper-purple.lighten(90%),
    stroke_color: proper-purple,
  ),
  important: (
    prefix: none,
    icon: "circle-exclamation",
    fill_color: rgb("#228B22").lighten(90%),
    stroke_color: rgb("#228B22").darken(20%),
  ),
  conclusion: (
    prefix: none,
    icon: "lightbulb-solid",
    fill_color: earth-yellow.lighten(90%),
    stroke_color: earth-yellow,
  ),
  good: (
    prefix: none,
    icon: "circle-check",
    fill_color: rgb("#FFD700").lighten(90%),
    stroke_color: rgb("#FFD700").darken(20%),
  ),
  note: (
    prefix: [ *Note:* ],
    icon: "note-sticky",
    fill_color: rgb("#FFD700").lighten(90%),
    stroke_color: rgb("#FFD700").darken(20%),
  ),
);

#let info-stroke(kind: "good") = info-settings.at(kind).stroke_color

#let info-image(kind: "info", ..args) = {
  let settings = info-settings.at(kind);
  image(
    "./assets/solid/" + settings.icon + ".svg", ..args,
    alt: settings.icon,
  )
}

#let __ubox(body, kind: "info", radius: 5pt, footer: none, icon: true) = {
  show par: set block(spacing: 0pt)
  let settings = info-settings.at(kind);
  let extra = if footer == none {
    none
  } else {
    linebreak()
    h(1fr)
    underline[#footer]
  }

  let contents = if icon {
    (
      image("./assets/" + settings.icon + ".svg", width: 32pt),
      {
        settings.prefix
        body
        extra
      }
    )
  } else {
    (
      {
        settings.prefix
        body
        extra
      },
    )
  }
  box(
    width: 0.8fr,
    fill: settings.fill_color,
    stroke: 1pt + settings.stroke_color,
    radius: radius,
    inset: 0pt,
    table(
      columns: if icon { (38pt, 1fr) } else { 1 },
      inset: 9.6pt,
      stroke: none,
      align: horizon,
      ..contents,
    )
  )
}

#let uinfo(body, footer: none) = __ubox(body, kind: "info", footer: footer)
#let udefinition(body, footer: none) = __ubox(body, kind: "definition", footer: footer)
#let uquestion(body, footer: none) = __ubox(body, kind: "question", footer: footer)
#let uimportant(body, footer: none) = __ubox(body, kind: "important", footer: footer)
#let uconclusion(body, footer: none) = __ubox(body, kind: "conclusion", footer: footer)
#let ugood(body, footer: none) = __ubox(body, kind: "good", footer: footer)
#let unote(body, footer: none) = __ubox(body, kind: "note", footer: footer)