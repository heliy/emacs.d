(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("b19b642b0d5be8ec4bc96698260575d3eb81a22064911a8036213facf3a9a6fa" "9fd20670758db15cc4d0b4442a74543888d2e445646b25f2755c65dcd6f1504b" default)))
 '(inhibit-startup-screen t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'upcase-region 'disabled nil)

;;set ibus-el
 (add-to-list 'load-path "~/.emacs.d/ibus-el-0.3.2")
 (require 'ibus)
 (add-hook 'after-init-hook 'ibus-mode-on)

 (global-linum-mode 1) ; always show line numbers                     

(add-to-list 'load-path "~/.emacs.d")
;;markdown-mode
(autoload 'markdown-mode "markdown-mode.el"
    "Major mode for editing Markdown files" t)
(setq auto-mode-alist
    (cons '("\\.md" . markdown-mode) auto-mode-alist))


;;能复制至系统剪切板
(setq x-select-enable-clipboard t)

;;颜色设置
(require 'color-theme)
(color-theme-initialize)
(color-theme-euphoria)

;;关闭滚动条
(set-scroll-bar-mode nil)

;;高亮当前行  
;;(require 'hl-line)  
;;(global-hl-line-mode t)

;;显示图片  
(auto-image-file-mode t)

;;隐藏menu
(menu-bar-mode 0) 

;;隐藏工具栏  
(tool-bar-mode 0)

;f11 -> 全屏
(global-set-key [f11] 'my-fullscreen)
(defun my-fullscreen ()
  (interactive)
  (x-send-client-message
   nil 0 nil "_NET_WM_STATE" 32
   '(2 "_NET_WM_STATE_FULLSCREEN" 0))
)

;;切换窗口
;;(windmove-default-keybindings)
;; 用switch-window
(global-set-key (kbd "C-x o") 'switch-window)
(require 'switch-window)

;;滚动页面设置  
(setq     scroll-step 1  
scroll-margin 3  
scroll-conservatively 10000)  


;;修改注释/反注释功能
;;如果没有激活的区域，就注释/反注释当前行，仅当在行尾的时候才在行尾加注释
(defun qiang-comment-dwim-line (&optional arg)
  (interactive "*P")
  (comment-normalize-vars)
  (if (and (not (region-active-p)) (not (looking-at "[ \t]*$")))
        (comment-or-uncomment-region (line-beginning-position) (line-end-position))
    (comment-dwim arg)))
(global-set-key "\M-;" 'qiang-comment-dwim-line)

;;代码折叠设置
(load-library "hideshow")
    (global-set-key (kbd "C-+") 'toggle-hiding)
    (global-set-key (kbd "C-\\") 'toggle-selective-display)
    (add-hook 'c-mode-common-hook   'hs-minor-mode)
    (add-hook 'emacs-lisp-mode-hook 'hs-minor-mode)
    (add-hook 'python-mode-hook     'hs-minor-mode)
    (add-hook 'lua-mode-hook        'hs-minor-mode)
    (add-hook 'lisp-mode-hook       'hs-minor-mode)
    (add-hook 'perl-mode-hook       'hs-minor-mode)
    (add-hook 'sh-mode-hook         'hs-minor-mode)

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")

;;设定删除保存记录为400  
(setq kill-ring-max 400) 

;;eshell-history-size
(setq eshell-history-size 5000)

;;python-mode
(add-to-list 'load-path "~/.emacs.d/python-mode.el-6.1.2") 
(setq py-install-directory "~/.emacs.d/python-mode.el-6.1.2")
(require 'python-mode)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))

;;lisp+
(show-paren-mode t) ;; 匹配括号高亮
(require 'autopair)
(autopair-global-mode) ;; 自动补全括号

;;multi-term
(require 'multi-term)
(setq multi-term-program "/bin/zsh")

;;ipython
(require 'ipython)

;;青空文库
;;(require 'aozora-view)
;;(add-to-list 'load-path "~/.emacs.d/elisps-master/lookup")
;;(require 'lookup)


;;w3m  
;;主页
(setq w3m-home-page "http://www.google.com")
;;默认显示图片
(setq w3m-default-display-inline-images t)
(setq w3m-default-toggle-inline-images t)
;;使用cookies
(setq w3m-command-arguments '("-cookie" "-F"))
(setq w3m-use-cookies t)
(setq browse-url-browser-function 'w3m-browse-url)                
(setq w3m-view-this-url-new-session-in-background t)

;;epy
;;(load-file "~/.emacs.d/for-python/epy-init.el")

;;elpy
(package-initialize)
(elpy-enable)

;;tarbar
(require 'tabbar)
(tabbar-mode 1)
(global-set-key [(meta j)] 'tabbar-forward)
(global-set-key [(meta k)] 'tabbar-backward)
; close default tabs，and move all files into one group
(setq tabbar-buffer-list-function
    (lambda ()
        (remove-if
          (lambda(buffer)
             (find (aref (buffer-name buffer) 0) " *"))
          (buffer-list))))
(setq tabbar-buffer-groups-function
      (lambda()(list "All")))
(set-face-attribute 'tabbar-button nil)
;;set tabbar's backgroud color
(set-face-attribute 'tabbar-default nil
                    :background "gray"
                    :foreground "gray30")
(set-face-attribute 'tabbar-selected nil
                    :inherit 'tabbar-default
                    :background "green"
                    :box '(:line-width 3 :color "DarkGoldenrod") )
(set-face-attribute 'tabbar-unselected nil
                    :inherit 'tabbar-default
                    :box '(:line-width 3 :color "gray"))
;; USEFUL: set tabbar's separator gap
(custom-set-variables '(tabbar-separator (quote (1.5))))
