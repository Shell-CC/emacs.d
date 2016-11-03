(tool-bar-mode -1)
(scroll-bar-mode -1)

(global-hl-line-mode t)

(setq inhibit-splash-screen t)
(setq-default cursor-type 'bar)

;; Full-screen
(setq initial-frame-alist (quote ((fullscreen . maximized))))

(provide 'init-ui)
