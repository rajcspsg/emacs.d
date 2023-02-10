;; Bottom of Emacs will show what branch you're on
;; and whether the local file is modified or not.
(use-package magit
  :init (require 'magit-files)
  :bind (("C-c M-g" . magit-file-dispatch))
  :custom ;; Do not ask about this variable when cloning.
  (magit-clone-set-remote.pushDefault t))

;; When we invoke magit-status, show green/red the altered lines, with extra
;; green/red on the subparts of a line that got alerted.
;;(system-packages-ensure "git-delta")

(use-package magit-delta
  :ensure t
  :hook (magit-mode . magit-delta-mode))


;; MA: The todo keywords work in code too!
(use-package magit-todos
  :after magit
  :after hl-todo
  ;; :hook (org-mode . magit-todos-mode)
  :config
  ;; For some reason cannot use :custom with this package.
  (custom-set-variables
    '(magit-todos-keywords (list "TODO" "FIXME" "MA" "WK" "JC")))
  ;; Ignore TODOs mentioned in exported HTML files; they're duplicated from org src.
  (setq magit-todos-exclude-globs '("*.html"))
  (magit-todos-mode))
