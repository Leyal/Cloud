import QtQuick 2.0

Rectangle
{
    property string _source
    property string _text
    property int _imgWidth
    property int _imgHeight
    property int _imgSpacing
    property int _textSpacing
    property var onClicked: (function(){})
    id:leftCustomButton
    Image
    {
        id:img
        width: _imgWidth
        height: _imgHeight
        anchors
        {
            left:parent.left
            leftMargin:_imgSpacing

        }
    }

}
