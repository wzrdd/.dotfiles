;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; General
(setq display-line-numbers-type 'relative
      indent-line-function      'insert-tab
      doom-theme                'doom-oceanic-next)

(use-package! prog-mode
  :config
  (setq indent-tabs-mode  nil ;; use spaces instead of tabs for indentation
        tab-width 2))

;; typescript
(add-hook! 'typescript-mode-hook
  (setq typescript-indent-level 2)
  (lsp)
  (magit-todos-mode))
(setq-hook! 'typescript-mode-hook tab-width 2)

(whitespace-mode -1)

;; LSP
(add-hook! 'lsp-mode
  (setq company-minimum-prefix-length 1
        company-idle-delay 0.0
        tab-width 2)
  (setq lsp-ui-sideline-code-actions nil
        lsp-ui-sideline-enable nil))

;; Tecosaur's screenshot
(use-package! screenshot
  :defer t
  :config (setq screenshot-upload-fn "xclip"))

(map! (:leader
       (:map global-map
        :desc "Screenshot selected region"
        :v "a" #'screenshot)))

;; Evil-Mode
;; Focus new window after splitting
(setq evil-split-window-below t
      evil-vsplit-window-right t)
;; More granular insert mode undo.
(setq evil-want-fine-undo t)

;; org
(after! org
  :config
  (setq org-directory "~/org/"
        org-startup-folded 'folded
        org-startup-with-inline-images t
        org-hide-emphasis-markers t
        org-superstar-headline-bullets-list '("⁖" "◉" "○" "✸" "■"))
  ;; org-capture
  (add-to-list 'org-capture-templates
               '("s" "Schedule" entry (file "~/org/schedule.org")
                 "* TODO %?\n%i\n%a" :prepend t))
  (add-to-list 'org-capture-templates
               '("l" "Links" entry (file "~/org/links.org")
                 "* Revisar %(org-cliplink-capture)" :prepend t))
  ;; automatically toggle latex preview on org files
  (add-hook! 'org-mode-hook 'org-fragtog-mode))

;; replace org-agenda with org-super-agenda
(use-package! org-super-agenda
  :commands (org-super-agenda-mode)
  :config (setq org-super-agenda-header-map (make-sparse-keymap)))

(after! org-agenda
  (add-to-list 'org-agenda-custom-commands
               '("p" "All TODOs groups by category"
                 alltodo ""
                 ((org-super-agenda-groups '((:auto-group t))))))
  (org-super-agenda-mode))


;;"Use org-download to put an image on org-mode using system clipboard."
(use-package! org-download
  :after org
  :defer nil
  :custom
  (org-download-method 'directory)
  (org-download-image-dir "images")
  (org-download-heading-lvl nil)
  (org-download-timestamp "%Y%m%d-%H%M%S_")
  (org-image-actual-width 300)
  (org-download-screenshot-method "/usr/bin/xclip %s")

  :config
  (require 'org-download))

(map! :leader
      :mode org-mode
      "m y" #'org-download-clipboard)

(setq +org-present-text-scale 3)

(use-package simple-httpd)
