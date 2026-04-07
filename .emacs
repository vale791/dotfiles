(setq custom-file "~/.emacs.custom")
(load custom-file)

(setq-default tab-width 4)
(setq indent-tabs-mode nil)

(setq c-default-style "k&r"
	  c-basic-offset 2)

(add-hook 'cmake-mode-hook 'cmake-font-lock-mode)

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)


					; disable the startup screen
(setq inhibit-startup-message t)

					; font
(add-to-list 'default-frame-alist `(font . "Monocraft")) ; change to Iosevka-20 for Iosevka

(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))
(add-hook 'compilation-filter-hook 'ansi-color-compilation-filter)

(defun exit-and-open-kitty ()
	(interactive)
	(call-process
	 "sh" nil 0 nil "-c"
	 (format "kitty -d %s &" (shell-quote-argument default-directory)))
	(save-buffers-kill-terminal))

;(global-set-key (kbd "C-x C-c") 'exit-and-open-kitty)

					; golang syntax highlighting
(add-to-list 'load-path "/home/itamar/.emacs.d/elpa/go-mode-1.6.0")
(autoload 'go-mode "go-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.go\\'" . go-mode))

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode 0)
(global-display-line-numbers-mode)
