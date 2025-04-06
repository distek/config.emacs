;; Packages
(set-face-attribute 'default nil :family "FiraCode Nerd Font Mono" :height 140)
(setq inhibit-startup-screen t
      initial-buffer-choice  nil)
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
(unless (package-installed-p 'centaur-tabs)
  (package-install 'centaur-tabs))
(unless (package-installed-p 'treemacs-evil)
  (package-install 'treemacs-evil))
(unless (package-installed-p 'general)
  (package-install 'general))
(unless (package-installed-p 'which-key)
  (package-install 'which-key))
(unless (package-installed-p 'helm)
  (package-install 'helm))
(unless (package-installed-p 'molokai-theme)
  (package-install 'molokai-theme))
(unless (package-installed-p 'color-theme-modern)
  (package-install 'color-theme-modern))
(unless (package-installed-p 'company-go)
  (package-install 'company-go))
(unless (package-installed-p 'go-mode)
  (package-install 'go-mode))
(unless (package-installed-p 'company)
  (package-install 'company))
(unless (package-installed-p 'dashboard)
  (package-install 'dashboard))
(unless (package-installed-p 'multi-vterm)
  (package-install 'multi-vterm))


;; Globals
;; (set-frame-font "FiraCode Nerd Font Mono 14" nil t)
(tool-bar-mode -1)

;; If on mac, enable menubar case yabai
(if (eq system-type 'darwin)
    (menu-bar-mode 1)
  (menu-bar-mode -1))

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
(helm-mode)

(global-set-key (kbd "M-SPC") #'helm-M-x)

(setq helm-input-idle-delay                     0.01
      helm-reuse-last-window-split-state        t
      helm-always-two-windows                   t
      helm-split-window-inside-p                t
      helm-commands-using-frame                 nil
;;       helm-commands-using-frame                 '(completion-at-point
;;                                                   helm-apropos
;;                                                   helm-eshell-prompts helm-imenu
;;                                                   helm-imenu-in-all-buffers)
      helm-actions-inherit-frame-settings       nil
      helm-use-frame-when-more-than-two-windows t
      helm-use-frame-when-dedicated-window      t
      ; helm-frame-background-color               "DarkSlateGray"
      helm-show-action-window-other-window      'left
      helm-allow-mouse                          t
      helm-move-to-line-cycle-in-source         t
      helm-autoresize-max-height                80   ; it is %.
      helm-autoresize-min-height                20   ; it is %.
      ; helm-debug-root-directory                 "/home/thierry/tmp/helm-debug"
      helm-follow-mode-persistent               t
      helm-candidate-number-limit               500
      helm-visible-mark-prefix                  "✓")

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

;; (global-set-key "\C-c" nil)
; (define-key (current-local-map) "\C-c" nil)
; (define-key (mml-mode-map) "\C-c" nil)
;;; C-c as general purpose escape key sequence.
;;;
;; (defun my-esc (prompt)
;;     "Functionality for escaping generally.  Includes exiting Evil insert state and C-g binding. "
;;     (cond
;;     ;; If we're in one of the Evil states that defines [escape] key, return [escape] so as
;;     ;; Key Lookup will use it.
;;     ((or (evil-insert-state-p) (evil-normal-state-p) (evil-replace-state-p) (evil-visual-state-p)) [escape])
;;     ;; This is the best way I could infer for now to have C-c work during evil-read-key.
;;     ;; Note: As long as I return [escape] in normal-state, I don't need this.
;;     ;;((eq overriding-terminal-local-map evil-read-key-map) (keyboard-quit) (kbd ""))
;;     (t (kbd "C-g"))))
;; (define-key key-translation-map (kbd "C-c") 'my-esc)
;; ;; Works around the fact that Evil uses read-event directly when in operator state, which
;; ;; doesn't use the key-translation-map.
;; (define-key evil-operator-state-map (kbd "C-c") 'keyboard-quit)
;; ;; Not sure what behavior this changes, but might as well set it, seeing the Elisp manual's
;; ;; documentation of it.
;; ;; (set-quit-char "C-c")

;; Centaur-tabs
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

;; Company
(require 'company)
(require 'go-mode)

;; Company mode
(setq company-idle-delay 0)
(setq company-minimum-prefix-length 1)

;; Go - lsp-mode
;; Set up before-save hooks to format buffer and add/delete imports.
(defun lsp-go-install-save-hooks ()
  (add-hook 'before-save-hook #'lsp-format-buffer t t)
  (add-hook 'before-save-hook #'lsp-organize-imports t t))
(add-hook 'go-mode-hook #'lsp-go-install-save-hooks)

;; Start LSP Mode and YASnippet mode
(add-hook 'go-mode-hook #'lsp-deferred)
(add-hook 'go-mode-hook #'yas-minor-mode)

;; Vterm
(require 'multi-vterm)
(setq multi-vterm-dedicated-window-height-percent 25)
(define-key vterm-mode-map [return]                      #'vterm-send-return)

(with-eval-after-load 'multi-vterm
    (setq vterm-keymap-exceptions nil)
    (evil-define-key 'insert vterm-mode-map (kbd "C-e")      #'vterm--self-insert)
    (evil-define-key 'insert vterm-mode-map (kbd "C-f")      #'vterm--self-insert)
    (evil-define-key 'insert vterm-mode-map (kbd "C-a")      #'vterm--self-insert)
    (evil-define-key 'insert vterm-mode-map (kbd "C-v")      #'vterm--self-insert)
    (evil-define-key 'insert vterm-mode-map (kbd "C-b")      #'vterm--self-insert)
    (evil-define-key 'insert vterm-mode-map (kbd "C-w")      #'vterm--self-insert)
    (evil-define-key 'insert vterm-mode-map (kbd "C-u")      #'vterm--self-insert)
    (evil-define-key 'insert vterm-mode-map (kbd "C-d")      #'vterm--self-insert)
    (evil-define-key 'insert vterm-mode-map (kbd "C-n")      #'vterm--self-insert)
    (evil-define-key 'insert vterm-mode-map (kbd "C-m")      #'vterm--self-insert)
    (evil-define-key 'insert vterm-mode-map (kbd "C-p")      #'vterm--self-insert)
    (evil-define-key 'insert vterm-mode-map (kbd "C-j")      #'vterm--self-insert)
    (evil-define-key 'insert vterm-mode-map (kbd "C-k")      #'vterm--self-insert)
    (evil-define-key 'insert vterm-mode-map (kbd "C-r")      #'vterm--self-insert)
    (evil-define-key 'insert vterm-mode-map (kbd "C-t")      #'vterm--self-insert)
    (evil-define-key 'insert vterm-mode-map (kbd "C-g")      #'vterm--self-insert)
    (evil-define-key 'insert vterm-mode-map (kbd "C-c")      #'vterm-send-C-c)
    (evil-define-key 'insert vterm-mode-map (kbd "C-SPC")    #'vterm--self-insert)
    (evil-define-key 'normal vterm-mode-map (kbd "C-d")      #'vterm--self-insert)
    (evil-define-key 'normal vterm-mode-map (kbd "<esc>")      #'vterm--self-insert)
    (evil-define-key 'insert vterm-mode-map (kbd "<esc>")      #'vterm--self-insert)
    (evil-define-key 'normal vterm-mode-map (kbd ",c")       #'multi-vterm)
    (evil-define-key 'normal vterm-mode-map (kbd "M-]")       #'multi-vterm-next)
    (evil-define-key 'normal vterm-mode-map (kbd "M-[")       #'multi-vterm-prev)
    (evil-define-key 'normal vterm-mode-map (kbd "i")        #'evil-insert-resume)
    (evil-define-key 'normal vterm-mode-map (kbd "o")        #'evil-insert-resume)
    (evil-define-key 'normal vterm-mode-map (kbd "<return>") #'evil-insert-resume)
    (evil-define-key 'insert vterm-mode-map (kbd "\\ a s") #'multi-vterm-dedicated-toggle)
    (evil-define-key 'insert vterm-mode-map (kbd "M-<return>") #'multi-vterm)
    ;; Normal mode
    (evil-define-key 'normal vterm-mode-map (kbd "M-h") 'windmove-left)
    (evil-define-key 'normal vterm-mode-map (kbd "M-j") 'windmove-down)
    (evil-define-key 'normal vterm-mode-map (kbd "M-k") 'windmove-up)
    (evil-define-key 'normal vterm-mode-map (kbd "M-l") 'windmove-right)

    ;; Insert mode
    (evil-define-key 'insert vterm-mode-map (kbd "M-h") 'windmove-left)
    (evil-define-key 'insert vterm-mode-map (kbd "M-j") 'windmove-down)
    (evil-define-key 'insert vterm-mode-map (kbd "M-k") 'windmove-up)
    (evil-define-key 'insert vterm-mode-map (kbd "M-l") 'windmove-right)
)


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
 "as" 'multi-vterm-dedicated-toggle
 "aj" 'helm-buffers-list
 "af" 'helm-find-files

 "kw" 'helm-occur
 "lr" 'lsp-find-references
 "ln" 'lsp-rename

 "so" 'eval-buffer
 )

(global-set-key (kbd "M-h") 'windmove-left)
(global-set-key (kbd "M-j") 'windmove-down)
(global-set-key (kbd "M-k") 'windmove-up)
(global-set-key (kbd "M-l") 'windmove-right)
(global-set-key (kbd "M-Q") 'delete-window)
(global-set-key (kbd "M-q") 'kill-buffer)

(with-eval-after-load 'treemacs
  (define-key treemacs-mode-map (kbd "M-h") 'windmove-left)
  (define-key treemacs-mode-map (kbd "M-j") 'windmove-down)
  (define-key treemacs-mode-map (kbd "M-k") 'windmove-up)
  (define-key treemacs-mode-map (kbd "M-l") 'windmove-right))

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

(setq ring-bell-function 'ignore)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(molokai))
 '(custom-safe-themes
   '("7478bc74ae421ad2103d4239176f71e6d55ef0be4eb874c328b862af5b93a857"
     "42abd324628cb258bb8bbb1fc8ebcd4920f6681f616eb1ac80c6f8853258c595"
     "9ac11c78f208abf58e5b313a33147cbf209ad9dc9cb169bf82464b043b45ad7a"
     "9dc64d345811d74b5cd0dac92e5717e1016573417b23811b2c37bb985da41da2"
     "6a2cc07c407e8321f0df155988e60b39fe6f2488d2c79a6b14211854ea6fbc52"
     "cdc2a7ba4ecf0910f13ba207cce7080b58d9ed2234032113b8846a4e44597e41"
     "c3fa63eab93d1f0b4bf9f60a98a2848ba29c34cc6f2ef5cf4076d9c190a47a6c"
     "be0efbaebc85494f3c1c06e320fd13a24abf485d5f221a90fe811cea9a39ed85"
     default))
 '(helm-minibuffer-history-key "M-p")
 '(package-selected-packages nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
