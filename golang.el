;;; golang.el --- setup golang lsp for emacs
;;; commentary:
;;; code:

(use-package go-mode
  :mode "\\.go\\'"
  :hook (before-save . gofmt-before-save))

(require 'flycheck)
(global-flycheck-mode 1)


(add-hook 'before-save-hook 'gofmt-before-save)

(use-package lsp-mode
  :defer t
  :commands (lsp lsp-deferred)
  :hook (go-mode . lsp-deferred)
  :init
  (setq lsp-auto-guess-root t)       ; Detect project root
  ;; disable Yasnippet
  (setq lsp-enable-snippet nil)
  (setq lsp-prefer-flymake nil)      ; Use lsp-ui and flycheck
  (setq flymake-fringe-indicator-position 'right-fringe))

(use-package flycheck-golangci-lint
  :ensure t)

(use-package dap-mode
  :config
  (dap-mode 1)
  (setq dap-print-io t)
  ;;(setq fit-window-to-buffer-horizontally t)
  ;;(setq window-resize-pixelwise t)
  (require 'dap-hydra)
  (require 'dap-go)
  (dap-go-setup)
  (use-package dap-ui
    :ensure nil
    :config
    (dap-ui-mode 1)))

(defun lsp-go-install-save-hooks ()
  (add-hook 'before-save-hook #'lsp-format-buffer t t)
  (add-hook 'before-save-hook #'lsp-organize-imports t t))

(add-hook 'go-mode-hook #'lsp-go-install-save-hooks)

(provide 'golang)
;;; golang.el ends here
