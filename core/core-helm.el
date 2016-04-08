(require 'helm-config)
(require 'helm-ag)
(require 'helm-projectile)

(setq helm-buffers-fuzzy-matching t
      helm-recentf-fuzzy-match    t
      helm-locate-fuzzy-match     t
      helm-M-x-fuzzy-match        t
      helm-semantic-fuzzy-match   t
      helm-imenu-fuzzy-match      t
      helm-apropos-fuzzy-match    t
      helm-lisp-fuzzy-completion  t)

(helm-mode 1)
;(helm-autoresize-mode 1)

(provide 'core-helm)
