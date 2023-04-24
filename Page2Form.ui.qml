import QtQuick 2.12
import QtQuick.Controls 2.5

Page {
    id:page2Form
    width: 600
    height: 400
    property alias howMuchSlider: howMuchSlider

    header: Label {
        color: "#ffffff"
        text: qsTr("Menu")
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: Qt.application.font.pixelSize * 2
        padding: 10
    }

    background: Rectangle {
        radius: 2
        color: "light blue"
        border.color: "blue"
        border.width: 1
        implicitWidth: 200
        implicitHeight: 24
    }

    Rectangle {
        id: rectangle
        x: 0
        y: -51
        width: 600
        height: 51
        color: "#000000"
    }

    Label {
        id: portionLabel
        x: 77
        y: 138
        width: 57
        height: 22
        text: qsTr("Portion Size")
    }

    Label {
        id: howMuchLabel
        x: 79
        y: 247
        text: qsTr("How much?")
    }

    TextArea {
        id: howMuchTextArea
        x: 37
        y: 261
        placeholderText: qsTr("Text Area")
    }

    Slider {
        id: howMuchSlider
        x: 7
        y: 200
        value: 0.5
    }

    Label {
        id: drinkingLabel
        x: 269
        y: 6
        width: 207
        height: 29
        text: qsTr("What are you drinking?")
    }

    Tumbler {
        id: tumbler
        x: 14
        y: 45
        width: 85
        height: 65
        model: ["Water", "Tea", "Coffee", "Juice", "Dairy", "Beer", "Liquor"]
    }

    Tumbler {
        id: tumbler1
        x: 77
        y: 166
        width: 60
        height: 45
        model: 10
    }

    Button {
        id: button
        x: 114
        y: 57
        width: 76
        height: 30
        text: qsTr("Enter")
    }

    SwipeView {
        id: swipeView
        x: 241
        y: 57
        width: 293
        height: 122
        currentIndex: 0

        Item {
            Image {
                id: image
                x: 125
                y: 0
                width: 117
                height: 100
                source: "../../../../../../../imageService.jpg"
                fillMode: Image.PreserveAspectFit
            }
        }

        Item {}
    }
}

/*##^##
Designer {
    D{i:11;customId:""}
}
##^##*/

