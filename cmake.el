;;; cmake.el --- setup cmake lsp for emacs
;;; commentary:
;;; code:

(use-package lsp-mode
  :ensure t)

(use-package cmake-mode
  :ensure t
  :mode ("CMakeLists\\.txt\\'" "\\.cmake\\'")
  :hook (cmake-mode . lsp-deferred))

(use-package cmake-font-lock
  :ensure t
  :after cmake-mode
  :config (cmake-font-lock-activate))

(provide 'cmake)
;;; cmake.el ends here
