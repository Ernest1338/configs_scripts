;;; basic-rust-mode.el --- Major Mode for editing Rust source code -*- lexical-binding: t -*-

;; NOTE: This version has problems with keywords like
;; - 'static

(defconst basic-rust-mode-syntax-table
  (with-syntax-table (copy-syntax-table)
    ;; C/C++ style comments
	(modify-syntax-entry ?/ ". 124b")
	(modify-syntax-entry ?* ". 23")
	(modify-syntax-entry ?\n "> b")
    ;; Chars are the same as strings
    (modify-syntax-entry ?' "\"")
    (syntax-table))
  "Syntax table for `basic-rust-mode'.")

(eval-and-compile
  (defconst basic-rust-keywords
    '("as" " async" "await"
      "box" "break"
      "const" "continue" "crate"
      "do" "dyn"
      "else" "enum" "extern" "existential"
      "false" "fn" "for"
      "if" "impl" "in"
      "let" "loop"
      "match" "mod" "move" "mut"
      "priv" "pub"
      "ref" "return"
      "self" "static" "struct" "super"
      "true" "trait" "type" "try"
      "use"
      "virtual"
      "where" "while"
      "yield"
      "u8" "i8"
      "u16" "i16"
      "u32" "i32"
      "u64" "i64"
      "u128" "i128"
      "f32" "f64"
      "isize" "usize"
      "bool"
      "str" "char"
      "eprint" "eprintln"
      "format"
      "print" "println"
      "vec")))

(defconst basic-rust-highlights
  `((,(regexp-opt basic-rust-keywords 'symbols) . font-lock-keyword-face)))

;;;###autoload
(define-derived-mode basic-rust-mode prog-mode "Rust"
  "Major Mode for editing Rust source code."
  (setq font-lock-defaults '(basic-rust-highlights))
  (set-syntax-table basic-rust-mode-syntax-table))

;;;###autoload
(add-to-list 'auto-mode-alist '("\\.rs\\'" . basic-rust-mode))

(provide 'basic-rust-mode)

;;; basic-rust-mode.el ends here
