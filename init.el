(menu-bar-mode -1) 
(tool-bar-mode -1)

;;(setq EMACS_DIR "~/.emacs.d/")

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/"))
;; (setq use-package-always-pin  "melpa-stable")
(package-initialize)

;; Download use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile (require 'use-package))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(doom-palenight))
 '(custom-safe-themes
   '("c83c095dd01cde64b631fb0fe5980587deec3834dc55144a6e78ff91ebc80b19" default))
 '(package-selected-packages
   '(helm-swoop lsp-java clojure-mode lsp-mode cider lsp-treemacs flycheck company)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(load "~/.emacs.d/centaur-tabs.el")
(load "~/.emacs.d/treemacs.el")
(load "~/.emacs.d/cmake.el")
;;(load "~/.emacs.d/java.el")
(load "~/.emacs.d/scala.el")
(load "~/.emacs.d/golang.el")
(load "~/.emacs.d/python.el")
(load "~/.emacs.d/haskell.el")
(load "~/.emacs.d/cpp.el")
(load "~/.emacs.d/clojure.el")
(load "~/.emacs.d/tabnine.el")
(load "~/.emacs.d/java.el")


(add-hook 'emacs-startup-hook 'treemacs)
