import QtQuick 2.0
Rectangle
{
    property string _source
    property string _title
    property string _detail
    property int _playCount
    property var onItemClicked:(function(){})
    width: 231*dp
    height: 191*dp
    anchors
    {
        left:parent.left
        leftMargin:16*dp
        top:parent.top
        topMargin:78*dp
    }
    Image
    {
        id:img
        source: _source
        width: parent.width
        height: 124*dp
        anchors
        {
            left:parent.left
            top:parent.top
        }
        Image {
            width: 33*dp
            height: 33*dp
            source: "http://lc-ba69fjyb.cn-n1.lcfile.com/b594990f2ef10a138041.png"
            anchors.centerIn: parent
        }
        Image {
            id: playCount
            source: "http://lc-ba69fjyb.cn-n1.lcfile.com/57078656bab989e9d6a4.png"
            width: 18*dp
            height: 10*dp
            anchors
            {
                right:parent.right
                rightMargin:40*dp
                top:parent.top
                topMargin:7*dp
            }
        }
        Text {
            id: play_count
            text: _playCount
            font.pixelSize: 12
            color: "white"
            width: 30*dp
            anchors
            {
                left:playCount.right
                leftMargin:3*dp
                right:parent.right
                rightMargin:3*dp
                verticalCenter:playCount.verticalCenter
            }
        }
    }
    Text {
        id: label
        text: qsTr(_title)
        width: parent.width
        wrapMode: Text.WordWrap
        font.pixelSize: 16
        anchors
        {
            top:img.bottom
            topMargin:3*dp
            left:parent.left
            leftMargin:3*dp
        }
    }
    Text {
        id: detail
        text: qsTr(_detail)
        font.pixelSize: 13
        width: parent.width
        wrapMode: Text.WordWrap
        anchors
        {
            top:label.bottom
            topMargin:3*dp
            left:parent.left
            leftMargin:0
        }
    }
    MouseArea
    {
        anchors.fill: parent
        onClicked:
        {
            console.log("&*&*&*&*&*&*&*&")
            onItemClicked()
        }
    }

}
