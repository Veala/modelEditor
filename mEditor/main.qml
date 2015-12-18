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
        editor.visible = true
        modelName.append({ "name": ""})
        for (var i=0; i<modelName.count; i++)
            editor.model.append(modelName.get(i) )
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
            if (modelName.count == 0) false
            else true
        }

        onTriggered: messageDialog.show("Ya!");
    }
    Action {
        id: exportObj
        text: "Экспорт..."
        enabled: {
            if (modelName.count == 0) false
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

    Editor {
        id: editor
    }

//    Window {
//        id: editor
//        title: "Редактор объекта"
//        modality: Qt.ApplicationModal
//        color: "yellow"
//        visible: false
//        height: 100
//        width: 300

//        TableView {
//            id: viewProp
//            anchors.fill: parent
//            anchors.margins: 5
//            TableViewColumn {
//                role: "property"
//                title: "Названия св-в"
//                width: 100
//            }
//            TableViewColumn {
//                role: "value"
//                title: "Значение"
//                width: 200
//            }
////            delegate: Row {
////                id: delegateProp
////                width: 80; height: 20
////                border.color: "gray"
////                color: "yellow"
////                Text {
////                    anchors.fill: parent
////                    horizontalAlignment: Text.AlignHCenter
////                    verticalAlignment: Text.AlignVCenter
////                    text: name
////                }
////            }
//            model: ListModel {
//                id: modelProp
//            }
//        }

//        function show(caption) {
//            messageDialog.text = caption;
//            messageDialog.open();
//        }
//    }

    ListView {
        id: viewName
        anchors.fill: parent
        anchors.margins: 5
        spacing: 3
        delegate: Rectangle {
            id: delegateName
            width: 80; height: 20
            border.color: "gray"
            color: "yellow"
            Text {
                anchors.fill: parent
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                text: name
            }
        }
        model: ListModel {
            id: modelName
        }
    }
}
