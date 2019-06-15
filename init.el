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

;; 设置默认文件夹
(setq default-directory "c:/Users/Administrator/test/emacs")

;; Set load path
(add-to-list 'load-path "C:/users/administrator/appdata/roaming/.emacs.d/elpa")

;; below is set code for package install
;; 
(require 'magit)
(require 'htmlize)

;; 所有关于latex导出pdf的设置
(require 'auctex)
(require 'cdlatex)
;; (load "auctex.el" nil t t)
;; (load "preview.el" nil t t)
(add-hook 'LaTeX-mode-hook #'LaTeX-install-toolbar)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex) ; with AUCTeX LaTeX mode
(add-hook 'latex-mode-hook 'turn-on-reftex) ; with Emacs latex mode
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default Tex-master nil)
(setq TeX-global-PDF-mode t TeX-engine 'xetex)
;; 设置默认编译命令
(add-hook 'LaTeX-mode-hook
          (lambda()
            (add-to-list 'TeX-command-list '("XeLaTex" "%`xelatex%(mode)% %t" TeX-run-TeX nil t))
            (setq TeX-command-default "XeLaTex")
            ))
;; 将cdlatex设置为AUCtex的辅模式
(add-hook 'LaTex-mode-hook 'turn-on-cdlatex)

;; 使用org-download进行图片插入
(require 'org-download)
;; edit default screenshop methods to imagemagick/convert
;; (setq org-download-screenshot-method "import %s")
(setq org-download-screenshot-method "convert clipboard: %s")
;; (setq-default org-download-image-dir "./images")
;; set key binding for org-download-screenshot
(global-set-key (kbd "C-S-y") 'org-download-screenshot)
(add-hook 'dired-mode-hook 'org-download-enable)

;; latex preview pane
(require 'latex-preview-pane)

;; web浏览器w3m
;; 设置通过cygwin下载下来的emacs-w3m保存路径
(add-to-list 'load-path "D:/cygwin64/home/Administrator/emacs-w3m")
(require 'w3m)
;; (require 'mime-w3m) 
;; 设置主页 
(setq w3m-home-page "http://www.baidu.com") 
;; 设置显示图片
(setq w3m-default-display-inline-images t)
(setq w3m-default-toggle-inline-images t)
;; 显示图标  
(setq w3m-show-graphic-icons-in-header-line t) 
(setq w3m-show-graphic-icons-in-mode-line t)
;; 启用cookie  
(setq w3m-use-cookies t)
;; 设定w3m运行的参数，分别为使用cookie和使用框架 
(setq w3m-command-arguments '("-cookie" "-F"))
;; Browse url function use w3m
(setq browse-url-browser-function 'w3m-browse-url)
;; W3M view url new session in background
(setq w3m-view-this-url-new-session-in-background t)

;; smex: make command faster 
(require 'smex) ; Not needed if you use package.el
(smex-initialize) ; Can be omitted. This might cause a (minimal) delay
                  ; when Smex is auto-initialized on its first run.    
;; set key binding for smex
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;; web-mode support for html
;; 
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.php?\\'" . web-mode))

;; try put these setting in a hook function:
(defun my-web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-markup-indent-offset 4)
  (setq web-mode-css-indent-offset 4)
  (setq web-mode-code-indent-offset 4)
  (setq web-mode-indent-style 4)
  )
(add-hook 'web-mode-hook  'my-web-mode-hook)

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
