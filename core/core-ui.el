(menu-bar-mode -1)
(tool-bar-mode 0)

(if (display-graphic-p)
    (toggle-scroll-bar -1))

;(use-package zenburn-theme
;  :ensure t
;  :config
;  (load-theme 'zenburn t))

(provide 'core-ui)
