#import "../ugent-template.typ": *
#show: ugent-preface

= Remark on the master's dissertation and the oral presentation
This master's dissertation is part of an exam. Any comments formulated by the assessment committee during the oral
presentation of the master's dissertation are not included in this text.

= Acknowledgements <sec_ack>
Here you will include your acknowledgements, don't forget to first thank your promoter(s) followed by your supervisor(s).

#align(right)[
  -- Your Name \
  Place, Date
]

= Permission of use on loan

The author gives permission to make this master dissertation available for consultation and to
copy parts of this master dissertation for personal use. In the case of any other use, the copyright
terms have to be respected, in particular with regard to the obligation to state expressly the
source when quoting results from this master dissertation.

#align(right)[
  -- Your Name \
  Place, Date
]

= Abstract

Your short abstract goes here. Give a short summary of your work, including the main results. The abstract should be short a couple of paragraphs at most.

== Keywords

Your keywords.

#ugent-outlines(
  // Whether to include a table of contents.
  heading: true,

  // Whether to include a list of acronyms.
  acronyms: true,

  // Whether to include a list of figures.
  figures: true,

  // Whether to include a list of tables.
  tables: true,

  // Whether to include a list of equations.
  equations: true,

  // Whether to include a list of listings (code).
  listings: true,
)