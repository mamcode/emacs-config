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
(setq newsticker-retrieval-interval 43200)

; Setup the feeds.
(setq newsticker-url-list-defaults nil)

(setq newsticker-url-list
      '(

	;; Sports

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
	;; http://www.guardian.co.uk/football
	("Football news | guardian.co.uk"
        "http://feeds.guardian.co.uk/theguardian/football/rss"
        nil nil nil)
	;; -------------------------------------------------------

	;; News

	;; http://cnnespanol.cnn.com
	("CNN en Español"
        "http://cnnespanol.cnn.com/feed/"
        nil nil nil)
	;; http://alt1040.com
	("ALT1040"
        "http://alt1040.com/feed"
        nil nil nil)
	;; http://www.guardian.co.uk/world
	("World news and comment from the Guardian | guardian.co.uk"
        "http://feeds.guardian.co.uk/theguardian/world/rss"
        nil nil nil)
	;; http://www.guardian.co.uk/world/usa
	("World news: United States | guardian.co.uk"
        "http://www.guardian.co.uk/world/usa/rss"
        nil nil nil)
	;; http://www.guardian.co.uk/global-development
	("Global development news, comment and analysis | guardian.co.uk"
        "http://www.guardian.co.uk/global-development/rss"
        nil nil nil)
	;; http://www.guardian.co.uk/data
	("News: Data | guardian.co.uk"
        "http://feeds.guardian.co.uk/theguardian/data/rss"
        nil nil nil)
	;; http://www.guardian.co.uk/law 
	("Law | guardian.co.uk"
        "http://www.guardian.co.uk/law/rss"
        nil nil nil)
	;; http://www.guardian.co.uk/technology
	("Tech | guardian.co.uk"
        "http://feeds.guardian.co.uk/theguardian/technology/rss"
        nil nil nil)
	;; http://www.guardian.co.uk/tv-and-radio
	("Television, radio and TV coverage | guardian.co.uk"
        "http://www.guardian.co.uk/tv-and-radio/rss"
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
	;; http://www.tendencias21.net/
	("Tendencias 21"
        "http://www.tendencias21.net/xml/syndication.rss"
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
	("Jquery: Getting Started"
        "http://forum.jquery.com/getting-started/feed"
        nil nil nil)
	("Jquery: Using Jquery"
        "https://forum.jquery.com/using-jquery/feed"
        nil nil nil)
	("Jquery: Developing Jquery Core"
        "https://forum.jquery.com/developing-jquery-core/feed"
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
	;; http://blog.mozilla.org
	("The Mozilla Blog"
        "http://blog.mozilla.org/feed/"
        nil nil nil)
	;; http://security.debian.org/
	("Debian -- El sistema operativo universal"
        "http://www.debian.org/security/dsa"
        nil nil nil)
	;; http://www.esdebian.org
	("esDebian"
        "http://www.esdebian.org/crss"
        nil nil nil)
	;; http://planet.debian.org/es/
	("Planet Debian Spanish"
        "http://planet.debian.org/es/rss10.xml"
        nil nil nil)
	;; http://www.linuxparatodos.net/portal
	("Linux Para Todos"
        "http://www.linuxparatodos.net/geeklog/backend/backend.rss"
        nil nil nil)
	;; http://www.vivalinux.com.ar/
	("VivaLinux!"
        "http://www.vivalinux.com.ar/xml/rss"
        nil nil nil)
	;; http://planet.gnu.org/
	("Planet GNU"
        "http://planet.gnu.org/atom.xml"
        nil nil nil)
	;; -------------------------------------------------------

	;; Business

	;; http://www.ingresosalcuadrado.com
	("Ingresos Al Cuadrado"
        "http://feeds.feedburner.com/IngresosAlCuadrado"
        nil nil nil)
	;; -------------------------------------------------------

	;; Design

	;; http://www.colourlovers.com/blog
	("Color + Design Blog by COLOURlovers"
	 "http://feeds.feedburner.com/Colourlovers"
	 nil nil nil)
	;; -------------------------------------------------------

	;; Joomla

	;; http://www.theartofjoomla.com/
	("Joomla Tutorials by Joomla Core Developer Andrew Eddie | New Life in IT | The Art of Joomla"
        "http://www.theartofjoomla.com/?format=feed&amp;type=rss"
        nil nil nil)
	;; http://www.rockettheme.com/
	("RocketTheme Blog"
        "http://www.rockettheme.com/blog?format=feed&type=rss"
        nil nil nil)
	;; -------------------------------------------------------

	;; Security

	;; http://www.rssmix.com/
	("OWASP Moderated News Feed"
        "http://feeds.feedburner.com/OWASP"
        nil nil nil)
	;; -------------------------------------------------------

	;; Education

	;; http://blog.coursera.org/
	("Coursera Blog"
        "http://blog.coursera.org/rss"
        nil nil nil)
	;; http://www.opencontentalliance.org
	("Open Content Alliance (OCA)"
        "http://www.opencontentalliance.org/feed/"
        nil nil nil)
	;; http://marketplace.tutsplus.com 
	("Tuts+ Marketplace new  items"
        "http://marketplace.tutsplus.com/feeds/new-tutsmarketplace-items.atom"
        nil nil nil)
	;; -------------------------------------------------------

	;; Web Development
	
	;; http://addyosmani.com/blog
	("AddyOsmani.com | Articles for developers"
        "http://feeds.feedburner.com/addyosmani"
        nil nil nil)
	;; http://limi.net
	("Alex Limi"
        "http://feeds.limi.net/limi"
        nil nil nil)
	;; http://ashkenas.com
	("Ashkenas.com"
        "http://ashkenas.com/feed.rss"
        nil nil nil)
	;; http://blog.getbootstrap.com
	("Bootstrap"
        "http://blog.getbootstrap.com/feed.xml"
        nil nil nil)
	;; http://news.bootswatch.com/
	("Bootswatch"
        "http://feeds.feedburner.com/bootswatch"
        nil nil nil)
	;; https://brendaneich.com
	;;("Brendan Eich"
        ;;"https://brendaneich.com/feed/"
        ;;nil nil nil)
	;; http://coderbay.com"
	("Coderbay - Free Web resources"
        "http://feeds.feedburner.com/Coderbay"
        nil nil nil)
	;; http://www.borismoore.com/
	("Dancing with Data"
        "http://www.borismoore.com/feeds/posts/default"
        nil nil nil)
	;; "http://davidmarkfans.wordpress.com
	("David Mark Fan Blog"
        "http://feeds.feedburner.com/DavidMarkFanBlog"
        nil nil nil)
	;; http://nimbupani.github.com/
	("Divya Manian"
        "http://feeds.feedburner.com/nimbupani"
        nil nil nil)
	;; http://drublic.de/blog
	("drublic"
        "http://feeds.feedburner.com/drublic"
        nil nil nil)
	;; http://erik.eae.net/
	("erik's weblog"
        "http://erik.eae.net/feed/atom/"
        nil nil nil)
	;; http://frontendmasters.com
	("Frontend Masters"
        "http://frontendmasters.com/feed/"
        nil nil nil)
	;; http://htmlui.com
	("htmlUI Blog"
        "http://feeds.feedburner.com/htmlui"
        nil nil nil)
	;; http://blog.jsfiddle.net/
	("jsFiddle - Online Web Editor"
        "http://blog.jsfiddle.net/rss"
        nil nil nil)
	;; http://mathiasbynens.be/notes
	("Mathias Bynens"
        "http://mathiasbynens.be/notes.atom"
        nil nil nil)
	;; http://mir.aculo.us/
	("mir.aculo.us"
        "http://mir.aculo.us/feed/atom/"
        nil nil nil)
	;; http://misko.hevery.com
	("Miško Hevery"
        "http://misko.hevery.com/feed/"
        nil nil nil)
	;; http://www.nczonline.net/blog
	("NCZOnline"
        "http://feeds.feedburner.com/nczonline"
        nil nil nil)
	;; http://paulirish.com/
	("Paul Irish"
        "http://feeds.feedburner.com/paul-irish"
        nil nil nil)
	;; http://peter.michaux.ca/ 
	("peter.michaux.ca"
        "http://michaux.ca/feed/atom.xml"
        nil nil nil)
	;; http://dmitry.baranovskiy.com
	("dmitry.baranovskiy.com"
        "http://microformatique.com/optimus/?uri=dmitry.baranovskiy.com&amp;format=rss"
        nil nil nil)
	;; http://www.desarrolloweb.com
	("Últimas novedades Desarrolloweb.com"
        "http://www.desarrolloweb.com/rss/general_rss.php"
        nil nil nil)
	;; http://octopress.org
	("Octopress"
        "http://octopress.org/atom.xml"
        nil nil nil)	
	;; -------------------------------------------------------

	;; Cakephp
	
	;; http://ask.cakephp.org/
	("Recent questions from http://cakeqs.org"
        "http://ask.cakephp.org/questions/index.rss"
        nil nil nil)
	;; http://mark-story.com/posts/archive/url[ext]:rss
	("Recent Writing - Mark Story"
        "http://mark-story.com/posts/rss"
        nil nil nil)
	;; -------------------------------------------------------

	;; Video
	
	;; Uploads by yuilibrary
	("Uploads by yuilibrary"
        "http://gdata.youtube.com/feeds/base/users/yuilibrary/uploads?alt=rss&amp;v=2"
        nil nil nil)
	;; -------------------------------------------------------

	;; Plone

	;; http://www.netsight.co.uk/blog
	("netsight.co.uk"
        "http://www.netsight.co.uk/blog/atom.xml"
        nil nil nil)
	;; http://www.erico.com.br
	("erico.com.br"
        "http://greenfinity.hu/en/blog/atom.xml"
        nil nil nil)
	;; http://www.circulartriangle.com/blog
	("Circular Triangle"
        "http://www.circulartriangle.com/blog/?feed=rss2"
        nil nil nil)
	;; http://lcaballero.wordpress.com
	("Leonardo J. Caballero G."
        "http://lcaballero.wordpress.com/feed/"
        nil nil nil)
	;; http://2013.ploneconf.org
	("ploneconf.org"
        "http://2013.ploneconf.org/news/aggregator/RSS"
        nil nil nil)
	;; http://greenfinity.hu/en/blog"
	("greenfinity.hu"
        "http://greenfinity.hu/en/blog/atom.xml"
        nil nil nil)
	;; http://plone.es
	("plone.es"
        "http://plone.es/noticias/aggregator/RSS"
        nil nil nil)
	;; http://plone.es/planet
	("Planeta Plone.es"
        "http://plone.es/planet/atom.xml"
        nil nil nil)
	;; http://plone.org
	("Plone News"
        "http://plone.es/planet/atom.xml"
        nil nil nil)
	;; http://www.vlent.nl/
	("Practicing web development"
        "http://www.vlent.nl/feed.atom"
        nil nil nil)
	;; http://www.stevemcmahon.com
	("Steve’s Blog"
        "http://www.stevemcmahon.com/steves-blog/steves-blog/RSS"
        nil nil nil)
	;; -------------------------------------------------------

	;; Miscellaneous

	;; http://codersvenezuela.com
	("Coders Venezuela"
        "http://www.codersvenezuela.com/posts.rss"
        nil nil nil)
	;; http://tirania.org/monomac//index.html
	("Miguel's OSX and iOS blog"
        "http://feeds.feedburner.com/MiguelsOsxAndIosBlog"
        nil nil nil)
	;; http://www.coactivate.org/news
	("Site News"
        "http://www.coactivate.org/news/rss"
        nil nil nil)
	;; http://pivotallabs.com
	("Pivotal Tracker"
        "http://pivotallabs.com/feed/"
        nil nil nil)
	;; http://arah.at 
	("arah.at"
        "http://arah.at/feed/"
        nil nil nil)
	;; http://blog.empathybox.com/
	("Jay Kreps"
        "http://blog.empathybox.com/rss"
        nil nil nil)
	;; http://life.kulbirsaini.com 
	("Life"
        "http://feeds.feedburner.com/life-journey"
        nil nil nil)
	;; http://www.omg.org/index.htm
	("What Is New"
        "http://www.omg.org/rss/What_Is_New.xml"
        nil nil nil)
	;; www.myphilanthropedia.org/
	("Philanthropedia"
        "http://feeds.feedburner.com/Philanthropedia"
        nil nil nil)
	;; https://www.yourcause.com/
	("YourCause.com"
        "https://www.yourcause.com/GenerateRssFeed.aspx?404;http://www.yourcause.com:80/rss.xml"
        nil nil nil)
	;; -------------------------------------------------------

        )
      )

; Optionally bind a shortcut for your new RSS reader.
(global-set-key (kbd "C-c r") 'newsticker-treeview)

; Don't forget to start it!
(newsticker-start)

;;Using customize-group -> 'newsticker' for change retrieval method to wget (to prevent collapse emacs)
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(newsticker-retrieval-method (quote extern)))

;; For add groups of feeds use M-x newsticker-group-add-group NAME PARENT 
;; -> M-x newsticker-treeview-save
;; For move feeds to groups M-x newsticker-group-move-feed NAME GROUP 
;; -> M-x newsticker-treeview-save