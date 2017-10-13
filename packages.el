(setq use-package-always-ensure t)
(use-package dracula-theme)
(use-package projectile)
(use-package ivy
  :config
  (define-key ivy-minibuffer-map (kbd "<left>") 'counsel-up-directory)
  (define-key ivy-minibuffer-map (kbd "<right>") 'ivy-alt-done))
;;  (ivy-set-sources 'ivy-switch-buffer '((original-source) 'counsel-file-jump)))
(use-package ivy-rich)
(use-package counsel-projectile)
(use-package counsel)
(use-package smartscan)
(use-package powerline)
(use-package airline-themes)
(use-package rjsx-mode
  :mode ("\\.js\\'" . rjsx-mode)
  :config
  (setq js2-strict-missing-semi-warning nil)
  (setq js-indent-level 2)
  (setq js2-missing-semi-one-line-override nil))
(use-package drag-stuff)
(use-package magit)
