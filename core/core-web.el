(require 'web-mode)
(require 'smartparens)
(require 'smartparens-html)

(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

;; make web-mode play nice with smartparens
(setq web-mode-enable-auto-pairing nil)

(sp-with-modes '(web-mode)
  (sp-local-pair "%" "%"
    :unless '(sp-in-string-p)
    :post-handlers '(((lambda (&rest _ignored)
                        (just-one-space)
                        (save-excursion (insert " ")))
                       "SPC" "=" "#")))
  (sp-local-pair "<% "  " %>" :insert "C-c %")
  (sp-local-pair "<%= " " %>" :insert "C-c =")
  (sp-local-pair "<%# " " %>" :insert "C-c #")
  (sp-local-tag "%" "<% "  " %>")
  (sp-local-tag "=" "<%= " " %>")
  (sp-local-tag "#" "<%# " " %>"))

(add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
(add-hook 'css-mode-hook  'emmet-mode) ;; enable Emmet's css abbreviation

(provide 'core-web)
