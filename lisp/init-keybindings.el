(global-set-key "\C-s" 'swiper)

(global-set-key "\C-x\ \C-r" 'recentf-open-files)

(global-set-key (kbd "C-c C-r") 'ivy-resume)

(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-h f") 'counsel-describe-function)
(global-set-key (kbd "C-h v") 'counsel-describe-variable)

(global-set-key (kbd "C-x TAB") 'indent-region-or-buffer)

(global-set-key (kbd "s-/") 'hippie-expand)

(global-set-key (kbd "C-c t i") 'my-toggle-web-indent)

(with-eval-after-load 'dired
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))

(provide 'init-keybindings)
