;;; dot-erc.el --- changes some of the emacs default settings
;;; Commentary:
;; Nothing yet

;;; Code:
(autoload 'erc "erc")
(setq erc-timestamp-format "[%H:%M]")
(setq erc-fill-prefix "    ")
(setq erc-auto-query 'buffer)
(setq erc-nick "neosloth")
(provide 'dot-erc)
;;; dot-erc.el ends here
