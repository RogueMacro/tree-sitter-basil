(identifier) @variable
((identifier) @variable.builtin (#eq? @variable.builtin "self"))
((identifier) @constant (#match? @constant "^[A-Z0-9_]+$"))
(struct_field (identifier) @variable.member)

((scoped_identifier (path (scoped_identifier (identifier) @module (#match? @module "^[a-z][a-zA-Z0-9]*$")))))
((scoped_identifier (path (scoped_identifier (identifier) @type (#match? @type "^[A-Z][a-zA-Z0-9]*$")))))

((path (scoped_identifier (identifier) @module (#match? @module "^[a-z][a-zA-Z0-9]*$"))))
((path (scoped_identifier (identifier) @type (#match? @type "^[A-Z][a-zA-Z0-9]*$"))))

(path (identifier) @module (#match? @module "^[a-z][a-zA-Z0-9]*$"))
(path (identifier) @type (#match? @type "^[A-Z][a-zA-Z0-9]*$"))

(function_definition (identifier) @function)
(function_call (path (identifier) @function (#set! "priority" 200)))
(function_call (path (scoped_identifier (identifier) @function (#set! "priority" 200))))

((type) @type (#set! "priority" 200))
(num_type_specifier) @type
(struct_definition (identifier) @type.definition)
; (impl_definition (type (path (identifier) @type)))

(package_definition (identifier) @module)
(mod_definition (identifier) @module)

(num_const) @number

(boolean) @boolean

(comment) @comment

(char_literal) @string
(string_literal) @string

[
  "as"
  "memory"
  "impl"
  "package"
  "mod"
] @keyword

"fn" @keyword.function

[
 "extern"
 "use"
] @keyword.import

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
