(require 'flycheck)
(require 'yasnippet)
(require 'smartparens-config)

(add-hook 'after-init-hook #'global-flycheck-mode)
(yas-global-mode 1)

(provide 'core-programming)
