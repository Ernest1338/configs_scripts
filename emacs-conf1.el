;; rename this file to init.el to use it (file system path: ~/.emacs.d/init.el or ~/.config/emacs/init.el)
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

;; Display line numbers in every buffer
;;(global-display-line-numbers-mode 1)

(toggle-frame-maximized)

(load "~/.emacs.d/basic-rust-mode.el")
