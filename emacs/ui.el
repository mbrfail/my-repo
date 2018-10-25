;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; This el sets the appearance and global behaviors of emacs.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; -------- modes ----------

(electric-indent-mode 0)
;; Parenthesis matching
(show-paren-mode 1)
;; auto close bracket insertion. New in emacs 
(electric-pair-mode 1)
;; highlight current line
(hl-line-mode 1)
;; no scroll bar:
(scroll-bar-mode -1)

;; -------- global variables ---------
(setq
 ;; Emacs keeps track of files that you are currently editing by creating a
 ;; symbolic link that looks like .#-emacsa08196. Unlike AutoSave files or
 ;; BackupFiles, these cannot be moved to a different directory. You can disable
 ;; them in Emacs versions >= 24.3
 create-lockfiles nil

 ;; Disable startup message
 inhibit-startup-screen t

 ;;show column mode
 column-number-mode t

 make-backup-files nil
 scroll-error-top-bottom t
 use-package-always-ensure t
 ;; Emacs’s sentence detection, by default, expects sentences to end with
 ;; terminal punctuation followed by two spaces or a new line.
 sentence-end-double-space nil
)

;; ------- buffer local variables ------
(setq-default
 indent-tabs-mode nil
 tab-width 4
 c-basic-offset 4)

;; ----- global keybindings -------
(global-unset-key (kbd "C-z"))

;; ----- faces ----------
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

;; X windows configuration
(when (display-graphic-p)
      (tool-bar-mode -1)
      (setq x-select-enable-clipboard t)
      ;; (custom-set-variables
      ;;  '(initial-frame-alist (quote ((fullscreen . maximized)))))
      )
;; (add-to-list 'default-frame-alist '(height . 100))
(add-to-list 'default-frame-alist '(width . 120))

;; Default auto fill column
(setq-default fill-column 80)



