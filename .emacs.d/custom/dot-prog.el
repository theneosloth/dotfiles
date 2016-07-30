;;; dot-prog.el --- changes some of the emacs default settings
;;; Commentary:
;; Nothing yet

;;; Code:

;;Indent c++ code with 4 spaces
(defun indent-c-mode-hook ()
  (setq c-basic-offset 4
        c-indent-level 4
        c-default-style "linux"))

(add-hook 'c-mode-common-hook 'indent-c-mode-hook)
(add-hook 'python-mode-hook (lambda()
                              (elpy-mode)
                              (setq elpy-rpc-backend "jedi")
                              ))
(add-hook 'prog-mode-hook (lambda()
                            (electric-pair-mode)
                            (rainbow-delimiters-mode)
                            (whitespace-mode)
                            (show-paren-mode)
                            ;;For some reason prettify lags on windows
                            (unless (eq system-type 'windows-nt)
                              (prettify-symbols-mode))
                            ))
(provide 'dot-prog)
;;; dot-prog.el ends here
