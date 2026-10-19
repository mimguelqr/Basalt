import QtQuick
import Quickshell

import QtQml

import "../appearence"
import "../components"

Widget {
    id: root

    width: row.width + 40

    property var currentDate: new Date()

    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: root.currentDate = new Date()
    }

    Row {
        id: row

        anchors {
            horizontalCenter: parent.horizontalCenter
            verticalCenter: parent.verticalCenter
        }

        spacing: 8

        Text {
            text: Qt.formatTime(root.currentDate, "hh:mm")

            color: Theme.accentColor
            font.family: "Prompt"
            font.weight: 500
            font.pointSize: 10
        }

        Rectangle {
            anchors.verticalCenter: parent.verticalCenter

            color: Theme.accentColor

            width: 4
            height: 4

            radius: 25
        }

        Text {
            text: Qt.locale("pt-BR").toString(root.currentDate, "dddd, dd/MM")

            color: Theme.accentColor
            font.family: "Prompt"
            font.weight: 350
            font.pointSize: 10
        }
    }
}
