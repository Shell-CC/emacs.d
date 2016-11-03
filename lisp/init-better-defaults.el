(setq ring-bell-function 'ignore)

(global-linum-mode t)

(delete-selection-mode t)
(global-auto-revert-mode t)

(setq make-backup-files nil)
(setq auto-save-default nil)

;; recent files
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 10)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

(provide 'init-better-defaults)
