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

    function createObject() {
        listModel.append(Rectangle { "color": "yellow" });//, "name": "Pizza"})
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
            if (listModel.count == 0) false
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
            ToolButton {    action: createObj   }
            ToolButton {    action: delObj      }
            ToolButton {    action: exportObj   }
            ToolButton {    action: importObj   }
            Item { Layout.fillWidth: true }
        }
    }

    MessageDialog {
        id: messageDialog
        title: qsTr("May I have your attention, please?")

        function show(caption) {
            messageDialog.text = caption;
            messageDialog.open();
        }
    }

    ListView {
        id: listView
        anchors.fill: parent
//        delegate: Item {
//            id: _delegate
//            x: 5
//            width: 80
//            height: 40
//            Row {
//                id: row1
//                spacing: 10
//                Rectangle {
//                    width: 40
//                    height: 40
//                    color: colorx
//                }

//                Text {
//                    text: name
//                    font.bold: true
//                    anchors.verticalCenter: parent.verticalCenter
//                }
//            }
//        }
        model: ListModel {
            id: listModel
        }
    }
}
