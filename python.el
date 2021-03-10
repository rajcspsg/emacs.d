(use-package python-mode
  :ensure nil
  :custom
  (python-shell-interpreter "python3"))

(use-package lsp-mode
  :defer t
  :commands (lsp lsp-deferred)
  :hook (python-mode . lsp-deferred)
  )
