;;; clojure.el --- setup clojure lsp for emacs
;;; commentary:
;;; code:


(setq show-paren-delay  0)
(setq show-paren-style 'mixed)
(show-paren-mode)

(use-package rainbow-delimiters
  :disabled
  :hook ((org-mode prog-mode text-mode) . rainbow-delimiters-mode))

(electric-pair-mode 1)

;; The ‘<’ and ‘>’ are not ‘parenthesis’, so give them no compleition.
(setq electric-pair-inhibit-predicate
      (lambda (c)
        (or (member c '(?< ?> ?~)) (electric-pair-default-inhibit c))))

;; Treat ‘<’ and ‘>’ as if they were words, instead of ‘parenthesis’.
(modify-syntax-entry ?< "w<")
(modify-syntax-entry ?> "w>")

(setq electric-pair-pairs
         '((?~ . ?~)
           (?* . ?*)
           (?/ . ?/)))

;; Let's also, for example, avoid obtaining double ‘~’ and ‘/’ when searching for a file.

;; Disable pairs when entering minibuffer
(add-hook 'minibuffer-setup-hook (lambda () (electric-pair-mode 0)))

;; Renable pairs when existing minibuffer
(add-hook 'minibuffer-exit-hook (lambda () (electric-pair-mode 1)))


(use-package clojure-mode
  :ensure t
  :hook (subword-mode paredit-mode lsp))


(use-package lsp-mode
  :ensure t
  :hook ((clojure-mode . lsp)
		 (clojurec-mode . lsp)
		 (clojurescript-mode . lsp))
  :config
  (setenv "PATH" (concat
				  "/usr/local/bin" path-separator
				  (getenv "PATH")))
  (dolist (m '(clojure-mode
			   clojurec-mode
			   clojurescript-mode
			   clojurex-mode))
	(add-to-list 'lsp-language-id-configuration `(,m . "clojure"))))

(add-hook 'clojure-mode-hook 'rainbow-delimiters-mode)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)


(use-package cider
  :ensure t
  :bind
    (("C-c u" . cider-user-ns))
    (("C-M-r" . cider-refresh))
  :config
  (setq cider-show-error-buffer t)
  (setq cider-auto-select-error-buffer t)
  (setq cider-repl-history-file "~/.emacs.d/cider-history")
  (setq cider-repl-pop-to-buffer-on-connect t)
  (setq cider-repl-wrap-history t))

(add-hook 'cider-repl-mode-hook #'company-mode)
(add-hook 'cider-mode-hook #'company-mode)
(add-to-list 'completion-category-defaults '(cider (styles basic)))


(use-package clj-refactor
  :ensure t)

(defun my-clojure-mode-hook ()
    (clj-refactor-mode 1)
    (yas-minor-mode 1) ; for adding require/use/import statements
    ;; This choice of keybinding leaves cider-macroexpand-1 unbound
    (cljr-add-keybindings-with-prefix "C-c C-m"))

(add-hook 'clojure-mode-hook #'my-clojure-mode-hook)


(use-package cider-hydra
  :ensure t
  :hook (clojure-mode))

(add-hook 'clojure-mode-hook #'cider-hydra-mode)

;; Use clojure mode for other extensions
(add-to-list 'auto-mode-alist '("\\.boot$" . clojure-mode))
(add-to-list 'auto-mode-alist '("\\.cljs.*$" . clojure-mode))
(add-to-list 'auto-mode-alist '("lein-env" . enh-ruby-mode))

;; these help me out with the way I usually develop web apps
(defun cider-start-http-server ()
  (interactive)
  (cider-load-buffer)
  (let ((ns (cider-current-ns)))
    (cider-repl-set-ns ns)
    (cider-interactive-eval (format "(println '(def server (%s/start))) (println 'server)" ns))
    (cider-interactive-eval (format "(def server (%s/start)) (println server)" ns))))

(defun cider-refresh ()
  (interactive)
  (cider-interactive-eval (format "(user/reset)")))

(defun cider-user-ns ()
  (interactive)
  (cider-repl-set-ns "user"))

(provide 'clojure)
;;; clojure.el ends here
