import QtQuick 2.0
import QtQuick.Window 2.2
import QtMultimedia 5.8
//import "qrc:/MV.qml"

Window {
    id:rootWindow
    property real dpScale: 1.5;     //在不同的分辨率屏幕下的窗口伸缩因子
    //    readonly property real dp: Math.max(Screen.pixelDensity*25.4/160*dpScale);
    readonly property real dp: 1
    visible: true
    width: 1050*dp
    height: 650*dp
    color: "white"

    TitleBarView{id:titleBarView}
    LeftScrollView{id:leftScrollView}
    //分割线
    Rectangle
    {
        id:diverLine1
        width: 1*dp
        height: 537.5*dp
        color: "#706D6D"
        anchors
        {
            top:titleBarView.bottom
            topMargin:0
            left:leftScrollView.right
            leftMargin:0
        }
    }
    //分割线
    Rectangle
    {
        id:diverLine2
        width: 190*dp
        height: 1*dp
        color: "#706D6D"
        anchors
        {
            top:leftScrollView.bottom
            topMargin:0
            right:diverLine1.left
            rightMargin:0
        }
    }
    SongMessageView
    {
        id:songMessageView
        anchors
        {
            left:parent.left
            leftMargin:0
            top:diverLine2.bottom
            topMargin:0*dp
        }
    }

    //分割线

    BottomControlView{id:bottom1

    }
    //    MyTabView{}
    Loader{
        id:rightWd;
        width: 857*dp
        height: 539*dp
        anchors
        {
            left:leftScrollView.right
            leftMargin:1*dp
            top:titleBarView.bottom
            bottom:bottom1.top
            bottomMargin:0*dp
        }

        source: "qrc:/MyTabView.qml";
    }
    MV{width: 0;height: 0;visible: false}
    MyTabView{width: 0;height: 0;visible: false}
    FindFM{width: 0;height: 0;visible: false}
//    PlayVideo{id:videoPlay;width: 0;height: 0;visible: false}
    //跳转到各个界面，相当于路由
    function rightWdRouter(url,properties){
        rightWd.setSource(url,properties);
    }

    //播放网络音乐
    function playSong(url){
        bottom1.leyalPlay(url)
    }
    function setMusicInfo(url,title,text)
    {
        songMessageView.setInfo(url,title,text)
    }
    function playOtherMv(url)
    {
        videoPlay.playMV(url)
    }
}
