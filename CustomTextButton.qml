import QtQuick 2.0

Rectangle
{
    id:myRec
    property int _width
    property int _height
    property string _text
    property var onButtonClick: (function(){})
    //    id:textButton
    width: _width
    height: _height
    Text
    {
        id:buttonText
        text: _text
        font.pixelSize: 18
        color: "black"
        anchors.fill: parent
    }
    MouseArea
    {
        anchors.fill: parent
        onClicked:
        {
            onClicked: myRec.state === 'clicked' ? myRec.state = "" : myRec.state = 'clicked';
            onButtonClick()
        }
    }

        states: [
            State {
                name: "clicked"
                PropertyChanges { target: buttonText; color: "red" }
            }
        ]
}
