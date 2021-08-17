import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

Popup {
    id: taskContentEditDialog

    property string taskTitle
    property string taskDescription


    signal pupilsDetailsAdded()

    anchors.centerIn: Overlay.overlay
    width: 600
    height: 300
    modal: true
    focus: true
    closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutsideParent

    Column{
        height: parent.height

        width: parent.width

        Rectangle {
            id: titleTextInputRectangle

            width: parent.width
            height: 30
            border.color: "grey"
            border.width: 1
            color: titleTextInput.focus ? "red" : "green"

            TextInput {
                 id: titleTextInput

                 leftPadding: 5
                 anchors.fill: parent
                 //anchors.margins: 5
                 width: parent.width
                 color: "black"
                 text: taskTitle
                 selectByMouse : true
                 focus: true
                 KeyNavigation.right: descriptionTextEdit

            }
        }


        Rectangle {
            id: descriptionTextEditRectangle

            color: focus ? "red" : "lightgray"
            width: parent.width
            height: descriptionTextEdit.contentHeight < 70 ? 70 : descriptionTextEdit.contentHeight
            border.color: "grey"
            border.width: 1
            KeyNavigation.right: saveButton

            TextEdit {
                id: descriptionTextEdit

                anchors.fill: parent
                leftPadding: 5
                focus: true
                wrapMode: TextEdit.Wrap
                selectByMouse : true
                color: "black"
                text: taskDescription
            }

        }

        Rectangle {
            id: okCancelRectangle

            width: parent.width
            height: 30

            Button {
                id: saveButton

                width: 100
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.right: parent.right
                KeyNavigation.tab: cancelButton

                palette {
                       button: "green"
                }

                text: qsTr("Save")
                onClicked: {
                    var tmpData = visualModel.model
                    console.log("tmpData[taskColumnIndex].tasks[taskIndex].description: " + tmpData[taskColumnIndex].tasks[taskIndex].description)
                    tmpData[taskColumnIndex].tasks[taskIndex].title = titleTextInput.text
                    tmpData[taskColumnIndex].tasks[taskIndex].description = descriptionTextEdit.text
                    console.log(visualModel.model)
                    visualModel.model = tmpData
                }
            }

            Button {
                id: cancelButton

                width: 100
                anchors.rightMargin: 5
                anchors.right: saveButton.left
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                text: qsTr("Cancel")
                KeyNavigation.tab: titleTextInput

                onClicked: {
                   console.log("cancel...")
                   taskContentEditDialog.close();
                }
            }
        }
    }
}
