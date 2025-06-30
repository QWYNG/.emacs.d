;; メニューバー非表示
(menu-bar-mode -1)

;;melpaリポジトリを設定
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; best theme
(load-theme 'kanagawa-wave t)

;; いい感じのダッシュボード
(require 'dashboard)
(dashboard-setup-startup-hook)

;; Org-mode
(setq org-directory "~/Dropbox/org/")
(setq org-default-notes-file "notes.org")
(defun show-org-capture ()
  (interactive)
  (find-file (concat org-directory org-default-notes-file))
  )
;; Org-captureの設定
;; Org-captureを呼び出すキーシーケンス
(define-key global-map (kbd "C-c m") 'org-capture)
;; Org-captureのテンプレート（メニュー）の設定
(setq org-capture-templates
      '(
        ("n" "Note" entry (file+datetree "~/Dropbox/org/notes.org")
         "* %U\n%?\n%i\n"
         :empty-lines 1)
        )
      )
;;

;; macのクリップボードと同期
(defun copy-from-osx ()
  (shell-command-to-string "pbpaste"))

(defun paste-to-osx (text &optional push)
  (let ((process-connection-type nil))
    (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
      (process-send-string proc text)
      (process-send-eof proc))))

(setq interprogram-cut-function 'paste-to-osx)
(setq interprogram-paste-function 'copy-from-osx)
;;

;; 設定ファイルをすぐに開きたい
(defun open-init-file ()
  "Open the user's init.el file."
  (interactive)
  (find-file user-init-file))
(global-set-key (kbd "C-c c")
                'open-init-file)

;;
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("daa27dcbe26a280a9425ee90dc7458d85bd540482b93e9fa94d4f43327128077" "c20728f5c0cb50972b50c929b004a7496d3f2e2ded387bf870f89da25793bb44" "d2ab3d4f005a9ad4fb789a8f65606c72f30ce9d281a9e42da55f7f4b9ef5bfc6" default))
 '(package-selected-packages '(magit dashboard kanagawa-themes vertico))
 '(vertico-mode t))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
