import QtQuick 2.0

//搜索栏
BorderImage
{
    id: searchBar
    source: "qrc:/NeteasCloudImages/searchBar.png"
    width: 230*dp; height: 24*dp
    border.left: 1; border.top: 1
    border.right: 1; border.bottom: 1
    anchors
    {
        left:parent.left
        leftMargin:344*dp
        top:parent.top
        topMargin:15*dp

    }
    Text {
           id: typeSomething
           anchors.fill: parent; anchors.leftMargin: 27*dp
           verticalAlignment: Text.AlignVCenter
           text: "请输入歌名,歌手,歌词"
           color: "gray"
       }
    TextInput{
        id:textInput
        anchors.fill: searchBar
//        anchors.horizontalCenter: searchBar
        anchors.leftMargin: 28*dp
        anchors.topMargin: 2.8*dp
        font.pixelSize: 14

    }
    states: State {
            name: "hasText"; when: textInput.text != ''
            PropertyChanges { target: typeSomething; opacity: 0 }
            PropertyChanges { target: clear; opacity: 1 }
        }

        transitions: [
            Transition {
                from: ""; to: "hasText"
                NumberAnimation { exclude: typeSomething; properties: "opacity" }
            },
            Transition {
                from: "hasText"; to: ""
                NumberAnimation { properties: "opacity" }
            }
        ]
}
