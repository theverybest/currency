import Foundation

class Currency {
    var name: String!
    var price: Int!
    var amount: Double!
    
    init(name: String, price: Int, amount: Double) {
        self.name = name
        self.amount = amount
        self.price = price
    }
    
}
