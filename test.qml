import QtQuick 2.12
import QtQuick.Controls 2.5

Item {
    StackView{
        id:stackview
        x: 0
        y: 0
        width: 200
        height: 200
        initialItem: stackpage1
    }

    Page{
        id:stackpage1
        width: 200
        height: 200

        Button{
            x: 0
            y: 100
            width:100
            height:100
            text:"Beer"
            onClicked: {
                stackview.push(stackpage2)
            }
        }
    }

    Page{
        id:stackpage2
        x: 0
        y: 0
        width: 200
        height: 200

        Button{
            x: 129
            y: 130
            width:71
            height:70
            text:"Enter"
            onClicked: {
                stackview.pop()
            }
        }

    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
