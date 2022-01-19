(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
;; M-x package-install RET evil-mode RET
(evil-mode 1)
(load-theme 'wombat)
(setq initial-buffer-choice t)
(setq-default tab-width 4)
(setq make-backup-files nil)
(toggle-frame-maximized)
(load "~/.emacs.d/basic-rust-mode.el")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(evil-visual-mark-mode ##)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
