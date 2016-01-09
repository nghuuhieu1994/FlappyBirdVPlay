import VPlay 2.0
import QtQuick 2.0
import "../entities"

Item {
    id: medal
    property int number: 0

    property string imagePath: "../../assets/img/"

    MultiResolutionImage {
        id: spriteMedal
    }
    onNumberChanged: {
        if(number >= 0)
        {
            spriteMedal.source = imagePath + "copper.png"
        }
        if(number > 10)
        {
            spriteMedal.source = imagePath + "silver.png"
        }
        if(number > 20)
        {
            spriteMedal.source = imagePath + "gold.png"
        }
        if(number > 30)
        {
            spriteMedal.source = imagePath + "platium.png"
        }
    }
}

