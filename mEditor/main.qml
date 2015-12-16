import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2

ApplicationWindow {
    title: qsTr("Редактор модели 1.0")
    width: 640
    height: 480
    visible: true

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
            MenuItem {
                text: qsTr("Создать объект")
                onTriggered: Qt.quit();
            }
            MenuItem {
                text: qsTr("Удалить объект/ы")
                onTriggered: Qt.quit();
            }
            MenuItem {
                text: qsTr("Экспорт...")
                onTriggered: Qt.quit();
            }
            MenuItem {
                text: qsTr("Импорт...")
                onTriggered: Qt.quit();
            }
        }
    }

    MainForm {
        anchors.fill: parent
        button1.onClicked: messageDialog.show(qsTr("Button 1 pressed"))
        button2.onClicked: messageDialog.show(qsTr("Button 2 pressed"))
        button3.onClicked: messageDialog.show(qsTr("Button 3 pressed"))
    }

    MessageDialog {
        id: messageDialog
        title: qsTr("May I have your attention, please?")

        function show(caption) {
            messageDialog.text = caption;
            messageDialog.open();
        }
    }
}
