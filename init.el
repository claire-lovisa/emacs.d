(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(custom-enabled-themes (quote (flatland)))
 '(custom-safe-themes
   (quote
    ("06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "82d2cac368ccdec2fcc7573f24c3f79654b78bf133096f9b40c20d97ec1d8016" "a2e7b508533d46b701ad3b055e7c708323fb110b6676a8be458a758dd8f24e27" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" default)))
 '(flycheck-color-mode-line-face-to-color (quote mode-line-buffer-id))
 '(package-selected-packages
   (quote
    (ace-mc flymake-json flatland-theme multiple-cursors less-css-mode magit ag grizzl projectile web-mode ace-jump-mode color-theme-sanityinc-tomorrow))))

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(when (< emacs-major-version 24)
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))

(when (string= system-type "darwin")
  (setq dired-use-ls-dired nil))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))
(package-install-selected-packages)

;(load-theme 'sanityinc-tomorrow-eighties)
(load-theme 'flatland)
(transient-mark-mode 1)
(global-linum-mode t)

(global-hl-line-mode 1)
(set-face-background 'hl-line "#414141")

(set-face-attribute 'region nil :background "#666")

(defalias 'yes-or-no-p 'y-or-n-p)

(electric-pair-mode t)
(push '(?\' . ?\') electric-pair-pairs)
(push '(?\| . ?\|) electric-pair-pairs)

(setq make-backup-files nil)
(setq auto-save-default nil)
(setq-default indent-tabs-mode nil)

(add-to-list 'load-path "/path/to/ag.el")
(require 'ag)

(require 'web-mode)
(setq css-indent-offset 2)
(setq js-indent-level 2)

(setq web-mode-markup-indent-offset 2)
(setq web-mode-code-indent-offset 2)

(add-to-list 'auto-mode-alist '("\\.jsx\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.js\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(setq web-mode-content-types-alist
  '(("jsx" . "\\.js[x]?\\'")))

(global-set-key (kbd "C-x g") 'magit-status)

(projectile-global-mode)
(setq projectile-completion-system 'grizzl)

(autoload
  'ace-jump-mode
  "ace-jump-mode"
  "Emacs quick move minor mode"
  t)

(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

(setq projectile-switch-project-action 'projectile-dired)

(global-set-key (kbd "M-p") 'ace-window)
(global-set-key (kbd "C-x p") 'ag-project)
(global-set-key (kbd "C-x b") 'projectile-switch-to-buffer)
(global-set-key (kbd "C-x g") 'magit-status)

(global-set-key (kbd "C-x ;") 'ace-mc-add-multiple-cursors)
(global-set-key (kbd "C-x j") 'ace-mc-add-single-cursor)

(global-set-key (kbd "C-c j v") 'flymake-json-load)
(global-set-key (kbd "C-u") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-j") 'mc/mark-next-like-this)
(global-set-key (kbd "C-x i") 'mc/mark-all-like-this)

(setq-default message-log-max nil)
(kill-buffer "*Messages*")

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
