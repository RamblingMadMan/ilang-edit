#ifndef ILANG_EDIT_REPL
#define ILANG_EDIT_REPL 1

#include <QWidget>
#include <QTextEdit>
#include <QLineEdit>
#include <QHBoxLayout>
#include <QVBoxLayout>

#include "ilang/Parser.hpp"
#include "ilang/Eval.hpp"

#include "Editor.hpp"

namespace ile{
	class ReplLine: public QTextEdit{
			Q_OBJECT

		public:
			ReplLine(Editor *editor_, QTextEdit *output_, QWidget *parent = nullptr)
				: QTextEdit(parent)
				, editor(editor_)
				, output(output_)
				, highlighter(this->document())
			{

			}

		protected:
			void keyPressEvent(QKeyEvent *keyEv) override{
				if(keyEv->key() == Qt::Key_Return || keyEv->key() == Qt::Key_Enter){
					//try {
						ilang::EvalData evalData;
						ilang::Ast ast;
						auto rootExprs = editor->parse(evalData.typeData, ast);

						for(auto &&expr : rootExprs){
							ilang::eval({expr.get()}, evalData);
						}

						auto rawText = this->document()->toRawText();
						auto rawTextStr = rawText.toStdString();

						auto toks = ilang::lexAll(rawTextStr);

						auto exprs = ilang::parseAll(rawTextStr, evalData.typeData, ast);

						for(auto &&expr : exprs){
							auto result = ilang::eval({expr.get()}, evalData);
							if(result.result)
								outputResult(std::move(result.result));
						}
					/*}
					catch(const ilang::LexError &e){ outputError(std::string("lex error: ") + e.what()); }
					catch(const ilang::ParseError &e){ outputError(std::string("parse error: ") + e.what()); }
					catch(const ilang::EvalError &e){ outputError(std::string("eval error: ") + e.what()); }
					catch(...){
						throw;
					}*/

					this->clear();
				}
				else {
					QTextEdit::keyPressEvent(keyEv);
				}
			}

		private:
			void outputError(const std::string &msg){
				auto str = QString::fromStdString(msg + "\n");
				auto cursor = output->textCursor();
				cursor.beginEditBlock();
				cursor.insertText(str);
				cursor.endEditBlock();
			}

			void outputResult(ilang::ResultPtr result){
				auto resultStr = result->toString() + "\n";
				auto outStr = QString::fromStdString(resultStr);

				auto cursor = output->textCursor();
				cursor.beginEditBlock();
				cursor.insertText(outStr);
				cursor.endEditBlock();

				//output->insertPlainText(outStr);
			}

			Editor *editor;
			QTextEdit *output;
			Highlighter highlighter;
	};

	class Repl: public QWidget{
			Q_OBJECT

		public:
			explicit Repl(Editor *editor_, QWidget *parent = nullptr)
				: QWidget(parent)
				, editor(editor_)
				, layout(this)
				, monoidFont("Monoid")
				, output()
				, replLine(editor, &output)
			{
				monoidFont.setStyleHint(QFont::TypeWriter);

				output.setFont(monoidFont);
				replLine.setFont(monoidFont);

				QFontMetrics fontMetrics(monoidFont);
				replLine.setFixedHeight(fontMetrics.height() + fontMetrics.lineSpacing());

				output.setReadOnly(true);

				layout.addWidget(&output);
				layout.addWidget(&replLine);
			}

		private:
			Editor *editor;
			QVBoxLayout layout;
			QFont monoidFont;
			QTextEdit output;
			ReplLine replLine;
	};
}

#endif // !ILANG_EDIT_REPL 
