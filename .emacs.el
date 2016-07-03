(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
    'package-archives
    '("melpa" . "http://melpa.org/packages/")
    t)
  (package-initialize))

;; USER SETTINGS
;; Switch between buffers with S-arrow
(windmove-default-keybindings)
(push 'delete-trailing-whitespace before-save-hook)
;;Show current buffer name
(setq frame-title-format "emacs - %b")
;;Hide the toolbar
(tool-bar-mode -1)
;; Always treat tabs as spaces
(setq-default indent-tabs-mode nil)
(setq tab-always-indent 'complete)

;;Indent c++ code with 4 spaces
(defun indent-c-mode-hook ()
  (setq c-basic-offset 4
        c-indent-level 4
        indent-tabs-mode nil
        c-default-style "bsd"))

(add-hook 'c-mode-common-hook 'indent-c-mode-hook)

(add-hook 'prog-mode-hook (lambda()
                            (electric-pair-mode)
                            (rainbow-delimiters-mode)
                            (prettify-symbols-mode)
                            (whitespace-mode)
                            ))

;; Move the backup directory to ~/saves
(setq backup-directory-alist '(("." . "~/.emacs_saves")))

;; (global-whitespace-mode 1)
(add-hook 'org-mode-hook (lambda()
                           (global-whitespace-mode 0)
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
       org-src-tab-acts-natively t)


;;CUSTOM PACKAGES
(setq inferior-lisp-program "/usr/bin/sbcl")
(setq slime-contribs '(slime-fancy))

;; Evil init
(require 'evil)
(evil-mode 1)

;;Pdf tool init
(pdf-tools-install)

;;Theme
(load-theme 'material t)

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

;;Disable splash screen
(setq inhibit-splash-screen t
      inhibit-startup-echo-area-message t
      inhibit-startup-message t)
