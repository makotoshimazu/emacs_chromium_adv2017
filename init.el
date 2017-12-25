;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)

;; == Basic settings ==
;; Remove tool bar
(tool-bar-mode 0)
;; Remove menu bar
(menu-bar-mode 0)
;; Use y/n instead of yes/no
(fset 'yes-or-no-p 'y-or-n-p)
;; No *.~ files
(setq make-backup-files nil)
;; No .#* files
(setq auto-save-default nil)
;; Use C-h as backspace
(keyboard-translate ?\C-h ?\C-?)
;; Highlight relevant parenthesis
(show-paren-mode t)
;; Show underline
(setq hl-line-face 'underline)
(global-hl-line-mode)
;; Share clipboard with X
(setq x-select-enable-clipboard t)
;; Highlight the target words
(setq search-highlight t)
(setq query-replace-highlight t)
;; Kill whole line including newline by one C-k
(setq kill-whole-line t)

;; == company ==
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)
(setq company-idle-delay 0.1)
(setq company-minimum-prefix-length 2)

;; == flycheck ==
(add-hook 'after-init-hook #'global-flycheck-mode)
(define-key global-map (kbd "C-M-P") 'flycheck-previous-error)
(define-key global-map (kbd "C-M-N") 'flycheck-next-error)

;; == irony ==
(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
(add-hook 'irony-mode-hook 'company-irony-setup-begin-commands)
(add-to-list 'company-backends 'company-irony)
(eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook #'flycheck-irony-setup))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (flycheck flycheck-irony company-irony irony company))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
