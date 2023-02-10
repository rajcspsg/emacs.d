
;; sample `helm' configuration use https://github.com/emacs-helm/helm/ for details
(helm-mode)

(use-package helm
:ensure t
:init 
(helm-mode 1)
(progn (setq helm-buffers-fuzzy-matching t))
:bind
(("C-c h" . helm-command-prefix))
(("M-x" . helm-M-x))
(("C-x C-f" . helm-find-files))
(("C-x b" . helm-buffers-list))
(("C-c b" . helm-bookmarks))
(("C-c f" . helm-recentf))   ;; Add new key to recentf
(("C-c g" . helm-grep-do-git-grep)))  ;; Search using grep in a git project

(use-package helm-descbinds
:ensure t
:bind ("C-h b" . helm-descbinds))



(use-package helm-swoop 
:ensure t
:chords
("js" . helm-swoop)
("jp" . helm-swoop-back-to-last-point)
:init
(bind-key "M-m" 'helm-swoop-from-isearch isearch-mode-map)

;; If you prefer fuzzy matching
(setq helm-swoop-use-fuzzy-match t)

;; Save buffer when helm-multi-swoop-edit complete
(setq helm-multi-swoop-edit-save t)

;; If this value is t, split window inside the current window
(setq helm-swoop-split-with-multiple-windows nil)

;; Split direction. 'split-window-vertically or 'split-window-horizontally
(setq helm-swoop-split-direction 'split-window-vertically)

;; If nil, you can slightly boost invoke speed in exchange for text color
(setq helm-swoop-speed-or-color nil)

;; ;; Go to the opposite side of line from the end or beginning of line
(setq helm-swoop-move-to-line-cycle t))

(require 'helm-xref)
(define-key global-map [remap find-file] #'helm-find-files)
(define-key global-map [remap execute-extended-command] #'helm-M-x)
(define-key global-map [remap switch-to-buffer] #'helm-mini)



(use-package lsp-ui
:ensure t
:after (lsp-mode)
:bind (:map lsp-ui-mode-map
         ([remap xref-find-definitions] . lsp-ui-peek-find-definitions)
         ([remap xref-find-references] . lsp-ui-peek-find-references))
:init (setq lsp-ui-doc-delay 1.5
      lsp-ui-doc-position 'bottom
	  lsp-ui-doc-max-width 100))

(use-package helm-lsp
:ensure t
:after (lsp-mode)
:commands (helm-lsp-workspace-symbol)
:init (define-key lsp-mode-map [remap xref-find-apropos] #'helm-lsp-workspace-symbol))

