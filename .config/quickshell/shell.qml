import Quickshell // for PanelWindow
import QtQuick // for Text

PanelWindow {
  id: pw1

  anchors {
    left: true
    top: true
    right: true
  }

  color: "#80000000"
  height: 42

  Rectangle {
    id: barRect

    anchors.centerIn: parent
    // text: "Hello!"

    anchors.fill: parent

    Rectangle {
        id: barLeft
        border.color: "green"
        border.width: 2
        color: "transparent"

        anchors.top: barRect.top
        anchors.bottom: barRect.bottom
        anchors.left: barRect.left
        width: 100
    }
    Rectangle {
        id: barMiddle
        border.color: "green"
        border.width: 2
        color: "transparent"

        anchors.horizontalCenter: barRect.horizontalCenter
        anchors.top: barRect.top
        anchors.bottom: barRect.bottom

        width: 100
    }
    Rectangle {
        id: barRight
        border.color: "green"
        border.width: 2
        color: "transparent"

        anchors.top: barRect.top
        anchors.bottom: barRect.bottom
        anchors.right: barRect.right
        width: 100
    }

    color: "transparent"
    border.color: "blue"
    border.width: 2
  }
}
