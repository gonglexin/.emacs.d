;;; init.el --- Configuration entry point.
;;
;; Copyright (c) 2016 Lexin Gong

(require 'package)

(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
			 ("melpa" . "https://melpa.org/packages/")))

(package-initialize)

;(defun set-exec-path-from-shell-PATH ()
;  (let ((path-from-shell
;	 (replace-regexp-in-string "[[:space:]\n]*$" ""
;				   (shell-command-to-string "$SHELL -l -c 'echo $PATH'"))))
;    (setenv "PATH" path-from-shell)
;    (setq exec-path (split-string path-from-shell path-separator))))
					;(when (equal system-type 'darwin) (set-exec-path-from-shell-PATH))
;(set-exec-path-from-shell-PATH)

;(require 'exec-path-from-shell)
;(when (memq window-system '(mac ns x))
;  (exec-path-from-shell-copy-env "PATH")
;(exec-path-from-shell-initialize)

;;; UI
(menu-bar-mode -1)
(if (display-graphic-p)
    (toggle-scroll-bar -1))

;; Theme
(load-theme 'dracula t)

;;;
(defadvice linum-update-window (around linum-dynamic activate)
  (let* ((w (length (number-to-string
		     (count-lines (point-min) (point-max)))))
	 (linum-format (concat "%" (number-to-string w) "d ")))
    ad-do-it))
(custom-set-variables '(linum-format (quote dynamic))
                      '(paradox-github-token t))
(custom-set-faces '(default ((t (:background "nil"))))
		  '(linum ((t (:background "color-235")))))
(global-linum-mode t)

;; Mac
(setq ns-function-modifier 'hyper)

;; Magit
(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-x M-g") 'magit-dispatch-popup)

;; replace buffer-menu with ibuffer
;(global-set-key (kbd "C-x C-b") 'ibuffer)

;;; avy
;(global-set-key (kbd "C-:") 'avy-goto-char)
;(global-set-key (kbd "C-'") 'avy-goto-char-2)
;(global-set-key (kbd "M-g f") 'avy-goto-line)
;(global-set-key (kbd "M-g w") 'avy-goto-word-1)
(global-set-key (kbd "M-g e") 'avy-goto-word-0)

(key-chord-mode t)
(key-chord-define-global "jj" 'avy-goto-word-1)
(key-chord-define-global "jl" 'avy-goto-line)
(key-chord-define-global "jk" 'avy-goto-char)
(avy-setup-default)

;;; Helm
(require 'helm-config)
(helm-mode 1)
(helm-autoresize-mode 1)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-x C-b") 'helm-buffers-list)
(global-set-key (kbd "C-x b") 'helm-mini)
(setq helm-mode-fuzzy-match t
      helm-completion-in-region-fuzzy-match t)
(setq helm-buffers-fuzzy-matching t
      helm-recentf-fuzzy-match    t
      helm-locate-fuzzy-match     t
      helm-M-x-fuzzy-match        t
      helm-semantic-fuzzy-match   t
      helm-imenu-fuzzy-match      t
      helm-apropos-fuzzy-match    t
      helm-lisp-fuzzy-completion  t)

;;; Enable company-mode
(add-hook 'after-init-hook 'global-company-mode)

(projectile-global-mode)


;;; Programming
(yas-global-mode 1)

;;; Ruby

;(require 'chruby)
;(add-hook 'ruby-mode-hook #'chruby-use-corresponding)

(setq ruby-insert-encoding-magic-comment nil)
(add-hook 'ruby-mode-hook 'robe-mode)
(eval-after-load 'company
  '(push 'company-robe company-backends))

(add-hook 'projectile-mode-hook 'projectile-rails-on)

(require 'projectile-rails)
(define-key projectile-rails-mode-map (kbd "s-m")   'projectile-rails-find-model)
(define-key projectile-rails-mode-map (kbd "s-c")   'projectile-rails-find-controller)
(define-key projectile-rails-mode-map (kbd "s-v")   'projectile-rails-find-view)
(define-key projectile-rails-mode-map (kbd "s-RET") 'projectile-rails-goto-file-at-point)
(define-key projectile-rails-mode-map (kbd "C-c g")  projectile-rails-mode-goto-map)


;;; Elixir
(add-hook 'elixir-mode-hook 'alchemist-mode)

;; load every .el file inside ~/.emacs.d/modules/
; (mapc 'load (directory-files "~/.emacs.d/modules" t ".*\.el"))


;;; store all backup and autosave files in the tmp dir
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))



