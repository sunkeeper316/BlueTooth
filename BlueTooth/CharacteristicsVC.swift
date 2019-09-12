
import CoreBluetooth
import UIKit

class CharacteristicsVC: UIViewController ,UITableViewDelegate , UITableViewDataSource , CBCentralManagerDelegate , CBPeripheralDelegate{
    
    var service : CBService!

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if service!.characteristics != nil {
            return service!.characteristics!.count
        }else {
            return 0
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CharacteristicCell")
        let characteristic = service.characteristics![indexPath.row]
        cell?.textLabel?.text = characteristic.uuid.uuidString
        cell?.detailTextLabel?.text = "value: \(characteristic.value?.hexEncodedString()) \(characteristic.value)"
        return cell!
    }

    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        
    }
    

}
