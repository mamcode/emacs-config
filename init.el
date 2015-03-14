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

;; Enable syntax highlighting
(global-font-lock-mode 1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Python specific settings ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;
;; PEP 8 ;;
;;;;;;;;;;;

;; Don't use TABS for indentations.
(setq-default indent-tabs-mode nil)

;; Set the number to the number of columns to use.
(setq-default fill-column 79)

;; Add Autofill mode to mode hooks.
(add-hook 'text-mode-hook 'turn-on-auto-fill)

;; Show line number in the mode line.
(line-number-mode 1)

;; Show column number in the mode line.
(column-number-mode 1)

;; Indentation is automatically added.
(load-library "python")

(autoload 'python-mode "python-mode" "Python Mode." t)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(add-to-list 'interpreter-mode-alist '("python" . python-mode))

(setq interpreter-mode-alist
      (cons '("python" . python-mode)
            interpreter-mode-alist)
      python-mode-hook
      '(lambda () (progn
                    (set-variable 'py-indent-offset 4)
                    (set-variable 'indent-tabs-mode nil))))

;; Highlight the column where a line must stop
;; Highlight character at "fill-column" position.
(set-face-background 'column-marker-1 "red")
(add-hook 'python-mode-hook
          (lambda () (interactive)
            (column-marker-1 fill-column)))

;; Remove trailing whitespace manually by typing C-t C-w.
(add-hook 'python-mode-hook
          (lambda ()
            (local-set-key (kbd "C-t C-w")
                           'delete-trailing-whitespace)))

;; Automatically remove trailing whitespace when file is saved.
(add-hook 'python-mode-hook
      (lambda()
        (add-hook 'local-write-file-hooks
              '(lambda()
                 (save-excursion
                   (delete-trailing-whitespace))))))

;; Use M-SPC (use ALT key) to make sure that words are separated by
;; just one space. Use C-x C-o to collapse a set of empty lines
;; around the cursor to one empty line. Useful for deleting all but
;; one blank line at end of file. To do this go to end of file (M->)
;; and type C-x C-o.
