;; Using Melpa
(when (>= emacs-major-version 24)
  (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
  )
(require 'cl)
;; Add whatever packages you want here
(defvar xiaoxig/packages '(
			   company
			   monokai-theme
			   hungry-delete
			   swiper
			   counsel
			   smartparens
			   js2-mode
			   nodejs-repl
			   exec-path-from-shell
			   popwin
			   reveal-in-osx-finder
			   web-mode

			   ) "Default packages")

(setq package-selected-packages xiaoxig/packages)

(defun xiaoxig/packages-installed-p ()
  (loop for pkg in xiaoxig/packages
	when (not (package-installed-p pkg)) do (return nil)
	finally (return t)))

(unless (xiaoxig/packages-installed-p)
  (message "%s" "Refreshing packages database")
  (package-refresh-contents)
  (dolist (pkg xiaoxig/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))

;; config for company
(global-company-mode t)

;; Load monokai theme
(load-theme 'monokai t)

;; Hungry-delete mode
(require 'hungry-delete)
(global-hungry-delete-mode)

;; config for ivy, counsel, and swiper
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)

;; Parent
(smartparens-global-mode t)
(sp-local-pair '(emacs-lisp-mode lisp-interaction-mode) "'" nil :actions nil)

;; config for web
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode)
	 ("\\.html\\'" . web-mode))
       auto-mode-alist))
;; config for web-mode
(defun my-web-mode-indent-setup ()
  (setq web-mode-markup-indent-offset 2) ; web-mode, html tag in html file
  (setq web-mode-css-indent-offset 2)    ; web-mode, css in html file
  (setq web-mode-code-indent-offset 2)   ; web-mode, js code in html file
  )
(add-hook 'web-mode-hook 'my-web-mode-indent-setup)
(defun my-toggle-web-indent ()
  (interactive)
  ;; web development
  (if (or (eq major-mode 'js-mode) (eq major-mode 'js2-mode))
      (progn
        (setq js-indent-level (if (= js-indent-level 2) 4 2))
        (setq js2-basic-offset (if (= js2-basic-offset 2) 4 2))))
  (if (eq major-mode 'web-mode)
      (progn (setq web-mode-markup-indent-offset (if (= web-mode-markup-indent-offset 2) 4 2))
             (setq web-mode-css-indent-offset (if (= web-mode-css-indent-offset 2) 4 2))
             (setq web-mode-code-indent-offset (if (= web-mode-code-indent-offset 2) 4 2))))
  (if (eq major-mode 'css-mode)
      (setq css-indent-offset (if (= css-indent-offset 2) 4 2)))
  (setq indent-tabs-mode nil))

;; config for exec-path-from-shell
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

;; add popwin mode
(require 'popwin)
(popwin-mode t)

(provide 'init-packages)
