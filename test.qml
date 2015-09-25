import QtQuick 2.0

Rectangle {
    id: test
    width: 100
    height: 62

    QObject {
        id: qObject
        Timer {
            id: child1
            Component.onCompleted: {
                console.log(child1.parent)
            }
            Component.onDestruction: {
                console.log(child1, "1 good bye")
            }
        }
        QtObject {
            id: child2
            Component.onCompleted: {
                console.log(child2.parent)
            }
            Component.onDestruction: {
                console.log(child2, "2 good bye")
            }
        }

        QObject {
            id: child3
            Component.onCompleted: {
                console.log(child3.parent)
            }
            Component.onDestruction: {
                console.log(child3, "3 good bye")
            }
        }

        Item {
            id: child4
            Component.onCompleted: {
                console.log(child4.parent)
            }
            Component.onDestruction: {
                console.log(child4, "4 good bye")
            }
        }

        Component.onCompleted: {
            console.log(qObject)
        }
    }
}

