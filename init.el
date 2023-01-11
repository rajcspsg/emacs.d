;;; init.el --- setup emacs configs
;;; commentary:
;;; code:

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

(use-package all-the-icons  :ensure t)
(use-package all-the-icons-completion  :ensure t)
(use-package all-the-icons-gnus  :ensure t)
(use-package all-the-icons-dired  :ensure t)
(use-package all-the-icons-ivy  :ensure t)
(use-package all-the-icons-ivy-rich  :ensure t)
(use-package all-the-icons-ibuffer  :ensure t)
(use-package treemacs-all-the-icons  :ensure t)
(use-package winum)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(doom-palenight))
 '(custom-safe-themes
   '("5f128efd37c6a87cd4ad8e8b7f2afaba425425524a68133ac0efd87291d05874" "c83c095dd01cde64b631fb0fe5980587deec3834dc55144a6e78ff91ebc80b19" default))
 '(package-selected-packages
   '(winum rainbow-mode spaceline-all-the-icons all-the-icons-dired all-the-icons-ibuffer all-the-icons-ivy all-the-icons-ivy-rich all-the-icons-completion all-the-icons centaur-tabs kaolin-themes helm-swoop lsp-java clojure-mode lsp-mode cider lsp-treemacs flycheck company rainbow-delimiters)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(use-package kaolin-themes
  :config
  (load-theme 'kaolin-dark t)
  (kaolin-treemacs-theme))

(when (string= system-type "darwin")
  (setq dired-use-ls-dired t
		insert-directory-program "~/.homebrew/bin/gls"
		dired-listing-switches "-aBhl --group-directories-first"))


(load "~/.emacs.d/centaur-tabs.el")
(load "~/.emacs.d/treemacs.el")
(load "~/.emacs.d/cmake.el")
(load "~/.emacs.d/java.el")
(load "~/.emacs.d/scala.el")
(load "~/.emacs.d/golang.el")
(load "~/.emacs.d/python.el")
(load "~/.emacs.d/haskell.el")
(load "~/.emacs.d/cpp.el")
(load "~/.emacs.d/clojure.el")
(load "~/.emacs.d/tabnine.el")
(load "~/.emacs.d/java.el")


(add-hook 'emacs-startup-hook 'treemacs)

(set-face-attribute 'default nil
                    :family "Monofurbold Nerd Font Mono"
                    :height 160
                    :weight 'normal
                    :width 'normal)

(setq rainbow-delimiters-mode t)
(winum-mode t)

;;; (provide init)
;;; init.el ends here
