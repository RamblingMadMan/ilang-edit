#include <iostream>

#include <QApplication>
#include <QWidget>
#include <QHBoxLayout>

#include "ilang/Type.hpp"
#include "ilang/Lexer.hpp"
#include "ilang/Util.hpp"

#include "Repl.hpp"
#include "Editor.hpp"

using namespace ile;

int main(int argc, char *argv[]){
	QApplication app(argc, argv);

	int fontId = QFontDatabase::addApplicationFont(":/fonts/Monoid-Retina.ttf");

	QWidget window;

	QHBoxLayout layout(&window);

	Editor editor;
	Repl repl(&editor);

	layout.addWidget(&editor);
	layout.addWidget(&repl);

	window.resize(1024, 600);
	window.show();
	window.setWindowTitle(
		QApplication::translate("ilang-edit", "Infinity Lang Editor")
	);

	return app.exec();
} 
