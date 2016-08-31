;; This file replaces itself with the config from init.org

(require 'org)
(find-file (concat user-emacs-directory "init.org"))

(org-babel-tangle)

(load-file (concat user-emacs-directory "init.el"))

(byte-compile-file (concat user-emacs-directory "init.el"))
