;;; dot-org.el --- changes some of the emacs default settings
;;; Commentary:
;; Nothing yet

;;; Code:

(add-hook 'org-mode-hook (lambda()
                           (global-whitespace-mode 0)
                           (flyspell-mode 1)
                           (org-toggle-pretty-entities)
                           ))

(org-babel-do-load-languages
 'org-babel-load-languages
 '((python . t)
   (java . t)
   (C . t)
   ))

 (setq org-src-preserve-indentation nil
       org-edit-src-content-indentation 0
       org-src-fontify-natively t
       org-src-tab-acts-natively t
       )

(provide 'dot-org)
;;; dot-org.el ends here
