import QtQuick 2.6
import QtQuick.Controls 2.5

Item {
	id: replView

	ScrollView {
		id: replOutputView
		anchors.fill: parent

		TextArea {
			anchors.top: parent.top
			anchors.left: parent.left
			anchors.right: parent.right

			objectName: "replOutput"
			//persistentSelection: true
			selectByMouse: true
			readOnly: true
			color: "#eaeaea"
			font.family: codeFont.name
			font.pointSize: 12
			text: ""
		}
	}

	TextArea {
		id: replInput

		anchors.bottom: parent.bottom
		anchors.left: parent.left
		anchors.right: parent.right

		objectName: "replInput"
		//persistentSelection: true
		selectByMouse: true
		readOnly: false
		color: "#eaeaea"
		font.family: codeFont.name
		font.pointSize: 12

		Keys.onPressed: {
			if(event.key == Qt.Key_Enter){

			}
		}
	}
} 
