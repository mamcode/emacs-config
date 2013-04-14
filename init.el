(cd "~/.emacs.d/")
;;;;;;;;;;;;;;;;;;;;;
;; Enable php-mode ;;
;;;;;;;;;;;;;;;;;;;;;
(add-to-list 'load-path "~/.emacs.d/")
(load "php-mode")
(require 'php-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Pear coding standards : http://pear.php.net/manual/en/standards.indenting.php ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun pear/php-mode-init ()
  "Set some buffer-local variables."
  (setq case-fold-search t)
  (setq indent-tabs-mode nil)
  (setq fill-column 78)
  (setq c-basic-offset 4)
  (c-set-offset 'arglist-cont 0)
  (c-set-offset 'arglist-intro '+)
  (c-set-offset 'case-label 2)
  (c-set-offset 'arglist-close 0))
(add-hook 'php-mode-hook 'pear/php-mode-init)

;;;;;;;;;;;;;;;;;;;;;;;;
;; Enable color-theme ;;
;;;;;;;;;;;;;;;;;;;;;;;;
(add-to-list 'load-path "~/.emacs.d/color-theme")
(require 'color-theme)
(eval-after-load "color-theme"
  '(progn
     (color-theme-initialize)
     (color-theme-arjen)))

;;;;;;;;;;;;;;;;;;
;; IRC with ERC ;;
;;;;;;;;;;;;;;;;;;

(erc :server "irc.freenode.net" :port 6667 :nick "punketo28")
(setq erc-autojoin-channels-alist
      '(("freenode.net" "#emacs" "#joomla" "#cakephp")))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; nxhtml for web development --nXhtml is an addon to Emacs for editing XHTML, PHP and similar things-- ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(load "~/.emacs.d/nxhtml/autostart.el")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Newsticker.el for Feeds RSS ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'newsticker)

; W3M HTML renderer isn't essential, but it's pretty useful.
(require 'w3m)
(setq newsticker-html-renderer 'w3m-region)

; We want our feeds pulled every 10 minutes.
(setq newsticker-retrieval-interval 600)

; Setup the feeds.
(setq newsticker-url-list-defaults nil)

(setq newsticker-url-list
      '(
	;; Sports

	;; http://espndeportes.espn.go.com
	("ESPN Deportes"
         "http://espndeportes.espn.go.com/rss/news"
         nil nil nil)
	;; http://www.marca.com
	("Marca"
         "http://marca.feedsportal.com/rss/portada.xml"
         nil nil nil)
	;; http://es-us.noticias.yahoo.com/deportes/
	("Yahoo! Noticias: Deportes"
         "http://d.yimg.com/espanol.rss.news.yahoo.com/rss/deportes"
         nil nil nil)
	;; http://www.sport.es
	("Sport.es: Ultimas Noticias"
         "http://www.sport.es/es/rss/last_news/rss.xml"
         nil nil nil)
	;; http://www.sport.es
	("Sport.es: Ultimas Noticias Barca"
         "http://www.sport.es/es/rss/barca/rss.xml"
         nil nil nil)
	;; http://www.sport.es
	("Sport.es: Ultimas Noticias Liga BBVA"
         "http://www.sport.es/es/rss/liga-bbva/rss.xml"
         nil nil nil)
	;; -------------------------------------------------------

	;; Emacs
	("EmacsWiki Recently Change"
         "http://www.emacswiki.org/emacs/index.rss"
         nil nil nil)
        ("Planet Emacsen"
         "http://planet.emacsen.org/atom.xml"
         nil nil nil)
        )
      )

;; (setq newsticker-url-list
;;       (google-reader-to-newsticker "~/Downloads/punketo28@gmail.com-takeout/Google-Reader/subscriptions.xml"))

; Optionally bind a shortcut for your new RSS reader.
(global-set-key (kbd "C-c r") 'newsticker-treeview)

; Don't forget to start it!
(newsticker-start)