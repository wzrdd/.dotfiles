;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;;; General
;;;
(setq display-line-numbers-type 'relative
      indent-line-function      'insert-tab
      doom-theme                'doom-tokyo-night)
;; Whitespace visualization that I prefer to run manually
(whitespace-mode -1)

;; Evil-Mode
;; Focus new window after splitting
(setq evil-split-window-below t
      evil-vsplit-window-right t)
;; More granular insert mode undo.
(setq evil-want-fine-undo t)

;; Tecosaur's screenshot
(use-package! screenshot
  :defer t
  :config (setq screenshot-upload-fn "xclip"))
(map! (:leader
       (:map global-map
        :desc "Screenshot selected region"
        :v "a" #'screenshot)))

;;; Programming
;;;
(use-package! prog-mode
  :config
  (setq indent-tabs-mode nil ;; use spaces instead of tabs for indentation
        tab-width 2))

;; LSP
(add-hook! 'lsp-mode
 (setq company-minimum-prefix-length 1
       company-idle-delay 0.0
       tab-width 2)
 (setq lsp-ui-sideline-code-actions nil
       lsp-ui-sideline-enable nil))

;; Typescript
(after! typescript-mode
  (add-hook! 'typescript-mode-hook #'format-all-mode)
  (add-hook! 'typescript-mode-hook
    (setq typescript-indent-level 2
     tab-width 2)
   (lsp)
   (magit-todos-mode)))

;;; org-mode
;;;
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
                 "* Revisar %(org-cliplink-capture)" :prepend t)))

;; automatically toggle latex preview on org files
(use-package! org-fragtog-mode
  :hook org-mode)

;; replace org-agenda with org-super-agenda
(use-package! org-super-agenda
  :commands (org-super-agenda-mode)
  :config (setq org-super-agenda-header-map (make-sparse-keymap)))

;; Paste images capability in org-mode
(use-package! org-download
  :after org
  :defer nil
  :config
  (setq org-download-image-dir "images"
        org-download-heading-lvl nil
        org-download-timestamp "%Y%m%d-%H%M%S_"
        org-image-actual-width 300
        org-download-screenshot-method "/usr/bin/xclip %s"))
(map! :leader
      :mode org-mode
      "m y" #'org-download-clipboard)

(setq +org-present-text-scale 3)
