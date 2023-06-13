;;; java.el --- setup java lsp
;;; commentary:
;;; code:

(setq backup-directory-alist `(("." . ,(expand-file-name "backups" user-cache-directory)))
      url-history-file (expand-file-name "url/history" user-cache-directory)
      auto-save-list-file-prefix (expand-file-name "auto-save-list/.saves-" user-cache-directory)
      projectile-known-projects-file (expand-file-name "projectile-bookmarks.eld" user-cache-directory))


(use-package projectile 
:ensure t
:init (projectile-mode +1)
:config 
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map))

(use-package avy 
:ensure t
:chords
("jc" . avy-goto-char)
("jw" . avy-goto-word-1)
("jl" . avy-goto-line))

(use-package which-key 
:ensure t 
:init
(which-key-mode))

(use-package quickrun 
:ensure t
:bind ("C-c r" . quickrun)
;; ⇒ “C-c C-r” to see output, “q” to close output
  ;; ⇒ “C-u C-c C-r” prompts for a language (Useful when testing snippets different from current programming mode)
  ;; ⇒ In a non-programming buffer, “C-c C-r” runs selected region.
  :config (bind-key* "C-c C-r"
                     (lambda (&optional start end)
                       (interactive "r")
                       (if (use-region-p)
                           (quickrun-region start end)
                         (quickrun current-prefix-arg)))))


(use-package company :ensure t)

(use-package yasnippet :config (yas-global-mode))
(use-package yasnippet-snippets :ensure t)


(use-package dap-mode
  :ensure t
  :after (lsp-mode)
  :functions dap-hydra/nil
  :config
  ;; (require 'dap-java)
  :bind (:map lsp-mode-map
         ("<f5>" . dap-debug)
         ("M-<f5>" . dap-hydra))
  :hook ((dap-mode . dap-ui-mode)
    (dap-session-created . (lambda (&_rest) (dap-hydra)))
    (dap-terminated . (lambda (&_rest) (dap-hydra/nil)))))

;; (use-package dap-java :ensure t)

(use-package lsp-treemacs
  :after (lsp-mode treemacs)
  :ensure t
  :commands lsp-treemacs-errors-list
  :bind (:map lsp-mode-map
         ("M-9" . lsp-treemacs-errors-list)))

(use-package treemacs
  :ensure t
  :commands (treemacs)
  :after (lsp-mode))


(use-package lsp-java 
:ensure t
:config (add-hook 'java-mode-hook 'lsp))

(provide 'java)
;;; java.el ends here
