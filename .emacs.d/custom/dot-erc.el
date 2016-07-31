;; dot-erc.el --- the ERC settings
;;; Commentary:
;; Nothing yet

;;; Code:
(require 'erc)
(setq erc-prompt-for-password nil)
(setq erc-auto-query 'buffer)
(setq erc-nick "neosloth")

(setq erc-fill-function 'erc-fill-static)
(setq erc-fill-static-center 22)

(setq erc-autojoin-channels-alist
      '(("freenode.net" "#emacs")))

;;(add-hook 'window-configuration-change-hook
;;          '(lambda()
;;             (setq erc-fill-column (- (window-width) 2))))
(provide 'dot-erc)
;;; dot-erc.el ends here
