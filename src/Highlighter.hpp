#ifndef ILANG_EDIT_HIGHLIGHTER_HPP
#define ILANG_EDIT_HIGHLIGHTER_HPP 1

#include <QSyntaxHighlighter>

#include "ilang/Type.hpp"
#include "ilang/Lexer.hpp"

namespace ile{
	class Highlighter: public QSyntaxHighlighter{
		public:
			Highlighter(QTextDocument *doc)
				: QSyntaxHighlighter(doc){
				regFmt.setForeground(QColor(200, 200, 200));
				idFmt.setForeground(QColor(100, 220, 100));
				typeFmt.setForeground(QColor(200, 100, 200));
				numFmt.setForeground(QColor(100, 200, 200));
				strFmt.setForeground(QColor(200, 100, 100));
			}

			void highlightBlock(const QString &text) override{
				using namespace ilang;
				auto src = text.toStdString();

				try {
					auto lexed = lex(src);

					int index = 0;

					while(lexed.token.type != TokenType::eof){
						auto &&tok = lexed.token;

						auto fmtPtr = &regFmt;

						auto str = as<std::string>(tok);
						auto len = int(str.length());

						switch(tok.type){
							case TokenType::id:{
								fmtPtr = findTypeByString(typeData, str) ? &typeFmt : &idFmt;
								break;
							}

							case TokenType::int_:
							case TokenType::real:{
								fmtPtr = &numFmt;
								break;
							}

							case TokenType::str:{
								fmtPtr = &strFmt;
								len += 2;
								break;
							}

							default:
								break;
						}

						this->setFormat(index, len, *fmtPtr);
						index += len;

						lexed = lex(std::move(lexed));
					}
				}
				catch (const LexError &err) {
					return;
				}
				catch(...){
					throw;
				}
			}

		private:
			ilang::TypeData typeData;
			QTextCharFormat regFmt, idFmt, typeFmt, numFmt, strFmt;
	};
}

#endif // !ILANG_EDIT_HIGHLIGHTER_HPP
