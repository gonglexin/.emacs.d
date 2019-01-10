;;; init.el --- Personal emacs configuration of Lexin Gong

;; Copyright © 2016 Lexin Gong
;;
;; Author: Lexin Gong <gonglexin@gmail.com>
;; Maintainer: Lexin Gong <gonglexin@gmail.com>
;; URL: http://www.github.com/gonglexin/emacs.d

;; This file is not part of GNU Emacs.

;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program. If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; Personal Emacs configuration of Lexin Gong

;;; Code:

(require 'package)
(setq package-enable-at-startup nil)
;(setq package-archives '(("gnu"   . "https://elpa.gnu.org/packages/")
;                         ("melpa" . "https://melpa.org/packages/")))

(setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
                         ("melpa" . "http://elpa.emacs-china.org/melpa/")))

(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(add-to-list 'load-path (expand-file-name "core" user-emacs-directory))
(setq custom-file (expand-file-name "customize.el" user-emacs-directory))

(require 'core-ui)
(require 'core-editor)
(require 'core-osx)

(use-package diminish :ensure t)
(use-package paradox :ensure t)

(use-package editorconfig
  :ensure t
  :diminish
  :init (editorconfig-mode 1))

(use-package which-key
  :ensure t
  :init (which-key-mode t))

(use-package exec-path-from-shell
  :if (memq window-system '(mac ns))
  :ensure t
  :config
  (exec-path-from-shell-initialize))

(use-package projectile
  :ensure t
  :init
  (projectile-global-mode t)
  :config
  (setq projectile-completion-system 'ivy)
  :bind-keymap
  ("C-c p" . projectile-command-map)
  :delight '(:eval (concat " " (projectile-project-name)))
  )

(use-package counsel-projectile
  :ensure t
  :init
  (counsel-projectile-mode))

(use-package swiper
  :ensure t
  :config
  (global-set-key "\C-s" 'swiper))

(use-package counsel
  :ensure t
  :init
  (counsel-mode)
  :bind (("M-x"     . counsel-M-x)
         ("C-x b"   . counsel-ibuffer)
         ("C-x C-f" . counsel-find-file)
         ("C-c C-r" . ivy-resume)
         ("C-c g"   . counsel-git)
         ("C-c i"   . counsel-imenu)
         ("C-c j"   . counsel-git-grep)
         ("C-c k"   . counsel-rg))
  :config
  (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t)
  (define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history))

(use-package company
  :ensure t
  :init (global-company-mode)
  :diminish company-mode
  :config
  (setq company-idle-delay 0.3)
  (setq company-tooltip-limit 10)
  (setq company-minimum-prefix-length 2)
  (setq company-tooltip-flip-when-above t))

;; Programming

;; https://elixirforum.com/t/emacs-elixir-setup-configuration-wiki/19196
(use-package eglot
  :ensure t
  :hook
  (elixir-mode . eglot-ensure)
  :bind (("C-c h" . eglot-help-at-point)
         ("C-c x" . xref-find-definitions))
  :config
  (add-to-list 'eglot-server-programs '(elixir-mode "/Users/gonglexin/projects/elixir-ls/release/language_server.sh")))

;(use-package flycheck
;   :ensure t
;   :config
;   (add-hook 'prog-mode-hook 'flycheck-mode))

;(use-package yasnippet
;  :ensure t
;  :init (yas-global-mode 1))

(use-package smartparens
  :ensure t
  :init
  (require 'smartparens-config)
  :diminish smartparens-mode
  :config
  (add-hook 'prog-mode-hook 'smartparens-mode))

(use-package magit
  :ensure t
  :bind (("C-x g"   . magit-status)
         ("C-x M-g" . magit-dispatch-popup)
         ("C-x M-l" . magit-log)
         ("C-x M-b" . magit-blame)))

;; Ruby
(use-package ruby-mode
  :config
  (setq ruby-insert-encoding-magic-comment nil)
  (add-hook 'ruby-mode-hook #'smartparens-mode)
  ;(add-hook 'ruby-mode-hook #'rufo-minor-mode)
  (setq rufo-minor-mode-use-bundler t))

;(use-package robe
;  :ensure t
;  :config
;  (add-hook 'ruby-mode-hook 'robe-mode))

;(use-package inf-ruby
;  :ensure t
;  :config
;  (add-hook 'ruby-mode-hook #'inf-ruby-minor-mode))

(use-package projectile-rails
  :ensure t
;  :config
;  (define-key projectile-rails-mode-map (kbd "s-m")   'projectile-rails-find-model)
;  (define-key projectile-rails-mode-map (kbd "s-c")   'projectile-rails-find-controller)
;  (define-key projectile-rails-mode-map (kbd "s-v")   'projectile-rails-find-view)
;  (define-key projectile-rails-mode-map (kbd "s-RET") 'projectile-rails-goto-file-at-point)
  )

;; Elixir
(use-package elixir-mode
  :ensure t
  :config
  (add-hook 'elixir-mode-hook #'smartparens-mode)
  ;; (add-hook 'elixir-mode-hook 'alchemist-mode)
  ;; (add-hook 'elixir-mode-hook
  ;;   (lambda () (add-hook 'before-save-hook 'elixir-format nil t)))
  ;; (add-hook 'elixir-format-hook (lambda ()
  ;;                                 (if (projectile-project-p)
  ;;                                   (setq elixir-format-arguments
  ;;                                     (list "--dot-formatter"
  ;;                                       (concat (locate-dominating-file buffer-file-name ".formatter.exs") ".formatter.exs")))
  ;;                                  (setq elixir-format-arguments nil))))
  (sp-with-modes '(elixir-mode)
  (sp-local-pair "fn" "end"
    :when '(("SPC" "RET"))
    :actions '(insert navigate))
  (sp-local-pair "do" "end"
    :when '(("SPC" "RET"))
    :post-handlers '(sp-ruby-def-post-handler)
    :actions '(insert navigate)))
  )

;(use-package alchemist
;  :ensure t
;  :config
;  (setq alchemist-goto-elixir-source-dir "~/projects/elixir/")
;  (setq alchemist-goto-erlang-source-dir "~/projects/otp/"))

;; Go
(use-package go-mode :ensure t)


;; Web
(use-package web-mode
  :ensure t
  :mode (("\\.erb\\'" . web-mode)
         ("\\.html?\\'" . web-mode)
         ("\\.eex\\'" . web-mode)
         ("\\.php\\'" . web-mode))
  :config
  (setq web-mode-enable-auto-pairing nil)  ;; make web-mode play nice with smartparens
  )

(use-package js2-mode
  :ensure t
  :mode ("\\.js$" . js2-mode))


;; Docker
(use-package dockerfile-mode
  :ensure t
  :mode ("Dockerfile" . dockerfile-mode))

(use-package docker-compose-mode :ensure t)

(provide 'init)

;;; init.el ends here
