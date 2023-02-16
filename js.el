;;; js.el --- setup javascript typescript lsp for emacs
;;; commentary:
;;; code:

(use-package typescript-mode
  :mode "\\.ts\\"
  :hook (typescript-mode . lsp-deferred)
  :config
  (setq typescript-indent-level 2))

(use-package dap-mode)
(use-package 'dap-node)

;; (dap-node-setup)

;;(dap-debug-register-template "Node: Run"
;;							 (list :type "node"
;;								   :request "launch"
;;								   :program "${workspaceFolder}/src/server/index.ts"
;;								   :outFiles ["${workspaceFolder}/public/src/server/**/*.js"]
;;								   :name "Debug Server"))

(provide 'js)
;;; js.el ends here
