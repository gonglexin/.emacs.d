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

;; update the package metadata
(unless package-archive-contents
  (package-refresh-contents))

(defvar package-list
  '(alchemist
    company
    company-go
    counsel
    counsel-projectile
    editorconfig
    elixir-mode
    emmet-mode
    exec-path-from-shell
    flycheck
    flycheck-elixir
    go-mode
    inf-ruby
    js2-mode
    magit
    markdown-mode
    paradox
    projectile
    projectile-rails
    restclient
    robe
    ruby-test-mode
    smartparens
    web-mode
    which-key
    yasnippet
    zenburn-theme)
  "A list of packages to ensure are installed at launch.")

(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

(add-to-list 'load-path (expand-file-name "core" user-emacs-directory))

(require 'core-ui)
(require 'core-editor)
(require 'core-osx)
(require 'core-projectile)
(require 'core-ivy)
(require 'core-completion)
(require 'core-programming)
(require 'core-ruby)
(require 'core-elixir)
(require 'core-go)
(require 'core-js)
(require 'core-web)
(require 'core-keybindings)
(require 'core-custom)

(provide 'init)

;;; init.el ends here
