parser grammar C2R2Parser;

options {
	tokenVocab = C2R2Lexer;
}

//Parser Rules
expr
	:	leaf
	|   function LPAREN expr RPAREN //function application
	|	LPAREN expr RPAREN	//parentheses
	|   VERT expr VERT //absolute value
	|	<assoc=right> expr POWER expr
	|	(PLUS | MINUS) expr //unary plus/minus
	|	expr { _input->LT(1)->getType() != PLUS &&  _input->LT(1)->getType() != MINUS }? expr //implicit multiplication
	|	expr (DIV | MUL) expr //division and explicit multiplication
	|	expr (PLUS | MINUS) expr //addition/subtraction
	;

//Function names
function: RE | IM | ABS | ARG | RECIP | CONJ | EXP | LOG | SINH | COSH | TANH | COTH | SECH | CSCH | SIN | COS | TAN | SEC | CSC | COT | POW | SQRT | ARCSIN | ARCCOS | ARCTAN | ARCCOT | ARCSEC | ARCCSC | ARCSINH | ARCCOSH | ARCTANH | ARCCOTH | ARCSECH | ARCCSCH | GAMMA;

//Leaves
leaf:	VARNAME | FLOAT | EYE | PI | E | DIGITS;