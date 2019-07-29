(setq exec-path (append exec-path '("/usr/local/bin")))
(setq mac-command-modifier 'meta)
(setq mac-option-modifier 'alt)
(setq default-directory "~/dev/")
(require 'package)
(require 'gnutls)
(add-to-list 'gnutls-trustfiles
             (expand-file-name
              "./comodo.rsa.ca.intermediate.crt"))
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
;;(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(global-visual-fill-column-mode)
(eval-when-compile
  (require 'use-package))
(require 'bind-key)
(load "~/.emacs.d/functions.el")
(load "~/.emacs.d/packages.el")
(setq sml/no-confirm-load-theme t)
(setq sml/theme 'respectful)
(sml/setup)
(savehist-mode 1)
(load-theme 'base16-material-darker t)
;;(load-theme 'airline-doom-one t)
;;(global-display-line-numbers-mode 1)
(setq linum-format " %d ")
(setq column-number-mode t)
(global-undo-tree-mode)
(delete-selection-mode)
(global-smartscan-mode)
(drag-stuff-global-mode 1)
(desktop-save-mode 1)
(setq desktop-restore-eager 2)
(ivy-mode 1)
(if (version< "27.0" emacs-version)
           (set-fontset-font
            "fontset-default" 'unicode "Apple Color Emoji" nil 'prepend)
         (set-fontset-font
          t 'symbol (font-spec :family "Apple Color Emoji") nil 'prepend))
;;(counsel-projectile-on)
(setq tooltip-use-echo-area t)
(setq yas-snippet-dirs '("~/.emacs.d/snippets"))
;; (defun setup-tide-mode ()
;;   (interactive)
;;   (tide-setup)
;;   (flycheck-mode +1)
;;   (setq flycheck-check-syntax-automatically '(save mode-enabled))
;;   (eldoc-mode +1)
;;   (tide-hl-identifier-mode +1)
;;   ;; company is an optional dependency. You have to
;;   ;; install it separately via package-install
;;   ;; `M-x package-install [ret] company`
;;   (company-mode +1))

;; aligns annotation to the right hand side
(setq company-tooltip-align-annotations t)
(add-to-list 'auto-mode-alist '("\\.js\\'" . web-mode))
(defun my-web-mode-hook ()  
  (setq web-mode-code-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-attr-indent-offset 2)
  (setq indent-tabs-mode nil)
  (setq web-mode-markup-indent-offset 2))
(add-hook 'web-mode-hook 'my-web-mode-hook)
(setq web-mode-content-types-alist
      '(("jsx" . "\\.js[x]?\\'")))
;;(add-hook 'web-mode-hook #'setup-tide-mode)

(defun kill-whitespace-or-word ()
  (interactive)
  (if (looking-back "[ \t\n]")
      (let ((p (point)))
        (re-search-backward "[^ \t\n]" nil :no-error)
        (forward-char)
        (kill-region p (point)))
    (kill-word 1)))

(defun back-word ()
  (interactive)
  (forward-whitespace -1)
;;  (re-search-backward "[ \t\n]" nil :no-error)
;;  (forward-char)
  )
;; 
(yas-global-mode 1)
(show-paren-mode)
;;(add-hook 'typescript-mode-hook #'setup-tide-mode)
;; native line numbers
;; (setq-default display-line-numbers 'visual
;;               display-line-numbers-current-absolute t
;;               display-line-numbers-width 1
;;               display-line-numbers-widen t)
;; (set-face-attribute 'line-number nil
;; 		    :foreground "#565761"
;; 		    :background "#282a36")
;; (set-face-attribute 'line-number-current-line nil
;; 		    :background "#565761"
;; 		    :foreground "#282a36")
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq projectile-require-project-root nil)
(setq projectile-enable-caching t)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers nil)
(setq x-select-enable-clipboard t)
(setq x-select-enable-primary nil)
(setq tab-width 2)
(setq js2-indent-level 2)
(setq typescript-indent-level 2)
(setq css-indent-offset 2)

'(ivy-set-display-transformer 'ivy-switch-buffer 'ivy-rich-switch-buffer-transformer)
(bind-key* "M-p" 'ivy-switch-buffer)
(bind-key* "C-p" 'counsel-projectile-find-file)
(bind-key* "M-r" 'counsel-imenu)
(bind-key* "M-x" 'counsel-M-x)
(global-set-key (kbd "C-M-\\") #'er-indent-region-or-buffer)
(global-set-key (kbd "M-d") 'mc/mark-next-like-this)
(global-set-key (kbd "M-s") 'save-buffer)
(global-set-key (kbd "M-c") 'clipboard-kill-ring-save)
(global-set-key (kbd "M-v") 'clipboard-yank)
(global-set-key (kbd "M-z") 'undo-tree-undo)
(global-set-key (kbd "M-Z") 'undo-tree-redo)
(global-set-key (kbd "M-v") 'yank)
(global-set-key (kbd "<A-backspace>") 'my-backward-delete-word)
(global-set-key (kbd "<M-backspace>") 'my-delete-line-backward)
(global-set-key (kbd "<M-S-backspace>") 'my-delete-line)
(global-set-key (kbd "<M-left>") 'beginning-of-line)
(global-set-key (kbd "<M-right>") 'end-of-line)
(global-set-key (kbd "<A-left>") 'backward-word) 
(global-set-key (kbd "<A-right>") 'forward-word)
(global-set-key (kbd "<A-down>") 'smartscan-symbol-go-forward)
(global-set-key (kbd "<A-up>") 'smartscan-symbol-go-backward)
(bind-key* "<M-S-up>" 'drag-stuff-up)
(bind-key* "<M-S-down>" 'drag-stuff-down)
(bind-key* "<M-up>" 'beginning-of-buffer)
(bind-key* "<M-down>" 'end-of-buffer)
(bind-key* "M-a" 'mark-whole-buffer)
(bind-key* "M-w" 'kill-this-buffer)
(bind-key* "<escape>" 'keyboard-escape-quit)
(bind-key* "M-f" 'swiper)
(bind-key* "M-F" 'counsel-projectile-ag)
(setq show-paren-style 'mixed)
(setq powerline-utf-8-separator-left        #xe0b0
      powerline-utf-8-separator-right       #xe0b2
      airline-utf-glyph-separator-left      #xe0b0
      airline-utf-glyph-separator-right     #xe0b2
      airline-utf-glyph-subseparator-left   #xe0b1
      airline-utf-glyph-subseparator-right  #xe0b3
      airline-utf-glyph-branch              #xe0a0
      airline-utf-glyph-readonly            #xe0a2
      airline-utf-glyph-linenumber          #xe0a1)
(setq magit-display-buffer-function
      (lambda (buffer)
        (display-buffer
         buffer
         (cond ((and (derived-mode-p 'magit-mode)
                     (eq (with-current-buffer buffer major-mode)
                         'magit-status-mode))
                nil)
               ((memq (with-current-buffer buffer major-mode)
                      '(magit-process-mode
                        magit-revision-mode
                        magit-diff-mode
                        magit-stash-mode))
                nil)
               (t
                '(display-buffer-same-window))))))
(setq line-number-display-limit large-file-warning-threshold)
(setq line-number-display-limit-width 200)
(server-start)
(defun my--is-file-large ()
  "If buffer too large and my cause performance issue."
  (< large-file-warning-threshold (buffer-size)))
(defun er-indent-buffer ()
  "Indent the currently visited buffer."
  (interactive)
  (indent-region (point-min) (point-max)))

(defun er-indent-region-or-buffer ()
  "Indent a region if selected, otherwise the whole buffer."
  (interactive)
  (save-excursion
    (if (region-active-p)
        (progn
          (indent-region (region-beginning) (region-end))
          (message "Indented selected region."))
      (progn
        (er-indent-buffer)
        (message "Indented buffer.")))))
(define-derived-mode my-large-file-mode fundamental-mode "LargeFile"
  "Fixes performance issues in Emacs for large files."
  ;; (setq buffer-read-only t)
  (setq bidi-display-reordering nil)
  (jit-lock-mode nil)
  (buffer-disable-undo)
  (set (make-variable-buffer-local 'global-hl-line-mode) nil)
  (set (make-variable-buffer-local 'line-number-mode) nil)
  (set (make-variable-buffer-local 'column-number-mode) nil) )

(add-to-list 'magic-mode-alist (cons #'my--is-file-large #'my-large-file-mode))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(drag-stuff-global-mode t)
 '(fringe-mode '(4 . 4) nil (fringe))
 '(js-indent-level 2)
 '(lsp-ui-sideline-ignore-duplicate t)
 '(lsp-ui-sideline-show-hover t)
 '(lsp-ui-sideline-show-symbol t)
 '(package-selected-packages
   '(company-tabnine ivy-posframe js-import base16-theme seti-theme atom-one-dark-theme night-owl-theme lsp-mode company-emoji smart-mode-line-atom-one-dark-theme graphql-mode restclient yafolding edbi sqlup-mode slime nodejs-repl smart-mode-line stylus-mode jade-mode pug-mode rust-mode web-mode company auto-complete yasnippet sr-speedbar prettier-js visual-fill-column coffee-mode markdown-mode+ markdown-mode emmet-mode multiple-cursors magit json-mode yaml-mode drag-stuff use-package undo-tree smartscan slack php-mode ivy-rich dracula-theme counsel-projectile))
 '(show-paren-mode t)
 '(tooltip-mode nil)
 '(web-mode-code-indent-offset 2)
 '(web-mode-css-indent-offset 2)
 '(web-mode-markup-indent-offset 2)
 '(web-mode-sql-indent-offset 2))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Hack" :foundry "nil" :slant normal :weight normal :height 120 :width normal))))
 '(ivy-posframe ((t (:inherit default :background "#44475a"))))
 '(ivy-posframe-border ((t (:inherit default :background "gray50"))))
 '(lsp-ui-peek-header ((t (:background "#44475a" :foreground "white"))))
 '(lsp-ui-peek-highlight ((t (:background "#ffb86c" :distant-foreground "black" :foreground "black" :box (:line-width -1 :color "#ffb86c" :style pressed-button)))))
 '(lsp-ui-peek-list ((t (:background "black"))))
 '(lsp-ui-sideline-symbol ((t (:foreground "grey" :box (:line-width -1 :color "grey") :height 0.99)))))
(put 'narrow-to-region 'disabled nil)
