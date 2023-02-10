;;; lsp.el --- setup common lsp config here
;;; commentary:
;;; code:

(use-package lsp-mode
  :ensure t)

(use-package yasnippet
  :ensure t)

(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode)


(use-package lsp-mode
:ensure t
:hook (
   (lsp-mode . lsp-enable-which-key-integration)
   (java-mode . #'lsp-deferred))
:init (setq
    lsp-keymap-prefix "C-c l"              ; this is for which-key integration documentation, need to use lsp-mode-map
    lsp-enable-file-watchers nil
    read-process-output-max (* 1024 1024)  ; 1 mb
    lsp-completion-provider :capf
    lsp-idle-delay 0.500)
:config
    (setq lsp-intelephense-multi-root nil) ; don't scan unnecessary projects
    (with-eval-after-load 'lsp-intelephense
    (setf (lsp--client-multi-root (gethash 'iph lsp-clients)) nil))
	(define-key lsp-mode-map (kbd "C-c l") lsp-command-map))

;; Enable nice rendering of documentation on hover
;;   Warning: on some systems this package can reduce your emacs responsiveness significally. 
;;   (See: https://emacs-lsp.github.io/lsp-mode/page/performance/)
;;   In that case you have to not only disable this but also remove from the packages since
;;   lsp-mode can activate it automatically.
(use-package lsp-ui)

;; lsp-mode supports snippets, but in order for them to work you need to use yasnippet
;; If you don't want to use snippets set lsp-enable-snippet to nil in your lsp-mode settings
;;   to avoid odd behavior with snippets and indentation
(use-package yasnippet)

;; Add company-lsp backend for metals.
;;   (depending on your lsp-mode version it may be outdated see:
;;    https://github.com/emacs-lsp/lsp-mode/pull/1983)
;;(use-package company-lsp)

;; Use the Debug Adapter Protocol for running tests and debugging
;; Posframe is a pop-up tool that must be manually installed for dap-mode
(use-package posframe)

(use-package lsp-ivy
  :ensure t)

(use-package lsp-treemacs
  :ensure t
  :bind (("M-<f7>" . lsp-find-references)))

(use-package dap-mode
  :hook
  (lsp-mode . dap-mode)
  (lsp-mode . dap-ui-mode))


(provide 'lsp.el)
;;; lsp.el ends here
