window.MathJax = {
    tex: {
      macros: {
        N: "\\mathbb{N}",
        R: "\\mathbb{R}",
        Z: "\\mathbb{Z}",
      },
      inlineMath: [["\\(", "\\)"]],
      displayMath: [["\\[", "\\]"]],
      processEscapes: true,
      processEnvironments: true
    },
    options: {
      ignoreHtmlClass: ".*|",
      processHtmlClass: "arithmatex"
    }
  };
  
  document$.subscribe(() => {
    MathJax.typesetPromise()
  })
  
