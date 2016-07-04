;;; dot-defaults.el --- changes some of the emacs default settings
;;; Commentary:
;; Nothing yet

;;; Code:

;; Switch between buffers with S-arrow
(windmove-default-keybindings)
(push 'delete-trailing-whitespace before-save-hook)
;;Show current buffer name
(setq frame-title-format "emacs - %b")
;;Hide the toolbar
(tool-bar-mode -1)
;; Always treat tabs as spaces
(setq-default indent-tabs-mode nil)

;;(setq tab-always-indent 'complete)

;; Move the auto saved and backed up files into the OS temp directory
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))

(setq auto-save-file-name-transforms
      `((".*" , temporary-file-directory t)))

;;Disable splash screen
(setq inhibit-splash-screen t
      inhibit-startup-echo-area-message t
      inhibit-startup-message t)

;;Theme
(load-theme 'material t)

(provide 'dot-defaults)
;;; dot-defaults.el ends here
