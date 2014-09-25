;; path where settings files are kept
(add-to-list 'load-path "~/.emacs.d/settings")
;; path to where plugins are kept
(setq plugin-path "~/.emacs.d/el-get/")

;; define various custom functions
(require 'custom-functions)

;; configure general settings
(require 'general-settings)

;; install dependencies with el-get
(require 'el-get-settings)

(require 'package)
(add-to-list 'package-archives
  ;; The 't' means to append, so that MELPA comes after the more
  ;; stable ELPA archive.
  '("melpa" . "http://melpa.milkbox.net/packages/") t)

;; Add ELPA if necessary. Looking at the El-Get package.rcp recipe in
;; ~/local/opt/el-get/recipes it seems this is probably unnecessary.
(when (< emacs-major-version 24)
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))

(package-initialize)

;---------------;
;;; Utilities ;;;
;---------------;

;; Git
;; (include-plugin "magit")
;; (require 'magit)

;; Popup
;; (include-elget-plugin "popup")
;; (require 'popup)

;; Websocket
;; (include-plugin "websocket")
;; (require 'websocket)

;; Request
;; (include-plugin "request")
;; (require 'request)

;; Auto complete
;; (require 'auto-complete-settings)

;; Camelcase functions
;; (require 'camelcase-settings)

;; Helm
;; (require 'helm-settings)


;-----------;
;;; Modes ;;;
;-----------;

;; Ido mode
;; (require 'ido)
;; (ido-mode 1)

;; MuMaMo
;; (require 'mumamo-settings)

;; Markdown mode
;; (require 'markdown-settings)

;; Python mode 
;; (require 'python-settings)

;; LaTeX and Auctex
;; (require 'latex-settings)

;; SCSS Mode
;; (require 'scss-settings)

;; Matlab mode
;; (require 'matlab-settings)

;; Nyancat mode!
;; (nyan-mode 1)

;; org mode
(require 'org-settings)

;; Theme
(color-theme-solarized-dark)

;; windmove

(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))

;; Backup Setings

(setq backup-directory-alist `(("." . "~/.saves")))
(setq backup-by-copying t)
(setq delete-old-versions t
  kept-new-versions 6
  kept-old-versions 2
  version-control t)
(setq vc-make-backup-files t)

;---------------------------------------------------------------------
;; Put auto 'custom' changes in a separate file (this is stuff like
;; custom-set-faces and custom-set-variables)
(load 
  (setq custom-file (expand-file-name "settings/custom.el" user-emacs-directory))
  'noerror)
