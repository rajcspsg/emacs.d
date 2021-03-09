(setenv "PATH" (concat (getenv "HOME") "/.ghcup/bin:" (getenv "HOME") "/.local/bin:" "/usr/local/bin:" (getenv "PATH")))

(setq exec-path
      (reverse
       (append
        (reverse exec-path)
        (list (concat (getenv "HOME") "/.ghcup/bin" (getenv "HOME") "/.local/bin")  "/usr/local/bin" ))))

(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode t))

(use-package yasnippet
  :ensure t)

(use-package lsp-mode
  :ensure t
  :hook (haskell-mode . lsp)
  :commands lsp)

(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode)

(use-package lsp-haskell
  :ensure t
  :config
;;  :mode ("\\.cabal\\" "\\.hs\\")
 (setq lsp-haskell-server-path "haskell-language-server-wrapper")
 (setq lsp-haskell-server-args ())
   ;; Comment/uncomment this line to see interactions between lsp client/server.
 (setq lsp-log-io t))

(add-hook 'haskell-mode-hook #'lsp)
(add-hook 'haskell-literate-mode-hook #'lsp)
