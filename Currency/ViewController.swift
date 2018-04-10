import UIKit
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var currencies: [Currency]?
    
    @IBOutlet weak var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getCurrency()
        table.delegate = self
        table.dataSource = self
    }

    func getCurrency() {
        let api = Api()
        api.getCurrency(
            success: { result in
                self.currencies = [Currency]()
                for cur in (result["stock"] as! [[String: Any]]) {
                    let name = cur["name"] as? String
                    let price = cur["volume"] as? Int
                    let amounts = cur["price"] as? [String: Any]
                    let amount = amounts!["amount"] as? Double
                    let cur = Currency(name: name!, price: price!, amount: amount!)
                    self.currencies?.append(cur)
                    DispatchQueue.main.async {
                        self.table.reloadData()
                    }
                }
            },
            error: {
                
        }
        
        
        )
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let _ = currencies {
            return currencies!.count
        } else {
            return 0
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "currencyCell") as! CurrencyViewCell
        
        cell.currencyName.text = currencies![indexPath.row].name
        cell.currencyPrice.text = String(currencies![indexPath.row].price)
        cell.currecnyAmount.text = String(format:"%.2f", currencies![indexPath.row].amount)
        
        return cell
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

