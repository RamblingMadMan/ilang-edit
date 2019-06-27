#ifndef ILANG_EDIT_REPL
#define ILANG_EDIT_REPL 1

#include <QWidget>
#include <QPainter>
#include <QApplication>
#include <QLabel>
#include <QTextItem>
#include <QLineEdit>
#include <QStyledItemDelegate>
#include <QListWidget>
#include <QToolButton>
#include <QScrollArea>
#include <QHBoxLayout>
#include <QVBoxLayout>
#include <QParallelAnimationGroup>

#include "fmt/core.h"

#include "ilang/Parser.hpp"
#include "ilang/Eval.hpp"

#include "Editor.hpp"

namespace ile{
	class ReplOutputDetails: public TextEdit{
			Q_OBJECT

			friend class ReplOutput;

		public:
			explicit ReplOutputDetails(ilang::TypeData &typeData, ilang::ResultHandle result, QWidget *parent = nullptr)
				: TextEdit(parent)
			{
				auto detail =
					fmt::format(" => {}\n of {}", result->toString(), result->resolveType(typeData)->str);

				setText(QString::fromStdString(detail));
				setReadOnly(true);
				setSizePolicy(QSizePolicy::MinimumExpanding, QSizePolicy::Minimum);
			}
	};

	class ReplOutput: public QWidget{
			Q_OBJECT

		public:
			explicit ReplOutput(ilang::TypeData &typeData, ilang::ExprPtr input_, ilang::ResultPtr result_, QWidget *parent = nullptr)
				: QWidget(parent)
				, input(std::move(input_))
				, result(std::move(result_))
				, details(typeData, result.get())
				, layout(this)
			{
				auto inputStr = input->toString();

				QFont font("Monoid");

				QFontMetrics fontMetrics(font);

				toggleButton.setToolButtonStyle(Qt::ToolButtonIconOnly);
				toggleButton.setArrowType(Qt::ArrowType::RightArrow);
				toggleButton.setCheckable(true);
				toggleButton.setChecked(true);

				outputLabel.setSizePolicy(QSizePolicy::Minimum, QSizePolicy::Minimum);
				outputLabel.setText(QString::fromStdString(inputStr));
				outputLabel.setFixedHeight(fontMetrics.height() + (fontMetrics.lineSpacing() / 2));
				outputLabel.setReadOnly(true);

				details.setFixedHeight(fontMetrics.height() * 2 + fontMetrics.lineSpacing());

				QObject::connect(&toggleButton, &QToolButton::clicked, [this](bool checked){
					toggleButton.setArrowType(checked ? Qt::ArrowType::DownArrow : Qt::ArrowType::RightArrow);
					checked ? details.show() : details.hide();
				});

				headerLayout.addWidget(&toggleButton);
				headerLayout.addWidget(&outputLabel);

				layout.addLayout(&headerLayout);
				layout.addWidget(&details);
				//layout.setSpacing(0);
			}

		private:
			ilang::ExprPtr input;
			ilang::ResultPtr result;

			ReplOutputDetails details;

			QHBoxLayout headerLayout;
			QVBoxLayout layout;
			QToolButton toggleButton;
			TextEdit outputLabel;
	};

	class ReplOutputList: public QWidget{
			Q_OBJECT

		public:
			ReplOutputList(QWidget *parent = nullptr)
				: QWidget(parent)
				, layout(this)
				, scrollArea(this)
			{
				layout.setMargin(0);

				outputArea = new QWidget(this);
				outputArea->setSizePolicy(QSizePolicy::MinimumExpanding, QSizePolicy::MinimumExpanding);
				outputArea->setLayout(new QVBoxLayout(outputArea));
				outputArea->layout()->setAlignment(Qt::AlignTop);
				outputArea->layout()->setMargin(0);
				outputArea->setContentsMargins(0, 0, 0, 0);

				scrollArea.setSizePolicy(QSizePolicy::MinimumExpanding, QSizePolicy::MinimumExpanding);
				scrollArea.setAlignment(Qt::AlignTop);
				scrollArea.setWidgetResizable(true);
				scrollArea.setWidget(outputArea);

				layout.addWidget(&scrollArea);
			}

			void addWidget(QWidget *widget){
				widget->setParent(outputArea);
				outputArea->layout()->addWidget(widget);
			}

		private:
			QVBoxLayout layout;
			QScrollArea scrollArea;
			QWidget *outputArea;
	};

	class ReplLine: public TextEdit{
			Q_OBJECT

		public:
			ReplLine(Editor *editor_, ReplOutputList *output_, QWidget *parent = nullptr)
				: TextEdit(parent)
				, editor(editor_)
				, output(output_)
			{

			}

		protected:
			void keyPressEvent(QKeyEvent *keyEv) override{
				if(keyEv->key() == Qt::Key_Return || keyEv->key() == Qt::Key_Enter){
					//try {
						ilang::EvalData evalData;
						ilang::Ast ast;

						ilang::registerEvalFn<void()>("exit", []{ QApplication::instance()->quit(); }, evalData);

						auto rootExprs = editor->parse(evalData.typeData, ast);

						for(auto &&expr : rootExprs){
							ilang::eval({expr.get()}, evalData);
						}

						auto rawText = this->document()->toPlainText();
						auto rawTextStr = rawText.toStdString();

						auto toks = ilang::lexAll(rawTextStr);
						auto exprs = ilang::parseAll(toks, evalData.typeData, ast);

						for(auto &&expr : exprs){
							auto result = ilang::eval({expr.get()}, evalData);
							if(result.result){
								outputResult(evalData.typeData, std::move(expr), std::move(result.result));
							}
							else
								outputMessage("COULD NOT GET RESULT FROM EXPRESSION");
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
			void outputMessage(const std::string &msg){
				auto str = QString::fromStdString(msg + "\n");
				output->addWidget(new QLabel(str));
				/*
				auto cursor = output->textCursor();
				cursor.beginEditBlock();
				cursor.insertText(str);
				cursor.endEditBlock();
				*/
			}

			void outputResult(ilang::TypeData &typeData, ilang::ExprPtr input, ilang::ResultPtr result){
				auto resultStr = result->toString() + "\n";
				auto outStr = QString::fromStdString(resultStr);
				output->addWidget(new ReplOutput(typeData, std::move(input), std::move(result)));
				/*
				auto cursor = output->textCursor();
				cursor.beginEditBlock();
				cursor.insertText(outStr);
				cursor.endEditBlock();
				*/

				//output->insertPlainText(outStr);
			}

			Editor *editor;
			ReplOutputList *output;
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

				//output.setFont(monoidFont);
				replLine.setFont(monoidFont);

				QFontMetrics fontMetrics(monoidFont);
				replLine.setFixedHeight(fontMetrics.height() + fontMetrics.lineSpacing());

				layout.setAlignment(Qt::AlignTop);
				layout.addWidget(&output);
				layout.addWidget(&replLine);
			}

		private:
			Editor *editor;
			QVBoxLayout layout;
			QFont monoidFont;
			ReplOutputList output;
			ReplLine replLine;
	};
}

#endif // !ILANG_EDIT_REPL 
