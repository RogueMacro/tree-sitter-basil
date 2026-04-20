(identifier) @variable


(function_definition (identifier) @function)

(function_call (path (identifier) @function))
(function_call (path (scoped_identifier (identifier) @function)))

(type) @type

(number) @number

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
