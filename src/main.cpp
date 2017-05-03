//
// Created by Robert Jacobson on 5/2/17.
//

#include <iostream>

#include "antlr4-runtime.h"
#include "C2R2Lexer.h"
#include "C2R2Parser.h"

using namespace c2r2;
using namespace antlr4;

int main(int , const char **) {
    ANTLRInputStream input(u8"3-+2");
    C2R2Lexer lexer(&input);
    CommonTokenStream tokens(&lexer);

    tokens.fill();
    for (auto token : tokens.getTokens()) {
        std::cout << token->toString() << std::endl;
    }

    C2R2Parser parser(&tokens);
    tree::ParseTree* tree = parser.expr();

    std::cout << tree->toStringTree(&parser) << std::endl << std::endl;

    return 0;
}