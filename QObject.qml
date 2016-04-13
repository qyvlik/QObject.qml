/*
 * Copyright (c) <2016> <copyright qyvlik>
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
*/

import QtQuick 2.0

/*!
    \qmltype QObject

    \code
    QObject {
        id: qObject
        QObject{ }
        QtObject{ }
        Timer { }
        Settings{ }
    }
    \endcode

    \warning Just some qml Objects will have parent-child relation with QObject. Such as Timer.
*/

QtObject {
    id: qObject

    /*! \qmlproperty QtObject QObject::data

        An object definition can have a single default property. A default property is
        the property to which a value is assigned if an object is declared within another
        object's definition without declaring it as a value for a particular property.

        \default
    */

    default property alias data: qObject.__data

    /*! \internal */
    property list<QtObject> __data

    /*! \qmlmethod void QObject::insert(int index, Item item)
        Inserts the item  ba at index position index.
    */
    function insert(index, item) {
       __data = __qmlListPropertyInsert(__data, index, item);
    }


    /*! \qmlmethod Item QObject::remove(int index)
        Removes item which at index from the data, and return remove item.
    */
    function remove(index) {
        var removeItem = __data[index];
        __qmlListPropertyRemove(__data, index);
        return removeItem;
    }

    /*! \internal */
    function __qmlListPropertyInsert(qmllistproperty, index, item) {
        if(index > qmllistproperty.length) return qmllistproperty;
        var  qmllistproperty_ = [];
        var length = qmllistproperty.length + 1;

        var flag = false;           // insert ?
        for(var iter = 0; iter < length; iter++) {
            if(iter === index) {
                 qmllistproperty_.push(item);
                flag = true;
            } else {
                if(flag) {
                     qmllistproperty_.push(qmllistproperty[iter-1]);
                } else {
                     qmllistproperty_.push(qmllistproperty[iter]);
                }
            }
        }
        return qmllistproperty_;
    }

    /*! \internal */
    function __qmlListPropertyRemove(qmllistproperty, index) {
        if(index > qmllistproperty.length-1) return qmllistproperty;
        var  qmllistproperty_ = [];
        for(var iter in qmllistproperty) {
            if(iter === index) {
                continue;
            } else {
                 qmllistproperty_.push(qmllistproperty[iter]);
            }
        }
        return qmllistproperty_;
    }
}

