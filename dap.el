(require 'dap-mode)
(require 'dap-node)

;; Enabling only some features
(setq dap-auto-configure-features '(sessions locals controls tooltip))

(dap-mode 1)

;; The modes below are optional
(dap-ui-mode 1)

;; enables mouse hover support
(dap-tooltip-mode 1)

;; use tooltips for mouse hover
;; if it is not enabled `dap-mode' will use the minibuffer.
(tooltip-mode 1)

;; displays floating panel with debug buttons
;; requies emacs 26+
(dap-ui-controls-mode 1)

