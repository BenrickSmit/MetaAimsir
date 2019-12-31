import QtQuick 2.12
import QtQuick.Controls 2.12

import components 1.0
import styles 1.0

//This item allows the user to choose the location that the application will display information for
Item {
    id: choose_location_view_item_frame

    //Set some basic properties
    width: Styles.main_view_default_width
    height: Styles.main_view_default_height/2

    Popup {
        id: popup
        x: 100
        y: 100
        width: 200
        height: 300
        modal: true
        focus: true
        closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutsideParent
    }//end of Popup
}//end of Item
