(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#26292c" "#ff4a52" "#40b83e" "#f6f080" "#afc4db" "#dc8cc3" "#93e0e3" "#f8f8f8"])
 '(custom-enabled-themes (quote (dracula)))
 '(custom-safe-themes
   (quote
    ("ff7625ad8aa2615eae96d6b4469fcc7d3d20b2e1ebc63b761a349bebbb9d23cb" "54472f6db535c18d72ca876a97ec4a575b5b51d7a3c1b384293b28f1708f961a" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "82d2cac368ccdec2fcc7573f24c3f79654b78bf133096f9b40c20d97ec1d8016" "a2e7b508533d46b701ad3b055e7c708323fb110b6676a8be458a758dd8f24e27" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" default)))
 '(fci-rule-color "#202325")
 '(flycheck-color-mode-line-face-to-color (quote mode-line-buffer-id))
 '(package-selected-packages
   (quote
    (git-gutter ace-mc flymake-json flatland-theme multiple-cursors less-css-mode magit ag grizzl projectile web-mode ace-jump-mode color-theme-sanityinc-tomorrow)))
 '(vc-annotate-background "#1f2124")
 '(vc-annotate-color-map
   (quote
    ((20 . "#ff0000")
     (40 . "#ff4a52")
     (60 . "#f6aa11")
     (80 . "#f1e94b")
     (100 . "#f5f080")
     (120 . "#f6f080")
     (140 . "#41a83e")
     (160 . "#40b83e")
     (180 . "#b6d877")
     (200 . "#b7d877")
     (220 . "#b8d977")
     (240 . "#b9d977")
     (260 . "#93e0e3")
     (280 . "#72aaca")
     (300 . "#8996a8")
     (320 . "#afc4db")
     (340 . "#cfe2f2")
     (360 . "#dc8cc3"))))
 '(vc-annotate-very-old-color "#dc8cc3"))

(let ((basedir "~/.emacs.d/themes/"))
      (dolist (f (directory-files basedir))
        (if (and (not (or (equal f ".") (equal f "..")))
                 (file-directory-p (concat basedir f)))
            (add-to-list 'custom-theme-load-path (concat basedir f)))))

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

(global-linum-mode t)
(setq linum-format "%4d \u2502 ")

;(load-theme 'sanityinc-tomorrow-eighties)
(load-theme 'flatland)
(transient-mark-mode 1)
(set-face-foreground 'linum "#9e9b98")

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

;(add-to-list 'load-path "/path/to/ag.el")
;(require 'ag)

;(require 'web-mode)
(setq css-indent-offset 2)
(setq js-indent-level 2)

(setq web-mode-markup-indent-offset 2)
(setq web-mode-code-indent-offset 2)

(add-to-list 'auto-mode-alist '("\\.jsx\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.js\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.php\\'" . web-mode))
(setq web-mode-content-types-alist
      '(("jsx" . "\\.js[x]?\\'")))

(global-git-gutter-mode +1)

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

(global-set-key (kbd "C-x i") 'mc/mark-all-like-this)
(global-set-key (kbd "C-x y") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-x u") 'mc/mark-next-like-this)

(global-set-key (kbd "M-j") 'backward-word)
(global-set-key (kbd "C-j") 'backward-char)

(setq-default message-log-max nil)
(kill-buffer "*Messages*")

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
