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
