;;; init.el --- changes some of the emacs default settings
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

(defun compile-dotfiles()
  (byte-recompile-directory
   (expand-file-name "~/.emacs.d/custom") 0 )
  (byte-recompile-file
   (expand-file-name "init.el" user-emacs-directory)))

(add-hook 'kill-emacs-hook (lambda()(compile-dotfiles)))

;; Load in all of my custom settings
(add-to-list 'load-path "~/.emacs.d/custom")
(require 'dot-defaults)
(require 'dot-org)
(require 'dot-prog)
(require 'dot-erc)

;;CUSTOM PACKAGES
(setq inferior-lisp-program "/usr/bin/sbcl")
(setq slime-contribs '(slime-fancy))

(autoload 'ivy "ivy")
(ivy-mode 1)
(setq projectile-completion-system 'ivy)

;; Evil init
(autoload 'evil "evil")
(evil-mode 1)

;;Pdf tool init
(pdf-tools-install)


(autoload 'powerline "powerline")
(autoload 'powerline-evil  "powerline-evil")
(powerline-default-theme)
(powerline-evil-vim-color-theme)

;; autocomplete default options
(ac-config-default)

;; Relative line package
(autoload 'nlinum-relative "nlinum")
(nlinum-relative-setup-evil)
(add-hook 'prog-mode-hook 'nlinum-relative-mode)
(setq nlinum-relative-redisplay-delay 0)
(setq nlinum-relative-current-symbol "")
(setq nlinum-relative-offset 0)

;;flycheck
(add-hook 'after-init-hook #'global-flycheck-mode)
;;; init.el ends here
