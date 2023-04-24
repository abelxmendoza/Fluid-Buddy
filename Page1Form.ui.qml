import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Controls.Styles 1.4

Page {
    id:page1Form
    width: 600
    height: 400

    header: Label {
        color: "#f7fffb"
        text: qsTr("Home")
        horizontalAlignment: Text.AlignHCenter
        styleColor: "#000000"
        font.pixelSize: Qt.application.font.pixelSize * 2
        padding: 10
    }

    background: Rectangle {
        radius: 2
        color: "light blue"
        implicitWidth: 200
        implicitHeight: 24
    }

    Rectangle {
        id: label_background
        x: 0
        y: -51
        width: 600
        height: 51
        color: "#000000"
    }

    ProgressBar {
        id: waterLevelProgressBar
        x: 185
        y: 108
        value: 0.5
        //color: "blue"
    }

    Label {
        id: bloodAlcoholLabel
        x: 185
        y: 151
        text: qsTr("Blood Alcohol Content")
    }

    Label {
        id: caloriesLabel
        x: 185
        y: 227
        text: qsTr("Calories")
    }

    TextArea {
        id: waterLevelTextArea
        x: 185
        y: 120
        text: "50%"
        placeholderText: qsTr("Text Area")
    }

    TextArea {
        id: caloriesTextArea
        x: 185
        y: 246
        text: "0.0"
        placeholderText: qsTr("Text Area")
    }

    TextArea {
        id: bloodAlcoholTextArea
        x: 185
        y: 188
        text: "0%"
        placeholderText: qsTr("Text Area")
    }

    ProgressBar {
        id: bloodAlcoholProgressBar
        x: 185
        y: 174
        value: 0
    }

    Label {
        id: waterLevelLabel
        x: 185
        y: 80
        text: qsTr("Water Level")
    }

    Pane {
        id: pane
        x: 0
        y: 307
        width: 600
        height: 42

        background: Rectangle {
            color: "light blue"
        }
        Label {
            id: weightLabel
            x: 370
            y: 14
            width: 32
            height: 16
            text: qsTr("Weight:")
        }

        Label {
            id: genderLabel
            x: 0
            y: 14
            text: qsTr("Gender:")
        }

        Label {
            id: ageLabel
            x: 180
            y: 14
            width: 36
            height: 16
            text: qsTr("Age:")
        }

        Label {
            id: gender_display_label
            x: 54
            y: 14
            text: qsTr("0")
        }

        Label {
            id: age_display_label
            x: 222
            y: 14

            text: qsTr("0")
        }

        Label {
            id: weight_display_label
            x: 423
            y: 14
            text: qsTr("0")
        }
    }
}
