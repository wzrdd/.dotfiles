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
(package! sexp-string
  ;; needed by org-roam-search
  :recipe (:host github :repo "natask/sexp-string"))
;; recommended for org-roam-ui
(unpin! org-roam)

;; org-mode related
(package! org-ol-tree
  :recipe (:host github :repo "Townk/org-ol-tree"))
(package! org-krita
  :recipe (:host github
           :repo "lepisma/org-krita"
           :files ("resources" "resources" "*.el" "*.el")))
(package! mermaid
  :recipe (:host github :repo "arnm/ob-mermaid"))

;; general quality of life
(package! emacs-sql-indent
  :recipe (:host github :repo "alex-hhh/emacs-sql-indent"))
(package! screnshot
  :recipe (:host github :repo "tecosaur/screenshot" :build (:not compile)))
