;;; dot-prog.el --- changes some of the emacs default settings
;;; Commentary:
;; Nothing yet

;;; Code:

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
(provide 'dot-prog)
;;; dot-prog.el ends here
