import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2
import QtQuick.Layouts 1.1

ApplicationWindow {
    title: qsTr("Редактор модели 1.0")
    width: 640
    height: 480
    visible: true
    id: backend
    property Editor curEditor
    property int number: 0

    function createObject() {
        loader.source = "Editor.qml"
        curEditor = loader.item
        curEditor.visible = true
        listModel.append({ "name": ""})
    }

    onActiveChanged: {
        if (active) {
            loader.source = ""
        }
    }

    Action {
        id: createObj
        text: "Создать объект"
        onTriggered: createObject()
    }
    Action {
        id: delObj
        text: "Удалить объект/ы"
        enabled: {
            if ((listModel.count == 0) || (number == 0)) false
            else true
        }
        onTriggered: messageDialog.show("Ya!");
    }
    Action {
        id: exportObj
        text: "Экспорт..."
        enabled: {
            if (listModel.count == 0) false
            else true
        }
        onTriggered: messageDialog.show("Ya!");
    }
    Action {
        id: importObj
        text: "Импорт..."
        onTriggered: messageDialog.show("Ya!");
    }
    Action {
        id: editObj
        text: "Редактировать..."
        enabled: {
            if ((listModel.count == 0) || (number != 1)) false
            else true
        }
        onTriggered: messageDialog.show("Ya!");
    }


    menuBar: MenuBar {
        Menu {
            title: qsTr("Файл")
            MenuItem {
                text: qsTr("Выход")
                onTriggered: Qt.quit();
            }
        }
        Menu {
            title: qsTr("Модель")
            MenuItem {  action: createObj   }
            MenuItem {  action: delObj      }
            MenuItem {  action: exportObj   }
            MenuItem {  action: importObj   }
        }
    }

    toolBar: ToolBar {
        RowLayout {
            anchors.fill: parent
            ToolButton {    action: createObj       }
            ToolButton {    action: delObj          }
            ToolButton {    action: exportObj       }
            ToolButton {    action: importObj       }
            ToolButton {    action: editObj         }
            Item       {    Layout.fillWidth: true  }
        }
    }

    Loader {
        id: loader
    }

    ListView {
        id: listView
        anchors.fill: parent
        anchors.margins: 5
        spacing: 3
        model: ListModel {
            id: listModel
        }
        delegate: Rectangle {
            id: delegate_x
            width: 80; height: 20
            radius: 5
            border.color: "gray"
            color: "yellow"
            Text {
                anchors.fill: parent
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                text: "Name: " + name
            }
            MouseArea {
                id: mouseArea
                acceptedButtons: Qt.LeftButton | Qt.RightButton
                anchors.fill: parent
                //index - от элемента идет так же как и name
                onClicked: {
                    if(delegate_x.color == "#ffff00") { //yellow
                        delegate_x.color = "lightsteelblue"; number++
                    } else {
                        delegate_x.color = "yellow"; number--
                    }
                }
            }
        }

        //highlight: Rectangle { color: "lightsteelblue"; radius: 5 }
        //focus: true
    }
}
