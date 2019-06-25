import QtQuick 2.6
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.10

// main window
ApplicationWindow {
	id: root
	width: 1024
	height: 600
	visible: true

	menuBar: MenuBar {

	}

	header: ToolBar {

	}

	footer: TabBar {

	}

	FontLoader {
		id: codeFont
		source: "qrc:///fonts/Monoid-Retina.ttf"
	}

	Rectangle{
		color: "#3d3d3d"
		anchors.fill: parent

		Editor {
			anchors.top: parent.top
			anchors.left: parent.left
			anchors.right: parent.right
		}

		Repl {
			anchors.bottom: parent.bottom
			anchors.left: parent.left
			anchors.right: parent.right
		}
	}

	/*
	Rectangle {
		color: "#131313"
		anchors.fill: parent

		ScrollView {
			id: textView
			anchors.fill: parent

			TextArea {
				objectName: "codeEditor"
				color: "#eaeaea"
				persistentSelection: true
				selectByMouse: true
				readOnly: false
				font.family: codeFont.name
				font.pointSize: 12
				text: "f(x) = 2^x\n"
			}
		}
	}
	*/
}
