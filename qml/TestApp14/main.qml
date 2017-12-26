import QtQuick 1.1
import com.nokia.meego 1.0

PageStackWindow {
    id: appWindow

    onInPortraitChanged: {
        if (!pageStack.busy) {
            if (inPortrait && pageStack.currentPage===mainPageLandscape) {
                pageStack.replace(mainPage);
            }
            else if (!inPortrait && pageStack.currentPage===mainPage) {
                pageStack.replace(mainPageLandscape);
            }
        }
    }

    initialPage: inPortrait ? mainPage : mainPageLandscape

    PortraitPage {
        id: mainPage
    }

    LandscapePage {
        id: mainPageLandscape
    }

    ToolBarLayout {
        id: commonTools
        visible: true
        ToolIcon {
            platformIconId: "toolbar-view-menu"
            anchors.right: (parent === undefined) ? undefined : parent.right
            onClicked: (myMenu.status === DialogStatus.Closed) ? myMenu.open() : myMenu.close()
        }
    }

    Menu {
        id: myMenu
        visualParent: pageStack
        MenuLayout {
            MenuItem { text: qsTr("Sample menu item") }
        }
    }
}
