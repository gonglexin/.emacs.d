(require 'editorconfig)
(require 'which-key)

;; enable editorconfig-mode
(editorconfig-mode 1)

;; display line number
(setq linum-format " %d ")
(global-linum-mode t)

;; highlight cursor line
(global-hl-line-mode t)

;; store all backup and autosave files in the tmp dir
(setq backup-directory-alist
  `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
  `((".*" ,temporary-file-directory t)))

;; revert buffers automatically when underlying files are changed
(global-auto-revert-mode t)

(which-key-mode t)

;; Always load newest byte code
(setq load-prefer-newer t)

(provide 'core-editor)
