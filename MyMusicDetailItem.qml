import QtQuick 2.0

Item {
    id:myMusicDetailItem
    property int _width:150*dp
    property int _height:180*dp
    property string _source
    property var onImageClick: (function(){})
    property string _musicText
    property string _musicIcon:"http://lc-ba69fjyb.cn-n1.lcfile.com/3dbbd07f14f9e3d6d14e.png"
    property string _playCount
    width: _width
    height: _height
    Rectangle
    {
        anchors.fill: parent
        Image {
            id: musicIcon
            source: _source
            width: _width
            height: _width
            Image {
                id:musciImg
                source: _musicIcon
                width: 16*dp
                height: 16*dp
                anchors
                {
                    right:parent.right
                    rightMargin:40*dp
                    top:parent.top
                    topMargin:5*dp
                }
            }
            Text {
                text: qsTr(_playCount)
                font.pixelSize: 11
                color: "white"
                anchors
                {
                    left:musciImg.right
                    leftMargin:3*dp
                    right:parent.right
                    rightMargin:3*dp
                    verticalCenter:musciImg.verticalCenter
                }
            }
        }

        Text {
            id: musicIcomText
            text: qsTr(_musicText)
            width: _width
            wrapMode: Text.WordWrap
            height: 30*dp
            anchors
            {
                top:musicIcon.bottom
                topMargin:5*dp
                horizontalCenter:musicIcon.horizontalCenter
            }
        }
        MouseArea
        {
            anchors.fill: parent
            onClicked:
            {
                onImageClick()
            }
        }
    }

}
