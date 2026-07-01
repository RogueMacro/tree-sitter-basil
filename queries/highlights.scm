(identifier) @variable


(function_definition (identifier) @function)

(function_call (path (identifier) @function))
(function_call (path (scoped_identifier (identifier) @function)))

(scoped_identifier (path (scoped_identifier (identifier) @module)))
(scoped_identifier (path (identifier) @module))

(type) @type

(number) @number

(boolean) @boolean

(comment) @comment

(char_literal) @string
(string_literal) @string

[
  "fn"
  "return"
  "extern"
  "while"
  "if"
  "as"
] @keyword


[
  ":="
  "="
  "<"
  "<="
  ">"
  ">="
  "=="
  "!="
  "+"
  "-"
  "*"
  "/"
  "&"
  "||"
  "->"
] @operator

[
  "("
  ")"
  "{"
  "}"
] @punctuation.bracket

[
  "::"
  ":"
  ";"
] @punctuation.delimiter
