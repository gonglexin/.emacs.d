(require 'smartparens)
(require 'alchemist)

(setq alchemist-goto-elixir-source-dir "~/projects/elixir/")

(add-hook 'elixir-mode-hook #'smartparens-mode)
(add-hook 'elixir-mode-hook 'alchemist-mode)

(sp-with-modes '(elixir-mode)
  (sp-local-pair "fn" "end"
    :when '(("SPC" "RET"))
    :actions '(insert navigate))
  (sp-local-pair "do" "end"
    :when '(("SPC" "RET"))
    :post-handlers '(sp-ruby-def-post-handler)
    :actions '(insert navigate)))

(provide 'core-elixir)
