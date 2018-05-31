import QtQuick 2.0
import QtGraphicalEffects 1.0
Rectangle
{
    id:songMessageView
    width: 190*dp
    height: 85*dp
    property var setInfo: (function(url,title,text)
                                {
                                    img.source = url;
                                    songName.text = title
                                    singer.text = text
                                })
    //头像
    Item
    {
        property bool isFirstClick: false
        width: 50*dp
        height: 50*dp
        anchors
        {
            left:parent.left
            leftMargin:20*dp
            verticalCenter:parent.verticalCenter
        }

        Image {
            id: img
            source: "http://lc-ba69fjyb.cn-n1.lcfile.com/BIDDmLSwSosWhO8mxcqIJ3A"
            sourceSize: Qt.size(parent.width, parent.height)
            smooth: true
            visible: false
        }

        Rectangle{
            id:mask
            anchors.fill: parent
            radius: 5*dp
        }

        OpacityMask {
            anchors.fill: parent
            source: img
            maskSource: mask
        }
        //点击事件
        MouseArea
        {
            anchors.fill: parent
            onClicked:
            {
                if(!parent.isFirstClick)
                {
                    personPopup.open()
                    parent.isFirstClick = ! parent.isFirstClick
                }
                else
                {
                    personPopup.close()
                    parent.isFirstClick = ! parent.isFirstClick
                }
            }
        }
        //歌曲名称
        Text {
            id: songName
            text: qsTr("Nothing to fear");font.pixelSize: 14;width: 60*dp;
            font.bold: true
            anchors
            {
                top:parent.top
                topMargin:10*dp
                left:img.right
                leftMargin:10*dp
            }
        }
        //歌手
        Text {
            id: singer
            text: qsTr("Dexter Britain");font.pixelSize: 14;width: 60*dp;
            anchors
            {
                bottom:parent.bottom
                bottomMargin:6*dp
                left:img.right
                leftMargin:10*dp
            }
        }
    }
}

