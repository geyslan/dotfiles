;;; Begin initialization

;; Set up some interface components early in startup
(menu-bar-mode -1)            ; Disable the menu bar
(when window-system
  (tool-bar-mode -1)          ; Disable the toolbar
  (scroll-bar-mode -1)        ; Disable visible scrollbar
  (tooltip-mode -1)           ; Disable tooltips
  (set-fringe-mode 10))       ; Set margins size (in pixels)

(setq inhibit-startup-message t)
(setq initial-scratch-message "")
(setq visible-bell t)

; Set font

(set-face-attribute 'default nil :font "JetBrainsMono Nerd Font Mono" :height 100 :weight 'normal)
;(set-face-attribute 'default nil :font "SauceCodePro Nerd Font Mono" :height 100 :weight 'normal)

;(set-face-attribute 'default nil :font "InconsolataGo Nerd Font Mono" :height 110)
;(set-face-attribute 'default nil :font "UbuntuMono Nerd Font Mono" :height 110)
;(set-face-attribute 'default nil :font "TerminessTTF Nerd Font Mono" :height 110 :weight 'normal)
;(set-face-attribute 'default nil :font "Monofur Nerd Font Mono" :height 110)
;(set-face-attribute 'default nil :font "Code New Roman" :height 110)

;(set-face-attribute 'default nil :font "RobotoMono Nerd Font Mono" :height 90 :weight 'normal)

;(set-face-attribute 'default nil :font "mononoki Nerd Font Mono" :height 100 :weight 'normal)


; Make ESC quit prompts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)


;; Column and line numbers
(column-number-mode t)
(global-display-line-numbers-mode t)
(dolist (mode '(org-mode-hook
                term-mode-hook
                eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))


;; Set up package management
(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org"   . "https://orgmode.org/elpa/")
                         ("elpa"  . "https://elpa.gnu.org/packages/")))
(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))
(setq use-package-always-ensure t) ; make `:ensure t` for all packages


;; Set up packages

; command-log-mode - show event and command histories of some or all buffers
(use-package command-log-mode)

; ivy - a generic completion frontend
(use-package ivy
  :diminish
  :bind (("C-s" . swiper)
         :map ivy-minibuffer-map
         ("C-k" . ivy-next-line)
         ("C-l" . ivy-previous-line)
         ("C-h" . ivy-alt-done)
         ("TAB" . ivy-alt-done)
         :map ivy-switch-buffer-map
         ("C-k" . ivy-next-line)
         ("C-l" . ivy-previous-line)
         ("C-h" . ivy-done)
         ("C-d" . ivy-switch-buffer-kill)
         :map ivy-reverse-i-search-map
         ("C-l" . ivy-previous-line)
         ("C-d" . ivy-reverse-i-search-kill))
  :demand
  :config
  (ivy-mode 1))

; ivy-rich - more friendly interface for ivy and counsel
(use-package ivy-rich
  :after ivy
  :config
  (ivy-rich-mode 1))

; counsel - a collection of ivy-enhanced commands
(use-package counsel
  :after (ivy counsel)
  :bind (("M-x"     . counsel-M-x)
         ("C-x b"   . counsel-switch-buffer)
         ("C-M-j"   . counsel-switch-buffer)
         ("C-x C-f" . counsel-find-file)
         :map minibuffer-local-map
         ("C-r"     . counsel-minibuffer-history))
  :config
  (counsel-mode 1))

; doom-themes - an opinionated pack of modern color-themes
(use-package doom-themes
  :init (load-theme 'doom-palenight t))

; all-the-icons - a utility to collect various IcoN Fonts and propertize them
(use-package all-the-icons)

; doom-modeline - a fancy and fast mode-line inspired by minimalism design
(use-package doom-modeline
  :after all-the-icons
  :init
  (doom-modeline-mode 1)
  :custom
  (doom-modeline-height 30))

; which-key - displays available keybindings in popup
(use-package which-key
  :defer 0
  :diminish which-key-mode
  :config
  (which-key-mode)
  (setq which-key-idle-delay 1))

; helpful - a better *help* buffer
(use-package helpful
  :commands (helpful-callable helpful-variable helpful-command helpful-key)
  :custom
  (counsel-describe-function-function #'helpful-callable)
  (counsel-describe-variable-function #'helpful-variable)
  :bind
  ([remap describe-function] . counsel-describe-function)
  ([remap describe-command]  . helpful-command)
  ([remap describe-variable] . counsel-describe-variable)
  ([remap describe-key]      . helpful-key))
