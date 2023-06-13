;;; init.el --- setup emacs configs
;;; commentary:
;;; code:

(setq EMACS_DIR "~/.emacs.d/")

;;Set language environment to UTF-8
(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)

;; Longer whitespace, otherwise syntax highlighting is limited to default column
(setq whitespace-line-column 1000) 

;; Enable soft-wrap
(global-visual-line-mode 1)

;; Maintain a list of recent files opened
(recentf-mode 1)            
(setq recentf-max-saved-items 50)

;; Move all the backup files to specific cache directory
;; This way you won't have annoying temporary files starting with ~(tilde) in each directory
;; Following setting will move temporary files to specific folders inside cache directory in EMACS_DIR

(setq user-cache-directory (concat "~/.emacs.d/" "cache"))

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
   '("2e05569868dc11a52b08926b4c1a27da77580daa9321773d92822f7a639956ce" "ff24d14f5f7d355f47d53fd016565ed128bf3af30eb7ce8cae307ee4fe7f3fd0" "5f128efd37c6a87cd4ad8e8b7f2afaba425425524a68133ac0efd87291d05874" "c83c095dd01cde64b631fb0fe5980587deec3834dc55144a6e78ff91ebc80b19" default))
 '(package-selected-packages
   '(clojure-quick-repls cider-eval-sexp-fu rainbow-identifiers winum rainbow-mode spaceline-all-the-icons all-the-icons-dired all-the-icons-ibuffer all-the-icons-ivy all-the-icons-ivy-rich all-the-icons-completion all-the-icons yasnippet helm-lsp projectile hydra company avy which-key helm-xref dap-mode centaur-tabs kaolin-themes helm-swoop lsp-java clojure-mode lsp-mode cider lsp-treemacs flycheck company rainbow-delimiters paredit syntax-subword parseedn jet mix elixir-mode dap-mode typescript-mode tree-sitter tree-sitter-langs lsp-ui)))
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
		;; insert-directory-program "~/.homebrew/bin/gls"
		dired-listing-switches "-aBhl --group-directories-first"))


(when (cl-find-if-not #'package-installed-p package-selected-packages)
  (package-refresh-contents)
  (mapc #'package-install package-selected-packages))

(require 'flycheck)
(global-flycheck-mode 1)

;; Org-mode issue with src block not expanding
;; This is a fix for bug in org-mode where <s TAB does not expand SRC block
(when (version<= "9.2" (org-version))
(require 'org-tempo))

;; Coding specific setting

;; Automatically add ending brackets and braces
(electric-pair-mode 1)

;; Make sure tab-width is 4 and not 8
(setq-default tab-width 4)

;; Highlight matching brackets and braces
(show-paren-mode 1)

(use-package doom-themes
:ensure t 
:init 
(load-theme 'doom-palenight t))

(use-package heaven-and-hell
  :ensure t
  :init
  (setq heaven-and-hell-theme-type 'dark)
  (setq heaven-and-hell-themes
        '((light . doom-acario-light)
          (dark . doom-palenight)))
  :hook (after-init . heaven-and-hell-init-hook)
  :bind (("C-c <f6>" . heaven-and-hell-load-default-theme)
         ("<f6>" . heaven-and-hell-toggle-theme)))

;;(add-to-list 'default-frame-alist '(font . "DejaVu Sans Mono-12"))

(defun my/ansi-colorize-buffer ()
(let ((buffer-read-only nil))
(ansi-color-apply-on-region (point-min) (point-max))))

(use-package ansi-color
:ensure t
:config
(add-hook 'compilation-filter-hook 'my/ansi-colorize-buffer))

(use-package use-package-chords
:ensure t
:init 
:config (key-chord-mode 1)
(setq key-chord-two-keys-delay 0.4)
(setq key-chord-one-key-delay 0.5) ; default 0.2
)


(load "~/.emacs.d/centaur-tabs.el")
(load "~/.emacs.d/treemacs.el")
(load "~/.emacs.d/helm.el")
(load "~/.emacs.d/treesitter.el")
(load "~/.emacs.d/lsp.el")
(load "~/.emacs.d/dap.el")
(load "~/.emacs.d/cmake.el")
(load "~/.emacs.d/java.el")
;;(load "~/.emacs.d/javascript.el")
(load "~/.emacs.d/scala.el")
(load "~/.emacs.d/golang.el")
(load "~/.emacs.d/python.el")
(load "~/.emacs.d/haskell.el")
(load "~/.emacs.d/cpp.el")
(load "~/.emacs.d/clojure.el")
(load "~/.emacs.d/tabnine.el")
(load "~/.emacs.d/java.el")
(load "~/.emacs.d/js.el")
;;(load "~/.emacs.d/elixir.el")
(load "~/.emacs.d/magit.el")
(load "~/.emacs.d/model-line.el")

(setq gc-cons-threshold (* 100 1024 1024)
      read-process-output-max (* 1024 1024)
      treemacs-space-between-root-nodes nil
      company-idle-delay 0.0
      company-minimum-prefix-length 1
      lsp-idle-delay 0.1)

(add-hook 'emacs-startup-hook 'treemacs)

(set-face-attribute 'default nil
                    :family "Monofurbold Nerd Font"
                    :height 160
                    :weight 'normal
                    :width 'normal)

(setq rainbow-delimiters-mode t)
(winum-mode t)

;;; (provide init)
;;; init.el ends here
(put 'upcase-region 'disabled nil)
