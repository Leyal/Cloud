import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtMultimedia 5.8
Rectangle
{
    property bool isPlay: false
    property var leyalPlay: (function(url)
    {
        mediaplayer.source = url;
        playPauseBtn.state = "play"
        mediaplayer.play();

        //                                    bottomControlView.isPlay = !bottomControlView.isPlay
    })
    id:bottomControlView
    width: 1050*dp
    height: 63*dp
    //    color: "#D8D8D8"
    anchors
    {
        left:parent.left
        leftMargin:0
        right:parent.right
        rightMargin:0
        bottom:parent.bottom
    }
    MediaPlayer
    {
        id:mediaplayer
        source:"https://lc-ba69fjyb.cn-n1.lcfile.com/c6eed7879d00b5310a0c.mp3"
        onStopped:
        {
            playPauseBtn.state = "pause"
        }
    }


    //时间格式化
    function currentTime(time)
    {
        var sec= Math.floor(time/1000);
        var hours=Math.floor(sec/3600);
        var minutes=Math.floor((sec-hours*3600)/60);
        var seconds=sec-hours*3600-minutes*60;
        var hh,mm,ss;
        if(hours.toString().length<2)
            hh="0"+hours.toString();
        else
            hh=hours.toString();
        if(minutes.toString().length<2)
            mm="0"+minutes.toString();
        else
            mm=minutes.toString();
        if(seconds.toString().length<2)
            ss="0"+seconds.toString();
        else
            ss=seconds.toString();
        return mm+":"+ss
    }
    Rectangle
    {
        id:diverLine3
        width: 1050*dp
        height: 1*dp
        color: "#706D6D"
        anchors
        {
            top:parent.top
            topMargin:0
            left:parent.left
            leftMargin:0
            right:parent.right
            rightMargin:0
        }
    }
    MyImageButton
    {
        _width:33*dp
        _height:33*dp
        _normalSource:"qrc:/NeteasCloudImages/lowerButtonNormal.png"
        _pressSource:"qrc:/NeteasCloudImages/lowerButtonPress.png"
        anchors
        {
            left:parent.left
            leftMargin:10*dp
            verticalCenter:parent.verticalCenter
        }
        onButtonClicked: function()
        {
            console.log("上一首")
        }
    }
    //播放暂停
    MyImageButton
    {
        id:playPauseBtn

        _width:38*dp
        _height:38*dp
        _normalSource:"qrc:/NeteasCloudImages/playButtonNormal.png"
//        _pressSource:"qrc:/NeteasCloudImages/playButtonNormal.png"
        anchors
        {
            left:parent.left
            leftMargin:75*dp
            verticalCenter:parent.verticalCenter
        }
        states: [
            State {
                name: "play"
                PropertyChanges {
                    target: playPauseBtn
                    _normalSource:"qrc:/NeteasCloudImages/pauseButton.png"

                }
            },
            State {
                name: "pause"
                PropertyChanges {
                    target: playPauseBtn
                    _normalSource:"qrc:/NeteasCloudImages/playButtonNormal.png"
                }
            }
        ]
        onButtonClicked: function()
        {
            if(mediaplayer.hasAudio)
            {
                if(playPauseBtn.state==="play")
                {
                    playPauseBtn.state="pause";
                    mediaplayer.pause();
                }
                else
                {
                    playPauseBtn.state="play";
                    mediaplayer.play();
                }
            }
        }
    }
    MyImageButton
    {
        _width:33*dp
        _height:33*dp
        _normalSource:"qrc:/NeteasCloudImages/upperButtonNormal.png"
        _pressSource:"qrc:/NeteasCloudImages/upperButtonPress.png"
        anchors
        {
            left:parent.left
            leftMargin:145*dp
            verticalCenter:parent.verticalCenter
        }
        onButtonClicked: function()
        {
            console.log("下一首")
        }
    }

    //进度条
    Slider{
        id:playPos
        width:bottomControlView.width*0.45
        height: 10
        maximumValue: mediaplayer.duration
        minimumValue: 0
        value:mediaplayer.position
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: 220*dp
        stepSize:1000
        function updateData()
        {
            playPos.value= mediaplayer.duration * mouse.x/parent.width
        }

        style: SliderStyle {
            groove: Rectangle {
                width: bottomControlView.width*0.45
                height: 3
                color: "gray"
                radius: 1
                Rectangle {
                    anchors.left: parent.left
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    width: mediaplayer.duration>0?parent.width*mediaplayer.position/mediaplayer.duration:0
                    color: "red"
                }
            }
            handle: Rectangle {
                anchors.centerIn: parent
                color: control.pressed ? "white" : "darkgray"
                border.color: "#A51100"
                border.width: 4
                implicitWidth: 12
                implicitHeight:12
                radius:6
                Rectangle{
                    width: 4
                    height: width
                    radius: width/2
                    color: "white"
                    anchors.centerIn: parent
                }
            }
        }
        //点击鼠标设置播放位置
        MouseArea {
            property int pos
            anchors.fill: parent
            onClicked: {
                if (mediaplayer.seekable)
                    pos = mediaplayer.duration * mouse.x/parent.width
                mediaplayer.seek(pos)
                playPos.value=pos
            }
        }
    }
    Text {
        id: sliderValue
        color: "black"
        text:bottomControlView.currentTime(mediaplayer.position)+"/"+bottomControlView.currentTime(mediaplayer.duration)
        anchors
        {
            verticalCenter:parent.verticalCenter
            left:playPos.right
            leftMargin:10*dp

        }
    }
    //音量

    Image
    {
        id:voiceIcon
        width: 20*dp
        height: 16*dp
        source: "qrc:/NeteasCloudImages/voiceButton.png"
        anchors
        {
            right:parent.right
            rightMargin:235*dp
            verticalCenter:parent.verticalCenter
        }
        MouseArea
        {
            anchors.fill: parent
            onClicked:rightWdRouter("qrc:/LeftScrollView.qml",{})
        }
    }
    //调节音量
    Slider{
        id:voice
        width: 125*dp
        height: 10
        anchors.verticalCenterOffset: 0
        value:mediaplayer.volume
        stepSize: 0.1
        maximumValue: 1
        minimumValue: 0
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: voiceIcon.right
        anchors.leftMargin: 5*dp
        onValueChanged:
        {
            mediaplayer.volume = value
        }

        style: SliderStyle {
            groove: Rectangle {
                implicitWidth: 120*dp
                implicitHeight: 3
                color: "gray"
                radius: 2
                Rectangle {
                    anchors.left: parent.left
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    width: mediaplayer.volume>0?parent.width*mediaplayer.volume:0
                    color: "red"
                }
            }
            handle: Rectangle {
                anchors.centerIn: parent
                color: "white"
                border.color: "black"
                border.width: 1
                implicitWidth: 8
                implicitHeight: 8
                radius:4

            }
        }
    }

    //歌词按钮
    Image
    {
        id:lyric
        width: 16*dp
        height: 16*dp
        source: "qrc:/NeteasCloudImages/lyricButton.png"
        anchors
        {
            verticalCenter:parent.verticalCenter
            right:parent.right
            rightMargin:82*dp
        }
        MouseArea
        {
            anchors.fill: parent
            onClicked:
            {
//                rightWdRouter("qrc:/LyricView.qml",{})
            }
        }
    }

    //更多按钮
    Image
    {
        id:moreButton
        width: 18*dp
        height: 14*dp
        source:"qrc:/NeteasCloudImages/menuButton.png"
        anchors
        {
            verticalCenter:parent.verticalCenter
            right:parent.right
            rightMargin:41*dp
        }
    }
}
