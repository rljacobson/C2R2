lexer grammar C2R2Lexer;

// Lexer Rules

// Operators
PLUS	:	'+'	;
MINUS	:	'-'	;
DIV	:	'/'	;
MUL	:	'*'	;
POWER	:	'^'	;

// Bracketers
VERT    : '|';
LPAREN	:	'('	;
RPAREN	:	')'	;

RE	: 're';
IM	: 'im';
ABS	: 'abs';
ARG	: 'arg';
RECIP	: 'recip';
CONJ	: 'conj';
EXP	: 'exp';
LOG	: 'log';
SINH	: 'sinh';
COSH	: 'cosh';
TANH	: 'tanh';
COTH	: 'coth';
SECH	: 'sech';
CSCH	: 'csch';
SIN	: 'sin';
COS	: 'cos';
TAN	: 'tan';
SEC	: 'sec';
CSC	: 'csc';
COT	: 'cot';
POW	: 'pow';
SQRT	: 'sqrt';
ARCSIN	: 'arcsin';
ARCCOS	: 'arccos';
ARCTAN	: 'arctan';
ARCTAN2	: 'arctan2';
ARCCOT	: 'arccot';
ARCSEC	: 'arcsec';
ARCCSC	: 'arccsc';
ARCSINH	: 'arcsinh';
ARCCOSH	: 'arccosh';
ARCTANH	: 'arctanh';
ARCCOTH	: 'arccoth';
ARCSECH	: 'arcsech';
ARCCSCH	: 'arccsch';
GAMMA	: 'gamma';

// Variables and Constants
VARNAME : 'x' | 'y' | 'z';
EYE     : 'i' | 'I';
PI      : 'pi' | 'Pi' | 'PI';
E       : 'e' | 'E';

// Number Representations
DOT     :   '.' ;
FLOAT
	:	DIGITS DOT DIGIT* NUMBERTYPE?	//We can omit numbers after the decimal point and not before, or...
	|	DIGIT* DOT DIGITS NUMBERTYPE?	//...before the decimal point and not after.
	|	DIGITS	NUMBERTYPE?			//Or we don't need a decimal point.
	;
DIGITS : DIGIT+; //Integers are DIGITS.
fragment
DIGIT	: [0-9];
fragment
NUMBERTYPE : 'f' | 'd';

WS  :   [ \t\r\n]+ -> skip ;