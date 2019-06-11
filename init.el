;;; init.el --- Spacemacs Initialization File
;;
;; Copyright (c) 2012-2017 Sylvain Benner & Contributors
;;
;; Author: Sylvain Benner <sylvain.benner@gmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;; Without this comment emacs25 adds (package-initialize) here
;; (package-initialize)

;; Increase gc-cons-threshold, depending on your system you may set it back to a
;; lower value in your dotfile (function `dotspacemacs/user-config')
(setq gc-cons-threshold 100000000)

(defconst spacemacs-version         "0.200.13" "Spacemacs version.")
(defconst spacemacs-emacs-min-version   "24.4" "Minimal version of Emacs.")

(if (not (version<= spacemacs-emacs-min-version emacs-version))
    (error (concat "Your version of Emacs (%s) is too old. "
                   "Spacemacs requires Emacs version %s or above.")
           emacs-version spacemacs-emacs-min-version)
  (load-file (concat (file-name-directory load-file-name)
                     "core/core-load-paths.el"))
  (require 'core-spacemacs)
  (spacemacs/init)
  (configuration-layer/sync)
  (spacemacs-buffer/display-startup-note)
  (spacemacs/setup-startup-hook)
  (require 'server)
  (unless (server-running-p) (server-start)))

;; Root directory
(setq default-directory "c:/Users/Administrator/test/emacs/")

;;
;; Set the ~/.emacs.d directory as the directory which is this file.

(setq user-emacs-directory "C:/users/administrator/appdata/roaming/.emacs.d")

;; Set load path
(add-to-list 'load-path "C:/users/administrator/appdata/roaming/.emacs.d/elpa")

;; below is set code for package install
;; 
;; magit 
(require 'magit)

;; Enable global company mode
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)
(setq company-idle-delay 0.1)
(setq company-minimum-prefix-length 1)
(setq company-backends '((company-capf company-files company-elisp company-cmake company-css company-yasnippet) (company-dabbrev company-dabbrev-code)))

;; Chinese support
(set-fontset-font "fontset-default"
                  'gb18030 '("Microsoft YaHei" . "unicode-bmp"))

;; org mode 9.2 更新了<s TAB按键快速添加src代码块的修改，如果依旧需要用此功能需要添加如下语句
(require 'org-tempo)

;; global-set-key
(global-set-key (kbd "C-x g") 'magit-status)

;; global-set-key
(global-set-key (kbd "C-x p") 'git-auto-commit-mode)

;; set up default hotkeys for evilnc
;;
;; evil-nerd-commenter
(evilnc-default-hotkeys)

;; enable flycheck mode
;; 
(add-hook 'after-init-hook #'global-flycheck-mode)

;; set global-linum-mode
;; 
(add-hook 'prog-mode-hook 'linum-mode)

;; global-set-key
;;
;; set linum-mode
(global-set-key (kbd "C-x t") 'linum-mode)

;;;;;;; Package Repositories ;;;;;;;;;;;;;;

(message user-init-file)

(require 'package)

(setq package-archives '(
                         ("melpa" . "http://melpa.milkbox.net/packages/")
                         ("org" . "http://orgmode.org/elpa/")
                         ("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" .  "http://marmalade-repo.org/packages/")
                         ))

;; (package-refresh-contents)
(package-initialize)

(provide 'init)
;;; init.el ends here
