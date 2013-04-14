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

	;; News
	;; http://cnnespanol.cnn.com
	("CNN en Español"
         "http://cnnespanol.cnn.com/feed/"
         nil nil nil)
	;; -------------------------------------------------------

	;; Health
	;; http://www.glaucoma.org/
	("Glaucoma Research Foundation"
         "http://feeds.feedburner.com/GRFMainFeed"
         nil nil nil)
	;; -------------------------------------------------------

	;; BigBlueButton
	;; http://www.bigbluebutton.org
	("BigBlueButton"
         "http://www.bigbluebutton.org/feed/"
         nil nil nil)
	;; -------------------------------------------------------

	;; LaaS
	;; http://www.eucalyptus.com/blog
	("Eucalyptus Blogs"
         "http://www.eucalyptus.com/blog/feed"
         nil nil nil)

	;; http://www.openstack.org/blog
	("The OpenStack Blog"
         "http://www.openstack.org/blog/feed/"
         nil nil nil)
	;; -------------------------------------------------------

	;; Modeling
	;; http://modeling-languages.com
	("Software Modeling Blog"
         "http://feeds.feedburner.com/ModelingLanguages-blog"
         nil nil nil)
	;; -------------------------------------------------------

	;; Science
	
	("BBCMundo.com | Ciencia y Tecnología"
         "http://newsrss.bbc.co.uk/rss/spanish/science/rss.xml"
         nil nil nil)

	;; http://ciencia.nasa.gov
	("Ciencia @ NASA"
         "http://ciencia.nasa.gov/rss.xml"
         nil nil nil)

	;; http://www.librys.com
	("Ciencia y Tecnología"
         "http://www.librys.com/feed.rss"
         nil nil nil)

	;; http://www.tendencias21.net/
	("Tendencias 21"
         "http://www.tendencias21.net/xml/syndication.rss"
         nil nil nil)

	;; http://todo-ciencia.com/ciencia
	("Todo-Ciencia.com"
         "http://todo-ciencia.com/ciencia/feed/"
         nil nil nil)
	;; -------------------------------------------------------

	;; Music
	;; http://angelnavas.wordpress.com
	("Angel Navas"
         "http://angelnavas.wordpress.com/feed/"
         nil nil nil)
	;; -------------------------------------------------------

	;; Emacs
	;; http://www.emacswiki.org/
	("EmacsWiki Recently Change"
         "http://www.emacswiki.org/emacs/index.rss"
         nil nil nil)

	;; http://planet.emacsen.org/
        ("Planet Emacsen"
         "http://planet.emacsen.org/atom.xml"
         nil nil nil)

	;; http://www.masteringemacs.org
	("Mastering Emacs"
         "http://www.masteringemacs.org/feed/"
         nil nil nil)
	;; -------------------------------------------------------

	;; UX
	;; http://www.uxforthemasses.com
	("UX for the masses"
         "http://www.uxforthemasses.com/feed/"
         nil nil nil)
	;; -------------------------------------------------------

	;; Python
	;; http://www.web-aox.com
	("aox Weblog"
         "http://www.web-aox.com/feed"
         nil nil nil)

	;; http://atmantree.com/go
	("atmantree.com"
         "http://atmantree.com/go/feed/"
         nil nil nil)

	;; http://blog.c42.in/
	("C42 Engineering"
         "http://blog.c42.in/blog?format=rss"
         nil nil nil)

	;; http://ch3m4.org/blog
	("Hyperreals *R"
         "http://ch3m4.org/blog/feed/"
         nil nil nil)

	;; http://pyladies.com/
	("PyLadies"
         "http://www.pyladies.com/feed.xml"
         nil nil nil)

	;; http://sebasmagri.alwaysdata.net/
	("Sebastián Magrí"
         "http://sebasmagri.alwaysdata.net/feed.rss"
         nil nil nil)
	
	;; http://silvercorp.wordpress.com
	("Silvercorp"
         "http://silvercorp.wordpress.com/feed/"
         nil nil nil)
	;; -------------------------------------------------------

	;; Jquery
	;; http://www.trirand.com/blog
	("jQuery Grid Plugin - jqGrid"
         "http://www.trirand.com/blog/?feed=rss2"
         nil nil nil)
	;; -------------------------------------------------------

	;; Free Software
	;; http://cesarius.net
	("Cesarius Revolutions | Cibercultura, GNU/Linux y Software Libre"
         "http://feeds.feedburner.com/CesariusRevolutions"
         nil nil nil)

	;; http://mako.cc/copyrighteous
	("copyrighteous"
         "http://mako.cc/copyrighteous/feed/atom"
         nil nil nil)

	("Free Software Directory"
         "http://directory.fsf.org/wiki/Special:Ask/-5B-5BLast-20review-20date::%2B-5D-5D/format%3Drss/sort%3DLast-20review-20date/order%3Ddescending/searchlabel%3DRecent-20updates-20RSS-20feed/title%3DFree-20Software-20Directory/description%3DRecent-20updates-20to-20Free-20Software-20Directory-20(directory.fsf.org)/offset%3D0"
         nil nil nil)

	;; https://blog.mozilla.org/privacy
	("Mozilla Privacy Blog"
         "https://blog.mozilla.org/privacy/feed/"
         nil nil nil)

	;; http://planet.gnu.org/
	("Planet GNU"
         "http://planet.gnu.org/atom.xml"
         nil nil nil)

	;; http://blog.mozilla.org
	("The Mozilla Blog"
         "http://blog.mozilla.org/feed/"
         nil nil nil)

        )
      )

;; (setq newsticker-url-list
;;       (google-reader-to-newsticker "~/Downloads/punketo28@gmail.com-takeout/Google-Reader/subscriptions.xml"))

; Optionally bind a shortcut for your new RSS reader.
(global-set-key (kbd "C-c r") 'newsticker-treeview)

; Don't forget to start it!
(newsticker-start)