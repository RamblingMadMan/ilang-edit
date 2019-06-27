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
	class TextEdit: public QTextEdit{
		public:
			template<typename ... Args>
			TextEdit(Args &&... args)
				: QTextEdit(std::forward<Args>(args)...)
				, m_highlighter(this->document()){}

			Highlighter &highlighter() noexcept{ return m_highlighter; }

		private:
			Highlighter m_highlighter;
	};

	class Editor: public QWidget{
		Q_OBJECT

		public:
			explicit Editor(QWidget *parent = nullptr)
				: QWidget(parent)
				, monoidFont("Monoid")
				, layout(this)
			{
				textEdit.setFont(monoidFont);
				layout.addWidget(&textEdit);
			}

			auto parse(ilang::TypeData &typeData, ilang::Ast &ast) const noexcept{
				auto rawText = textEdit.document()->toPlainText();
				auto rawStr = rawText.toStdString();
				auto toks = ilang::lexAll(rawStr);
				return ilang::parseAll(toks, typeData, ast);
			}

		private:
			QFont monoidFont;
			QVBoxLayout layout;
			TextEdit textEdit;

			friend class Repl;
			friend class ReplLine;
	};
}

#endif // !ILANG_EDIT_EDITOR_HPP 
