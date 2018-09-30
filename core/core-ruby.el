(require 'company)
(require 'smartparens)
(require 'projectile-rails)

(setq ruby-insert-encoding-magic-comment nil)
(add-hook 'ruby-mode-hook #'smartparens-mode)
(add-hook 'ruby-mode-hook 'robe-mode)
(add-hook 'ruby-mode-hook #'rufo-minor-mode)
(setq rufo-minor-mode-use-bundler t)
(projectile-rails-global-mode)

(eval-after-load 'company
  '(push 'company-robe company-backends))

(provide 'core-ruby)
