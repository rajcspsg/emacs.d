;;; js.el --- setup javascript typescript lsp for emacs
;;; commentary:
;;; code:

(use-package typescript-mode
  :mode "\\.ts\\"
  :hook (typescript-mode . lsp-deferred)
  :config
  (setq typescript-indent-level 2))

(add-hook 'typescript-mode-hook 'lsp-deferred)
(add-hook 'javascript-mode-hook 'lsp-deferred)

(use-package dap-mode)
(require 'dap-node)

(defun my-setup-dap-node ()
  "Require dap-node feature and run dap-node-setup if VSCode module isn't already installed"
  (require 'dap-node)
  (unless (file-exists-p dap-node-debug-path) (dap-node-setup)))

(add-hook 'typescript-mode-hook 'my-setup-dap-node)
(add-hook 'javascript-mode-hook 'my-setup-dap-node)

(dap-node-setup)

;;(dap-debug-register-template "Node: Run"
;;							 (list :type "node"
;;								   :request "launch"
;;								   :program "${workspaceFolder}/index.ts"
;;								   :dap-compilation "npx tsc index.ts --outdir dist --sourceMap true"
;;								   :outFiles ["${workspaceFolder}/dist/**/*.js"]
;;								   :name "Debug Server"))

(provide 'js)
;;; js.el ends here
