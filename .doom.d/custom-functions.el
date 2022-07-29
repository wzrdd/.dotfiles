;;; custom-functions.el -*- lexical-binding: t; -*-

(defun me/org-tree-to-indirect-buffer-popup ()
  (interactive)
  (with-popup-rules!
    '(("." :size 20 :side bottom :select nil :quit 'current))
    (org-tree-to-indirect-buffer)
    (+popup/other)
    (evil-goto-line)))

(defun me/lookup-wikipedia ()
  (interactive)
  (browse-url
    (url-encode-url
     (format "https://wikipedia.org/search-redirect.php?language=en&go=Go&search=%s"
             (read-string "Searching on en.wikipedia.org: ")))))
(map! (:leader
       (:desc "Search text en-wikipedia"
        :v "ow" #'me/lookup-wikipedia)))

(defun me/org-link-copy (&optional arg)
  "Extract URL from org-mode link and add it to kill ring."
  (interactive "P")
  (let* ((link (org-element-lineage (org-element-context) '(link) t))
         (type (org-element-property :type link))
         (url (org-element-property :path link))
         (url (concat type ":" url)))
    (kill-new url)
    (message (concat "Copied URL: " url))))

(map! :leader
      :mode org-mode
      "m l y" #'me/org-link-copy)
