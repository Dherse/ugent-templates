#let __query_labels_with_key(loc, key, before: false) = {
    if before {
        query(selector(label("glossary:" + key)).before(loc, inclusive: false), loc)
    } else {
        query(selector(label("glossary:" + key)), loc)
    }
}

#let gloss(key, suffix: none, short: auto, long: auto) = {
  locate(loc => {
    let glossary-entries = state("glossary_entries").final(loc);
    if not key in glossary-entries {
      panic("Glossary key not found: " + key);
    }

    let entry = glossary-entries.at(key)
    let gloss = __query_labels_with_key(loc, key, before: true)
    let in_preface(loc) = state("section").at(loc) == "preface";

    // Find whether this is the first glossary entry.
    let is_first = if in_preface(loc) {
      gloss.map((x) => x.location()).find((x) => in_preface(x)) == none;
    } else {
      gloss.map((x) => x.location()).find((x) => not in_preface(x)) == none
    }

    let is_long = if long == auto { is_first } else { long }
    let long = if is_long {
      " (" + emph(entry.long) + ")"
    } else {
      none
    }

    [
      #link(label(entry.key))[#entry.short#suffix#long]
      #label("glossary:" + entry.key)
    ]
  })
}

#let gloss-init(body) = {
  show ref: r => {
    if r.element != none and r.element.func() == heading and r.element.level == 99 {
      gloss(str(r.target), suffix: r.citation.supplement)
    } else {
      r
    }
  }

  body
}

#let gloss-entry(key, short, long) = {
  state("glossary_entries").update((entries) => {
    if entries == none {
      entries = (:);
    }
    entries.insert(key, (short: short, long: long, key: key))
    entries
  })
}

#let glossary(title: "Glossary") = {
  locate(loc => {
    let entries = state("glossary_entries").final(loc);
    if entries == none {
      return;
    }

    [
      #heading(title) <glossary>
    ]
    let elems = ();
    for entry in entries.values().sorted(key: (x) => x.key) {
      elems.push([
        #heading(smallcaps(entry.short), level: 99, numbering: "1.")
        #label(entry.key)
      ])

      elems.push({
        emph(entry.long)
        box(width: 1fr, repeat[.])
        __query_labels_with_key(loc, entry.key)
          .map((x) => x.location())
          .dedup(key: (x) => x.page())
          .sorted(key: (x) => x.page())
          .map((x) => link(x)[#numbering(x.page-numbering(), ..counter(page).at(x))])
          .join(", ")
      })
    }

    table(
      columns: (auto, 1fr),
      inset: 5pt,
      stroke: none,
      fill: (_, row) => {
        if calc.odd(row) {
          luma(240)
        } else {
          white
        }
      },
      align: horizon,
      ..elems
    )
  })
}