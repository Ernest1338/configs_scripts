;; Rename this file to init.el to use it (file system path: ~/.emacs.d/init.el or ~/.config/emacs/init.el (adjust paths elsewere))
;; Setup evil-mode and rust mode:
;; cd ~/.emacs.d && git clone --depth 1 https://github.com/emacs-evil/evil.git && git clone https://github.com/rust-lang/rust-mode.git

;;(require 'package)
;;(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;;(package-initialize)

;; Disable the tool bar, menu bar and the scroll bar
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

;; Revert buffers when the underlying file has changed
(global-auto-revert-mode 1)

;; Setting up and enabling evil-mode
(add-to-list 'load-path "~/.emacs.d/evil")
(require 'evil)
(evil-mode 1)

;; Setting up and enabling rust-mode
(add-to-list 'load-path "~/.emacs.d/rust-mode")
(autoload 'rust-mode "rust-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-mode))

;; Setting up the theme
(load-theme 'wombat)

(setq inhibit-startup-message 't ;; skip welcome screen
      make-backup-files 'nil)    ;; don't create backup files
(setq-default indent-tabs-mode 'nil ;; use spaces instead of tabs for indentation
              tab-width '4)         ;; tab width -> 4

;; Start with maximized window
(toggle-frame-maximized)

;; Display line numbers in every buffer
;;(global-display-line-numbers-mode 1)

;; Enable my basic-rust-mode
;;(load "~/.emacs.d/basic-rust-mode.el")
