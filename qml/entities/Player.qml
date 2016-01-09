import VPlay 2.0
import QtQuick 2.0

EntityBase {
    id: player
    entityType: "player"

    property real upwardforce: -280
    property int resetX: 0
    property int resetY: 0

    width: collider.radius * 2
    height: collider.radius * 2

    signal gameOver()

    Component.onCompleted: reset()

    onGameOver: {
        spriteSequence.running = false
    }

    SpriteSequenceVPlay {
        id: spriteSequence

        anchors.centerIn: parent

        SpriteVPlay {
            name: "idle"
            frameCount: 3
            frameRate: 10

            frameWidth: 34
            frameHeight: 24
            source: "../../assets/img/birdSprite.png"
        }
        rotation: /*wabbleX.running ? 0 :*/ collider.linearVelocity.y/10
    }

    CircleCollider {
        id: collider

        radius: spriteSequence.height/2
        anchors.centerIn: parent

        bodyType: Body.Dynamic
    }

    function reset() {
        player.x = resetX
        player.y = resetY
        collider.body.linearVelocity = Qt.point(0,0)
        spriteSequence.running = true
    }

    function push() {
        audioManager.play(audioManager.idWING)
        collider.body.linearVelocity = Qt.point(0,0)
        var localForwardVector = collider.body.toWorldVector(Qt.point(0, upwardforce));
        collider.body.applyLinearImpulse(localForwardVector, collider.body.getWorldCenter());
    }
}
