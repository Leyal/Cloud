import QtQuick 2.0

Item
{
    property int _width
    property int _height
    property string _normalSource
    property string _pressSource
    property var onButtonClicked: (function(){})
    id:button
    width: _width
    height: _height
    Image
    {
        id:buttonImage
        width: parent.width
        height: parent.height
        source: _normalSource
        anchors.fill: parent
    }
    MouseArea
    {
        anchors.fill: parent
        onClicked: onButtonClicked()
//        onPressed:buttonImage.source = _pressSource
//        onReleased: buttonImage.source = (button.enabled ?_normalSource : _pressSource)
    }
}
