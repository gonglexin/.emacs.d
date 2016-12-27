(require 'smartparens)
(require 'projectile-rails)

(setq ruby-insert-encoding-magic-comment nil)
(add-hook 'ruby-mode-hook #'smartparens-mode)
(projectile-rails-global-mode)

(provide 'core-ruby)
