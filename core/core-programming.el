(require 'flycheck)
(require 'yasnippet)
(require 'smartparens-config)

;(add-hook 'after-init-hook #'global-flycheck-mode)
(add-hook 'prog-mode-hook 'flycheck-mode)
(add-hook 'prog-mode-hook 'smartparens-mode)
(yas-global-mode 1)

(provide 'core-programming)
