(identifier) @variable


(function_definition (identifier) @function)

(function_call (path (identifier) @function))
(function_call (path (scoped_identifier (identifier) @function)))

(scoped_identifier (path (scoped_identifier (identifier) @module)))
(scoped_identifier (path (identifier) @module))

(type) @type
(num_type_specifier) @type

(num_const) @number

(boolean) @boolean

(comment) @comment

(char_literal) @string
(string_literal) @string

[
  "as"
] @keyword

"fn" @keyword.function

"extern" @keyword.import

[
 "return"
] @keyword.return

[
 "while"
] @keyword.repeat

[
  "if"
] @keyword.conditional


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
  "&&"
  "||"
  "->"
] @operator

[
  "("
  ")"
  "{"
  "}"
  "["
  "]"
] @punctuation.bracket

[
  "::"
  ":"
  ";"
] @punctuation.delimiter
