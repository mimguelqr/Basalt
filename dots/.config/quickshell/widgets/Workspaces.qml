import QtQuick
import Quickshell.Hyprland

import "../appearence"
import "../components"

Widget {
    id: root

    width: workspacesRow.width + 40

    Row {
        id: workspacesRow

        anchors {
            horizontalCenter: parent.horizontalCenter
            verticalCenter: parent.verticalCenter
        }

        spacing: 8

        Repeater {
            model: 5

            Rectangle {
                id: workspaceCircle
                required property int index

                anchors {
                    verticalCenter: parent.verticalCenter
                }

                radius: width / 2

                color: Hyprland.focusedWorkspace?.id === index + 1 ? Theme.accentColor : "#565656"

                width: Hyprland.focusedWorkspace?.id === index + 1 ? 8 : 6
                height: Hyprland.focusedWorkspace?.id === index + 1 ? 8 : 6

                Behavior on color {
                    ColorAnimation {
                        duration: 200
                        easing.type: Easing.OutCubic
                    }
                }

                Behavior on width {
                    NumberAnimation {
                        duration: 200
                        easing.type: Easing.OutCubic
                    }
                }

                Behavior on height {
                    NumberAnimation {
                        duration: 200
                        easing.type: Easing.OutCubic
                    }
                }
            }
        }
    }
}
