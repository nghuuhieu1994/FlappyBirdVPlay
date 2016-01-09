import QtQuick 2.0
import VPlay 2.0
import "../common"
import "../entities"

SceneBase {
    id: scene

    signal gamePressed()

    Background {
        anchors.horizontalCenter: scene.gameWindowAnchorItem.horizontalCenter
        anchors.bottom: scene.gameWindowAnchorItem.bottom
    }

    MultiResolutionImage {
        anchors.top: parent.top
        anchors.topMargin: 60
        anchors.horizontalCenter: scene.gameWindowAnchorItem.horizontalCenter
        source: "../../assets/img/logo.png"
    }

    Ground {
        id: ground
        anchors.horizontalCenter: scene.gameWindowAnchorItem.horizontalCenter
        anchors.bottom: scene.gameWindowAnchorItem.bottom
    }

    Player {
        resetX: scene.width/2 - 17
        resetY: scene.gameWindowAnchorItem.height/2 - 48
    }

    Menu {
        anchors.bottom: ground.top
        onPlayPressed: gamePressed()
    }

    onEnterPressed: {
        gamePressed()
    }
}

