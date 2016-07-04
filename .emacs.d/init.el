;;; dot-prog.el --- changes some of the emacs default settings
;;; Commentary:
;; Nothing yet

;;; Code:

(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
    'package-archives
    '("melpa" . "http://melpa.org/packages/")
    t)
  (package-initialize))

;; USER SETTINGS
;;(mapc 'load (directory-files
;;             (concat user-emacs-directory "/custom") t ".\.el"))

(add-to-list 'load-path "~/.emacs.d/custom")
(require 'dot-defaults)
(require 'dot-org)
(require 'dot-prog)


;;CUSTOM PACKAGES
(setq inferior-lisp-program "/usr/bin/sbcl")
(setq slime-contribs '(slime-fancy))

(require 'ivy)
(ivy-mode 1)
(setq projectile-completion-system 'ivy)

;; Evil init
(require 'evil)
(evil-mode 1)

;;Pdf tool init
(pdf-tools-install)


(require 'powerline)
(require 'powerline-evil)
(powerline-default-theme)
(powerline-evil-vim-color-theme)

;; autocomplete default options
(ac-config-default)

;; Relative line package
(require 'nlinum-relative)
(nlinum-relative-setup-evil)
(add-hook 'prog-mode-hook 'nlinum-relative-mode)
(setq nlinum-relative-redisplay-delay 0)
(setq nlinum-relative-current-symbol "")
(setq nlinum-relative-offset 0)

;;flycheck
(add-hook 'after-init-hook #'global-flycheck-mode)

;;; init.el ends here
