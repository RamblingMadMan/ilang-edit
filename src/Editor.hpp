#ifndef ILANG_EDIT_EDITOR_HPP
#define ILANG_EDIT_EDITOR_HPP 1

#include <iostream>

#include <QWidget>
#include <QTextEdit>
#include <QVBoxLayout>

#include "ilang/Parser.hpp"
#include "ilang/Eval.hpp"

#include "Highlighter.hpp"

namespace ile{
	class Editor: public QWidget{
		Q_OBJECT

		public:
			explicit Editor(QWidget *parent = nullptr)
				: QWidget(parent)
				, monoidFont("Monoid")
				, layout(this)
				, highlighter(textEdit.document())
			{
				textEdit.setFont(monoidFont);
				layout.addWidget(&textEdit);
			}

			auto parse(ilang::TypeData &typeData, ilang::Ast &ast) const noexcept{
				auto rawText = textEdit.document()->toPlainText();
				auto rawStr = rawText.toStdString();
				return ilang::parseAll(rawStr, typeData, ast);
			}

		private:
			QFont monoidFont;
			QVBoxLayout layout;
			QTextEdit textEdit;
			Highlighter highlighter;

			friend class Repl;
			friend class ReplLine;
	};
}

#endif // !ILANG_EDIT_EDITOR_HPP 
