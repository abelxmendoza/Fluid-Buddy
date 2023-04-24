import QtQuick 2.12

import QtQuick.Controls 2.5

Page {
    id: page3Form
    width: 600
    height: 400

    header: Label {
        color: "#ffffff"
        text: qsTr("Profile")
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: Qt.application.font.pixelSize * 2
        padding: 10
    }

    background: Rectangle {
        radius: 2
        color: "light blue"
        border.color: "light blue"
        border.width: 1
        implicitWidth: 200
        implicitHeight: 24
    }

    Button {
        id: save_button
        x: 250
        y: 289
        text: "Save"

        onClicked: page1Form.textField1.text = qsTr("Male")
        //weightTextField.text = qsTr("Male");

        //if(male_radioDelegate.checked == true)
        //  gender_display_label.text = qsTr("Male");
        //else
        // gender_display_label.text = qsTr("Female");
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
        id: ageLabel
        x: 63
        y: 237
        text: qsTr("Weight")
        font.pointSize: 20
    }

    Label {
        id: weightLabel
        x: 63
        y: 135
        width: 70
        height: 29
        text: qsTr("Year Of Birth")
        font.pointSize: 20
    }

    TextField {
        id: weightTextField
        x: 155
        y: 229
        width: 147
        height: 40
        placeholderText: qsTr("Text Field")
    }

    ComboBox {
        id: ageComboBox
        x: 239
        y: 129
        model: ["1980", "1981", "1982", "1983", "1984", "1985", "1986", "1987", "1988", "1989", "1990", "1991", "1992", "1993", "1994", "1995", "1996", "1997", "1998", "1999", "2000", "2001", "2002", "2003", "2004", "2005", "2006", "2007", "2008", "2009", "2010"]
    }

    Rectangle {
        id: rectangle1
        x: 12
        y: 90
        width: 577
        height: 1
        color: "#ffffff"
    }

    Rectangle {
        id: rectangle2
        x: 12
        y: 192
        width: 577
        height: 1
        color: "#ffffff"
    }

    RadioDelegate {
        id: radioDelegate2
        x: 327
        y: 231
        width: 102
        height: 38
        text: qsTr("Kg")
        checked: true
        checkable: true
        autoExclusive: true
        autoRepeat: false
    }

    RadioDelegate {
        id: radioDelegate3
        x: 447
        y: 231
        width: 107
        height: 38
        text: qsTr("Lb")
        checked: false
        highlighted: false
        hoverEnabled: false
        enabled: true
        autoExclusive: true
        autoRepeat: false
    }

    Pane {
        id: pane
        x: 0
        y: 0
        width: 600
        height: 84
        clip: false
        scale: 1
        visible: true

        background: Rectangle {
            radius: 2
            color: "light blue"
            border.color: "light blue"
            border.width: 1
            implicitWidth: 50
            implicitHeight: 24
        }

        RadioDelegate {
            id: male_radioDelegate
            x: 172
            y: 8
            width: 102
            height: 38
            text: qsTr("Male")
            autoRepeat: false
            autoExclusive: true
            checkable: true
            checked: true
        }

        RadioDelegate {
            id: famale_radioDelegate1
            x: 327
            y: 8
            width: 127
            height: 38
            text: qsTr("Female")
            hoverEnabled: false
            enabled: true
            highlighted: false
            autoExclusive: true
            autoRepeat: false
        }

        Label {
            id: genderLabel
            x: 58
            y: 15
            width: 70
            height: 24
            text: qsTr("Gender")
            font.pointSize: 20
        }
    }
}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.8999999761581421}
}
##^##*/

