(use-package centaur-tabs
   :config
   (setq centaur-tabs-style "bar"
	  centaur-tabs-height 32
	  centaur-tabs-set-icons t
	  centaur-tabs-set-modified-marker t
	  centaur-tabs-show-navigation-buttons t
	  centaur-tabs-set-bar 'under
	  x-underline-at-descent-line t)
   (centaur-tabs-headline-match)
   (centaur-tabs-mode t)
   (setq uniquify-separator "/")
   (setq uniquify-buffer-name-style 'forward))
