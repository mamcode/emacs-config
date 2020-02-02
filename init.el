;; init.el --- Emacs configuration

;; INSTALL PACKAGES
;; --------------------------------------

(require 'package)

;; (add-to-list 'package-archives
;; 	     '("melpa" . "http://melpa.org/packages/") t)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives '("gnu" . (concat proto "://elpa.gnu.org/packages/")))))
(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

(defvar myPackages
  '(better-defaults
    zerodark-theme
    ein
    pyvenv
    elpy
    flycheck
    py-autopep8
    js2-mode
    js2-refactor
    xref-js2))

(mapc #'(lambda (package)
	  (unless (package-installed-p package)
	    (package-install package)))
      myPackages)

;; BASIC CUSTOMIZATION
;; --------------------------------------

(setq inhibit-startup-message t) ;; hide the startup message
(load-theme 'zerodark t)
(zerodark-setup-modeline-format)
(global-linum-mode t) ;; enable line numbers globally

;; PYTHON CONFIGURATION
;; --------------------------------------

(elpy-enable)
(setq python-shell-interpreter "ipython"
      python-shell-interpreter-args "-i --simple-prompt")

;; use flycheck not flymake with elpy
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

;; enable autopep8 formatting on save
(require 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

(require 'js2-mode)
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

;; ;; Better imenu
(add-hook 'js2-mode-hook #'js2-imenu-extras-mode)

(require 'js2-refactor)
(require 'xref-js2)

(add-hook 'js2-mode-hook #'js2-refactor-mode)
(js2r-add-keybindings-with-prefix "C-c C-r")
(define-key js2-mode-map (kbd "C-k") #'js2r-kill)

;; js-mode (which js2 is based on) binds "M-." which conflicts with xref, so
;; unbind it.
(define-key js-mode-map (kbd "M-.") nil)

(add-hook 'js2-mode-hook (lambda ()
			   (add-hook 'xref-backend-functions #'xref-js2-xref-backend nil t)))

;; init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("ed17fef69db375ae1ced71fdc12e543448827aac5eb7166d2fd05f4c95a7be71" "5a45c8bf60607dfa077b3e23edfb8df0f37c4759356682adf7ab762ba6b10600" "e396098fd5bef4f0dd6cedd01ea48df1ecb0554d8be0d8a924fb1d926f02f90f" "acfac6b14461a344f97fad30e2362c26a3fe56a9f095653832d8fc029cb9d05c" "6515fcc302292f29a94f6ac0c5795c57a396127d5ea31f37fc5f9f0308bbe19f" "5ed25f51c2ed06fc63ada02d3af8ed860d62707e96efc826f4a88fd511f45a1d" "de1f10725856538a8c373b3a314d41b450b8eba21d653c4a4498d52bb801ecd2" "39546362fed4d5201b2b386dc21f21439497c9eec5fee323d953b3e230e4083e" "773e0bfa5450c75d613cbf29734cdc876c3d59dbf85b93cff3015a8687dea158" "ba913d12adb68e9dadf1f43e6afa8e46c4822bb96a289d5bf1204344064f041e" "bdb4509c123230a059d89fc837c40defdecee8279c741b7f060196b343b2d18d" "efbe8f0a87281bcfa5e560d5ca10268c735de3a3bb160b54c520d02609aed9d8" "f357d72451c46d51219c3afd21bb397a33cb059e21db1f4adeffe5b8a9093537" "b73a23e836b3122637563ad37ae8c7533121c2ac2c8f7c87b381dd7322714cd0" "0dd2666921bd4c651c7f8a724b3416e95228a13fca1aa27dc0022f4e023bf197" "d5aec3a39364bc4c6c13f472b2d0cdaebd5cff7a6e4839749be2156fcc075006" "0eccc893d77f889322d6299bec0f2263bffb6d3ecc79ccef76f1a2988859419e" default)))
 '(package-selected-packages
   (quote
    (brutalist-theme inverse-acme-theme flucui-themes constant-theme nofrils-acme-theme habamax-theme night-owl-theme one-themes chyla-theme zeno-theme all-the-icons-dired neotree zerodark-theme xref-js2 py-autopep8 magit js2-refactor flycheck elpy ein better-defaults))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(setq nxml-child-indent 4 nxml-attribute-indent 4)
