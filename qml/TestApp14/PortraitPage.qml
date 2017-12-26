import QtQuick 1.1
import com.nokia.meego 1.0

Page {
    tools: commonTools

    Rectangle {
        anchors.fill: parent
        color: "yellow"
    }

    Label {
        id: label
        anchors.centerIn: parent
        text: qsTr("This is the portrait page!")
        visible: true
    }

}
