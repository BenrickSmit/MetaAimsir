import QtQuick 2.12

import components 1.0
import styles 1.0

ListView {
    id: about_option_view_list_view

    anchors.fill: parent
    orientation: ListView.Horizontal

    delegate: AboutViewButton {button_text: text}
    model: ListModel{
        ListElement {text: " Licenses"}
        ListElement {text: " Privacy Policy"}
        ListElement {text: " Resources"}
    }//end of ListModel
}//end of ListView
