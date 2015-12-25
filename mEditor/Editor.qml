import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2
import QtQuick.Layouts 1.1

Window {
    id: editor
    title: "Редактор объекта"
    modality: Qt.ApplicationModal
    color: "yellow"
    visible: false
    height: 100
    width: 300
    property alias model: modelProp

    Component.onCompleted: {
        console.log("Waaa comleted");
    }
    Component.onDestruction: {
        console.log("Waaa destroyed");
    }


    TableView {
        id: viewProp
        anchors.fill: parent
        anchors.margins: 5
        TableViewColumn {
            role: "property"
            title: "Названия св-в"
            width: 100
        }
        TableViewColumn {
            role: "value"
            title: "Значение"
            width: 200
        }
        model: ListModel {
            id: modelProp
        }

    }

}

