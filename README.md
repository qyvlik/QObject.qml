# QObject.qml

QtObject use the default property, so it can hold some qml Object.

> note: Just some qml Objects will have parent-child relation with QObject. Such as Timer.


```
    QObject {
        id: qObject
        QObject{ }
        QtObject{ }
        Timer { }
        Settings{ }
    }
```
