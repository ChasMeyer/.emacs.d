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

;; Ensure tramp is around...
(require 'tramp)

;; Allows simpler syntax for tramp/sudo combo file editing ex:
;; /sudo:server:/path/to/file
(add-to-list 'tramp-default-proxies-alist 
     '((and (string-match system-name 
                  (tramp-file-name-host (car target-alist)))
            "THISSHOULDNEVERMATCH")
       "\\`root\\'" "/ssh:%h:"))
