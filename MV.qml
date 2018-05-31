import QtQuick 2.0
Rectangle
{
    anchors.fill: parent
    Text {
        id: mv
        text: qsTr("最新MV")
        font.pixelSize: 20
        anchors.left: tabBardividerLine.left
        anchors.top: parent.top
        anchors.topMargin: 10*dp
        color: "gray"
    }
    Rectangle
    {
        id:tabBardividerLine
        width: parent.width
        height: 1*dp
        color:"gray"
        anchors
        {
            left:parent.left
            leftMargin:16*dp
            right:parent.right
            rightMargin:16*dp
            top:parent.top
            topMargin:40*dp
        }
    }
    //MV图片
    MvItemView
    {
        id:item1
        _source:"http://p1.music.126.net/P5BW4BgCB92OTlNfnpN6LA==/19210667160665541.jpg"
        _title:"What's the love?SBS人气歌谣 18/04/22现场版-TWICE"
        _detail:"TWICE《What's the love》现场版"
        _playCount:2011
        anchors
        {
            left:parent.left
            leftMargin:16*dp
            top:parent.top
            topMargin:78*dp
        }
        onItemClicked: function()
        {
            console.log("sadasdasdasdas")
            rightWdRouter("qrc:/PlayVideo.qml",{})
            playOtherMv("https://lc-ba69fjyb.cn-n1.lcfile.com/b41cbb9be76ad691f165.mp4")

        }
    }
    //
    MvItemView
    {
        id:item2
        _source:"http://p1.music.126.net/Yh-JQJQ9IjgYWz_ZkGZH-A==/109951163230989575.jpg"
        _title:"What's the love?SBS人气歌谣 18/04/22现场版-TWICE"
        _detail:"TWICE《What's the love》现场版"
        _playCount:34284
        anchors
        {
            left:parent.left
            leftMargin:315*dp
            top:parent.top
            topMargin:78*dp
        }
        onItemClicked: function()
        {
            console.log("sadasdasdasdas")
            rightWdRouter("qrc:/PlayVideo.qml",{})
            playOtherMv("https://lc-ba69fjyb.cn-n1.lcfile.com/09df098adccc7523f995.mp4")

        }
    }

    //
    MvItemView
    {
        id:item3
        _source:"http://p1.music.126.net/N3ECfPoK9EY8pKV6eIzXzQ==/109951163263122705.jpg"
        _title:"What's the love?SBS人气歌谣 18/04/22现场版-TWICE"
        _detail:"TWICE《What's the love》现场版"
        _playCount:8976
        anchors
        {
            left:parent.left
            leftMargin:613*dp
            top:parent.top
            topMargin:78*dp
        }
    }

    //
    MvItemView
    {
        id:item4
        _source:"http://p1.music.126.net/qNnaotqswSSIaxPHTpdmBA==/18770862511115632.jpg"
        _title:"What's the love?SBS人气歌谣 18/04/22现场版-TWICE"
        _detail:"TWICE《What's the love》现场版"
        _playCount:5457
        anchors
        {
            left:parent.left
            leftMargin:16*dp
            top:parent.top
            topMargin:301*dp
        }
    }

    //
    MvItemView
    {
        id:item5
        _source:"http://p1.music.126.net/H18Unf3DU-y36e9u9HVwtA==/109951163254437574.jpg"
        _title:"What's the love?SBS人气歌谣 18/04/22现场版-TWICE"
        _detail:"TWICE《What's the love》现场版"
        _playCount:9881
        anchors
        {
            left:parent.left
            leftMargin:315*dp
            top:parent.top
            topMargin:301*dp
        }
    }

    //
    MvItemView
    {
        id:item6
        _source:"http://p1.music.126.net/yivvFyqRgiuFlLNP-QC2rw==/18887410742525477.jpg"
        _title:"What's the love?SBS人气歌谣 18/04/22现场版-TWICE"
        _detail:"TWICE《What's the love》现场版"
        _playCount:1078
        anchors
        {
            left:parent.left
            leftMargin:613*dp
            top:parent.top
            topMargin:301*dp
        }
    }
}
