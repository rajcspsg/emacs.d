;;; clojure.el --- setup clojure lsp for emacs
;;; commentary:
;;; code:

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


(provide 'clojure)
;;; clojure.el ends here
