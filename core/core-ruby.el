(require 'smartparens)
(require 'projectile-rails)

(setq ruby-insert-encoding-magic-comment nil)
(add-hook 'ruby-mode-hook #'smartparens-mode)
(add-hook 'projectile-mode-hook 'projectile-rails-on)

(provide 'core-ruby)
