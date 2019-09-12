
import CoreBluetooth
import UIKit

class ServicesVC: UIViewController ,UITableViewDelegate , UITableViewDataSource , CBCentralManagerDelegate , CBPeripheralDelegate{
    
    var count = 2

    @IBOutlet weak var tabelView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override func viewWillAppear(_ animated: Bool) {
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(reload), userInfo: nil, repeats: true)
    }
    @objc func reload(){
        count -= 1
        if count < 0 {
            tabelView.reloadData()
            Timer.initialize()
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return services.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let service = services[indexPath.row]
        let cell = tabelView.dequeueReusableCell(withIdentifier: "ServiceCell")
        cell?.textLabel?.text = service.uuid.uuidString
        cell?.detailTextLabel?.text = service.description
        return cell!
    }
    
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! CharacteristicsVC
        let indexPath = tabelView.indexPathForSelectedRow
        let service = services[indexPath!.row]
        vc.service = service
        
    }
    

}
