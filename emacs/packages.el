;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; This el loads essential packages.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; the package manager
(require 'package)
(setq
 package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                    ("org" . "http://orgmode.org/elpa/")
                    ("melpa" . "http://melpa.org/packages/")
                    ("melpa-stable" . "http://stable.melpa.org/packages/"))
 package-archive-priorities '(("melpa-stable" . 1)))

(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)

;; Install ensime
(use-package ensime
  :ensure t
  :pin melpa-stable)

;; Add sbt
(add-to-list 'exec-path "/usr/local/bin")

;; dirtree
(add-to-list 'load-path "~/.emacs.d/elpa/dirtree-20140129.832")
(autoload 'dirtree "dirtree" "Add directory to tree view" t)

;; ace-jump
(autoload
  'ace-jump-mode
  "ace-jump-mode"
  "Emacs quick move minor mode" t)
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

(defun my-shell-hook ()
  (define-key shell-mode-map (kbd "C-c SPC") 'ace-jump-mode))

(add-hook 'shell-mode-hook 'my-shell-hook)
