(setq use-package-always-ensure t)
(use-package dracula-theme)
(use-package projectile)
(use-package ivy
  :config
  (define-key ivy-minibuffer-map (kbd "<left>") 'counsel-up-directory)
  (define-key ivy-minibuffer-map (kbd "<right>") 'ivy-alt-done)
  (define-key ivy-minibuffer-map (kbd "M-v") 'yank))
;;  (ivy-set-sources 'ivy-switch-buffer '((original-source) 'counsel-file-jump)))
(use-package ivy-rich
  :config (ivy-rich-mode)
  )
(use-package counsel-projectile)
(use-package counsel)
(use-package smex)
(use-package smartscan)
(use-package web-mode)			
(use-package drag-stuff)
(use-package magit)
(use-package visual-fill-column)
(use-package multiple-cursors)

;; (use-package lsp-mode
;;   :config
;;   ;;(add-to-list 'lsp-language-id-configuration '(svelte-mode . "svelte"))
;;   ;; (lsp-register-client
;;   ;;  (make-lsp-client :new-connection (lsp-stdio-connection "svelteserver")
;;   ;;                   :major-modes '(svelte-mode)
;;   ;; 		    :priority 1
;;   ;;                   :server-id 'svelteserver))  
;;   :hook
;;   (web-mode . lsp)
;; ;;  (svelte-mode . lsp)
;;   :commands lsp)

;;optionally
;; (use-package bob
;;   :commands bob-mode
;;   :config
;;   (define-key bob-mode-map [remap xref-find-definitions] #'bob-peek-find-definitions)
;;   (define-key bob-mode-map [remap xref-find-references] #'bob-peek-find-references)
;;   (setq bob-peek-fontify 'always))

;;(use-package company-lsp :commands company-lsp)
;; (use-package helm-lsp :commands helm-lsp-workspace-symbol)
;; (use-package lsp-treemacs :commands lsp-treemacs-errors-list)
(use-package ivy-posframe
  :config
  (setq ivy-posframe-display-functions-alist
	'((swiper . ivy-posframe-display)
	  (t . ivy-posframe-display-at-frame-center)))
  
  (ivy-posframe-mode 1))

(use-package company-tabnine
  :ensure t
  :config
  (setq company-backends '(company-tabnine))
;; Trigger completion immediately.
  (setq company-idle-delay 0)

  ;; Number the candidates (use M-1, M-2 etc to select completions).
  (setq company-show-numbers t)

;; Use the tab-and-go frontend.
;; Allows TAB to select and complete at the same time.
  (company-tng-configure-default)
  (setq company-frontends
	'(company-tng-frontend
          company-pseudo-tooltip-frontend
          company-echo-metadata-frontend))
 )

(use-package company
  :config
  (setq company-backends '(company-tabnine company-emoji)))

