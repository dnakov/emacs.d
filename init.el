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
(require 'diminish)
(require 'bind-key)
(load "~/.emacs.d/functions.el")
(load "~/.emacs.d/packages.el")
(setq sml/no-confirm-load-theme t)
(sml/setup)
(load-theme 'dracula t)
;;(load-theme 'airline-doom-one t)
(global-linum-mode +1)
(setq linum-format " %d ")
(global-undo-tree-mode)
(delete-selection-mode)
(global-smartscan-mode)
(drag-stuff-global-mode 1)
(desktop-save-mode 1)
(setq desktop-restore-eager 2)
(ivy-mode 1)
;;(counsel-projectile-on)
(global-linum-mode +1)

(setq yas-snippet-dirs '("~/.emacs.d/snippets"))

(yas-global-mode 1)
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq projectile-require-project-root nil)
(setq projectile-enable-caching t)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
(setq x-select-enable-clipboard t)
(setq x-select-enable-primary nil)
(setq tab-width 2)
(setq indent-tabs-mode nil)
(setq js2-indent-level 2)
(setq css-indent-offset 2)
(setq web-mode-code-indent-offset 2)
(setq web-mode-css-indent-offset 2)
(setq web-mode-attr-indent-offset 2)
(setq web-mode-markup-indent-offset 2)
(ivy-set-display-transformer 'ivy-switch-buffer 'ivy-rich-switch-buffer-transformer)
(bind-key* "M-p" 'ivy-switch-buffer)
(bind-key* "C-p" 'counsel-projectile-find-file)
(bind-key* "M-r" 'counsel-imenu)
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

(defun my--is-file-large ()
  "If buffer too large and my cause performance issue."
  (< large-file-warning-threshold (buffer-size)))

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
 '(custom-safe-themes
   (quote
    ("3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" default)))
 '(drag-stuff-global-mode t)
 '(package-selected-packages
   (quote
    (yasnippet sr-speedbar prettier-js visual-fill-column coffee-mode markdown-mode+ markdown-mode emmet-mode multiple-cursors magit json-mode yaml-mode drag-stuff use-package undo-tree smartscan slack php-mode ivy-rich dracula-theme counsel-projectile))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Hack" :foundry "nil" :slant normal :weight normal :height 120 :width normal)))))
