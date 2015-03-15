import UIKit

/*!
 @class ParkingLot
*/
public class ParkingLot {
    /*!
     @property row
    
     @brief Stored propery for row value.
    */
    private var row: Int!
    
    /*!
     @property place
    
     @brief Stored propery for place value.
    */
    private var place: Int!

    public init(place: Int, inRow row: Int) {
        self.place = place
        self.row = row
    }
}
