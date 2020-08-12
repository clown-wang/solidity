lexer grammar SolidityLexer;

/**
 * Keywords reserved for future use in Solidity.
 */
ReservedKeywords:
    'after' | 'alias' | 'apply' | 'auto' | 'case' | 'copyof' | 'default' | 'define' | 'final'
    | 'implements' | 'in' | 'inline' | 'let' | 'macro' | 'match' | 'mutable' | 'null' | 'of'
    | 'partial' | 'promise' | 'reference' | 'relocatable' | 'sealed' | 'sizeof' | 'static'
    | 'supports' | 'switch' | 'typedef' | 'typeof' | 'unchecked' | 'var';

Pragma: 'pragma' -> pushMode(PragmaMode);
Abstract: 'abstract';
Anonymous: 'anonymous';
Address: 'address';
As: 'as';
Assembly: 'assembly' -> pushMode(AssemblyBlockMode);
Bool: 'bool';
Break: 'break';
Bytes: 'bytes';
Calldata: 'calldata';
Catch: 'catch';
Constant: 'constant';
Constructor: 'constructor';
Continue: 'continue';
Contract: 'contract';
Delete: 'delete';
Do: 'do';
Else: 'else';
Emit: 'emit';
Enum: 'enum';
Event: 'event';
External: 'external';
Fallback: 'fallback';
False: 'false';
Fixed: 'fixed' | ('fixed' [0-9]+ 'x' [0-9]+);
From: 'from';
/**
 * Bytes types of fixed length.
 * byte is an alias of bytes1.
 */
FixedBytes:
	'byte' | 'bytes1' | 'bytes2' | 'bytes3' | 'bytes4' | 'bytes5' | 'bytes6' | 'bytes7' | 'bytes8' |
	'bytes9' | 'bytes10' | 'bytes11' | 'bytes12' | 'bytes13' | 'bytes14' | 'bytes15' | 'bytes16' |
	'bytes17' | 'bytes18' | 'bytes19' | 'bytes20' | 'bytes21' | 'bytes22' | 'bytes23' | 'bytes24' |
	'bytes25' | 'bytes26' | 'bytes27' | 'bytes28' | 'bytes29' | 'bytes30' | 'bytes31' | 'bytes32';
For: 'for';
Function: 'function';
Hex: 'hex';
If: 'if';
Immutable: 'immutable';
Import: 'import';
Indexed: 'indexed';
Interface: 'interface';
Internal: 'internal';
Is: 'is';
Library: 'library';
Mapping: 'mapping';
Memory: 'memory';
Modifier: 'modifier';
New: 'new';
/**
 * Unit denomination for numbers.
 */
NumberUnit: 'wei' | 'gwei' | 'ether' | 'seconds' | 'minutes' | 'hours' | 'days' | 'weeks' | 'years';
Override: 'override';
Payable: 'payable';
Private: 'private';
Public: 'public';
Pure: 'pure';
Receive: 'receive';
Return: 'return';
Returns: 'returns';
/**
 * Sized signed integer types.
 * int is an alias of int256.
 */
SignedIntegerType:
	'int' | 'int8' | 'int16' | 'int24' | 'int32' | 'int40' | 'int48' | 'int56' | 'int64' |
	'int72' | 'int80' | 'int88' | 'int96' | 'int104' | 'int112' | 'int120' | 'int128' |
	'int136' | 'int144' | 'int152' | 'int160' | 'int168' | 'int176' | 'int184' | 'int192' |
	'int200' | 'int208' | 'int216' | 'int224' | 'int232' | 'int240' | 'int248' | 'int256';
Storage: 'storage';
String: 'string';
Struct: 'struct';
True: 'true';
Try: 'try';
Type: 'type';
Ufixed: 'ufixed' | ('ufixed' [0-9]+ 'x' [0-9]+);
/**
 * Sized unsigned integer types.
 * uint is an alias of uint256.
 */
