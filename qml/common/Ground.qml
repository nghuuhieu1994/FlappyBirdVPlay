import VPlay 2.0
import QtQuick 2.0

Item {
    id: groundElement
    width: spriteGround.width
    height: spriteGround.height
    MultiResolutionImage
    {
        id:spriteGround
        x : 0
        source: "../../assets/img/ground.png"
    }

    MultiResolutionImage
    {
        id: spriteGround2
        x : spriteGround2.width
        source: "../../assets/img/ground.png"
    }
    MultiResolutionImage
    {
        id: spriteGround3
        x : spriteGround3.width * 2
        source: "../../assets/img/ground.png"
    }

    MovementAnimation {
        id: animation
        target: spriteGround
        property: "x"
        velocity: -40
        running: true
        minPropertyValue: -spriteGround.width
        onLimitReached: {
            reset()
        }
    }
    MovementAnimation {
        id: animation2
        target: spriteGround2
        property: "x"
        velocity: -40
        running: true
        minPropertyValue: -spriteGround2.width
        onLimitReached: {
            reset2()
        }
    }
    MovementAnimation {
        id: animation3
        target: spriteGround3
        property: "x"
        velocity: -40
        running: true
        minPropertyValue: -spriteGround3.width
        onLimitReached: {
            reset3()
        }
    }
    function reset() {
        spriteGround.x = scene.width
    }

    function reset2() {
        spriteGround2.x = spriteGround.x + spriteGround.width
    }
    function reset3() {
        spriteGround3.x = spriteGround2.x + spriteGround2.width
    }
    function start()
    {

    }
}

