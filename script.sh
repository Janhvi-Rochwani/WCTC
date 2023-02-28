clear
bison -d -t -v parser.y
flex lexer.l
g++ -o WCTC parser.tab.c lex.yy.c node.cpp main.cpp -ll
./WCTC < test.java
rm lex.yy.c parser.tab.h parser.tab.c
dot -Tpng tree.gv -o ast.png

# typename and package name are just Name

# Name -> Name "." ID
# $$ = new node("Name", false);
# string s($3);
# add_child($$, $1);
# node* temp_node = new node(".", true, "DELIMITER");
# add_child($$, temp_node);
# temp_node = new node(s, true, "ID");
# add_child($$, temp_node);

# qIdentifierDot FormalParamterList FormalParameterList? FormalParameter sCommaFormalParameter VariableArityParameter pVariableModifier Throws qThrows MethodBody InstanceInitializer StaticInitializer ConstructorDeclaration ConstructorDeclarator COnstructorBody ExplicitConstructorInvocation BracketArgumentList