;; rename this file to init.el to use it
;; setup evil-mode:
;; cd ~/.emacs.d && git clone --depth 1 https://github.com/emacs-evil/evil.git

;;(require 'package)
;;(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;;(package-initialize)

(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

;; setting up and enabling evil-mode
(add-to-list 'load-path "~/.emacs.d/evil")
(require 'evil)
(evil-mode 1)

(load-theme 'wombat)

(setq inhibit-startup-message 't ;; skip welcome screen
      make-backup-files 'nil)    ;; don't create backup files
(setq-default tab-width '4)

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
