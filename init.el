(cd "~/.emacs.d/")

;;;;;;;;;;;;;;;;;;;;;;;;
;; Enable color-theme ;;
;;;;;;;;;;;;;;;;;;;;;;;;
(add-to-list 'load-path "~/.emacs.d/color-theme")
(require 'color-theme)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Enable emacs-color-theme-solarized ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-to-list 'load-path "~/.emacs.d/emacs-color-theme-solarized")
(require 'color-theme-solarized)
(eval-after-load "color-theme"
  '(progn
     (color-theme-initialize)
     (color-theme-solarized)))

;;;;;;;;;;;;;;;;;;;
;; less-css-mode ;;
;;;;;;;;;;;;;;;;;;;
;; This mode provides syntax highlighting for LESS CSS files, plus
;; optional support for compilation of .less files to .css files at
;; the time they are saved: use `less-css-compile-at-save' to enable
;; this.
(add-to-list 'load-path "~/.emacs.d/less-css-mode")
(require 'less-css-mode)

;;;;;;;;;;;;;;;;;;;;;;;
;; Set the font size ;;
;;;;;;;;;;;;;;;;;;;;;;;
(set-face-attribute 'default nil :height 110)


;;;;;;;;;;;;;;;;;;;
;; Cask          ;;
;;;;;;;;;;;;;;;;;;;
(require 'cask "~/.cask/cask.el")
(cask-initialize)

;;;;;;;;;;;;;;
;; Flycheck ;;
;;;;;;;;;;;;;;
(add-hook 'after-init-hook #'global-flycheck-mode)
