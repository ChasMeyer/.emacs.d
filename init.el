;; package setup
(require 'package) ;; You might already have this line
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (url (concat (if no-ssl "http" "https") "://melpa.org/packages/")))
  (add-to-list 'package-archives (cons "melpa" url) t))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("d6922c974e8a78378eacb01414183ce32bc8dbf2de78aabcc6ad8172547cb074" default)))
 '(inhibit-startup-screen t)
 '(package-selected-packages
   (quote
    (better-defaults slack magithub magit cyberpunk-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Turn the scrollbar, toolbar, and menubar off
(toggle-scroll-bar -1)
(tool-bar-mode -1)
(menu-bar-mode -1)

;; Ensure tramp is around...
(require 'tramp)

;; Allows simpler syntax for tramp/sudo combo file editing ex:
;; /sudo:server:/path/to/file
(add-to-list 'tramp-default-proxies-alist 
     '((and (string-match system-name 
                  (tramp-file-name-host (car target-alist)))
            "THISSHOULDNEVERMATCH")
       "\\`root\\'" "/ssh:%h:"))

;; Place backups in the system temp directory instead of the original file's location
(setq backup-directory-alist
          `((".*" . ,temporary-file-directory)))
    (setq auto-save-file-name-transforms
          `((".*" ,temporary-file-directory t)))

;; IDO-Mode all the things!!!
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

;; Enable all the MagitHub features
(require 'magithub)
(magithub-feature-autoinject t)

			 
