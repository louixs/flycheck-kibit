;;; flycheck-kibit.el --- Add Clojure idiom checker (via kibit) to flycheck

;; Copyright (C) 2019 Ryuei Sasaki <ryuei.sasaki@gmail.com>
;;
;; Author: Ryuei Sasaki <ryuei.sasaki@gmail.com>
;; Created: 27 Sept 2019
;; Version: 0.1.0
;; Package-Requires: ((flycheck "31"))

;;; Commentary:

;; This package adds Clojure idiom checker (via kibit) to flycheck.  To use it, add
;; to your init.el:

;; (require 'flycheck-kibit)

;; Make sure kibit binary is on your path. Binary version of kibit can be obtained here:
;; https://github.com/louixs/kibit-graalvm

;;; License:

;; This file is not part of GNU Emacs.
;; However, it is distributed under the same license.

;; GNU Emacs is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 3, or (at your option)
;; any later version.

;; GNU Emacs is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
;; Boston, MA 02110-1301, USA.

;;; Code:
(require 'flycheck)

(flycheck-define-checker flycheck-kibit
  "A Clojure idiom checker using kibit.
   Make sure to Obtain GraalVM compiled kibit used for this flycheck `https://github.com/louixs/kibit-graalvm'"
  :command ("kibit-graalvm" "flycheck" source)
  :error-patterns
  ((warning  line-start (file-name) ":" line ":" column " warning: " (message) line-end))
  :modes (clojure-mode clojurescript-mode))

(add-to-list 'flycheck-checkers 'flycheck-kibit)

(provide 'flycheck-kibit)
;;; flycheck-kibit.el ends here
