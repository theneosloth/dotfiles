;;; init.el --- Loads a literate config file
;;; Commentary:

;;; Code:
;; Allocate more memory to the garbage collector during initialization.
(setq gc-cons-threshold (* 500 1024 1024))
;; Reset it to the default after initialization
(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
    'package-archives
    '("melpa" . "http://melpa.org/packages/")
    t)
  (package-initialize))

(unless package-archive-contents
  (package-refresh-contents))

(org-babel-load-file (concat user-emacs-directory "config.org"))

(add-hook 'after-init-hook (lambda () (setq gc-cons-threshold (* 5 1024 1024))))
;;; init.el ends here
