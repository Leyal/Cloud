import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls 2.4
import QtGraphicalEffects 1.0
Rectangle
{
    width: parent.width
    height: parent.height
    //    Image
    //    {
    //        id:img
    //        width: 300*dp
    //        height: 300*dp
    //        source: "http://p1.music.126.net/8UlHDv3_ynDCsz4TC-Raxw==/109951163160241235.jpg"
    Image {
        id: img
        width: 300*dp
        height: 300*dp
        source: "http://p1.music.126.net/8UlHDv3_ynDCsz4TC-Raxw==/109951163160241235.jpg"
        sourceSize: Qt.size(parent.width, parent.height)
        smooth: true
        visible: false
        anchors
        {
            left:parent.left
            top:parent.top
        }
    }

    Rectangle{
        id:mask
        anchors.fill: parent
        radius: 150*dp
    }

    OpacityMask {
        anchors.fill: parent
        source: img
        maskSource: mask
    }
    ScrollView
    {
        id:lyric
        width: parent.width/2
        height: parent.height-50*dp
        contentWidth: parent.width/2
        contentHeight: parent.height*4
        clip:true

        anchors
        {
            left:img.right
            leftMargin:20*dp
            right:parent.right
            rightMargin:20*dp
            top:img.top
            topMargin:0
        }
        Text {
            anchors.fill: parent
            id: txt
            wrapMode: Text.WordWrap
            text: "...Ready For It? (BloodPop® Remix)
专辑： ...Ready For It? (BloodPop® Remix)
歌手： Taylor Swift / BloodPop
作曲 : Taylor Swift/Max Martin/Shellback/Ali Payami
作词 : Taylor Swift/Max Martin/Shellback/Ali Payami
Knew he was a killer first time that I saw him
早知他危险无比 初次见他我就心知肚明
Wondered how many girls he had loved and left haunted
想知道他爱上过多少女孩 又有多少对他难忘怀
But if he's a ghost, then I can be a phantom
但若他真如幽灵般难缠那我自然也不坏
Holdin' him for ransom, some
缠住他等悬赏者来
Some boys are tryin' too hard, he don't try at all though
有些男孩苦心积虑 他却从来毫不费力
Younger than my exes, but he act like such a man, so
比我历任都年轻但举止却如此不凡
I see nothing better, I keep him forever
我丢掉理智 想缠他一世
Like a vendetta-ta
如世仇无休无止
I, I, I see how this is gon' go
我知道这故事会如何走下去
Touch me and you'll never be alone
轻轻触碰你便不再孤单无依
I-Island breeze and lights down low
海岛之风 让灯光渐隐
No one has to know
无人知其降临
In the middle of the night, in my dreams
午夜时分 在我的梦里
You should see the things we do, baby (we do)
你会看见我们所经历的经历
In the middle of the night, in my dreams (my dreams)
午夜时分 在我的梦里
I know I'm gonna be with you
我知道我会和你在一起
So I take my time
所以我不慢不急
Are you ready for it?
你是否也已准备就绪

Knew I was a robber first time that he saw me
至于我 我是个偷心大盗 他初次见我就知道
Stealing hearts and running off and never sayin' sorry
偷走了心就逃离 毫无歉意
But if I'm a thief, then he can join the heist, and
但就算我真是个盗贼 他也能加入这盗窃的聚会
We'll move to an island, and
我们逃亡到个小岛
And he can be my jailer, Burton to this Taylor
他便做起我的狱卒 上演新版的伯顿恋泰勒
Every love I've known in comparison is a failure
每一个人皆所知的吾爱都断送于对比之心
I forget their names now, I'm so very tame now
如今我已忘了他们的姓名 如今我已变得十分温驯
Never be the same now, now
再不复往昔
I, I, I see how this is gon' go
我知道这故事会如何走下去
Touch me and you'll never be alone
轻轻触碰你便不再孤单无依
I-Island breeze and lights down low
海岛之风 让灯光渐隐
No one has to know
无人知其降临
In the middle of the night, in my dreams (my dreams)
午夜时分 在我的梦里
You should see the things we do, baby (we do, baby)
你会看见我们所经历的经历
In the middle of the night in my dreams (my dreams)
午夜时分 在我的梦里
I know I'm gonna be with you
我知道我会和你在一起
So I take my time
所以我不慢不急
Are you ready for it?
你是否也已准备就绪

Yeah, my dreams, we do, baby
在我的梦里 你我一起
In the middle of the night
午夜时分
Baby, let the games begin
宝贝 游戏就此开局
Let the games begin
游戏就此开始
Let the games begin
游戏就此开始
Baby, let the games begin
宝贝 游戏就此开局
Let the games begin
游戏就此开始
Let the games begin
游戏就此开始
In the middle of the night, in my dreams
午夜时分 在我的梦里
You should see the things we do, baby
你会看见我们所经历的经历"

        }
    }
}
