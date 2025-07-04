#import "resources/format.typ": project
#import "@preview/muchpdf:0.1.0": muchpdf

#let versions = (
  (
    "v1.0",
    "24.02.2025",
    "Creation of the document outline."
  ),
  (
    "v1.1",
    "24.02.2025",
    "Automatically generated document version table."
  ),
  (
    "v1.2",
    "07.04.2025",
    "Added description of the key generator for control term."
  ),
  (
    "v1.3",
    "18.04.2025",
    "Slight fixes to chapter 3.2, started chapter 3.3."
  ),
  (
    "v1.4",
    "19.04.2025",
    "Added description of the signer's implementation."
  ),
  (
    "v1.5",
    "28.04.2025",
    "Finished the description of the signer's implementation, its functionality, and the summary."
  ),
  (
    "v1.6",
    "19.05.2025",
    "Added a link to the GitHub repository and attached the Doxygen documentation."
  )
)

#show: project.with(
  title: "Security of Computer Systems",
  subtitle: "",
  authors: (
    "Jakub Jędrzejczyk, 188752",
  ),
  school-logo: [],
  company-logo: [],
  mentors: (),
  jury: (),
  branch: none,
  academic-year: none,
  polish: false,
  footer-text: "",
  supertitle: "Project Report",
  subject: [],
  versions: versions
)

#show link: set text(blue)

#include "chapters/abstract.typ"

#include "chapters/keygen.typ"

#include "chapters/signer.typ"

#include "chapters/summary.typ"

#pagebreak()

#bibliography("citations.bib")

#align(bottom)[
  Below is the Doxygen documentation for the project, as required by the project guidelines. 
]
