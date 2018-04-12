(require 'company)
(require 'smartparens)
(require 'projectile-rails)

(setq ruby-insert-encoding-magic-comment nil)
(add-hook 'ruby-mode-hook #'smartparens-mode)
(add-hook 'ruby-mode-hook 'robe-mode)
(projectile-rails-global-mode)

(eval-after-load 'company
  '(push 'company-robe company-backends))

(provide 'core-ruby)
