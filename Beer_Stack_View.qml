import QtQuick 2.12
import QtQuick.Controls 2.5


Item {
    anchors.fill:parent
    Rectangle{
        anchors.fill:parent
        color: "light blue"


    }
    StackView {
        id: stackView22
        x: 1
        y: 6
        width: 599
        height: 393


        Button{
            id: button1
            x: 57
            y: 313
            width: 87
            height: 30
            text: qsTr("Enter")
            onClicked: {
                stackView.pop()
                //stackView.push("qrc:/main.qml")
            }
        }


    }


}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
