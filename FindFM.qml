import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls 2.4
import QtGraphicalEffects 1.0
import QtMultimedia 5.8
Rectangle
{
    id:rootWindow
    width: parent.width
    height: parent.height

    Item {
        id:item
        width: 300*dp
        height: 300*dp
        anchors
        {
            left:parent.left
            leftMargin:30*dp
            top:parent.top
            topMargin:30*dp
        }
        Rectangle
        {
            border.color: "black"
            color: "black"
            width: parent.width
            height: parent.width
            anchors.fill: parent
            radius: parent.width/2
        }

        Image
        {
            id:img
            source: "http://p1.music.126.net/8UlHDv3_ynDCsz4TC-Raxw==/109951163160241235.jpg"
            sourceSize: Qt.size(parent.width, parent.height)
            smooth: true
            visible: false

        }
        Rectangle{
            id:mask
            width: parent.width/2
            height: parent.height/2
            anchors.centerIn: parent
            radius: width/2
        }

        OpacityMask {
            anchors.centerIn: parent
            width: parent.width/1.5
            height: parent.height/1.5
            source: img
            maskSource: mask
        }
        MouseArea
        {
            anchors.fill: parent
            onClicked:
            {
                playSong("https://lc-ba69fjyb.cn-n1.lcfile.com/f7d81aba8f78eccdc39c.mp3")
                setMusicInfo("http://p1.music.126.net/8UlHDv3_ynDCsz4TC-Raxw==/109951163160241235.jpg",
                             "Hear Me Now","Alok")
                animation.start()
            }
        }
        MediaPlayer
        {
            id:player
            source: "https://lc-ba69fjyb.cn-n1.lcfile.com/f7d81aba8f78eccdc39c.mp3"
        }
        RotationAnimation
        {
            id:animation
            target: item
            from: 0
            to:360
            duration: 192*1000

        }
    }
    Rectangle
    {
        id:center
        width: 53*dp
        height: 24*dp
        radius: 10*dp
        color: "#A51100"
        anchors
        {
            horizontalCenter:item.horizontalCenter
            bottom:rootWindow.bottom
            bottomMargin:100*dp
        }

        Text {
            text: qsTr("喜欢")
            font.pixelSize: 12
            color: "white"
            anchors.centerIn: parent
        }
    }

    Rectangle
    {
        width: 53*dp
        height: 24*dp
        radius: 10*dp
        color: "#A51100"
        anchors
        {
            right:center.left
            rightMargin:30*dp
            bottom:rootWindow.bottom
            bottomMargin:100*dp
        }

        Text {
            text: qsTr("收藏")
            font.pixelSize: 12
            color: "white"
            anchors.centerIn: parent
        }
    }

    Rectangle
    {
        width: 53*dp
        height: 24*dp
        radius: 10*dp
        color: "#A51100"
        anchors
        {
            left:center.right
            leftMargin:30*dp
            bottom:rootWindow.bottom
            bottomMargin:100*dp
        }

        Text {
            text: qsTr("分享")
            font.pixelSize: 12
            color: "white"
            anchors.centerIn: parent
        }
    }


    ScrollView
    {

        width: parent.width/2
        height: parent.height-50*dp
        contentWidth: parent.width/2
        contentHeight: parent.height*2
        clip:true
        anchors
        {
            left:img.right
            leftMargin:20*dp
            right:parent.right
            rightMargin:20*dp
            top:item.top
            topMargin:0
        }
        Text {
            anchors.fill: parent
            id: txt
            wrapMode: Text.WordWrap
            text: "If you get to hear me now
如果现在倾听我的话
I know you'll get stronger
我确信你会变得更强
When you get older
你长大了
Just don't shrug your shoulders
遇事哪能只是耸耸肩膀
When you get older
你成长了
Things aren't easy
懂得万事哪有一蹴而就
So just you believe me now
所以现在何不信我良言
If you don't keep it cool now
此时不搏，更待何时
You'll never make a sound
错失良机，默默无闻

All the lights will guide the way
熠熠星光照亮你前行
If you get to hear me now
请倾听我的话吧
All the fears will fade away
所有的恐惧都将消散
If you get to hear me now
请倾听我的话吧
If you get to hear me now
请倾听我的话吧
If you get to hear me now
请倾听我的话吧

Leave excuses aside
撇开你那些借口
Speak out your mind
大声地抒发己见
Don't let in slide
不要任其溜走
You're not always right
人非圣贤，孰能无过
Things aren't easy
万事没有一蹴而就
So just you believe me now
所以现在何不信我良言
Don't learn the hard way
怎能舍近求远
Just let me show you how
就让我引你开辟捷径

All the lights will guide the way
熠熠星光照亮你前行
If you get to hear me now
请倾听我的话吧
All the fears will fade away
所有的恐惧都将消散
If you get to hear me now
请倾听我的话吧
If you get to hear me now
请倾听我的话吧
If you get to hear me now
请倾听我的话吧
If you get to hear me now
请倾听我的话吧
If you get to hear me now
请倾听我的话吧
If you get to hear me now
请倾听我的话吧
If you get to hear me now
请倾听我的话吧"

        }
    }
}
