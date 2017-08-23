(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files (quote ("~/Documents/tests/test.org")))
 '(package-selected-packages (quote (org-edna elpy auctex))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(require 'package)
(add-to-list 'package-archives
             '("elpy" . "http://jorgenschaefer.github.io/packages/"))
;; for right-to-left direction in org-mode
(defun set-bidi-env ()
  "interactive"
  (setq bidi-paragraph-direction 'nil))
(add-hook 'org-mode-hook 'set-bidi-env)
;; org-export stylesheet
(setq org-html-head-extra
	  "<link rel=\"stylesheet\" href=\"/home/hadi/.emacs.d/lisp/org.css\" type=\"text/css\" />")
(defun my/org-inline-css-hook (exporter)
  "Insert custom inline css to automatically set the
background of code to whatever theme I'm using's background"
  (when (eq exporter 'html)
	(let* ((my-pre-bg (face-background 'default))
		   (my-pre-fg (face-foreground 'default)))
	  (setq
	   org-html-head-extra
	   (concat
		org-html-head-extra
		(format "<style type=\"text/css\">\n pre.src {background-color: %s; color: %s;}</style>\n"
				my-pre-bg my-pre-fg))))))
(add-hook 'org-export-before-processing-hook 'my/org-inline-css-hook)
;; export org to html with checkbox like ☑ (ballot)
(setq org-html-checkbox-type 'unicode)
(package-initialize)
(elpy-enable)
