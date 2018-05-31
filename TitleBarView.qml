import QtQuick 2.0
import QtQuick.Controls 2.1
import QtGraphicalEffects 1.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
Rectangle
{
    id:rootRec
    width: 1050*dp
    height: 50*dp
    color: "#A51100"
    anchors
    {
        left:parent.left
        right:parent.right
        top:parent.top
    }

    //logo
    Image
    {
        id:logo
        width: 30*dp
        height: 30*dp
        source: "qrc:/NeteasCloudImages/logo.png"
        anchors
        {
            left:parent.left
            leftMargin:15*dp
            top:parent.top
            topMargin:11*dp
        }
    }
    //标题
    Text
    {
        id:title
        text: "网易云音乐"
        font.pixelSize: 24*dp
        color: "white"
        anchors
        {
            verticalCenter:logo.verticalCenter
            left:logo.right
            leftMargin:5*dp
        }
    }
    //后退按钮
    MyImageButton
    {
        id:leftBackButton
        _width:30*dp
        _height:28*dp
        _normalSource:"qrc:/NeteasCloudImages/leftBackBtnNormal.png"
        _pressSource:"qrc:/NeteasCloudImages/leftBackBtnPress.png"
        anchors
        {
            left:parent.left
            leftMargin:235*dp
            top:parent.top
            topMargin:15*dp
        }

        onButtonClicked: function()
        {
            console.log("leftBack")
            //            rightWdRouter("qrc:/LeftScrollView.qml",{})
        }
    }
    //前进按钮
    MyImageButton
    {
        id:rightGoButton
        _width:30*dp
        _height:28*dp
        _normalSource:"qrc:/NeteasCloudImages/rightGoButtonNormal.png"
        _pressSource:"qrc:/NeteasCloudImages/rightGoButtonpress.png"
        anchors
        {
            left:parent.left
            leftMargin:261*dp
            top:parent.top
            topMargin:15*dp
        }

        onButtonClicked: function()
        {
            console.log("rightGo")
        }
    }
    //搜索框
    SearchBarView{}
    //消息按钮
    MyImageButton
    {
        property bool isFistClick: false
        _width:18*dp
        _height:17*dp
        _normalSource:"qrc:/NeteasCloudImages/messageBtnNormal.png"
        _pressSource:"qrc:/NeteasCloudImages/messageBtnPress.png"
        anchors
        {
            right:parent.right
            rightMargin:120*dp
            top:parent.top
            topMargin:21*dp
        }
        onButtonClicked: function()
        {
            if(isFistClick)
            {
                //                _normalSource="qrc:/NeteasCloudImages/messageBtnNormal.png"
                popup.close()
                isFistClick = ! isFistClick
            }
            else
            {
                //                _normalSource = "qrc:/NeteasCloudImages/messageBtnPress.png"
                popup.open()
                isFistClick = ! isFistClick
            }
        }


    }
    //信息框
    Popup
    {
        id: popup
        x:801*dp
        y:50*dp
        width: 250*dp
        height: 380*dp
        modal: false
        focus: true
        leftPadding: 0
        rightPadding: 0
        topPadding: 0
        bottomPadding: 0
        closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutsideParent
        Rectangle
        {
            width: parent.width
            height: parent.height
            anchors.fill: parent
            TabView
            {
                id:tab
                anchors.fill: parent
                Tab
                {
                    title: "@我"
                    Text {
                        text: qsTr("暂无@我的内容")
                        anchors
                        {
                            top:parent.top
                            topMargin:30*dp
                            horizontalCenter:popup.horizontalCenter
                        }
                    }

                }
                Tab
                {
                    title: "私信"
                    Image
                    {
                        source: "http://lc-ba69fjyb.cn-n1.lcfile.com/86bca2114ff2ae1f013b.png"
                        anchors.fill: parent
                    }
                }
                Tab
                {
                    title:"评论"
                    Text {
                        text: qsTr("暂无评论")
                        anchors
                        {
                            top:parent.top
                            topMargin:30*dp
                            horizontalCenter:popup.horizontalCenter
                        }
                    }
                }
                Tab
                {
                    title:"通知"
                    Text {
                        text: qsTr("暂无通知内容")
                        anchors
                        {
                            top:parent.top
                            topMargin:30*dp
                            horizontalCenter:popup.horizontalCenter
                        }
                    }
                }
                style: TabViewStyle {
                         frameOverlap: 1
                         tab: Rectangle {
                             color: styleData.selected ? "#A51100" :"#E7E5E5"
                             border.color:  "gray"
                             implicitWidth: 63
                             implicitHeight: 20
                             radius: 2
                             Text {
                                 id: text
                                 anchors.centerIn: parent
                                 text: styleData.title
                                 color: styleData.selected ? "white" : "black"
                             }
                         }
                         frame: Rectangle { color: "#E7E5E5" ;border.color: "gray"}
                     }
            }
        }
    }
    //设置按钮
    MyImageButton
    {
        _width:20*dp
        _height:20*dp
        _normalSource:"qrc:/NeteasCloudImages/settingBtnNormal.png"
        _pressSource:"qrc:/NeteasCloudImages/settingBtnPress.png"
        anchors
        {
            top:parent.top
            topMargin:20*dp
            right:parent.right
            rightMargin:83*dp
        }
        onButtonClicked: function()
        {
            console.log("切换页面")
            rightWdRouter("qrc:/SettingView.qml",{})

        }
    }
    //分割线
    Rectangle
    {
        id:dividerLine
        width: 1*dp
        height: 50*dp
        color: "#2C2C2C"
        anchors
        {
            top:parent.top
            topMargin:0
            bottom:parent.bottom
            bottomMargin:0
            right:parent.right
            rightMargin:53*dp
        }
    }
    //头像
    Item
    {
        property bool isFirstClick: false
        width: 24*dp
        height: 24*dp
        anchors
        {
            right:parent.right
            rightMargin:22*dp
            top:parent.top
            topMargin:16*dp
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
            radius: width/2.
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
    }
    //头像按钮
    MyImageButton
    {
        property bool isFirstClick: false
        _width:10*dp
        _height:6*dp
        _normalSource:"qrc:/NeteasCloudImages/iconBtnNormal.png"
        _pressSource:"qrc:/NeteasCloudImages/iconBtnPress.png"
        anchors
        {
            right:parent.right
            rightMargin:6*dp
            top:parent.top
            topMargin:28*dp
        }
        onButtonClicked: function()
        {
            if(!isFirstClick)
            {
                personPopup.open()
                isFirstClick = !isFirstClick
            }
            else
            {
                personPopup.close()
                isFirstClick = !isFirstClick
            }
        }
    }
    //个人信息弹出框
    Popup
    {
        id:personPopup
        width: 200*dp
        height: 180*dp
        x:854*dp
        y:50*dp
        modal: false
        focus: true
        leftPadding: 0
        rightPadding: 0
        topPadding: 0
        bottomPadding: 0
        closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutsideParent
        Rectangle
        {
            width: parent.width
            height: parent.height
            anchors.fill: parent
            Item
            {
                id:icon
                width: 24*dp
                height: 24*dp
                anchors
                {
                    left:parent.left
                    leftMargin:26*dp
                    top:parent.top
                    topMargin:9*dp

                }

                Image {
                    id: iconImg
                    source: "http://lc-ba69fjyb.cn-n1.lcfile.com/BIDDmLSwSosWhO8mxcqIJ3A"
                    sourceSize: Qt.size(parent.width, parent.height)
                    smooth: true
                    visible: false
                }

                Rectangle{
                    id:imgMask
                    anchors.fill: parent
                    radius: width/2.
                }

                OpacityMask {
                    anchors.fill: parent
                    source: iconImg
                    maskSource: imgMask
                }
            }
            //昵称
            Text {
                id: nickName
                text: qsTr("喜欢纯音乐的猫")
                font.pixelSize: 16
                anchors
                {
                    verticalCenter:icon.verticalCenter
                    left:icon.right
                    leftMargin:10*dp
                }
            }
            //----------------------------------------------------------------
          Image
          {
              width: 200*dp
              height: 132*dp
              source: "http://lc-ba69fjyb.cn-n1.lcfile.com/b9b4680304615a24ca1d.png"
              anchors
              {
                  left:parent.left
                  leftMargin:5*dp
                  right:parent.right
                  rightMargin:15*dp
                  bottom:parent.bottom
                  bottomMargin:10*dp
                  top:parent.top
                  topMargin:40*dp
              }
          }
        }
    }
}
