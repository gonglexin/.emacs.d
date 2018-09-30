(require 'smartparens)
(require 'alchemist)
(require 'flycheck)

(setq alchemist-goto-elixir-source-dir "~/projects/elixir/")

(add-hook 'elixir-mode-hook #'smartparens-mode)
(add-hook 'elixir-mode-hook 'alchemist-mode)
(add-hook 'elixir-mode-hook
  (lambda () (add-hook 'before-save-hook 'elixir-format nil t)))
(add-hook 'elixir-format-hook (lambda ()
                                (if (projectile-project-p)
                                  (setq elixir-format-arguments
                                    (list "--dot-formatter"
                                      (concat (locate-dominating-file buffer-file-name ".formatter.exs") ".formatter.exs")))
                                  (setq elixir-format-arguments nil))))


;; (eval-after-load 'flycheck
;;   '(flycheck-credo-setup))

(sp-with-modes '(elixir-mode)
  (sp-local-pair "fn" "end"
    :when '(("SPC" "RET"))
    :actions '(insert navigate))
  (sp-local-pair "do" "end"
    :when '(("SPC" "RET"))
    :post-handlers '(sp-ruby-def-post-handler)
    :actions '(insert navigate)))

(provide 'core-elixir)
