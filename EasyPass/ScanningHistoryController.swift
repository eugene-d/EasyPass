import UIKit

public class ScanningHistoryController: UITableViewController, ScanningViewController {
    
    private var cachedTableData: [[String: Int]]?
    
    var tableData: [[String: Int]] {
        if cachedTableData == nil {
            if let url = NSBundle.mainBundle()
                .URLForResource("ParkingLots", withExtension: "nsarray") {
                    cachedTableData = NSArray(contentsOfURL: url) as? [[String: Int]]
            }
            assert(cachedTableData != nil, "ParkingLots.nsarray was not loaded")
        }
        
        return cachedTableData!
    }
    
    required public init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.title = NSLocalizedString("Scanning History", comment: "")
        addTabBarItem()
    }
    
    internal func addTabBarItem() {
        let tabBarItem = UITabBarItem(tabBarSystemItem: .History, tag: 0)
        self.tabBarItem = tabBarItem
    }
    
    public override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    public override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellId = "ScanningHistoryCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellId, forIndexPath: indexPath) as UITableViewCell
        let parkingLotInfo = tableData[indexPath.row]
        
        cell.textLabel?.text = NSLocalizedString("Row: ", comment: "") + String(format: "%d", parkingLotInfo["row"]!)
        
        cell.detailTextLabel?.text = NSLocalizedString("Place: ", comment: "") + String(format: "%d", parkingLotInfo["place"]!)
        return cell
    }
}