UnsignedIntegerType:
	'uint' | 'uint8' | 'uint16' | 'uint24' | 'uint32' | 'uint40' | 'uint48' | 'uint56' | 'uint64' |
	'uint72' | 'uint80' | 'uint88' | 'uint96' | 'uint104' | 'uint112' | 'uint120' | 'uint128' |
	'uint136' | 'uint144' | 'uint152' | 'uint160' | 'uint168' | 'uint176' | 'uint184' | 'uint192' |
	'uint200' | 'uint208' | 'uint216' | 'uint224' | 'uint232' | 'uint240' | 'uint248' | 'uint256';
Using: 'using';
View: 'view';
Virtual: 'virtual';
While: 'while';

LParen: '(';
RParen: ')';
LBrack: '[';
RBrack: ']';
LBrace: '{';
RBrace: '}';
Colon: ':';
Semicolon: ';';
Period: '.';
Conditional: '?';
Arrow: '=>';

Assign: '=';
AssignBitOr: '|=';
AssignBitXor: '^=';
AssignBitAnd: '&=';
AssignShl: '<<=';
AssignSar: '>>=';
AssignShr: '>>>=';
AssignAdd: '+=';
AssignSub: '-=';
AssignMul: '*=';
AssignDiv: '/=';
AssignMod: '%=';

Comma: ',';
Or: '||';
And: '&&';
BitOr: '|';
BitXor: '^';
BitAnd: '&';
Shl: '<<';
Sar: '>>';
Shr: '>>>';
Add: '+';
Sub: '-';
Mul: '*';
Div: '/';
Mod: '%';
Exp: '**';

Equal: '==';
NotEqual: '!=';
LessThan: '<';
GreaterThan: '>';
LessThanOrEqual: '<=';
GreaterThanOrEqual: '>=';
Not: '!';
BitNot: '~';
Inc: '++';
Dec: '--';

/**
 * A single quoted string literal.
 */
