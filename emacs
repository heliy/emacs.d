(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
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
 (setq linum-format "%d| ")  ;set format  

(add-to-list 'load-path "~/.emacs.d")
;;markdown-mode
(autoload 'markdown-mode "markdown-mode.el"
    "Major mode for editing Markdown files" t)
(setq auto-mode-alist
    (cons '("\\.md" . markdown-mode) auto-mode-alist))

;;能复制至系统剪切板
(setq x-select-enable-clipboard t)