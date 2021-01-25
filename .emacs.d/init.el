;  _ __ ___   __| |___ _ __
; | '_ ` _ \ / _` / __| '_ \
; | | | | | | (_| \__ \ |_) |
; |_| |_| |_|\__,_|___/ .__/
;                     |_|

;; packages
(require 'package)
(setq package-archives 
      '(("melpa" . "https://melpa.org/packages/")
	("melpa-stable" . "https://stable.melpa.org/packages/")
	("org" . "https://orgmode.org/elpa/")
	("elpa" . "https://elpa.gnu.org/packages/")))

(defvar my-packages)
(setq my-packages
      '(dashboard company ivy centaur-tabs hl-todo doom-modeline neotree git-gutter
	     doom-themes vterm magit gist rainbow-delimiters rainbow-mode
	     projectile paredit flycheck clojure-mode cider clj-refactor
	     flycheck-clj-kondo elixir-mode alchemist exunit flycheck-credo
	     flycheck-cask erlang haskell-mode dante attrap use-package
	     lsp-mode lsp-ui lsp-haskell js2-mode rjsx-mode typescript-mode
	     js2-refactor markdown-mode markdown-toc edit-indirect grip-mode
	     ruby-mode yard-mode inf-ruby bundler rake projectile-rails which-key
	     fish-mode company-shell emmet-mode haml-mode pug-mode slim-mode
	     web-mode company-web css-mode less-css-mode sass-mode stylus-mode
	     rainbow-mode counsel-css toml-mode yaml-mode json-mode all-the-icons))

(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(dolist (package my-packages)
  (unless (package-installed-p package)
    (package-install package)))

(require 'use-package)

(load "~/.emacs.d/config.el")
