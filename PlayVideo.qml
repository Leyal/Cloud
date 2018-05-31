import QtQuick 2.0
import QtMultimedia 5.0
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.2
import QtQuick.Layouts 1.1
import QtQuick.Dialogs 1.2
Rectangle
{
//    property string _mvSource:"https://lc-ba69fjyb.cn-n1.lcfile.com/b41cbb9be76ad691f165.mp4"
    property var playMV: (function(url){
//       _mvSource = url
    })
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

    id:screen
    anchors.fill: parent
    Rectangle {

        anchors.fill: parent
        color: "black"
        MediaPlayer {
            id: mediaplayer
            source: "https://lc-ba69fjyb.cn-n1.lcfile.com/b41cbb9be76ad691f165.mp4"
//            source: _mvSource
            autoLoad: true
            autoPlay: true
            loops: 0
            onPlaying:
            {
                btn_play_pause.source = "http://lc-ba69fjyb.cn-n1.lcfile.com/f1fe434995a4a837bb4d.png"
            }
            onPaused:
            {
                btn_play_pause.source = "http://lc-ba69fjyb.cn-n1.lcfile.com/d9b4e8476c46c3a2e5b8.png"
            }
            onPositionChanged: {
//                playPos.value=position/1000;
            }
            onSourceChanged:
            {
                btn_play_pause.source = "http://lc-ba69fjyb.cn-n1.lcfile.com/f1fe434995a4a837bb4d.png"
            }
        }
        VideoOutput {
            anchors.fill: parent
            source: mediaplayer
        }
        Component.onCompleted:
        {

        }

        MouseArea {
            id: playArea
            property bool isF: false
            anchors.fill: parent
            onPressed: mediaplayer.play();
            onClicked:
            {
                if(!isF)
                {
                    mediaplayer.pause()
                    isF = !isF
                }
                else
                {
                    mediaplayer.play()
                    isF = !isF
                }
            }

        }
        //
        Rectangle
        {
            id:control
            width: screen.width
            height: 30*dp
            color: "black"
            border.color: "white"
            anchors
            {
                left:parent.left
                bottom:parent.bottom
                bottomMargin:0
            }
            Image {
                id: btn_play_pause
                source: "http://lc-ba69fjyb.cn-n1.lcfile.com/f1fe434995a4a837bb4d.png"
                width: 11*dp
                height: 10*dp
                anchors
                {
                    left:parent.left
                    leftMargin:17*dp
                    verticalCenter:parent.verticalCenter
                }
                MouseArea
                {
                    property bool isPlay: false
                    onClicked:
                    {
                        if(!isPlay)
                        {
                            btn_play_pause.state == 'pause' ? btn_play_pause.state = ' ':btn_play_pause.state = 'pause';
                            mediaplayer.play()
                            isPlay = !isPlay
                        }
                        else
                        {
                            btn_play_pause.state == 'play' ? btn_play_pause.state = ' ':btn_play_pause.state = 'play';
                            mediaplayer.pause()
                            isPlay = !isPlay
                        }
                    }
                }
            }
            //进度条
            Slider{
                id:playPos
                width:screen.width*0.66
                height: 10
                maximumValue: mediaplayer.duration
                minimumValue: 0
                value:mediaplayer.position
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: btn_play_pause.right
                anchors.leftMargin: 10*dp
                stepSize:1000
                function updateData()
                {
                    playPos.value= mediaplayer.duration * mouse.x/parent.width
                }

                style: SliderStyle {
                    groove: Rectangle {
                        width: screen.width*0.66
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
                        width: 0
                        height: 0
//                        color: control.pressed ? "white" : "darkgray"
//                        border.color: "#A51100"
//                        border.width: 4
//                        implicitWidth: 12
//                        implicitHeight:12
//                        radius:6
//                        Rectangle{
//                            width: 4
//                            height: width
//                            radius: width/2
//                            color: "white"
//                            anchors.centerIn: parent
//                        }
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
                        playPos.updateData()
                    }
                }
            }
            Text {
                id: sliderValue
                color: "white"
                text:screen.currentTime(mediaplayer.position)+"/"+screen.currentTime(mediaplayer.duration)
                anchors
                {
                    verticalCenter:parent.verticalCenter
                    left:playPos.right
                    leftMargin:10*dp

                }
            }
            //音量按钮图片
            Image {
                id: voiceIcon
                source: "http://lc-ba69fjyb.cn-n1.lcfile.com/d85c708b8ca718aa1bdc.png"
                width: 10*dp
                height: 8*dp
                anchors
                {
                    left:sliderValue.right
                    leftMargin:10*dp
                    verticalCenter:parent.verticalCenter
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
                anchors.leftMargin: 10*dp
                onValueChanged:
                {
                    mediaplayer.volume = value
                }

                style: SliderStyle {
                    groove: Rectangle {
                        implicitWidth: screen.width*0.2
                        implicitHeight: 3
                        color: "gray"
                        radius: 2
                        Rectangle {
                            anchors.left: parent.left
                            anchors.top: parent.top
                            anchors.bottom: parent.bottom
                            width: mediaplayer.volume>0?parent.width*mediaplayer.volume:0
                            color: "#A51100"
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
        }
    }
}


