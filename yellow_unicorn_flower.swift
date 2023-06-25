//import required frameworks
import UIKit

//class to represent 3D printer product
class Printer {
    var brand: String
    var model: String
    var printSpeed: Double
    var printMaterials: [String]
    
    init(brand: String, model: String, printSpeed: Double, printMaterials: [String]) {
        self.brand = brand
        self.model = model
        self.printSpeed = printSpeed
        self.printMaterials = printMaterials
    }
}
    
//array of printer objects
var printers = [
    Printer(brand: "ParametricTech", model: "M1", printSpeed: 0.02, printMaterials: ["ABS", "PLA", "PETG"]),
    Printer(brand: "Xerion", model: "XS-1", printSpeed: 0.03, printMaterials: ["ABS", "PLA", "PETG", "Nylon"]),
    Printer(brand: "Kilocode", model: "K-1000", printSpeed: 0.06, printMaterials: ["ABS", "PLA", "PETG", "Nylon", "Metal"])
]

//class to represent 3D printers design and manufacture
class Manufacturing {
    //variable to store the printers array
    var printers: [Printer]
    
    //initialization
    init(printers: [Printer]) {
        self.printers = printers
    }
    
    //function to add a printer to the array
    func addPrinter(printer: Printer) {
        printers.append(printer)
    }
    
    //function to remove a printer from the array
    func removePrinter(at index: Int) {
        printers.remove(at: index)
    }
    
    //function to check the array for a certain printer
    func findPrinter(brand: String, model: String) -> Printer? {
        for printer in printers {
            if printer.brand == brand && printer.model == model {
                return printer
            }
        }
        
        return nil
    }
    
    //function to get the overall print speed of all printers
    func getOverallPrintSpeed() -> Double {
        var totalPrintSpeed = 0.0
        for printer in printers {
            totalPrintSpeed += printer.printSpeed
        }
        
        return totalPrintSpeed
    }
    
    //function to get the total number of materials that can be printed 
    func getTotalPrintMaterials() -> [String] {
        var allMaterials = [String]()
        for printer in printers {
            for material in printer.printMaterials {
                if !allMaterials.contains(material) {
                    allMaterials.append(material)
                }
            }
        }
        
        return allMaterials
    }
}

//instance of manufacturing class
let 3DPrinterManufacturing = Manufacturing(printers: printers)

//function to print the manufacturing details for the user
func printManufacturingDetails() {
    let overallPrintSpeed = 3DPrinterManufacturing.getOverallPrintSpeed()
    let totalPrintMaterials = 3DPrinterManufacturing.getTotalPrintMaterials()
    
    print("We design and manufacture high-quality 3D printers for industrial and personal use. Our printers have a total print speed of \(overallPrintSpeed) and can print with the following materials: \(totalPrintMaterials.joined(separator: ", ")).")
}

//call the printing function
printManufacturingDetails()