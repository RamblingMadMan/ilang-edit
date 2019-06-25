import QtQuick 2.6
import QtQuick.Controls 2.5

Item {
	id: editorView

	ScrollView {
		id: editorTextView
		anchors.fill: parent

		TextArea {
			objectName: "codeEditor"
			color: "#eaeaea"
			//persistentSelection: true
			selectByMouse: true
			readOnly: false
			font.family: codeFont.name
			font.pointSize: 12
			text: "f(x) = 2^x\n"
		}
	}
} 
