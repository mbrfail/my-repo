;; My(tlongcn's) personal setting
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Hot keys section
;;
;; Window frame control:
;;   \C-xr: Double frame size and split
;;   \C-xt: Reset frame to single 80-column size
;;   \C-x+: Makes all windows equally sized
;;   \C-c p/n/f/b: window-move
;;   \C-c SPC: ace-jump
;;
;; Text insert
;;   \C-c s: copyright signature
;;   \C-c t: todo
;;
;;
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(add-to-list 'load-path "/usr/local/google/home/tlongcn/.emacs.d/lisp/")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Key rebinding
(global-set-key (kbd "C-?") 'help-command)
(global-set-key (kbd "M-?") 'mark-paragraph)
(global-set-key (kbd "C-h") 'delete-backward-char)
(global-set-key (kbd "M-h") 'backward-kill-word)

(global-set-key (kbd "C-c p") 'windmove-up)
(global-set-key (kbd "C-c n") 'windmove-down)
(global-set-key (kbd "C-c b") 'windmove-left)
(global-set-key (kbd "C-c f") 'windmove-right)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Customized keys
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Insert common texts
(global-set-key (kbd "C-c s") 'my-insert-signature)
(global-set-key (kbd "C-c t") 'my-insert-todo)
(global-set-key (kbd "C-c i") 'my-cpp-include)

(defun my-insert-signature ()
  "Insert copyright header."
  (interactive)
  (insert "// Copyright 2017 Google Inc.\n// All Rights Reserved.\n//\n// Author: tlongcn@google.com (Teng Long)\n"))

(defun my-insert-todo ()
  "Insert todo header."
  (interactive)
  (insert "// TODO(tlongcn): "))

(defun my-cpp-include ()
  "Insert #include \"\""
  (interactive)
  (insert "#include \"\"")
  (backward-char))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; no startup msg
(setq inhibit-startup-message t)        ; Disable startup message

;; Parenthesis matching
(show-paren-mode 1)

;;show column mode
(setq column-number-mode t)

;; auto close bracket insertion. New in emacs 24
(electric-pair-mode 1)

;; highlight current line
(hl-line-mode 1)

;; no scroll bar:
(scroll-bar-mode -1)
;; faces
(defun faces_x ()
  ;; these are used when in X
  (custom-set-faces
   '(default ((t (:foreground "wheat" :background "black"))))
   '(flyspell-duplicate ((t (:foreground "Gold3" :underline t :weight normal))))
   '(flyspell-incorrect ((t (:foreground "OrangeRed" :underline t :weight normal))))
   '(font-lock-comment-face ((t (:foreground "SteelBlue1"))))
   '(font-lock-function-name-face ((t (:foreground "gold"))))
   '(font-lock-keyword-face ((t (:foreground "springgreen"))))
   '(font-lock-type-face ((t (:foreground "PaleGreen"))))
   '(font-lock-variable-name-face ((t (:foreground "Coral"))))
   '(menu ((((type x-toolkit)) (:background "light slate gray" :foreground "wheat" :box (:line-width 2 :color "grey75" :style released-button)))))
   '(mode-line ((t (:foreground "black" :background "light slate gray"))))
   '(tool-bar ((((type x w32 mac) (class color)) (:background "midnight blue" :foreground "wheat" :box (:line-width 1 :style released-button))))))
  (set-cursor-color "deep sky blue")
  (set-foreground-color "wheat")
  (set-background-color "black")
  (set-face-foreground 'default "wheat")
  (set-face-background 'default "black")
 )

(if window-system
    (faces_x)
)

;;
;; X windows configuration
;;
(when (display-graphic-p)
      (tool-bar-mode -1)
      (setq x-select-enable-clipboard t)
      ;; (custom-set-variables
      ;;  '(initial-frame-alist (quote ((fullscreen . maximized)))))
      )
(add-to-list 'default-frame-alist '(height . 100))
;; (add-to-list 'default-frame-alist '(width . 164))

;; Default auto fill column
;; (setq-default fill-column 80)

;;
;; 80 columns setting
;;
(add-hook 'c++-mode-hook
          (lambda () (font-lock-set-up-width-warning 120)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ace jump mode major function
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(autoload
  'ace-jump-mode
  "ace-jump-mode"
  "Emacs quick move minor mode" t)
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

(defun my-shell-hook ()
  (define-key shell-mode-map (kbd "C-c SPC") 'ace-jump-mode))

(add-hook 'shell-mode-hook 'my-shell-hook)

;; (global-set-key (kbd "C-c SPC") 'ace-jump-mode)

;;
;; enable a more powerful jump back function from ace jump mode
;;
(autoload
  'ace-jump-mode-pop-mark
  "ace-jump-mode"
  "Ace jump back:-)"
  t)
(eval-after-load "ace-jump-mode"
  '(ace-jump-mode-enable-mark-sync))
(define-key global-map (kbd "C-x SPC") 'ace-jump-mode-pop-mark)
;; Ace-window
(autoload
  'ace-window
  "ace-window"
  "Emacs quick move window mode" t)
(global-set-key (kbd "M-p") 'ace-window)
(define-key global-map (kbd "C-x o") 'ace-window)

;; Enable Hippie-expand
(setq hippie-expand-try-functions-list
      '(try-expand-dabbrev                 ; 搜索当前 buffer
        try-expand-dabbrev-visible         ; 搜索当前可见窗口
        try-expand-dabbrev-all-buffers     ; 搜索所有 buffer
        try-expand-dabbrev-from-kill       ; 从 kill-ring 中搜索
        try-complete-file-name-partially   ; 文件名部分匹配
        try-complete-file-name             ; 文件名匹配
        try-expand-all-abbrevs             ; 匹配所有缩写词
        try-expand-list                    ; 补全一个列表
        try-expand-line                    ; 补全当前行
        try-complete-lisp-symbol-partially ; 部分补全 elisp symbol
        try-complete-lisp-symbol))         ; 补全 lisp symbol

;; bash completion
;; (require 'bash-completion)
;; (bash-completion-setup)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Not enabled yet
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun double-and-split (&optional width)
  "Double the frame size and split window, creating two equally sized windows.
If WIDTH argument is supplied, use it instead of current frame width."
  (interactive "P")
  (set-frame-width (selected-frame) (+ (* (or width (frame-width)) 2) 3))
  (split-window-horizontally))

(global-set-key "\C-xr" #'double-and-split)

(defun back-to-single (&optional width)
  (interactive "P")
  (set-frame-width (selected-frame) 80))

(global-set-key "\C-xt" #'back-to-single)   ; bind autogen to control-c + g


;; Use package installation
;; (require 'package)
;; (setq package-enable-at-startup nil)
;; (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
;; (add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
;; (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
;; (package-initialize)

;; (unless (package-installed-p 'use-package)
;;   (package-refresh-contents)
;;   (package-install 'use-package))

;; (eval-when-compile
;;   (require 'use-package))
;; (require 'diminish)
;; (require 'bind-key)
