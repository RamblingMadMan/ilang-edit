#ifndef ILANG_EDIT_REPL
#define ILANG_EDIT_REPL 1

#include <cmath>

#include <QWidget>
#include <QPainter>
#include <QApplication>
#include <QScrollBar>
#include <QLabel>
#include <QLineEdit>
#include <QToolButton>
#include <QPushButton>
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
				toggleButton.setArrowType(Qt::ArrowType::DownArrow);
				toggleButton.setCheckable(true);
				toggleButton.setChecked(true);

				auto spacing = int(std::floor(fontMetrics.lineSpacing() * 0.5));

				outputLabel.setSizePolicy(QSizePolicy::MinimumExpanding, QSizePolicy::Maximum);
				outputLabel.setText(QString::fromStdString(inputStr));
				outputLabel.setFixedHeight(fontMetrics.height() + spacing);
				outputLabel.setReadOnly(true);

				details.setSizePolicy(QSizePolicy::MinimumExpanding, QSizePolicy::Maximum);
				//details.setFixedHeight(fontMetrics.height() * 2 + spacing);

				QObject::connect(&toggleButton, &QToolButton::clicked, [this](bool checked){
					toggleDetails(checked);
				});

				headerLayout.addWidget(&toggleButton);
				headerLayout.addWidget(&outputLabel);

				layout.setSizeConstraint(QLayout::SetMinimumSize);
				layout.addLayout(&headerLayout);
				layout.addWidget(&details);
				//layout.setSpacing(0);
			}

			void hideDetails(){
				toggleDetails(false);
			}

			void showDetails(){
				toggleDetails(true);
			}

			void toggleDetails(bool isShown){
				toggleButton.setChecked(true);
				toggleButton.setArrowType(isShown ? Qt::ArrowType::DownArrow : Qt::ArrowType::RightArrow);
				isShown ? details.show() : details.hide();
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
				outputArea->setSizePolicy(QSizePolicy::MinimumExpanding, QSizePolicy::Maximum);
				outputArea->setLayout(new QVBoxLayout(outputArea));
				outputArea->layout()->setAlignment(Qt::AlignBottom);
				outputArea->layout()->setMargin(0);
				outputArea->setContentsMargins(0, 0, 0, 0);

				scrollArea.setSizePolicy(QSizePolicy::MinimumExpanding, QSizePolicy::MinimumExpanding);
				scrollArea.setAlignment(Qt::AlignBottom);
				scrollArea.setWidgetResizable(true);
				scrollArea.setWidget(outputArea);

				minimizeAllBtn.setSizePolicy(QSizePolicy::Maximum, QSizePolicy::Maximum);
				maximizeAllBtn.setSizePolicy(QSizePolicy::Maximum, QSizePolicy::Maximum);
				minimizeAllBtn.setText("Minimize All");
				maximizeAllBtn.setText("Maximize All");

				QObject::connect(&minimizeAllBtn, &QToolButton::pressed, [this]{
					for(int i = 0; i < outputArea->layout()->count(); i++){
						auto obj = outputArea->layout()->itemAt(i)->widget();
						if(auto output = dynamic_cast<ReplOutput*>(obj))
							output->hideDetails();
					}
				});

				QObject::connect(&maximizeAllBtn, &QToolButton::pressed, [this]{
					for(int i = 0; i < outputArea->layout()->count(); i++){
						auto obj = outputArea->layout()->itemAt(i)->widget();
						if(auto output = dynamic_cast<ReplOutput*>(obj))
							output->showDetails();
					}
				});

				toolBarLayout.setAlignment(Qt::AlignLeft);
				toolBarLayout.setSizeConstraint(QLayout::SetFixedSize);
				toolBarLayout.addWidget(&minimizeAllBtn);
				toolBarLayout.addWidget(&maximizeAllBtn);

				layout.addLayout(&toolBarLayout);
				layout.addWidget(&scrollArea);
			}

			void addWidget(QWidget *widget){
				emit minimizeAllBtn.click();
				widget->setParent(outputArea);
				outputArea->layout()->addWidget(widget);
				scrollArea.ensureWidgetVisible(widget, 0, 0);
				scrollArea.verticalScrollBar()->setSliderPosition(scrollArea.verticalScrollBar()->maximum());
			}

		private:
			QVBoxLayout layout;
			QScrollArea scrollArea;
			QHBoxLayout toolBarLayout;
			QPushButton minimizeAllBtn, maximizeAllBtn;
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
				auto replOutput = new ReplOutput(typeData, std::move(input), std::move(result));
				replOutput->setSizePolicy(QSizePolicy::MinimumExpanding, QSizePolicy::Maximum);
				output->addWidget(replOutput);
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
				replLine.setFixedHeight(fontMetrics.height() * 2 + (fontMetrics.lineSpacing() / 2));

				output.setSizePolicy(QSizePolicy::MinimumExpanding, QSizePolicy::MinimumExpanding);

				layout.setAlignment(Qt::AlignBottom);
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
