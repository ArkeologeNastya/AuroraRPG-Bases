Objects = {
createObject ( 11505, 1691, 412.89999, 33.6, 0, 0, 340 )
createObject ( 11505, 1707.8, 406.79999, 33.6, 0, 0, 339.999 )
createObject ( 994, 1681.7, 419.29999, 29.7, 0, 0, 342 )
createObject ( 994, 1679.1, 412, 29.7, 0, 0, 341.999 )
createObject ( 994, 1713, 408.10001, 29.7, 0, 0, 341.999 )
createObject ( 994, 1710.3, 400.89999, 29.7, 0, 0, 341.999 )
createObject ( 1315, 1698.6, 426.39999, 33.1, 0, 0, 342 )
createObject ( 1315, 1710.2, 422.89999, 33.1, 0, 0, 159.999 )
createObject ( 11461, 1662.5, 362, 18.6, 0, 0, 336 )
createObject ( 1540, 1719.6, 450.10001, 34.7, 0, 0, 250 )
createObject ( 11292, 1718.1, 413.10001, 31.5, 0, 0, 251.159 )
createObject ( 11292, 1679.8, 403.89999, 30.9, 0, 0, 71.158 )
}
for index, object in ipairs ( Objects ) do
    setElementDoubleSided ( object, true )
end