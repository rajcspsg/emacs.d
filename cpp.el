;;; cpp.el --- set clangd lsp for c/c++
;;; commentary:
;;; code:

(which-key-mode)
(add-hook 'c-mode-hook 'lsp)
(add-hook 'c++-mode-hook 'lsp)


(with-eval-after-load 'lsp-mode
  (add-hook 'lsp-mode-hook #'lsp-enable-which-key-integration)
  (require 'dap-cpptools)
  (yas-global-mode))

(provide 'cpp)
;;; cpp.el ends here
