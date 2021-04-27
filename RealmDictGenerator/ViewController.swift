import Cocoa
import SwiftCSV
import RealmSwift

class ViewController: NSViewController {
    var imeDict = [ImeDictModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        readDict()
        writeRealmDb()
        print("DONE!")
    }
    
    override var representedObject: Any? {
        didSet {
            // Update the view, if already loaded.
        }
    }
    
    func readDict() {
        do {
            // From a file inside the app bundle, with a custom delimiter, errors, and custom encoding
            let kipCsv: CSV? = try CSV(
                name: "PhahTaigi_ImeDict",
                extension: "csv",
                bundle: .main,
                delimiter: ",",
                encoding: .utf8)
            
            for row in kipCsv!.namedRows {
                let imeDictModel = ImeDictModel()
                
                imeDictModel.wordId = Int(row["wordId"]!)!
                imeDictModel.poj = row["poj"]!
                imeDictModel.pojSujip = row["pojSujip"]!
                imeDictModel.pojSujipBoSooji = row["pojSujipBoSooji"]!
                imeDictModel.pojSujipThauJibo = row["pojSujipThauJibo"]!
                imeDictModel.kip = row["kip"]!
                imeDictModel.kipSujip = row["kipSujip"]!
                imeDictModel.kipSujipBoSooji = row["kipSujipBoSooji"]!
                imeDictModel.kipSujipThauJibo = row["kipSujipThauJibo"]!
                imeDictModel.pojPriority = Int(row["pojPriority"]!)!
                imeDictModel.kipPriority = Int(row["kipPriority"]!)!
                imeDictModel.hanji = row["hanji"]!
                imeDictModel.srcDict = Int(row["srcDict"]!)!
                
                imeDict.append(imeDictModel)
            }
        } catch {
            // Catch errors from trying to load files
        }
    }
    
    func writeRealmDb() {
        var config = Realm.Configuration()
        config.fileURL = FileManager.default.homeDirectoryForCurrentUser.appendingPathComponent("PhahTaigiImeDict.realm")
        // /Users/hebi/Library/Containers/tw.taibunkesimi.PhahTaigi.RealmDictGenerator/Data
        print("REALM DB PATH: \(config.fileURL!)")

        // Open the Realm with the configuration
        let realm = try! Realm(configuration: config)
        
        try! realm.write {
            realm.deleteAll()
            
            for imeDictItem in imeDict {
                realm.add(imeDictItem, update: .modified)
            }
        }
    }
}

