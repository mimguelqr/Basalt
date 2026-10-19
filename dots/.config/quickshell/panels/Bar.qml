import QtQuick
import Quickshell
import Quickshell.Widgets
import Quickshell.Io

import "../widgets"
import "../appearence"

Scope {
    Variants {
        model: Quickshell.screens

        PanelWindow {
            id: root

            anchors {
                top: true
                left: true
                right: true
            }

            implicitHeight: 45

            color: Theme.topBarBackgroundColor

            Row {
                id: row

                spacing: 6

                anchors {
                    horizontalCenter: parent.horizontalCenter
                    verticalCenter: parent.verticalCenter
                }
                Workspaces {}

                Clock {}
            }
        }
    }
}
