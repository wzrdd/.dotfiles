;;; -*- lexical-binding: t; -*-

;;; General
;;;
;; Custom Functions
(load-file "~/.dotfiles/.doom.d/custom-functions.el")

;; General variables
(setq display-line-numbers-type 'relative
      indent-line-function 'insert-tab
      doom-theme 'doom-old-hope
      indent-tabs-mode 'nil
      whitespace-mode 'nil)

(setq ispell-dictionary "spanish")

;; Emacs 29 🦍
(when (version< "29.0" emacs-version)
  ;; General Emacs29
  (pixel-scroll-precision-mode))

;; Evil-Mode
(use-package! evil
  :config
  (setq evil-split-window-below t  ;; Focus new window after splitting.
        evil-vsplit-window-right t ;; Same as above.
        evil-want-fine-undo t))    ;; comentario de ejemplo

;; Tecosaur's screenshot
(use-package! screenshot
  :defer t
  :config (setq screenshot-upload-fn "xclip"))
(map! :leader
      :map global-map
      :desc "Screenshot selected region"
      :v "a" #'screenshot)

;;; Programming
;;;
(use-package! prog-mode
  :config
  (setq indent-tabs-mode 'nil ;; use spaces instead of tabs for indentation
        tab-width 2))

;; Company
(use-package! company
  :config
  (setq company-minimum-prefix-length 3
        company-idle-delay 0.1
        tab-width 2))

;; LSP
(use-package! lsp
  :config
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

;; Ledger
(use-package! ledger-mode
  :mode "\\.dat\\'")

;;; org-mode
;;;
(use-package! org
  :config
  (setq org-directory "~/org/"
        org-startup-folded 'folded
        org-startup-with-inline-images t
        org-hide-emphasis-markers t
        org-superstar-headline-bullets-list '("⁖" "◉" "○" "✸" "■"))
  (add-hook! 'org-mode-hook 'auto-fill-mode))

;; org-babel
(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (mermaid . t)))

;;; org-roam
;;;
(use-package! org-roam
  :config
  (setq org-roam-directory "~/org/notes/zettelkasten"
        +org-roam-auto-backlinks-buffer t
        org-roam-buffer-postrender-functions #'magit-section-show-level-2-all))

(use-package! org-transclusion
  :after org
  :init
  (map!
   :map global-map "<f12>" #'org-transclusion-add
   :leader
   :prefix "n"
   :desc "Org Transclusion Mode" "t" #'org-transclusion-mode))

(use-package! org-capture
  :config
  (add-to-list 'org-capture-templates
               '("i" "Inbox" entry (file "~/org/inbox.org")
                 "** Revisar %(org-cliplink-capture)" :append t)))

;; automatically toggle latex preview on org files
(use-package! org-fragtog-mode
  :hook org-mode)

;; replace org-agenda with org-super-agenda
(use-package! org-super-agenda
  :commands (org-super-agenda-mode)
  :config (setq org-super-agenda-header-map (make-sparse-keymap)))

;; Paste images capability in org-mode
(use-package! org-download
  :after org-roam
  :defer nil
  :config
  (setq org-download-image-dir "images"
        org-download-heading-lvl nil
        org-download-timestamp "%Y%m%d-%H%M%S_"
        org-image-actual-width 300
        org-download-screenshot-method "/usr/bin/xclip %s")
  (org-download-enable))
(map! :leader
      :mode org-mode
      "m y" #'org-download-clipboard)

(use-package! org-krita
  :config
  (add-hook 'org-mode-hook 'org-krita-mode))

;; org-present
(setq +org-present-text-scale 3)

;; org-roam-ui
(use-package! websocket ;; needed by org-roam-ui
  :after org-roam)

(use-package! org-roam-ui
  :after org-roam
  :config
  (setq org-roam-ui-sync-theme t
        org-roam-ui-follow t
        org-roam-ui-update-on-save t
        org-roam-ui-open-on-start t))
