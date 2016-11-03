
;; Using Melpa
(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
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

;; config for exec-path-from-shell
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

;; Load monokai theme
(load-theme 'monokai t)

(tool-bar-mode -1)
(scroll-bar-mode -1)

(global-linum-mode t)
(global-company-mode t)
(global-hl-line-mode t)
(delete-selection-mode t)
(global-auto-revert-mode t)

(defun open-my-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(setq-default cursor-type 'bar)
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq inhibit-splash-screen t)

;; recent files
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 10)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;; Full-screen
(setq initial-frame-alist (quote ((fullscreen . maximized))))

;; Parent
(require 'smartparens)
;;(add-hook 'emacs-lisp-mode-hook 'smartparens-mode)
(smartparens-global-mode t)

;; Hungry-delete mode
(require 'hungry-delete)
(global-hungry-delete-mode)

;; config for ivy, counsel, and swiper
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-h f") 'counsel-describe-function)
(global-set-key (kbd "C-h v") 'counsel-describe-variable)

;; config for js
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       auto-mode-alist))



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-idle-delay 0.1)
 '(custom-safe-themes
   (quote
    ("a800120841da457aa2f86b98fb9fd8df8ba682cebde033d7dbf8077c1b7d677a" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(js2-external-variable ((t (:foreground "dark gray")))))

