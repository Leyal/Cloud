import QtQuick 2.0
//import QtQuick.Controls 2.4


Rectangle
{
    width: 190*dp
    height: 450*dp
    anchors
    {
        top:parent.top
        topMargin:50*dp
        left:parent.left
        leftMargin:0
    }

    ListView
    {
        id:list
        width: parent.width
        height: parent.height
//        delegate: delegate
//        model: leftScrollViewModel
        //推荐
        Text {
            id: recommend
            text: qsTr("推荐")
            color: "gray"
            font.pixelSize: 12
            anchors
            {
                top:parent.top
                topMargin:6*dp
                left:parent.left
                leftMargin:6*dp
            }
        }
        //发现音乐
        Rectangle
        {
            id:findMusic
            width: parent.width
            height: 40*dp
            color: "white"
            anchors
            {
                left:parent.left
                leftMargin:0
                top:parent.top
                topMargin:32*dp
            }

            Image {
                id: findMusicImg
                source: "qrc:/NeteasCloudImages/findMusicButton.png"
                width: 25*dp
                height: 21*dp
                anchors
                {
                    left:parent.left
                    leftMargin:22*dp
                    verticalCenter:parent.verticalCenter
                }
            }

            Text {
                id: findMusicText
                text: qsTr("发现音乐")
                font.pixelSize: 14
                anchors
                {
                    left:parent.left
                    leftMargin:60*dp
                    verticalCenter:findMusicImg.verticalCenter
                }
            }
            MouseArea
            {
                anchors.fill: parent
                onClicked:
                {
                    console.log("发现音乐")
                    rightWdRouter("qrc:/MyTabView.qml",{})
                }

            }
        }
        //私人FM
        Rectangle
        {
            id:personalFM
            width: parent.width
            height: 40*dp
            color: "white"
            anchors
            {
                left:parent.left
                leftMargin:0
                top:parent.top
                topMargin:72*dp
            }

            Image {
                id: personalFMImg
                source: "qrc:/NeteasCloudImages/myFMButton.png"
                width: 23*dp
                height: 17*dp
                anchors
                {
                    left:parent.left
                    leftMargin:22*dp
                    verticalCenter:parent.verticalCenter
                }
            }

            Text {
                id: personalFMText
                text: qsTr("私人FM")
                font.pixelSize: 14
                anchors
                {
                    left:parent.left
                    leftMargin:60*dp
                    verticalCenter:personalFMImg.verticalCenter
                }
            }
            MouseArea
            {
                anchors.fill: parent
                onClicked:
                {
                    console.log("私人FM")
                    rightWdRouter("qrc:/FindFM.qml",{})
                }
            }
        }
    }
    //MV
    Rectangle
    {
        id:myMv
        width: parent.width
        height: 40*dp
        color: "white"
        anchors
        {
            left:parent.left
            leftMargin:0
            top:parent.top
            topMargin:112*dp
        }

        Image {
            id: myMvImg
            source: "qrc:/NeteasCloudImages/MyMVButton.png"
            width: 23*dp
            height: 23*dp
            anchors
            {
                left:parent.left
                leftMargin:22*dp
                verticalCenter:parent.verticalCenter
            }
        }

        Text {
            id: myMvText
            text: qsTr("MV")
            font.pixelSize: 14
            anchors
            {
                left:parent.left
                leftMargin:60*dp
                verticalCenter: myMvImg.verticalCenter
            }
        }
        MouseArea
        {
            anchors.fill: parent
            onClicked:
            {
                console.log("MV")
                rightWdRouter("qrc:/MV.qml",{})
            }

        }
    }
    //朋友
    Rectangle
    {
        id:myFriend
        width: parent.width
        height: 40*dp
        color: "white"
        anchors
        {
            left:parent.left
            leftMargin:0
            top:parent.top
            topMargin:152*dp
        }

        Image {
            id: myFriendImg
            source: "qrc:/NeteasCloudImages/friendButton.png"
            width: 22*dp
            height: 22*dp
            anchors
            {
                left:parent.left
                leftMargin:22*dp
                verticalCenter:parent.verticalCenter
            }
        }

        Text {
            id: myFriendText
            text: qsTr("朋友")
            font.pixelSize: 14
            anchors
            {
                left:parent.left
                leftMargin:60*dp
                verticalCenter: myFriendImg.verticalCenter
            }
        }
        MouseArea
        {
            anchors.fill: parent
            onClicked: console.log("朋友")
        }
    }

    //我的音乐
    Text {
        id: mySong
        text: qsTr("我的音乐")
        color: "gray"
        font.pixelSize: 12
        anchors
        {
            top:parent.top
            topMargin:200*dp
            left:parent.left
            leftMargin:6*dp
        }
    }

    //iTunes音乐
    Rectangle
    {
        id:iTunesMusic
        width: parent.width
        height: 40*dp
        color: "white"
        anchors
        {
            left:parent.left
            leftMargin:0
            top:parent.top
            topMargin:230*dp
        }

        Image {
            id: iTunesMusicImg
            source: "qrc:/NeteasCloudImages/iTunesButton.png"
            width: 22*dp
            height: 22*dp
            anchors
            {
                left:parent.left
                leftMargin:22*dp
                verticalCenter:parent.verticalCenter
            }
        }

        Text {
            id: iTunesMusicText
            text: qsTr("iTunes音乐")
            font.pixelSize: 14
            anchors
            {
                left:parent.left
                leftMargin:60*dp
                verticalCenter: iTunesMusicImg.verticalCenter
            }
        }
        MouseArea
        {
            anchors.fill: parent
            onClicked: console.log("iTunesMusic")
        }
    }

    //下载的音乐
    Rectangle
    {
        id:downloadMusic
        width: parent.width
        height: 40*dp
        color: "white"
        anchors
        {
            left:parent.left
            leftMargin:0
            top:parent.top
            topMargin:270*dp
        }

        Image {
            id: downloadMusicImg
            source: "qrc:/NeteasCloudImages/downloadButton.png"
            width: 22*dp
            height: 22*dp
            anchors
            {
                left:parent.left
                leftMargin:22*dp
                verticalCenter:parent.verticalCenter
            }
        }

        Text {
            id: downloadMusicText
            text: qsTr("下载的音乐")
            font.pixelSize: 14
            anchors
            {
                left:parent.left
                leftMargin:60*dp
                verticalCenter: downloadMusicImg.verticalCenter
            }
        }
        MouseArea
        {
            anchors.fill: parent
            onClicked: console.log("下载的音乐")
        }
    }
    //我的歌手
    Rectangle
    {
        id:mySinger
        width: parent.width
        height: 40*dp
        color: "white"
        anchors
        {
            left:parent.left
            leftMargin:0
            top:parent.top
            topMargin:310*dp
        }

        Image {
            id: mySingerImg
            source: "qrc:/NeteasCloudImages/mineButton.png"
            width: 22*dp
            height: 22*dp
            anchors
            {
                left:parent.left
                leftMargin:22*dp
                verticalCenter:parent.verticalCenter
            }
        }

        Text {
            id: mySingerText
            text: qsTr("我的歌手")
            font.pixelSize: 14
            anchors
            {
                left:parent.left
                leftMargin:60*dp
                verticalCenter: mySingerImg.verticalCenter
            }
        }
        MouseArea
        {
            anchors.fill: parent
            onClicked: console.log("我的歌手")
        }
    }

    //我的电台
    Rectangle
    {
        id:myRadio
        width: parent.width
        height: 40*dp
        color: "white"
        anchors
        {
            left:parent.left
            leftMargin:0
            top:parent.top
            topMargin:350*dp
        }

        Image {
            id: myRadioImg
            source: "qrc:/NeteasCloudImages/MyRadioButton.png"
            width: 22*dp
            height: 22*dp
            anchors
            {
                left:parent.left
                leftMargin:22*dp
                verticalCenter:parent.verticalCenter
            }
        }

        Text {
            id: myRadioText
            text: qsTr("我的电台")
            font.pixelSize: 14
            anchors
            {
                left:parent.left
                leftMargin:60*dp
                verticalCenter: myRadioImg.verticalCenter
            }
        }
        MouseArea
        {
            anchors.fill: parent
            onClicked: console.log("我的电台")
        }
    }
}