StringLiteral: '"' DoubleQuotedStringCharacter* '"' | '\'' SingleQuotedStringCharacter* '\'';
UnicodeStringLiteral: 'unicode"' DoubleQuotedStringCharacter* '"' | 'unicode\'' SingleQuotedStringCharacter* '\'';
//@doc:inline
fragment DoubleQuotedStringCharacter: ~["\r\n\\] | ('\\' .);
//@doc:inline
fragment SingleQuotedStringCharacter: ~['\r\n\\] | ('\\' .);

/**
 * Hex strings need to consist of an even number of hex digits that may be grouped using underscores.
 */
HexString: 'hex' (('"' EvenHexDigits? '"') | ('\'' EvenHexDigits? '\''));
/**
 * Hex numbers consist of a prefix and an arbitrary number of hex digits that may be delimited by underscores.
 */
HexNumber: '0' [xX] HexDigits;
//@doc:inline
fragment HexDigits: HexCharacter ('_'? HexCharacter)*;
//@doc:inline
fragment EvenHexDigits: HexCharacter HexCharacter ('_'? HexCharacter HexCharacter)*;
//@doc:inline
fragment HexCharacter: [0-9A-Fa-f];

/**
 * A decimal number literal consists of decimal digits that may be delimited by underscores and
 * an optional positive or negative exponent.
 * If the digits contain a decimal point, the literal has fixed point type.
 */
DecimalNumber: (DecimalDigits | (DecimalDigits? '.' DecimalDigits)) ([eE] '-'? DecimalDigits)?;
//@doc:inline
fragment DecimalDigits: [0-9] ('_'? [0-9])* ;


/**
 * An identifier in solidity has to start with a letter, a dollar-sign or an underscore and
 * may additionally contain numbers after the first symbol.
 */
Identifier: IdentifierStart IdentifierPart*;
//@doc:inline
fragment IdentifierStart: [a-zA-Z$_];
//@doc:inline
fragment IdentifierPart: [a-zA-Z0-9$_];

WS: [ \t\r\n\u000C]+ -> skip ;
COMMENT: '/*' .*? '*/' -> channel(HIDDEN) ;
LINE_COMMENT: '//' ~[\r\n]* -> channel(HIDDEN);

mode AssemblyBlockMode;

//@doc:inline
AssemblyDialect: '"evmasm"';
AssemblyLBrace: '{' -> popMode, pushMode(YulMode);

AssemblyBlockWS: [ \t\r\n\u000C]+ -> skip ;
AssemblyBlockCOMMENT: '/*' .*? '*/' -> channel(HIDDEN) ;
AssemblyBlockLINE_COMMENT: '//' ~[\r\n]* -> channel(HIDDEN) ;

mode YulMode;

YulBreak: 'break';
YulCase: 'case';
YulContinue: 'continue';
YulDefault: 'default';
YulFalse: 'false';
YulFor: 'for';
YulFunction: 'function';
YulIf: 'if';
YulLeave: 'leave';
YulLet: 'let';
YulSwitch: 'switch';
YulTrue: 'true';

/**
 * Builtin functions in the EVM Yul dialect.
 */
YulEVMBuiltin:
    'stop' | 'add' | 'sub' | 'mul' | 'div' | 'sdiv' | 'mod' | 'smod' | 'exp' | 'not'
    | 'lt' | 'gt' | 'slt' | 'sgt' | 'eq' | 'iszero' | 'and' | 'or' | 'xor' | 'byte'
    | 'shl' | 'shr' | 'sar' | 'addmod' | 'mulmod' | 'signextend' | 'keccak256'
    | 'pop' | 'mload' | 'mstore' | 'mstore8' | 'sload' | 'sstore' | 'msize' | 'gas'
    | 'address' | 'balance' | 'selfbalance' | 'caller' | 'callvalue' | 'calldataload'
    | 'calldatasize' | 'calldatacopy' | 'extcodesize' | 'extcodecopy' | 'returndatasize'
    | 'returndatacopy' | 'extcodehash' | 'create' | 'create2' | 'call' | 'callcode'
    | 'delegatecall' | 'staticcall' | 'return' | 'revert' | 'selfdestruct' | 'invalid'
    | 'log0' | 'log1' | 'log2' | 'log3' | 'log4' | 'chainid' | 'origin' | 'gasprice'
    | 'blockhash' | 'coinbase' | 'timestamp' | 'number' | 'difficulty' | 'gaslimit';

YulLBrace: '{' -> pushMode(YulMode);
YulRBrace: '}' -> popMode;
YulLParen: '(';
YulRParen: ')';
YulAssign: ':=';
YulPeriod: '.';
YulComma: ',';
YulArrow: '->';

/**
 * Yul identifiers consist of letters, dollar signs, underscores and numbers, but may not start with a number.
 */
YulIdentifier: YulIdentifierStart YulIdentifierPart*;
//@doc:inline
fragment YulIdentifierStart: [a-zA-Z$_];
//@doc:inline
fragment YulIdentifierPart: [a-zA-Z0-9$_];
/**
 * Hex literals in Yul consist of a prefix and one or more hexadecimal digits.
 */
YulHexNumber: '0' 'x' [0-9a-fA-F]+;
/**
 * Decimal literals in Yul may be zero or any sequence of decimal digits without leading zeroes.
 */
YulDecimalNumber: '0' | ([1-9] [0-9]*);
/**
 * String literals in Yul consist of one or more double quoted strings that may contain escape sequences
 * and regular characters except unescaped line breaks or quotes.
 */
YulStringLiteral: '"' YulDoubleQuotedStringCharacter* '"';
//@doc:inline
fragment YulDoubleQuotedStringCharacter: ~["\r\n\\] | ('\\' .);

YulWS: [ \t\r\n\u000C]+ -> skip ;
YulCOMMENT: '/*' .*? '*/' -> channel(HIDDEN) ;
YulLINE_COMMENT: '//' ~[\r\n]* -> channel(HIDDEN) ;

mode PragmaMode;

/**
 * Pragma token. Can contain any kind of symbol except a semicolon.
 */
//@doc:name PragmaToken
//@doc:no-diagram
PragmaToken: ~[;]+;
PragmaSemicolon: ';' -> popMode;

PragmaWS: [ \t\r\n\u000C]+ -> skip ;
PragmaCOMMENT: '/*' .*? '*/' -> channel(HIDDEN) ;
PragmaLINE_COMMENT: '//' ~[\r\n]* -> channel(HIDDEN) ;
