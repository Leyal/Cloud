
import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick 2.7
//import QtQuick.Controls 2.1
import QtQuick.Controls 2.4
ScrollView
{
    id:myTabView
//    width: 857*dp
//    height: 537*dp
    width: parent.width
    height: parent.height
    contentWidth: 857*dp
    contentHeight: 1230*dp
    ScrollBar.vertical.policy: ScrollBar.AlwaysOn
    clip: true//文档中说的是如果不是作为全屏显示  应该设置为true
    Loader
    {
        id:loader
    }

    //Tab按钮
    //推荐
    Rectangle{
        id:listViewOfScrollView
        width: 857*dp
        height: 537*dp
//        color:"purple"
//                anchors.fill: parent
        anchors
        {
            left:parent.left
            leftMargin:0
            top:parent.top
            topMargin:0
        }

        Rectangle
        {
            id:recommend
            width: 77*dp
            height: 27*dp
            anchors
            {
                left:parent.left
                leftMargin:126*dp
                top:parent.top
                topMargin:11*dp
            }
            Text {
                id: recommendText
                text: qsTr("推荐")
                font.pixelSize: 16
                color: "red"
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
            }
            MouseArea
            {
                anchors.fill: parent
                hoverEnabled: true
                enabled: true
                onClicked:
                {
                    console.log("11111111111111");
                }
            }
        }
        //排行榜
        Rectangle
        {
            id:sortList
            width: 77*dp
            height: 27*dp
            anchors
            {
                left:parent.left
                leftMargin:242*dp
                top:parent.top
                topMargin:11*dp
            }
            Text {
                id: sortListText
                text: qsTr("排行榜")
                font.pixelSize: 16
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
            }
            MouseArea
            {
                anchors.fill: parent
                hoverEnabled: true
                enabled: true
                onClicked:
                {
                    console.log("11111111111111");
                }
            }
        }
        //歌单
        Rectangle
        {
            id:songList
            width: 77*dp
            height: 27*dp
            anchors
            {
                left:parent.left
                leftMargin:366*dp
                top:parent.top
                topMargin:11*dp
            }
            Text {
                id: songListText
                text: qsTr("歌单")
                font.pixelSize: 16
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
            }
            MouseArea
            {
                anchors.fill: parent
                hoverEnabled: true
                enabled: true
                onClicked:
                {
                    console.log("11111111111111");
                }
            }
        }
        //主播电台
        Rectangle
        {
            id:zhuboRadio
            width: 77*dp
            height: 27*dp
            anchors
            {
                left:parent.left
                leftMargin:492*dp
                top:parent.top
                topMargin:11*dp
            }
            Text {
                id: zhuboRadioText
                text: qsTr("主播电台")
                font.pixelSize: 16
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
            }
            MouseArea
            {
                anchors.fill: parent
                hoverEnabled: true
                enabled: true
                onClicked:
                {
                    console.log("11111111111111");
                }
            }
        }
        //最新音乐
        Rectangle
        {
            id:latestMusic
            width: 77*dp
            height: 27*dp
            anchors
            {
                left:parent.left
                leftMargin:633*dp
                top:parent.top
                topMargin:11*dp
            }
            Text {
                id: latestMusicText
                text: qsTr("最新音乐")
                font.pixelSize: 16
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
            }
            MouseArea
            {
                anchors.fill: parent
                hoverEnabled: true
                enabled: true
                onClicked:
                {
                    console.log("11111111111111");
                }
            }
        }
        //分割线
        Rectangle
        {
            id:tabBardividerLine
            width: parent.width
            height: 1*dp
            color:"gray"
            anchors
            {
                left:parent.left
                leftMargin:18*dp
                right:parent.right
                rightMargin:18*dp
                top:parent.top
                topMargin:47*dp

            }
        }


        //轮播图
        Item {

            width: 556*dp
            height: 230*dp
            anchors
            {
                top:parent.top
                topMargin:0*dp
                left:parent.left
                leftMargin:30*dp
                //            verticalCenter:parent.verticalCenter
//                horizontalCenter:parent.horizontalCenter
            }

            MyCircleView {
                id: cirCleView
                anchors.fill: parent
                model: ListModel {
                    ListElement { picUrl: 'http://p1.music.126.net/DqOLrm2JMskTXPnvlZElZA==/109951163268332122.jpg' }
                    ListElement { picUrl: 'http://p1.music.126.net/C0Fgu7c2VB_HRuW4bBx08w==/109951163266830169.jpg' }
                    ListElement { picUrl: 'http://p1.music.126.net/8UhZmTrPO8gMa_V_b-5NSQ==/109951163268322954.jpg' }
                    ListElement { picUrl: 'http://lc-ba69fjyb.cn-n1.lcfile.com/d6559b69589de8fa3a6b' }
                    ListElement { picUrl: 'http://p1.music.126.net/DqOLrm2JMskTXPnvlZElZA==/109951163268332122.jpg' }
                    ListElement { picUrl: 'http://p1.music.126.net/8UhZmTrPO8gMa_V_b-5NSQ==/109951163268322954.jpg' }
                }

                delegate: Item {
                    width: cirCleView.width
                    height: cirCleView.height
                    Image {
                        anchors.fill: parent
                        source: picUrl
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked: Qt.openUrlExternally("https://music.163.com/#/album?id=38431080")
                    }
                }


                onDraggingChanged: {
                    if (dragging)
                        timer.stop()
                    else
                        timer.start()
                }
            }

            PageIndicator {
                anchors.bottom: parent.bottom
                anchors.bottomMargin: -20*dp
                anchors.horizontalCenter: parent.horizontalCenter
                count: cirCleView.count
                currentIndex: cirCleView.currentIndex
            }

            Timer {
                id: timer
                running: true
                repeat: true
                interval: 3000
                onTriggered: cirCleView.currentIndex = (cirCleView.currentIndex + 1) % cirCleView.count
            }
        }
        //今日推荐
        Rectangle
        {
            id:todayrecommend
           width: 170*dp
           height: 170*dp
           radius: 30*dp
           anchors
           {
               top:parent.top
               topMargin:60*dp
               right:parent.right
               rightMargin:40*dp
           }
           function getCurrentDate()
           {
               var d = new Date();
               var days = add_zero(d.getDate())
               return days;
           }
           function add_zero(temp)
               {
                    if(temp<10) return "0"+temp;
                    else return temp;
               }

           Image
           {
               anchors.fill: parent
               source: "http://lc-ba69fjyb.cn-n1.lcfile.com/5a33db94eb0cabf11be1.png"
           }
           Text {
               id: dateD
               anchors.centerIn: parent
               font.pixelSize: 100
               color:"white"
               text: todayrecommend.getCurrentDate()
           }


        }

        //热门精选
        Rectangle
        {
            id:hotSelect
            width:90*dp
            height: 45*dp
            anchors
            {
                left:parent.left
                leftMargin:30*dp
                top:parent.top
                topMargin:250*dp
            }
            Text {
                id: hotSelectText
                text: qsTr("热门精选")
                color: "#A51100"
                font.pixelSize: 25
                anchors.fill: parent
                anchors
                {
                    verticalCenter:parent.verticalCenter
                    horizontalCenter:parent.horizontalCenter
                }
            }
        }
        //热门精选分割栏
        Rectangle
        {
            id:hotDividerBar
            width: 800*dp
            height: 3*dp
            radius: 2
            color:"#A51100"
            anchors
            {
                left:parent.left
                leftMargin:30*dp
                top:hotSelect.bottom
                topMargin:0
            }
        }
        //*************************************************/
       MyMusicDetailItem
       {
           id:firItem
           _source:"http://p1.music.126.net/Vdotc6utgS41-2NkSTgtCA==/18812643953480210.jpg"
           _musicText:"后来我们什么都有了却没有了我们"
           _playCount:"245万"
           anchors
           {
               top:hotDividerBar.bottom
               topMargin:20*dp
               left:parent.left
               leftMargin:44*dp
           }
//           onImageClick: function()
//           {
//               console.log("asdasdasd")
//           }
           MouseArea
           {
               anchors.fill: parent
               onClicked:
               {
                   playSong("https://lc-ba69fjyb.cn-n1.lcfile.com/c6eed7879d00b5310a0c.mp3")
                   setMusicInfo(firItem._source,
                                "Grind me down","Jawster")
               }
           }

       }

       //2.
       MyMusicDetailItem
       {
           id:secondItem
           _source:"http://p4.music.126.net/NBBCa7O7A7brPt0wu4475g==/109951163254573115.jpg"
           _musicText:"在柳絮如雪的季节，听见思念的声音"
           _playCount:"65万"
           anchors
           {
               top:hotDividerBar.bottom
               topMargin:20*dp
               left:parent.left
               leftMargin:254*dp
           }
           MouseArea
           {
               anchors.fill: parent
               onClicked:
               {
                   playSong("https://lc-ba69fjyb.cn-n1.lcfile.com/fdd1184e47b250012925.mp3")
                   setMusicInfo(secondItem._source,
                                "Shape of you","j.fla")
               }
           }
       }
       //3.
       MyMusicDetailItem
       {
           id:thirdItem
           _source:"http://p1.music.126.net/ySb1ubAwhlEcR_RZ1T__XQ==/109951163250061188.jpg"
           _musicText:"来年陌生的是昨日最爱的某某"
           _playCount:"1365万"
           anchors
           {
               top:hotDividerBar.bottom
               topMargin:20*dp
               left:parent.left
               leftMargin:464*dp
           }
           onImageClick: function()
           {

           }
       }
       //4.
       MyMusicDetailItem
       {
           id:fourthItem
           _source:"http://p1.music.126.net/m7G245LV0wOx5YXOHBWJuw==/109951163254531309.jpg"
           _musicText:"未来俱乐部"
           _playCount:"2450"
           anchors
           {
               top:hotDividerBar.bottom
               topMargin:20*dp
               left:parent.left
               leftMargin:674*dp
           }
           onImageClick: function()
           {

           }
       }
    //5.
       MyMusicDetailItem
       {
           id:fifthItem
           _source:"http://p1.music.126.net/lzy222V4GyqakQfrmpdDwg==/18953381440148467.jpg"
           _musicText:"「古风」笛子前奏"
           _playCount:"5万"
           anchors
           {
               top:firItem.bottom
               topMargin:40*dp
               left:parent.left
               leftMargin:44*dp
           }
           onImageClick: function()
           {

           }
       }
    //6.
       MyMusicDetailItem
       {
           id:sixthItem
           _source:"http://p1.music.126.net/BPqdfpQ3KXUiYiQgV3ycdQ==/109951163226749851.jpg"
           _musicText:"华语电影台词对白"
           _playCount:"89万"
           anchors
           {
               top:firItem.bottom
               topMargin:40*dp
               left:parent.left
               leftMargin:254*dp
           }
           onImageClick: function()
           {

           }
       }
       //7.
       MyMusicDetailItem
       {
           id:seventhItem
           _source:"http://p1.music.126.net/1b4PYx4pywTRBBr7TtHBXA==/18823639069713073.jpg"
           _musicText:"如果可以，我想和故人谈一场恋爱"
           _playCount:"8964"
           anchors
           {
               top:firItem.bottom
               topMargin:40*dp
               left:parent.left
               leftMargin:464*dp
           }
           onImageClick: function()
           {

           }
       }
       //8.
       MyMusicDetailItem
       {
           id:eighthItem
           _source:"http://p1.music.126.net/y9iABvPb3Mk8iqArtC8nKg==/19133701347129053.jpg"
           _musicText:"寒假都快结束了，暑假为什么接不上"
           _playCount:"3万"
           anchors
           {
               top:firItem.bottom
               topMargin:40*dp
               left:parent.left
               leftMargin:674*dp
           }
           onImageClick: function()
           {

           }
       }
       //个性推荐
       Rectangle
       {
           id:personalRecommendText
           width:90*dp
           height: 45*dp
           anchors
           {
               left:parent.left
               leftMargin:30*dp
               top:eighthItem.bottom
               topMargin:40*dp
           }
           Text {
               id: personalRecommendTxt
               text: qsTr("个性推荐")
               color: "#A51100"
               font.pixelSize: 25
               anchors.fill: parent
               anchors
               {
                   verticalCenter:parent.verticalCenter
                   horizontalCenter:parent.horizontalCenter
               }
           }
           Text {
               text: qsTr("根据你的口味生成，播放和收藏越多，推荐越准")
               font.pixelSize: 15
               color: "#A51100"
               anchors
               {
                   left:personalRecommendTxt.right
                   leftMargin:10*dp
                   verticalCenter:personalRecommendTxt.verticalCenter
               }
           }
       }
       //热门精选分割栏
       Rectangle
       {
           id:personalRecommend
           width: 800*dp
           height: 3*dp
           radius: 2
           color:"#A51100"
           anchors
           {
               left:parent.left
               leftMargin:30*dp
               top:personalRecommendText.bottom
               topMargin:0*dp
               right:parent.right
               rightMargin:30*dp
           }
       }

       /*                           --------------------------------------------------*/
      PersonalMusicItem
      {
          id:item1
          _width:328*dp
          _height:150*dp
          _text:"岁月如潮水，将我向老歌推"
          _spacing:20*dp
          _detailText:"根据你的口味生成"
          _source:"http://p1.music.126.net/o9GzTfkc0E8dOUCeejPv4w==/18680702558107743.jpg"
          anchors
          {
              left:parent.left
              leftMargin:44*dp
              top:personalRecommend.bottom
              topMargin:30*dp
          }
      }

      /********************************/
      PersonalMusicItem
      {
          id:item2
          _width:328*dp
          _height:150*dp
          _text:"熬夜和想你，我都该戒掉了"
          _spacing:20*dp
          _detailText:"根据你收藏的歌单《纯音乐，看书刷题专用》推荐"
          _source:"http://p1.music.126.net/P8w0xreTcXV-GAUcx6Axjg==/109951163216834301.jpg"
          anchors
          {
                left:parent.left
                leftMargin:443*dp
                top:personalRecommend.bottom
                topMargin:30*dp
          }
      }
      //***********************
      PersonalMusicItem
      {
          id:item3
          _width:328*dp
          _height:150*dp
          _text:"你一定要是一个孩子"
          _spacing:20*dp
          _detailText:"根据你收藏的歌单《搞怪视频音乐》推荐"
          _source:"http://p1.music.126.net/kDH59ouX99NivKXEVKr0Yw==/109951163243617760.jpg"
          anchors
          {
                left:parent.left
                leftMargin:44*dp
                top:item1.bottom
                topMargin:30*dp
          }
      }

      PersonalMusicItem
      {
          id:item4
          _width:328*dp
          _height:150*dp
          _text:"你是一首旋律，被写在春天的风里"
          _spacing:20*dp
          _detailText:"根据你收藏的歌单《青春小乐曲》推荐"
          _source:"http://p1.music.126.net/BBfrJ4hkX9NOs1UkxyLMZw==/19085322835513264.jpg"
          anchors
          {
                left:parent.left
                leftMargin:443*dp
                top:item2.bottom
                topMargin:30*dp
          }
      }

      //十字分割线
      Rectangle
      {
          width: parent.width-88*dp
          height: 1*dp
          color: "gray"
          opacity: 0.3
          anchors
          {
              left:parent.left
              leftMargin:44*dp
              top:item1.bottom
              topMargin:15*dp
          }
      }

      Rectangle
      {
          width: 1*dp
          height: 330*dp
          color: "gray"
          opacity: 0.3
          anchors
          {
              top:personalRecommend.bottom
              topMargin:30*dp
              left:parent.left
              leftMargin:420*dp
          }
      }

    }
}



