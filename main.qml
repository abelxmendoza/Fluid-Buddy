import QtQuick 2.12
import QtQuick.Controls 2.5
import Qt.labs.settings 1.0

ApplicationWindow {
    id: applicationWindow
    visible: true
    width: 600
    height: 450
    title: qsTr("Tabs")

    property var beerAlcoholValue: 0.0
    property var humanAlcoholContent: 0.0
    property var genderString:" "
    property var weightInPound: 0.0
    property var weightContent: " "
    property var hourCount: date.getHours()
    property var ageValue: 0.0
    property var date: new Date
    property var genderConstant: 0.0
    property var humanWaterPercentage: 0.25
    property var name:" "

    property var weightValue: 0.0
    property var portionSize: 0.0
    property var eliminationRate: 0.017
    property var alcoholValue: 0.0
    property var waterNeed: 0.0
    property var waterPercentageInDrink: 1.0
    property var waterInput: 0.0
    property var caloriesFactor: 0.0
    property var totalCalories: 0.0
    property var index:0


    property string datastore: ""
    //property var model_history: ""

    Component.onCompleted: {
        if(datastore){
            model_history.clear()
            var datamodel = JSON.parse(datastore)
            for(var i = 0; i < datamodel.length;++i)
                model_history.append(datamodel[i])
        }

        if(ageValue == 0)
        {
            tabBar.currentIndex = 2
        }
        else
        {
            stackview_setting.push(settingMainPage)
        }
    }

    onClosing:{
        var datamodel = []
        for(var i = 0; i < model_history.count; ++i)
            datamodel.push(model_history.get(i))
        datastore = JSON.stringify(datamodel)
    }

    Settings {
        property alias beerAlcoholValue: applicationWindow.beerAlcoholValue
        property alias humanAlcoholContent: applicationWindow.humanAlcoholContent
        property alias genderString: applicationWindow.genderString
        property alias weightValue: applicationWindow.weightInPound
        property alias weightContent: applicationWindow.weightContent
        property alias hourCount: applicationWindow.hourCount
        property alias ageValue: applicationWindow.ageValue
        property alias date: applicationWindow.date
        property alias genderConstant: applicationWindow.genderConstant
        property alias humanWaterPercentage: applicationWindow.humanWaterPercentage
        property alias totalCalories: applicationWindow.totalCalories
        property alias name: applicationWindow.name
        property alias waterneed: applicationWindow.waterNeed
        property alias weightInPound: applicationWindow.weightInPound

        property alias datastore: applicationWindow.datastore

    }



    Timer {
        interval: 1000; running: true; repeat: true;
        onTriggered: timeChanged()
    }

    function timeChanged() {
        date = new Date
        hourCount = date.getSeconds()
        humanAlcoholContent = (beerAlcoholValue * genderConstant - (eliminationRate * hourCount)) / weightInPound
    }

    SwipeView {
        id: swipeView
        anchors.fill: parent
        currentIndex: tabBar.currentIndex
        //tabBar.currentIndex: 2


        // Page 1: home page ------------------------------------------------------------------------------------
        Page{
            id:homePage
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
                value: humanWaterPercentage
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
                text:(humanWaterPercentage<=0)? 0:(humanWaterPercentage * 100).toFixed(2) + "%"
                placeholderText: qsTr("Text Area")
            }

            TextArea {
                id: caloriesTextArea
                x: 185
                y: 246
                text: totalCalories.toFixed(2)
                placeholderText: qsTr("Text Area")
            }

            TextArea {
                id: bloodAlcoholTextArea
                x: 185
                y: 188
                text:(humanAlcoholContent<=0)?0:humanAlcoholContent.toFixed(4) + "%"
                placeholderText: qsTr("Text Area")
            }

            ProgressBar {
                id: bloodAlcoholProgressBar
                x: 185
                y: 174
                value: humanAlcoholContent
            }

            Label {
                id: waterLevelLabel
                x: 185
                y: 80
                text: qsTr("Water Level")
            }

            Label {
                id: waterLevelLabelIntro
                x: 320
                y: 5
                text: qsTr("Water Level maintain 50% is human body need")
            }

            Button {
                id: button_Urination
                x: 360
                y: 250
                width: 110
                height: 30
                text: qsTr("Go Restroom")

                onClicked:{
                    //beerAlcoholPercentage = beerAlcoholPercentage - 0.2 * beerAlcoholPercentage
                    humanWaterPercentage = humanWaterPercentage - 0.25 * humanWaterPercentage
                }
            }

            Pane {
                id: userinfoPane
                x: 0
                y: 307
                width: 600
                height: 42

                background: Rectangle {
                    color: "light blue"
                }
                Label {
                    id: weightLabel
                    x: 450
                    y: 14
                    width: 57
                    height: 16
                    text: qsTr("Weight:")
                }

                Label {
                    id: genderLabel
                    x: 150
                    y: 14
                    text: qsTr("Gender:")
                }

                Label {
                    id: ageLabel
                    x: 300
                    y: 14
                    width: 36
                    height: 16
                    text: qsTr("Age:")
                }

                TextArea {
                    id: gender_display_textArea
                    x: 195
                    y: 8
                    width: 56
                    height: 28
                    text: genderString
                }

                TextArea {
                    id: age_display_textArea
                    x: 330
                    y: 8

                    text: ageValue
                }

                TextArea {
                    id: weight_display_textArea
                    x: 500
                    y: 8
                    text: weightContent
                }

                Label {
                    id: nameLabel
                    x: 0
                    y: 15
                    text: "Name:"
                }

                TextArea {
                    id: name_display_textArea
                    x: 45
                    y: 8
                    width: 56
                    height: 28
                    text: name
                }
            }

            Button {
                id: button_newUser
                x: 360
                y: 293
                width: 110
                height: 30
                text: qsTr("Clear data")
                onClicked:{
                    beerAlcoholValue = 0.0
                    humanAlcoholContent = 0.0
                    genderString = " "
                    weightInPound = 0.0
                    weightContent = " "
                    hourCount: date.getHours()
                    ageValue = 0.0
                    date: new Date
                    genderConstant = 0.0
                    humanWaterPercentage = 0.25

                    weightValue = 0.0
                    portionSize = 0.0
                    eliminationRate = 0.017
                    alcoholValue = 0.0
                    waterNeed = 0.0
                    waterPercentageInDrink = 1
                    waterInput = 0.0

                    weight_display_textArea.text = " "
                    gender_display_textArea.text = " "
                    age_display_textArea.text = 0.0
                    caloriesFactor = 0.0
                    totalCalories = 0.0
                    name = " "
                    name_display_textArea.text = " "
                    index = 0
                    model_history.clear()
                    model_history.append({"i":0,"user_name":"User","drink_history":"Drink", "brand_history":"Brand",
                                          "size":"Size", "calories":"Calories", "date":"Date&Time"})
                }
            }
        }
        // Page 2: Menu page--------------------------------------------------------------------------------------
        Page {
            id:menuPage
            width: 640
            height: 400

            Page{
                id:menuMainPage
                x: 0
                y: 0
                width: 640
                height: 400

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
                    implicitWidth: 200
                    implicitHeight: 24
                }

                Rectangle {
                    id: menuHeader
                    x: 0
                    y: -51
                    width: 600
                    height: 51
                    color: "#000000"
                }

                Label {
                    id: headerLabel
                    x: 230
                    y: 6
                    width: 141
                    height: 29
                    text: qsTr("What are you drinking?")
                    font.pointSize: 16
                }

                Button {
                    id: enterButton
                    x: 262
                    y: 326
                    width: 76
                    height: 30
                    text: qsTr("Enter")

                    onClicked:{
                        if(cupRadioButton.checked == true)
                            portionSize = 8.0
                        if(canRadioButton.checked == true)
                            portionSize = 12.0
                        if(bottleRadioButton.checked == true)
                            portionSize = 16.9
                        if(bomberRadioButton.checked == true)
                            portionSize = 22.0

                        if(custom_size.checked == true)
                            portionSize = custom_size_text.displayText

                        totalCalories = totalCalories + caloriesFactor * portionSize
                        beerAlcoholValue = beerAlcoholValue + alcoholValue * portionSize
                        humanWaterPercentage = humanWaterPercentage + waterPercentageInDrink * portionSize / waterNeed

                        model_history.append({"i":++index,"user_name":name_display_textArea.text,"drink_history":drink_selection.text, "brand_history":brand_selection.text,
                                              "size":portionSize.toString() + "oz", "calories":(caloriesFactor * portionSize).toFixed(2).toString(),
                                              "date": date.toLocaleString(Qt.locale())})

                        tabBar.currentIndex = 0
                    }
                }

                Image {
                    id: beerClassImage
                    x: 0
                    y: 41
                    width: 100
                    height: 100
                    source: "beer-icon.jpg"
                }

                Image {
                    id: sodaClassImage
                    x: 123
                    y: 41
                    width: 100
                    height: 100
                    source: "soda-icon.jpg"
                }

                Image {
                    id: waterClassImage
                    x: 250
                    y: 41
                    width: 100
                    height: 100
                    source: "water-icon.jpg"
                }

                BorderImage {
                    id: teaClassImage
                    x: 378
                    y: 41
                    width: 100
                    height: 100
                    source: "tea-icon.jpg"
                }

                BorderImage {
                    id: coffeeClassImage
                    x: 500
                    y: 41
                    width: 100
                    height: 100
                    source: "coffee-icon.jpg"
                }

                Pane {
                    id: cupSizeRadioButtonSet
                    x: 1
                    y: 230
                    width: 600
                    height: 73
                    anchors.horizontalCenterOffset: -1
                    anchors.horizontalCenter: headerLabel.horizontalCenter

                    background: Rectangle {
                        color: "light blue"
                    }

                    Label {
                        id: portionLabel1
                        x: -6
                        y: -12
                        width: 57
                        height: 22
                        text: qsTr("Size")
                        anchors.top: parent.top
                        anchors.topMargin: -12
                    }

                    RadioButton {
                        id: cupRadioButton
                        x: 40
                        y: -12
                        width: 107
                        height: 40
                        text: qsTr("Cup(8 oz)")
                        checked: true
                    }

                    RadioButton {
                        id: canRadioButton
                        x: 195
                        y: -12
                        width: 112
                        height: 40
                        text: qsTr("Can(12 oz)")
                    }

                    RadioButton {
                        id: bottleRadioButton
                        x: 355
                        y: -12
                        width: 140
                        height: 40
                        text: qsTr("Bottle(16.9 oz)")
                    }

                    RadioButton {
                        id: bomberRadioButton
                        x: 40
                        y: 22
                        width: 150
                        height: 40
                        text: qsTr("Bombers(22 oz)")
                    }

                    RadioButton {
                        id: custom_size
                        x: 195
                        y: 22
                        width: 129
                        height: 40
                        text: qsTr("Custom Size")
                    }
                    TextField {
                        id: custom_size_text
                        x: 318
                        y: 28
                        width: 46
                        height: 34
                        clip: false

                        visible: (custom_size.checked)?true:false
                    }

                    Label {
                        id: size_label_oz
                        x: 370
                        y: 34
                        width: 30
                        height: 22
                        text: (custom_size.checked)?"oz":""
                        font.pointSize: 12
                    }
                }
                Button {
                    id: beerButton
                    x: 6
                    y: 152
                    width: 76
                    height: 30
                    text: qsTr("Beer")

                    onClicked: {
                        stackview.push(stack_beer)
                    }
                }
                Button {
                    id: sodaButton
                    x: 135
                    y: 152
                    width: 76
                    height: 30
                    text: qsTr("Soda")
                    onClicked: {
                        stackview.push(stack_soda)
                    }
                }
                Button {
                    id: waterButton
                    x: 262
                    y: 152
                    width: 76
                    height: 30
                    text: qsTr("Water")
                    onClicked:{
                        drink_selection.text = "Water"
                        brand_selection.text = "Water"
                        waterPercentageInDrink = 1
                        calories_display.text = "0"
                        alcohol_display.text = "0"
                        alcoholValue = 0
                        caloriesFactor = 0
                    }
                }
                Button {
                    id: teaButton
                    x: 390
                    y: 152
                    width: 76
                    height: 30
                    text: "Tea"
                    onClicked: {
                        stackview.push(stack_tea)
                    }
                }

                Button {
                    id: coffeeButton
                    x: 512
                    y: 152
                    width: 76
                    height: 30
                    text: qsTr("Coffee")
                    onClicked: {
                        stackview.push(stack_coffee)
                    }
                }

                Label {
                    id: drink_label
                    x: 6
                    y: 192
                    width: 43
                    height: 22
                    text: qsTr("Drink:")
                    font.pointSize: 12
                }
                Label {
                    id: drink_selection
                    x: 55
                    y: 192
                    width: 64
                    height: 22
                    font.pointSize: 12
                    text:"Water"
                }
                Label {
                    id: brand_label
                    x: 6
                    y: 208
                    width: 43
                    height: 22
                    text: qsTr("Brand:")
                    font.pointSize: 12
                }
                Label {
                    id: brand_selection
                    x: 55
                    y: 208
                    width: 64
                    height: 22
                    text: "Water"
                    font.pointSize: 12
                }

                Label {
                    id: calories_label
                    x: 180
                    y: 192
                    width: 46
                    height: 34
                    clip: false
                    text: "Calories: "
                }
                Label {
                    id: alcohol_label
                    x: 180
                    y: 208
                    width: 46
                    height: 34
                    clip: false
                    text: "Alcohol: "
                }
                Label {
                    id: calories_display
                    x: 240
                    y: 192
                    width: 46
                    height: 34
                    clip: false
                    text: "0"
                }
                Label {
                    id: alcohol_display
                    x: 240
                    y: 208
                    width: 46
                    height: 34
                    clip: false
                    text: "0"
                }
                Label {
                    id: calories_label_unit
                    x: 280
                    y: 192
                    width: 46
                    height: 34
                    clip: false
                    text: "Cal/oz"
                }
                Label {
                    id: alcohol_label_unit
                    x: 280
                    y: 208
                    width: 46
                    height: 34
                    clip: false
                    text: "ABV"
                }




            }
            //page 2 sub page: beer selection page-------------------------------------------------------------
            Page{
                id:stack_beer
                width: 640
                height: 400

                background: Rectangle {
                    color: "light blue"
                }

                Label{
                    x:212
                    y:0
                    width: 153
                    height: 32
                    text:"Select Beer brand"
                    font.bold: false
                    horizontalAlignment: Text.AlignHCenter
                    font.pointSize: 20
                }

                Component{
                    id:delegate_beer
                    Item{
                        id:item2
                        width: 300
                        height: 150

                        Image{
                            width: 150
                            height: 150
                            source:beer_image
                        }

                        MouseArea{
                            anchors.fill: item2
                            onClicked:{
                                stackview.pop()
                                drink_selection.text = "Beer"
                                brand_selection.text = brand
                                alcoholValue = alcPercent
                                waterPercentageInDrink = waterPercent
                                caloriesFactor = caloriesfactor_beer
                                calories_display.text = caloriesFactor
                                alcohol_display.text = alcoholValue
                            }
                        }

                        Label{
                            x:180
                            y:90
                            text:brand
                        }
                        Label{
                            x:180
                            y:110
                            text:"Calories: " + caloriesfactor_beer + " cal per oz"
                        }
                        Label{
                            x:180
                            y:130
                            text:"Alcohol by volumn: " + alcPercent * 100 + " %"
                        }
                    }
                }

                ListModel{
                    id:modelBeer
                    ListElement{
                        beer_image: "beer_1.jpg"
                        brand: "Heineken"
                        alcPercent: 0.05
                        waterPercent: 0.95
                        caloriesfactor_beer: 12.42
                    }
                    ListElement{
                        beer_image: "beer_2.jpg"
                        brand: "Guinness"
                        alcPercent: 0.042
                        waterPercent: 0.958
                        caloriesfactor_beer: 10.42
                    }
                    ListElement{
                        beer_image: "beer_3.jpg"
                        brand: "Corona"
                        alcPercent: 0.046
                        waterPercent: 0.954
                        caloriesfactor_beer: 12.33
                    }
                    ListElement{
                        beer_image: "beer_4.jpg"
                        brand: "Samuel Adams"
                        alcPercent: 0.05
                        waterPercent:0.95
                        caloriesfactor_beer: 14.58
                    }
                    ListElement{
                        beer_image: "beer_5.jpg"
                        brand: "Budweiser"
                        alcPercent: 0.05
                        waterPercent:0.95
                        caloriesfactor_beer: 12.08
                    }
                    ListElement{
                        beer_image: "beer_6.jpg"
                        brand: "Coors"
                        alcPercent: 0.042
                        waterPercent: 0.958
                        caloriesfactor_beer: 8.5
                    }
                    ListElement{
                        beer_image: "beer_7.jpg"
                        brand: "Blue Moon"
                        alcPercent: 0.054
                        waterPercent: 0.946
                        caloriesfactor_beer: 14.17
                    }
                    ListElement{
                        beer_image: "beer_8.jpg"
                        brand: "Miller"
                        alcPercent: 0.042
                        waterPercent: 0.958
                        caloriesfactor_beer: 8
                    }
                    ListElement{
                        beer_image: "beer_9.jpg"
                        brand: "Bud Light"
                        alcPercent: 0.05
                        waterPercent: 0.95
                        caloriesfactor_beer: 12
                    }
                }

                ScrollView {
                    anchors.fill:parent

                    ListView{
                        id: listView_beer
                        model:modelBeer
                        width:parent.width
                        delegate: delegate_beer
                    }
                }
            }
            //page 2 sub page: soda selection page-------------------------------------------------------------
            Page{
                id:stack_soda
                width: 640
                height: 400

                background: Rectangle {
                    color: "light blue"
                }

                Label{
                    x:212
                    y:0
                    width: 153
                    height: 32
                    text:"Select Soda brand"
                    font.bold: false
                    horizontalAlignment: Text.AlignHCenter
                    font.pointSize: 20
                }


                Component{
                    id:delegate_soda

                    Item{
                        id:item2
                        width: 300
                        height: 150


                        Image{
                            width: 150
                            height: 150
                            source:soda_image
                        }
                        MouseArea{
                            anchors.fill: item2
                            onClicked:{
                                stackview.pop()
                                drink_selection.text = "Soda"
                                brand_selection.text = brand
                                alcoholValue = 0
                                waterPercentageInDrink = waterPercent
                                caloriesFactor = caloriesfactor_soda
                                calories_display.text = caloriesFactor
                                alcohol_display.text = "0"
                            }
                        }

                        Label{
                            x:180
                            y:90
                            text:brand
                        }
                        Label{
                            x:180
                            y:110
                            text:"Calories: " + caloriesfactor_soda + " cal per oz"
                        }
                    }
                }

                ListModel{
                    id:model_soda
                    ListElement{
                        soda_image: "soda_1.jpg"
                        brand: "Coke"
                        waterPercent:0.89
                        caloriesfactor_soda: 11.67
                    }
                    ListElement{
                        soda_image: "soda_2.jpg"
                        brand: "Pepsi"
                        waterPercent:0.90
                        caloriesfactor_soda: 12.5
                    }
                    ListElement{
                        soda_image: "soda_3.jpg"
                        brand: "Mtn Dew"
                        waterPercent:0.90
                        caloriesfactor_soda: 14.17
                    }
                    ListElement{
                        soda_image: "soda_4.jpg"
                        brand: "Dr Pepper"
                        waterPercent:0.90
                        caloriesfactor_soda: 12.5
                    }
                    ListElement{
                        soda_image: "soda_5.jpg"
                        brand: "Sprite"
                        waterPercent:0.90
                        caloriesfactor_soda: 11.67
                    }
                    ListElement{
                        soda_image: "soda_6.jpg"
                        brand: "Fanta"
                        waterPercent:0.90
                        caloriesfactor_soda: 13.33
                    }
                }


                ScrollView {
                    anchors.fill:parent

                    ListView{
                        id: listView_soda
                        model:model_soda
                        width:parent.width
                        delegate: delegate_soda

                    }
                }
            }
            //page 2 sub page: tea selection page-------------------------------------------------------------
            Page{
                id:stack_tea
                width: 640
                height: 400


                background: Rectangle {
                    color: "light blue"
                }

                Label{
                    x:212
                    y:0
                    width: 153
                    height: 32
                    text:"Select tea"
                    font.bold: false
                    horizontalAlignment: Text.AlignHCenter
                    font.pointSize: 20
                }


                Component{
                    id:delegate_tea

                    Item{
                        id:item3
                        width: 300
                        height: 150


                        Image{
                            width: 150
                            height: 150
                            source:tea_image
                        }
                        MouseArea{
                            anchors.fill: item3
                            onClicked:{
                                stackview.pop()
                                drink_selection.text = "tea"
                                brand_selection.text = brand
                                alcoholValue = 0
                                waterPercentageInDrink = waterPercent
                                caloriesFactor = 0.25
                                calories_display.text = caloriesFactor
                                alcohol_display.text = "0"
                            }
                        }

                        Label{
                            x:180
                            y:90
                            text:brand
                        }
                        Label{
                            x:180
                            y:110
                            text:"Calories: 0.25 cal per oz"
                        }
                    }
                }

                ListModel{
                    id:model_tea
                    ListElement{
                        tea_image: "tea_1.jpg"
                        brand: "Black Tea"
                        waterPercent: 1
                    }
                    ListElement{
                        tea_image: "tea_2.jpg"
                        brand: "Green Tea"
                        waterPercent: 1
                    }
                    ListElement{
                        tea_image: "tea_3.jpg"
                        brand: "White Tea"
                        waterPercent: 1
                    }
                }


                ScrollView {
                    anchors.fill:parent

                    ListView{
                        id: listView_tea
                        model:model_tea
                        width:parent.width
                        delegate: delegate_tea

                    }
                }
            }
            //page 2 sub page: coffee selection page-------------------------------------------------------------
            Page{
                id:stack_coffee
                width: 640
                height: 400


                background: Rectangle {
                    color: "light blue"
                }

                Label{
                    x:212
                    y:0
                    width: 153
                    height: 32
                    text:"Select Coffee"
                    font.bold: false
                    horizontalAlignment: Text.AlignHCenter
                    font.pointSize: 20
                }


                Component{
                    id:delegate_coffee

                    Item{
                        id:item4
                        width: 300
                        height: 150


                        Image{
                            width: 150
                            height: 150
                            source:coffee_image
                        }
                        MouseArea{
                            anchors.fill: item4
                            onClicked:{
                                stackview.pop()
                                drink_selection.text = "Coffee"
                                brand_selection.text = brand
                                alcoholValue = 0
                                waterPercentageInDrink = waterPercent
                                caloriesFactor = caloriesfactor_coffee
                                caloriesfactor_coffee: 12.42
                                calories_display.text = caloriesFactor
                                alcohol_display.text = "0"
                            }
                        }
                        Label{
                            x:180
                            y:90
                            text:brand
                        }
                        Label{
                            x:180
                            y:110
                            text:"Calories: " + caloriesfactor_coffee + " cal per oz"
                        }
                    }
                }

                ListModel{
                    id:model_coffee
                    ListElement{
                        coffee_image: "coffee_1.jpg"
                        brand: "Black coffee"
                        waterPercent: 0.9875
                        caloriesfactor_coffee: 0.125
                    }
                    ListElement{
                        coffee_image: "coffee_2.jpg"
                        brand: "Latte"
                        waterPercent: 0.9875
                        caloriesfactor_coffee: 12.88
                    }
                    ListElement{
                        coffee_image: "coffee_3.jpg"
                        brand: "Cappuccino"
                        waterPercent: 0.9875
                        caloriesfactor_coffee: 8.125
                    }
                    ListElement{
                        coffee_image: "coffee_4.jpg"
                        brand: "Mocha"
                        waterPercent: 0.9875
                        caloriesfactor_coffee: 17.5
                    }
                }


                ScrollView {
                    anchors.fill:parent

                    ListView{
                        id: listView_coffee
                        model:model_coffee
                        width:parent.width
                        delegate: delegate_coffee

                    }
                }
            }

            StackView{
                id:stackview
                anchors.bottomMargin: 0
                initialItem:menuMainPage
                anchors.fill:parent

                background: Rectangle {
                    radius: 2
                    color: "light blue"
                    implicitWidth: 200
                    implicitHeight: 24
                }
            }
        }


        //page 3: setting page-------------------------------------------------------------
        Page {
            id: settingPage
            width: 600
            height: 400

            Page{
                id: settingMainPage
                width: 600
                height: 400

                header: Label {
                    height: 50
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
                    y: 305
                    text: "Save"

                    onClicked:{
                        if(male_radioDelegate.checked == true)
                        {
                            gender_display_textArea.text = qsTr("Male")
                            genderConstant = 3.75
                            genderString = "Male"
                        }
                        else
                        {
                            gender_display_textArea.text = qsTr("Female")
                            genderConstant = 4.7
                            genderString = "Female"
                        }

                        age_display_textArea.text = 2020 - ageComboBox.displayText
                        ageValue = age_display_textArea.text

                        weightValue = weightTextField.displayText
                        if(weightSelection_kg.checked == true){
                            weight_display_textArea.text = weightTextField.displayText + qsTr(" kg")
                            weightContent = weightTextField.displayText + qsTr(" kg")
                            // convert kg to lb
                            weightInPound = weightValue * 2.20462;
                        }
                        else{
                            weight_display_textArea.text = weightTextField.displayText + qsTr(" lb")
                            weightContent = weightTextField.displayText + qsTr(" lb")
                            weightInPound = weightValue
                        }
                        waterNeed = weightInPound * (2/3)
                        name = nameTextField.text
                        name_display_textArea.text = name

                        tabBar.currentIndex = 0
                    }
                }

                Button {
                    id: userManuel_button
                    x: 460
                    y: 25
                    text: qsTr("User Manuel")
                    highlighted: true

                    onClicked: {
                        stackview_setting.pop()
                    }
                }

                Rectangle {
                    x: 0
                    y: -51
                    width: 600
                    height: 51
                    color: "#000000"
                }

                Label {
                    id: ageLabel1
                    x: 65
                    y: 260
                    text: qsTr("Weight")
                    font.pointSize: 20
                }

                Label {
                    id: weightLabelSetting
                    x: 65
                    y: 190
                    width: 118
                    height: 29
                    text: qsTr("Year Of Birth")
                    font.pointSize: 20
                }

                TextField {
                    id: weightTextField
                    x: 165
                    y: 251
                    width: 147
                    height: 40
                    placeholderText: qsTr("Text Field")
                }

                ComboBox {
                    id: ageComboBox
                    x: 210
                    y: 180
                    model: ["1980", "1981", "1982", "1983", "1984", "1985", "1986", "1987", "1988", "1989", "1990", "1991", "1992", "1993", "1994", "1995", "1996", "1997", "1998", "1999", "2000", "2001", "2002", "2003", "2004", "2005", "2006", "2007", "2008", "2009", "2010"]
                }

                Rectangle {
                    id: seperator1
                    x: 12
                    y: 80
                    width: 577
                    height: 1
                    color: "#ffffff"
                }

                Rectangle {
                    id: seperator2
                    x: 12
                    y: 160
                    width: 577
                    height: 1
                    color: "#ffffff"
                }

                Rectangle {
                    id: seperator3
                    x: 12
                    y: 240
                    width: 577
                    height: 1
                    color: "#ffffff"
                }

                RadioDelegate {
                    id: weightSelection_kg
                    x: 332
                    y: 252
                    width: 102
                    height: 38
                    text: qsTr("Kg")
                    checked: true
                    checkable: true
                    autoExclusive: true
                    autoRepeat: false
                }

                RadioDelegate {
                    id: weightSelection_lb
                    x: 464
                    y: 252
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

                Label {
                    id: genderLabel1
                    x: 65
                    y: 110
                    width: 70
                    height: 24
                    text: qsTr("Gender")
                    font.pointSize: 20
                }

                Pane {
                    id: gender_pane
                    x: 143
                    y: 88
                    width: 428
                    height: 68
                    clip: false
                    scale: 1
                    visible: true

                    background: Rectangle {
                        radius: 2
                        color: "light blue"
                        implicitWidth: 50
                        implicitHeight: 24
                    }

                    RadioDelegate {
                        id: male_radioDelegate
                        x: 24
                        y: 6
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
                        x: 169
                        y: 6
                        width: 127
                        height: 38
                        text: qsTr("Female")
                        hoverEnabled: false
                        enabled: true
                        highlighted: false
                        autoExclusive: true
                        autoRepeat: false
                    }
                }


                Label {
                    id: nameLabelSetting
                    x: 65
                    y: 30
                    width: 60
                    height: 29
                    text: qsTr("Name")
                    font.pointSize: 20
                }

                TextField {
                    id: nameTextField
                    x: 165
                    y: 25
                    width: 147
                    height: 40
                    placeholderText: qsTr("Text Field")
                }
            }

            Page{
                id:infoPage
                width: 600
                height: 400

                header: Label {
                    height: 50
                    color: "#ffffff"
                    text: qsTr("Introduction")
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

                Rectangle {
                    x: 0
                    y: -51
                    width: 600
                    height: 51
                    color: "#000000"
                }

                Text {
                    id: welcomeText
                    x: 14
                    y: 16
                    width: 174
                    height: 20
                    text: qsTr("Welcome to Fluid Buddy")
                    font.pixelSize: 16
                }

                Text {
                    id: introText
                    x: 14
                    y: 49
                    width: 512
                    height: 229
                    text: "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0//EN\" \"http://www.w3.org/TR/REC-html40/strict.dtd\">\n<html><head><meta name=\"qrichtext\" content=\"1\" /><style type=\"text/css\">\np, li { white-space: pre-wrap; }\n</style></head><body style=\" font-family:'.AppleSystemUIFont'; font-size:13pt; font-weight:400; font-style:normal;\">\n<ol style=\"margin-top: 0px; margin-bottom: 0px; margin-left: 0px; margin-right: 0px; -qt-list-indent: 1;\"><li style=\"\" style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\">Setting Page</li>\n<p style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:1; text-indent:0px;\">User can import personal information to calculate Human water level, <br />Blood Alcohol Content and Calories.</p>\n<p style=\"-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:1; text-indent:0px;\"><br /></p>\n<p style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:1; text-indent:0px;\">Information need: Name, Age, Gender, Weight</p>\n<p style=\"-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><br /></p>\n<li style=\"\" style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\">Home Page</li>\n<p style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:1; text-indent:0px;\">User can keep track on water level, BAC and Calories</p>\n<p style=\"-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:1; text-indent:0px;\"><br /></p>\n<li style=\"\" style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\">Menu</li>\n<p style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:1; text-indent:0px;\">User can selete the fluid type and brand</p>\n<p style=\"-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:1; text-indent:0px;\"><br /></p>\n<li style=\"\" style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\">History</li></ol>\n<p style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:1; text-indent:0px;\">User can keep track on history</p>\n<p style=\"-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><br /></p>\n<p style=\"-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><br /></p></body></html>"
                    font.pixelSize: 14
                    textFormat: Text.RichText
                }

                Button {
                    id: done_button
                    x: 250
                    y: 284
                    text: qsTr("Done")

                    onClicked: {
                        stackview_setting.push(settingMainPage)
                    }
                }

            }

            StackView{
                id:stackview_setting
                anchors.bottomMargin: 0
                initialItem:infoPage
                anchors.fill:parent

                background: Rectangle {
                    radius: 2
                    color: "light blue"
                    implicitWidth: 200
                    implicitHeight: 24
                }
            }
        }





        Page{
            id:historyPage
            width: 600
            height: 400

            header: Label {
                color: "#f7fffb"
                text: qsTr("History")
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
                x: 0
                y: -51
                width: 600
                height: 51
                color: "#000000"
            }

            Component{
                id:delegate_history

                Item{
                    id:item4
                    width: 300
                    height: 50

                    Label{
                        x:10
                        y:20
                        text: i
                    }

                    Label{
                        x:50
                        y:20
                        text:user_name
                    }

                    Label{
                        x:110
                        y:20
                        text:drink_history
                    }
                    Label{
                        x:170
                        y:20
                        text:brand_history
                    }
                    Label{
                        x:250
                        y:20
                        text:size
                    }
                    Label{
                        x:290
                        y:20
                        text:calories
                    }
                    Label{
                        x:350
                        y:20
                        text:date
                    }

                }
            }

            ListModel{
                id:model_history
                ListElement{
                    i: 0
                    user_name: "User"
                    drink_history: "Drink"
                    brand_history: "Brand"
                    size: "Size"
                    calories: "Calories"
                    date: "Date&Time"
                }
            }


            ScrollView {
                anchors.fill:parent

                ListView{
                    id: listView_history
                    model:model_history
                    width:parent.width
                    delegate: delegate_history

                }
            }

        }

    }

    footer: TabBar {
        id: tabBar
        currentIndex: swipeView.currentIndex

        TabButton {
            text: qsTr("Home")
        }
        TabButton {
            text: qsTr("Menu")
        }
        TabButton {
            text: qsTr("Settings")
        }
        TabButton{
            text: qsTr("History")
        }
    }
}






