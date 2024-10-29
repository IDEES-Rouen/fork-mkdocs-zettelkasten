(use-modules
 ((guix licenses) #:prefix license:)
 (mkdocs-material)
 (guix download)
 (guix profiles)
 (guix packages)
 (gnu packages python-build)
 (gnu packages python-web)
 (gnu packages python-check)
 (gnu packages check)
 (guix build-system python)
 (guix build-system pyproject)
 (guix gexp)
 (gnu packages version-control)
 (gnu packages python-xyz)
 )

(define-public python-mkdocs-plugin-tags
  (package
   (name "python-mkdocs-plugin-tags")
   (version "1.0.2")
   (source
    (origin
     (method url-fetch)
     (uri (pypi-uri "mkdocs-plugin-tags" version))
     (sha256
      (base32 "09zrdzghzlzmqjpadr0b14912cwnw87v5qgc90ry03ygsgxfpydi"))))
   (build-system pyproject-build-system)
   (arguments
    `(#:tests? #f
      #:phases
      (modify-phases %standard-phases
                     (delete 'sanity-check))))
   (propagated-inputs (list python-mkdocs))
   (home-page "https://github.com/ginsburgnm/mkdocs-plugin-tags")
   (synopsis "\"Create tags in mkdocs\"")
   (description "\"Create tags in mkdocs\".")
   (license license:expat)))

(define-public python-mkdocs-zettelkasten
  (package
   (name "python-mkdocs-zettelkasten")
   (version "0.1.9")
   (source
    (origin
     (method url-fetch)
     (uri (pypi-uri "mkdocs-zettelkasten" version))
     (sha256
      (base32 "0nmxkims50ccrz37q4z4d726jfzb30wak714nr7zx1s1m44h4qnn"))))
   (build-system pyproject-build-system)
   (arguments (list #:tests? #f))
   (propagated-inputs (list python-gitpython python-jinja2 python-mkdocs-1-6-1 python-markdown-3-5-2 python-pymdown-extensions))
   (home-page "https://github.com/buvis/mkdocs-zettelkasten")
   (synopsis "Add Zettelkasten features to MkDocs")
   (description "Add Zettelkasten features to @code{MkDocs}.")
   (license license:expat)))

(packages->manifest
 (list python-pip
       python-markdown-3-5-2
       python-mkdocs-1-6-1
       python-mkdocs-plugin-tags
       python-mkdocs-zettelkasten
       python-mkdocs-bibtex ))
