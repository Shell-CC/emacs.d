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

;; config for js
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       auto-mode-alist))

;; config for exec-path-from-shell
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

;; add popwin mode
(require 'popwin)
(popwin-mode t)

(provide 'init-packages)
