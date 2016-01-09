import VPlay 2.0
import QtQuick 2.0
import QtMultimedia 5.5

Item {
    id: audioManager
    property int idDIE: 1
    property int idHIT: 2
    property int idPOINT: 3
    property int idSWOOSHING: 4
    property int idWING: 5

    function play(clipID) {
        switch(clipID) {
        case idDIE:
            die.play()
            break
        case idHIT:
            hit.play()
            break
        case idPOINT:
            point.play()
            break
        case idSWOOSHING:
            swoosh.play()
            break
        case idWING:
            wing.play()
            break
        }
    }

    MediaPlayer {
        id: die
        source: "../../assets/audio/sfx_die.wav"
    }
    MediaPlayer {
        id: hit
        source: "../../assets/audio/sfx_hit.wav"
    }
    MediaPlayer {
        id: point
        source: "../../assets/audio/sfx_point.wav"
    }
    MediaPlayer {
        id: swoosh
        source: "../../assets/audio/sfx_swooshing.wav"
    }
    MediaPlayer {
        id: wing
        source: "../../assets/audio/sfx_wing.wav"
    }
}

