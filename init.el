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

(setq package-enable-at-startup nil)
(package-initialize)

(require 'cask "/usr/local/Cellar/cask/0.7.4/cask.el")
(cask-initialize)

(require 'pallet)
(pallet-mode t)

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
