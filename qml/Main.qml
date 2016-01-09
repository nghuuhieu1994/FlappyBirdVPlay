import VPlay 2.0
import QtQuick 2.0
import "scenes"
import "common"

GameWindow {
    id: window

    width: 240
    height: 400

    property alias window: window
    activeScene: splash

    Component.onCompleted: {
    //fix bug collision
        splash.opacity = 1
        mainItemDelay.start()
    }

    Timer {
        id: mainItemDelay
        interval: 500
        onTriggered: {
            mainItemLoader.source = "MainItem.qml"
        }
    }

    Loader {
        id: mainItemLoader
        onLoaded: {
            if(item) {
                hideSplashDelay.start()
            }
        }
    }

    Timer {
        id: hideSplashDelay
        interval: 200
        onTriggered: {
            splash.opacity = 0
        }
    }

    SplashScene {
        id: splash
    }
}

