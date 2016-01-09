import VPlay 2.0
import QtQuick 2.0
import "../game"
import "../common"
import "../entities"

SceneBase {
    id: scene

    property int score: 0

    property bool gameIsRunning: false
    property double gravityValue: 9.81 * 3

    property alias entityContainer: level

    signal menuPressed()
    signal useCoinsPressed()

    PhysicsWorld {
        id: physicsWorld
        gravity.y: gravityValue

        updatesPerSecondForPhysics: 60
        velocityIterations: 5
        positionIterations: 5
        debugDrawVisible: false
    }

    Level {
        id: level
        anchors.fill: parent
    }

    Player {
        id: player
        resetX: parent.width/10*3
        resetY: parent.height/10*4
        onGameOver: {
            if(scene.state === "gameOver")
                return
            coins=score
            if(score > mainItem.highscore)
                mainItem.highscore = score

            scene.state = "gameOver"
            audioManager.play(audioManager.idDIE)
            audioManager.play(audioManager.idHIT)
        }
    }

    Numbers {
        anchors.horizontalCenter: parent.horizontalCenter
        y: 30
        number: score
    }

    MouseArea {
        id: mouseControl
        anchors.fill: scene.gameWindowAnchorItem
        onPressed: {
            if(gameIsRunning) {
                player.push()
            }
        }
    }

    GameOverScreen {
        id: gameOverStats

        onPlayPressed: scene.state = "wait"
        onUseCoinsPressed: parent.useCoinsPressed()
    }

    WaitScreen {
        id: waitToPlay
        onClicked: {
            scene.state = "play"
            player.push()
        }
    }

    onBackButtonPressed: {
        if(scene.state == "gameOver") mainItem.state = "menu"
    }

    function enterScene() {
        state = "wait"
    }

    function exitScene() {
        menuPressed()
    }

    function initGame() {
        player.reset()
        level.reset()
        score = 0
    }

    function startGame() {
        level.start()
    }

    function stopGame() {
        level.stop()
    }

    function gameOver() {
        stopGame()
    }

    state: "wait"

    states: [
        State {
            name: "wait"
            PropertyChanges {target: waitToPlay; opacity: 1}
            PropertyChanges {target: physicsWorld; gravity: Qt.point(0,0)}

            StateChangeScript {
                script: {
                    initGame()
                }
            }
        },
        State {
            name: "play"
            PropertyChanges {target: scene; gameIsRunning: true}
            PropertyChanges {target: physicsWorld; gravity: Qt.point(0,gravityValue)}
            StateChangeScript {
                script: {
                    startGame()
                }
            }
        },
        State {
            name: "gameOver"
            PropertyChanges {target: gameOverStats; opacity: 1}
            PropertyChanges {target: physicsWorld; gravity: Qt.point(0,gravityValue*3)}
            StateChangeScript {
                script: {
                    gameOver()
                }
            }
        }
    ]
}

