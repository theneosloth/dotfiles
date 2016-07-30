;;; init.el --- changes some of the emacs default settings
;;; Commentary:
;; This loads all the custom packages I use and my custom settings files

;;; Code:

;; Allocate more memory to the garbage collector during initialization.
(setq gc-cons-threshold 100000000)
;; Reset it to the default after initialization
(add-hook 'after-init-hook (lambda () (setq gc-cons-threshold 800000)))

(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
    'package-archives
    '("melpa" . "http://melpa.org/packages/")
    t)
  (package-initialize))

(unless package-archive-contents
  (package-refresh-contents))

;;List of packages that are going to be automatically installed
(defvar package-list
      '(evil
        powerline-evil
        ivy
        nlinum-relative
        slime
        auto-complete
        material-theme
        flycheck
        elpy
        rainbow-delimiters
        ))
(defvar linux-only
  '(pdf-tools))

(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

;; Recompile everything in custom and init.el
(defun compile-dotfiles()
  (byte-recompile-directory
   (expand-file-name "custom/" user-emacs-directory) 0 )
  (byte-compile-file
   (expand-file-name "./init.el" user-emacs-directory) 0))

(add-hook 'kill-emacs-hook 'compile-dotfiles)


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
; The function is a huge time hog so I threw it on a hook.
(add-hook 'doc-view-mode-hook #'pdf-tools-install)

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

;;Theme
(load-theme 'material t)

;;; init.el ends here
