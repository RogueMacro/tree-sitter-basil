(identifier) @variable
(struct_field (identifier) @variable.member)

(function_definition (identifier) @function)

(function_call (path (identifier) @function))
(function_call (path (scoped_identifier (identifier) @function)))

(scoped_identifier (path (scoped_identifier (identifier) @module)))
(scoped_identifier (path (identifier) @module))

((type) @type (#set! "priority" 200))
(num_type_specifier) @type
(struct_definition (identifier) @type.definition)
(impl_definition (identifier) @type)


(num_const) @number

(boolean) @boolean

(comment) @comment

(char_literal) @string
(string_literal) @string

[
  "as"
  "memory"
  "impl"
] @keyword

"fn" @keyword.function

"extern" @keyword.import

"struct" @keyword.type

"return" @keyword.return

"while" @keyword.repeat

"if" @keyword.conditional


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
  "!"
  "."
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
