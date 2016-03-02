(require-package 'rainbow-delimiters)
(add-hook 'clojure-mode-hook 'rainbow-delimiters-mode)
(require-package 'ido)
(ido-mode t)

(require-package 'smex)
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)

(setq set-mark-command-repeat-pop t)

(tool-bar-mode -1)

(scroll-bar-mode -1)

(blink-cursor-mode 0)

(define-key global-map (kbd "C-c C-=") 'text-scale-increase)
(define-key global-map (kbd "C-c C--") 'text-scale-decrease)

(windmove-default-keybindings)

(require-package 'undo-tree)
(global-undo-tree-mode)


(global-set-key (kbd "s-3") '(lambda () (interactive) (insert "#")))


(defun toggle-fullscreen ()
  "Toggle full screen"
  (interactive)
  (set-frame-parameter
     nil 'fullscreen
     (when (not (frame-parameter nil 'fullscreen)) 'fullboth)))
     
(global-set-key [f7] 'toggle-fullscreen)

; (remove-if (lambda (x)
;              (eq 'font (car x)))
;            default-frame-alist)
; (cond
;  ((and (window-system) (eq system-type 'darwin))
;   (add-to-list 'default-frame-alist '(font . "Anonymous Pro 16"))))


(defun beautify-json ()
  (interactive)
  (let ((b (if mark-active (min (point) (mark)) (point-min)))
        (e (if mark-active (max (point) (mark)) (point-max))))
    (shell-command-on-region b e
                             "python -mjson.tool" (current-buffer) t)
    (esk-indent-buffer)))


(require-package 'cyberpunk-theme)
(load-theme 'cyberpunk t)

(defalias 'yes-or-no-p 'y-or-n-p)

