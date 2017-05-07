(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" default)))
 '(package-selected-packages
   (quote
    (grizzl projectile web-mode ace-jump-mode color-theme-sanityinc-tomorrow))))

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(when (< emacs-major-version 24)
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))
(package-install-selected-packages)

(load-theme 'sanityinc-tomorrow-eighties)
(transient-mark-mode 1)
(global-linum-mode t)

(electric-pair-mode t)
(push '(?\' . ?\') electric-pair-pairs) 

(setq make-backup-files nil)
(setq auto-save-default nil)
(setq-default indent-tabs-mode nil)

(require 'web-mode)
(setq css-indent-offset 2)
(setq js-indent-level 2)
(setq web-mode-markup-indent-offset 2)
(setq web-mode-code-indent-offset 2)
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . web-mode))

(projectile-global-mode)
(setq projectile-completion-system 'grizzl)

(autoload
  'ace-jump-mode
  "ace-jump-mode"
  "Emacs quick move minor mode"
  t)

(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

(global-set-key (kbd "M-p") 'ace-window)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
