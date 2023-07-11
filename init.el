;; Packages
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

;;; Template
; (unless (package-installed-p 'REPLACE)
;   (package-install 'REPLACE))

;;; After adding packages, run `M-x package-refresh-contents`
(unless (package-installed-p 'evil)
  (package-install 'evil)
  (package-install 'evil-collection))
(unless (package-installed-p 'nerd-icons)
  (package-install 'nerd-icons))

;; Globals
(set-frame-font "FiraCode Nerd Font Mono 14" nil t)
(tool-bar-mode -1)
(menu-bar-mode -1)
(global-display-line-numbers-mode)
(setq display-line-numbers-type 'relative)

(defun display-startup-echo-area-message ()
  (message ""))

(setq initial-scratch-message "")

(defun my-tabbar-buffer-groups ()
  (list (cond ((string-equal "*" (substring (buffer-name) 0 1)) "emacs")
              ((eq major-mode 'dired-mode) "emacs")
              (t "user"))))
(setq tabbar-buffer-groups-function 'my-tabbar-buffer-groups)

;; Helm
(setq helm-mode-fuzzy-match t)
(setq helm-completion-in-region-fuzzy-match t)
(require 'helm)
(global-set-key (kbd "M-SPC") #'helm-M-x)

;; Whichkey
(require 'which-key)
(which-key-mode)

;; Evil
(setq evil-want-integration t)
(setq evil-want-keybinding nil)
(setq evil-want-C-u-scroll t)
(evil-collection-init)
(require 'evil)
(when (require 'evil-collection nil t)
  (evil-collection-init))
(evil-mode 1)

;; Tabbar
;; (require 'tabbar)
;; (customize-set-variable 'tabbar-background-color "gray20")
;; (customize-set-variable 'tabbar-separator '(0.5))
;; (customize-set-variable 'tabbar-use-images t)
;; (tabbar-mode 1)
;; 
;; (set-face-attribute 'tabbar-default nil
;;         :background "gray20" :foreground 
;;         "gray60" :distant-foreground "gray50"
;;         :family "FiraCode Nerd Font Mono" :box nil)
;; (set-face-attribute 'tabbar-unselected nil
;;         :background "gray80" :foreground "black" :box nil)
;; (set-face-attribute 'tabbar-modified nil
;;         :foreground "red4" :box nil
;;         :inherit 'tabbar-unselected)
;; (set-face-attribute 'tabbar-selected nil
;;         :background "#4090c0" :foreground "white" :box nil)
;; (set-face-attribute 'tabbar-selected-modified nil
;;         :inherit 'tabbar-selected :foreground "GoldenRod2" :box nil)
;; (set-face-attribute 'tabbar-button nil
;;         :box nil)

(require 'centaur-tabs)
(centaur-tabs-mode t)
(evil-global-set-key 'normal (kbd "<backtab>") 'centaur-tabs-backward)
(evil-global-set-key 'normal (kbd "<tab>") 'centaur-tabs-forward)
(centaur-tabs-headline-match)
(setq centaur-tabs-style "slant")

;; nerd-icons
(require 'nerd-icons)
(setq nerd-icons-font-family "FiraCode Nerd Font Mono")

;; dashboard
(require 'dashboard)
(dashboard-setup-startup-hook)

(setq dashboard-display-icons-p t) ;; display icons on both GUI and terminal
(setq dashboard-icon-type 'nerd-icons) ;; use `nerd-icons'
(setq dashboard-set-heading-icons nil)
(setq dashboard-set-file-icons t)

(setq dashboard-set-init-info nil)

(setq dashboard-banner-logo-title "Evilmacs")
;; Set the banner
(setq dashboard-startup-banner 'logo)

;; Content is not centered by default. To center, set
(setq dashboard-center-content t)

;; To disable shortcut "jump" indicators for each section, set
; (setq dashboard-show-shortcuts nil)

(setq dashboard-items '((recents  . 5)
                        (bookmarks . 5)
                        (projects . 5)
                        (agenda . 5)
                        (registers . 5)))

(setq initial-buffer-choice (lambda () (get-buffer-create "*dashboard*")))

;; Mappings
(require 'general)
(general-create-definer leader-def
  ;; :prefix my-leader
  :prefix "SPC")

(general-create-definer local-leader-def
  ;; :prefix my-local-leader
  :prefix "SPC m")

(global-set-key (kbd "<ESC> <ESC>") 'keyboard-escape-quit)

(leader-def
 :keymaps 'normal
 "aa" 'helm-find-files
 "ad" 'treemacs
 "aj" 'helm-buffers-list
 "af" 'helm-find-files

 "kw" 'helm-occur
 )

(global-set-key (kbd "M-h") 'windmove-left)
(global-set-key (kbd "M-j") 'windmove-down)
(global-set-key (kbd "M-k") 'windmove-up)
(global-set-key (kbd "M-l") 'windmove-right)

;; vnoremap > '>gv'
(define-key evil-visual-state-map ">" (lambda ()
    (interactive)
    ; ensure mark is less than point
    (when (> (mark) (point)) 
        (exchange-point-and-mark)
    )
    (evil-normal-state)
    (evil-shift-right (mark) (point))
    (evil-visual-restore) ; re-select last visual-mode selection
))

;; vnoremap < '<gv'
(define-key evil-visual-state-map "<" (lambda ()
    (interactive)
    ; ensure mark is less than point
    (when (> (mark) (point)) 
        (exchange-point-and-mark)
    )
    (evil-normal-state)
    (evil-shift-left (mark) (point))
    (evil-visual-restore) ; re-select last visual-mode selection
))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(molokai))
 '(custom-safe-themes
   '("42abd324628cb258bb8bbb1fc8ebcd4920f6681f616eb1ac80c6f8853258c595" "9ac11c78f208abf58e5b313a33147cbf209ad9dc9cb169bf82464b043b45ad7a" "9dc64d345811d74b5cd0dac92e5717e1016573417b23811b2c37bb985da41da2" "6a2cc07c407e8321f0df155988e60b39fe6f2488d2c79a6b14211854ea6fbc52" "cdc2a7ba4ecf0910f13ba207cce7080b58d9ed2234032113b8846a4e44597e41" "c3fa63eab93d1f0b4bf9f60a98a2848ba29c34cc6f2ef5cf4076d9c190a47a6c" "be0efbaebc85494f3c1c06e320fd13a24abf485d5f221a90fe811cea9a39ed85" default))
 '(helm-minibuffer-history-key "M-p")
 '(package-selected-packages
   '(centaur-tabs treemacs-evil general which-key helm evil-collection molokai-theme color-theme-modern evil)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
