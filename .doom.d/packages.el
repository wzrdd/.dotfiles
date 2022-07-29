;; -*- no-byte-compile: t; -*-
;;; $DOOMDIR/packages.el

;; MELPA
(package! elcord)
(package! org-download)
(package! org-cliplink)
(package! org-fragtog)
(package! org-super-agenda)
(package! org-transclusion)
(package! org-roam-ui)

;; Github
(package! delve
  :recipe (:host github :repo "publicimageltd/delve"))
(package! org-ol-tree
  :recipe (:host github :repo "Townk/org-ol-tree"))
(package! emacs-sql-indent
  :recipe (:host github :repo "alex-hhh/emacs-sql-indent"))
(package! screnshot
  :recipe (:host github :repo "tecosaur/screenshot" :build (:not compile)))
(package! org-roam-bibtex
  :recipe (:host github :repo "org-roam/org-roam-bibtex"))

;; recommended for org-roam-ui and needed by org-roam-bibtex
(unpin! org-roam)
(when (featurep! :tools biblio)
  (unpin! bibtex-completion helm-bibtex ivy-bibtex))
