(require 'smartparens)
(require 'projectile-rails)

(add-hook 'ruby-mode-hook #'smartparens-mode)
(add-hook 'projectile-mode-hook 'projectile-rails-on)

(provide 'core-ruby)
