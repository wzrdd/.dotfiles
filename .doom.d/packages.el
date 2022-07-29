;; -*- no-byte-compile: t; -*-
;;; $DOOMDIR/packages.el

;; MELPA
;;
;; General
(package! elcord)

;; org-mode related
(package! org-download)
(package! org-cliplink)
(package! org-fragtog)
(package! org-super-agenda)
(package! org-transclusion)

;; org-roam related
(package! org-roam-ui)

;; Github
;;
;; org-roam related
(package! delve
  :recipe (:host github :repo "publicimageltd/delve"))
(package!  delve-show
  :recipe (:host github :repo "natask/delve-show"))
(package! org-roam-search
  :recipe (:host github :repo "natask/org-roam-search"))
(package! sexp-string
  ;; needed by org-roam-search
  :recipe (:host github :repo "natask/sexp-string"))
(package! org-roam-bibtex
  :recipe (:host github :repo "org-roam/org-roam-bibtex"))
;; recommended for org-roam-ui and needed by org-roam-bibtex
(unpin! org-roam)
(when (featurep! :tools biblio)
  (unpin! bibtex-completion helm-bibtex ivy-bibtex))

;; org-mode related
(package! org-ol-tree
  :recipe (:host github :repo "Townk/org-ol-tree"))

;; general quality of life
(package! emacs-sql-indent
  :recipe (:host github :repo "alex-hhh/emacs-sql-indent"))
(package! screnshot
  :recipe (:host github :repo "tecosaur/screenshot" :build (:not compile)))
