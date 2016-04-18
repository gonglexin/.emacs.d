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
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))
(package-initialize)

(unless (package-installed-p 'alchemist)
  (package-install 'alchemist))
(unless (package-installed-p 'avy)
  (package-install 'avy))
(unless (package-installed-p 'company)
  (package-install 'company))
(unless (package-installed-p 'editorconfig)
  (package-install 'editorconfig))
(unless (package-installed-p 'elixir-mode)
  (package-install 'elixir-mode))
(unless (package-installed-p 'emmet-mode)
  (package-install 'emmet-mode))
(unless (package-installed-p 'flycheck)
  (package-install 'flycheck))
(unless (package-installed-p 'flycheck-elixir)
  (package-install 'flycheck-elixir))
(unless (package-installed-p 'helm)
  (package-install 'helm))
(unless (package-installed-p 'helm-ag)
  (package-install 'helm-ag))
(unless (package-installed-p 'helm-projectile)
  (package-install 'helm-projectile))
(unless (package-installed-p 'inf-ruby)
  (package-install 'inf-ruby))
(unless (package-installed-p 'key-chord)
  (package-install 'key-chord))
(unless (package-installed-p 'magit)
  (package-install 'magit))
(unless (package-installed-p 'markdown-mode)
  (package-install 'markdown-mode))
(unless (package-installed-p 'projectile)
  (package-install 'projectile))
(unless (package-installed-p 'projectile-rails)
  (package-install 'projectile-rails))
(unless (package-installed-p 'restclient)
  (package-install 'restclient))
(unless (package-installed-p 'smartparens)
  (package-install 'smartparens))
(unless (package-installed-p 'web-mode)
  (package-install 'web-mode))
(unless (package-installed-p 'yasnippet)
  (package-install 'yasnippet))
(unless (package-installed-p 'zenburn-theme)
  (package-install 'zenburn-theme))


(add-to-list 'load-path (expand-file-name "core" user-emacs-directory))

(require 'core-ui)
(require 'core-editor)
(require 'core-keybindings)
(require 'core-projectile)
(require 'core-helm)
(require 'core-completion)
(require 'core-programming)
(require 'core-ruby)
(require 'core-elixir)
(require 'core-web)
(require 'core-custom)

(provide 'init)

;;; init.el ends here
