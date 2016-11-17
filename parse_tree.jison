%lex
%%

\s+	 	 	/*skip*/
[+-] 		return 'OPERATOR'
'*' 		return 'OPERATOR'
'/' 		return 'OPERATOR'
[0-9]+   	return 'NUMBER'
"("			return 'OPEN'
")"			return 'CLOSE'
<<EOF>>  	return 'EOF'

/lex

%start expressions

%%
expressions : e EOF{console.log('final Result',$$)};
e : OPEN e CLOSE { $$ = $1 + $2 + $3 } 
	| OPERATOR e e { $$ = $2 + $1 + $3 }
	| NUMBER;



