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

    function createObject() {
        loader.source = "Editor.qml"
        curEditor = loader.item
        curEditor.visible = true
        modelName.append({ "name": ""})
        //for (var i=0; i<modelName.count; i++)
            //editor.model.append(modelName.get(i) )
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

    Loader {
        id: loader
    }

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
