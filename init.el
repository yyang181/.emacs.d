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
(defconst spacemacs-emacs-min-version   "26.3" "Minimal version of Emacs.")

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
(setq default-directory "c:/Users/17186/test/emacs/")

;;
;; Set the ~/.emacs.d directory as the directory which is this file.

(setq user-emacs-directory "C:/users/17186/appdata/roaming/.emacs.d")

;; 设置默认文件夹
(setq default-directory "c:/Users/17186/test/emacs")

;; Set load path
(add-to-list 'load-path "C:/users/17186/appdata/roaming/.emacs.d/elpa")

;; 设置默认的编码环境
;; (set-default-coding-systems 'utf-8)
(setq-default markdown-coding-system 'utf-8)

;; 设置默认的字体和字号
(add-to-list 'default-frame-alist
             '(font . "Source Code Pro-10"))
;;(set-frame-font "Source Code Pro-48")
;;(set-face-attribute 'default nil :height 720)

;; below is set code for package install
;; 
(require 'magit)
(require 'htmlize)

;; 配置cpp一键运行程序
;; (defun my-g++-compile-and-run ()
;;   (interactive)
;;   (compile (format "g++ %s && ./a.out" (buffer-file-name))))
;; (define-key c++-mode-map (kbd "<f5>") #'my-g++-compile-and-run)

;; 所有关于org-导出latex模板的设置，包括自定义模板
;;org-export latex
(with-eval-after-load 'ox-latex
  (add-to-list 'org-latex-classes
               '("org-article"
                 "\\documentclass{article}
                 \\usepackage{amsmath,amsfonts,amsthm,amssymb}
                 \\usepackage{setspace}
                 \\usepackage{fancyhdr}
                 \\usepackage{lastpage}
                 \\usepackage{extramarks}
                 \\usepackage{chngpage}
                 \\usepackage{soul}
                 \\usepackage[usenames,dvipsnames]{color}
                 \\usepackage{graphicx,float,wrapfig}
                 \\usepackage{ifthen}
                 \\usepackage{listings}
                 \\usepackage{courier}
                 \\usepackage[colorlinks,
                              breaklinks=true,
                              bookmarks=false,
                              linkcolor=blue,
                              anchorcolor=green,
                              citecolor=green
                              ]{hyperref}  
                 \\usepackage{xcolor}
                 \\usepackage{xeCJK}
                 \\usepackage{indentfirst}
                 [NO-DEFAULT-PACKAGES]      
                 [PACKAGES]                 
                 [EXTRA]"
                 ("\\section{%s}" . "\\section*{%s}")
                 ("\\subsection{%s}" . "\\subsection*{%s}")
                 ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                 ("\\paragraph{%s}" . "\\paragraph*{%s}")
                 ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))))

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

;; set ipython as the default python interpreter
(require 'ein)
(setq python-python-command "d:/anaconda/python.exe")
;; (setq ein:console-security-dir "d:/anaconda/")
;; (setq ein:console-executable "d:/anaconda/Scripts/jupyter-notebook.exe")
;; (setq ein:console-executable "d:/anaconda/Scripts/jupyter-console.exe")
;; (setq ein:console-args "d:/anaconda/etc/jupyter")
(require 'python)
(add-to-list 'auto-mode-alist '("\\.py?\\'" . python-mode))
;; set ein as the default python-file-mode
;; (setq ein:connect-default-notebook "localhost:8888/tree")
;; (setq ein:connect-default-notebook "http://localhost:8888/tree")
;; (add-hook 'python-mode-hook 'ein:connect-to-default-notebook)
;; important setup on windows
(setq python-shell-interpreter "d:/anaconda/python.exe"
      python-shell-interpreter-args
      "-i d:/anaconda/Scripts/ipython-script.py")

;; (require 'ipython)
;; (when (executable-find "ipython")
;;   (setq python-shell-interpreter "ipython"))
;; (setq python-shell-interpreter "ipython")

;; python package config
;; (require 'python)
;; (setq
;;  python-shell-interpreter "ipython"
;;  python-shell-interpreter-args ""
;;  python-shell-prompt-regexp "In \\[[0-9]+\\]: "
;;  python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: "
;;  python-shell-completion-setup-code
;;  "from IPython.core.completerlib import module_completion"
;;  python-shell-completion-module-string-code
;;  "';'.join(module_completion('''%s'''))\n"
;;  python-shell-completion-string-code
;;  "';'.join(get_ipython().Completer.all_completions('''%s'''))\n")

;; 快速打开配置文件
(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))
;; 这一行代码，将函数 open-init-file 绑定到 <f2> 键上
(global-set-key (kbd "<f2>") 'open-init-file)

;; 设置emacs默认全屏打开
(setq initial-frame-alist (quote ((fullscreen . maximized))))

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

;; smex: make command faster 
(require 'smex) ; Not needed if you use package.el
(smex-initialize) ; Can be omitted. This might cause a (minimal) delay
                  ; when Smex is auto-initialized on its first run.    
;; set key binding for smex
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;;一键快速编译并运行 C++-mode
(defun your-g++-compile-and-run ()
  (interactive)
  (compile (format "g++ %s -g -o %s && %s " (buffer-name (current-buffer)) (substring (buffer-name (current-buffer)) 0 -4) (substring (buffer-name (current-buffer)) 0 -4))))
(global-set-key [(f5)] 'your-g++-compile-and-run)  ;;快捷键F9

;;一键快速编译 C++-mode
(defun quick-compile ()
  "A quick compile funciton for C++"
  (interactive)
  (compile (concat "g++ " (buffer-name (current-buffer)) " -g -o " (substring (buffer-name (current-buffer)) 0 -4)))
  )
(global-set-key [(f9)] 'quick-compile)  ;;快捷键F9

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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;org mode 
;; org mode 9.2 更新了<s TAB按键快速添加src代码块的修改，如果依旧需要用此功能需要添加如下语句
(require 'org-tempo)

;; 在org-mode中绑定输出markdown语言的选项到C-c C-c
(eval-after-load "org"
  '(require 'ox-md nil t))

;; 设置org-babel代码块交互显示功能
(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (C . t)
   (java . t)
   (js . t)
   (ruby . t)
   (ditaa . t)
   (python . t)
   (shell . t)
   (latex . t)
   (plantuml . t)
   (R . t)))

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
