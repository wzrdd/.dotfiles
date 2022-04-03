;; -*- no-byte-compile: t; -*-
;;; $DOOMDIR/packages.el

(package! elcord)
(package! org-download)
(package! org-cliplink)
(package! org-fragtog)
(package! org-super-agenda)
(package! org-ol-tree
  :recipe (:host github :repo "Townk/org-ol-tree"))
(package! emacs-sql-indent
  :recipe (:host github :repo "alex-hhh/emacs-sql-indent"))
(package! screnshot
  :recipe (:host github :repo "tecosaur/screenshot" :build (:not compile)))

;; unpin org-roam is neccesary for org-roam-ui
(unpin! org-roam)
(package! org-roam-ui)
