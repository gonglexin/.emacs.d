(menu-bar-mode -1)
(tool-bar-mode 0)

(if (display-graphic-p)
    (toggle-scroll-bar -1))

(load-theme 'zenburn t)

(provide 'core-ui)
