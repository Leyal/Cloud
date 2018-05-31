import QtQuick 2.0

Rectangle
{
    property int _width
    property int _height
    property string _source
    property string _text
    property string _detailText
    property int _spacing
    width: _width
    height: _height
    Image {
        id:img
        source: _source
        width: _height
        height: _height
        anchors
        {
            left:parent.left
            leftMargin:0
            top:parent.top
            topMargin:0
        }
    }
    Text
    {
        id:titleText
        width: _width - _height -_spacing
        height: _height - _spacing*2
        text: _text
        font.pixelSize: 20
        wrapMode: Text.WordWrap
        anchors
        {
            left:img.right
            leftMargin:_spacing/2
            right:parent.right
            rightMargin:_spacing/2
            top:parent.top
            topMargin:_spacing/2
            bottom:parent.bottom
            bottomMargin:_spacing/2
        }
    }
    Text {
        width: _width - _height -_spacing
       font.pixelSize: 14
        text: qsTr(_detailText)
        color:"gray"
        wrapMode: Text.WordWrap
        anchors
        {
            top:titleText.bottom
            topMargin:-30*dp
            left:titleText.left
        }
    }
}
