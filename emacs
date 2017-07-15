;;Load package-install sources
(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   '("melpa" . "http://melpa.org/packages/")
   t)
  (add-to-list 'package-archives
   '("melpa-stable" . "http://melpa-stable.milkbox.net/packages/")
   t)
  (package-initialize))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (nlinum-relative sr-speedbar fiplr expand-region projectile editorconfig js2-mode exec-path-from-shell window-number buffer-move smooth-scroll project-explorer json-mode markdown-mode go-autocomplete go-eldoc go-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(defvar my-packages
  '(;;;; Go shit
    go-mode
    go-guru
    go-eldoc
    go-autocomplete

        ;;;;;; Markdown
    markdown-mode

        ;;;;;; Javascript
    json-mode
        ;;;;;; Env
    project-explorer
    smooth-scroll
    buffer-move
    window-number
    fiplr
    sr-speedbar
    git-gutter
    nlinum

    ;;;; themes
    monokai-theme)
  "My packages!")

(load-theme 'monokai t)

(global-set-key (kbd "C-;") 'er/expand-region)

;; fetch the list of packages available
(unless package-archive-contents
  (package-refresh-contents))

;; install the missing packages
(dolist (package my-packages)
  (unless (package-installed-p package)
    (package-install package)))

;;Load Go-specific language syntax
(defun go-mode-setup ()
  (go-eldoc-setup))

(add-hook 'go-mode-hook 'go-mode-setup)

;;Format before saving
(defun go-mode-setup ()
  (go-eldoc-setup)
  (add-hook 'before-save-hook 'gofmt-before-save))
(add-hook 'go-mode-hook 'go-mode-setup)

;;Goimports
(defun go-mode-setup ()
  (go-eldoc-setup)
  (setq gofmt-command "goimports")
  (add-hook 'before-save-hook 'gofmt-before-save))
(add-hook 'go-mode-hook 'go-mode-setup)

;;Godef, shows function definition when calling godef-jump
(defun go-mode-setup ()
  (go-eldoc-setup)
  (setq gofmt-command "goimports")
  (add-hook 'before-save-hook 'gofmt-before-save)
  (local-set-key (kbd "M-.") 'godef-jump))
(add-hook 'go-mode-hook 'go-mode-setup)

; ;;Custom Compile Command
; (defun go-mode-setup ()
;   (setq compile-command "go build -v && go test -v && go vet && golint && errcheck")
;   (define-key (current-local-map) "\C-c\C-c" 'compile)
;   (go-eldoc-setup)
;   (setq gofmt-command "goimports")
;   (add-hook 'before-save-hook 'gofmt-before-save)
;   (local-set-key (kbd "M-.") 'godef-jump))
; (add-hook 'go-mode-hook 'go-mode-setup)

;;Load auto-complete
(ac-config-default)
(require 'auto-complete-config)
(require 'go-autocomplete)

(add-to-list 'load-path (concat (getenv "GOPATH")  "/src/github.com/golang/lint/misc/emacs"))
(require 'golint)

(require 'go-guru)

;;Project Explorer
(require 'project-explorer)
(global-set-key (kbd "M-e") 'project-explorer-toggle)

(add-to-list 'load-path "~/.emacs.d/lisp")
(require 'editorconfig)
(editorconfig-mode 1)

                                        ; fiplr
(require 'fiplr)
(global-set-key (kbd "C-x f") 'fiplr-find-file)

(setq fiplr-ignored-globs
      '((directories
         ;; Version control
         (".git"
          ".svn"
          ".hg"
          ".bzr"
          ;; NPM
          "node_modules"
          ;; Bower
          "bower_components"
          ;; Maven
          "target"
          ;; Python
          "__pycache__"
          ;; others
          "tmp"
          "vendor"
          ))
        (files
         ;; Emacs
         (".#*"
          ;; Vim
          "*~"
          ;; Objects
          "*.so"
          "*.o"
          "*.obj"
          ;; Media
          "*.jpg"
          "*.png"
          "*.gif"
          "*.pdf"
          ;; Archives
          "*.gz"
          "*.zip"))))

                                        ;
(global-set-key (kbd "C-c d") 'kill-whole-line)


                                        ; speedbar
(require 'sr-speedbar)
;(speedbar 1)
(speedbar-add-supported-extension ".go")
(setq sr-speedbar-auto-refresh nil)

                                        ; window management
(windmove-default-keybindings)
(sr-speedbar-open)

                                        ; search compatability
(global-set-key (kbd "<f4>") 'next-error)

                                        ; git-gutter
(nlinum-mode)
;; Preset `nlinum-format' for minimum width.
(defun my-nlinum-mode-hook ()
  (when nlinum-mode
    (setq-local nlinum-format
                (concat "%" (number-to-string
                             ;; Guesstimate number of buffer lines.
                             (ceiling (log (max 1 (/ (buffer-size) 80)) 10)))
                        "d"))))
(add-hook 'nlinum-mode-hook #'my-nlinum-mode-hook)
(global-linum-mode 1)
(load "~/.emacs.d/utils/linum-highligth-current-line-number.el")
(global-git-gutter-mode +1)
