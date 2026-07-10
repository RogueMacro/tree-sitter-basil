/**
 * @file Green
 * @author William Tetlie <william.tetlie@gmail.com>
 * @license MIT
 */

/// <reference types="tree-sitter-cli/dsl" />
// @ts-check

const identifierString = /[_a-zA-Z][_a-zA-Z0-9]*/;

export default grammar({
  name: "basil",

  rules: {
    source_file: $ => repeat($.definition),
    
    definition: $ => choice(
      $.extern_definition,
      $.function_definition,
      $.memory_definition,
      $.struct_definition,
      $.comment
    ),

    extern_definition: $ => seq(
      "extern",
      $.identifier,
      ";"
    ),

    memory_definition: $ => seq(
      "memory",
      $.identifier,
      ":",
      $.type,
      ";"
    ),

    struct_definition: $ => seq(
      "struct",
      $.identifier,
      "{",
      repeat($.struct_field),
      "}"
    ),

    struct_field: $ => seq($.identifier, ":", $.type, optional(",")),


    function_definition: $ => seq(
      "fn",
      $.identifier,
      $.parameter_list,
      optional($.return_type),
      choice(
        $.block,
        ";"
      )
    ),

    return_type: $ => seq(
      "->",
      $.type,
    ),

    parameter_list: $ => seq(
      "(",
      repeat(
        seq(
          $.identifier,
          ":",
          $.type,
          optional(",")
        )
      ),
      ")"
    ),

    block: $ => seq(
      "{",
      repeat($.statement),
      "}"
    ),

    statement: $ => choice(
      $.assignment,
      $.while,
      $.if,
      $.return,
      $.comment,
      seq($.expression, ";"),
    ),

    assignment: $ => seq(
      $.expression,
      choice(
        ":=",
        "="
      ),
      $.expression,
      ";"
    ),

    deref: $ => seq(
      "*",
      $.identifier
    ),

    while: $ => seq(
      "while",
      $.expression,
      "{",
      repeat($.statement),
      "}"
    ),

    if: $ => seq(
      "if",
      $.expression,
      "{",
      repeat($.statement),
      "}"
    ),

    return: $ => seq(
      "return",
      $.expression,
      ";"
    ),

    comment: $ => seq(
      "//",
      token.immediate(prec(1, /.*/))
    ),

    expression: $ => choice(
      $.number,
      $.char_literal,
      $.string_literal,
      $.indexing,
      seq(optional("&"), $.identifier),
      $.binary_expression,
      $.function_call,
      $.cast,
      $.boolean,
    ),

    indexing: $ => seq(
      $.identifier,
      "[",
      $.expression,
      "]"
    ),

    binary_expression: $ => choice(
      prec.left(6, seq(choice("!", "-"), $.expression)),
      prec.left(5, seq($.expression, choice("*", "/"), $.expression)),
      prec.left(4, seq($.expression, choice("+", "-"), $.expression)),
      prec.left(3, seq($.expression, choice("<", "<=", ">", ">=", "==", "!="), $.expression)),
      prec.left(2, seq($.expression, "&&", $.expression)),
      prec.left(1, seq($.expression, "||", $.expression)),
    ),

    function_call: $ => seq(
      $.path,
      $.call_argument_list,
    ),

    call_argument_list: $ => seq(
      "(",
      repeat(
        seq(
          $.expression,
          optional(",")
        )
      ),
      ")"
    ),

    cast: $ => seq(
      $.expression,
      "as",
      $.type,
    ),

    path: $ => choice(
      $.identifier,
      $.scoped_identifier,
    ),

    identifier: $ => identifierString,

    scoped_identifier: $ => seq(
      $.path,
      "::",
      $.identifier
    ),

    type: $ => seq(
      optional("&"),
      identifierString
    ),

    boolean: $ => choice(
      "true",
      "false"
    ),

    number: $ => choice(
      $.num_const,
      seq($.num_const, alias(choice(token.immediate("u64"), token.immediate("i64")), $.num_type_specifier)),
    ),

    num_const: $ => /\d+/,

    char_literal: $ => seq(
      "'",
      choice(
        seq("\\", /[a-zA-Z0-9]/),
        /[^\\']/
      ),
      "'"
    ),

    string_literal: $ => seq(
      '"',
      repeat(
        choice(
          seq("\\", /[a-zA-Z0-9]/),
          /[^\\"]/
        ),
      ),
      '"'
    ),
  }
});
