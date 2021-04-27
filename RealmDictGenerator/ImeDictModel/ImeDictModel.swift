import Foundation
import RealmSwift

class ImeDictModel: Object {
    
    @objc dynamic var wordId = 0
    @objc dynamic var poj = ""
    @objc dynamic var pojSujip = ""
    @objc dynamic var pojSujipBoSooji = ""
    @objc dynamic var pojSujipThauJibo = ""
    @objc dynamic var kip = ""
    @objc dynamic var kipSujip = ""
    @objc dynamic var kipSujipBoSooji = ""
    @objc dynamic var kipSujipThauJibo = ""
    @objc dynamic var hanji = ""
    
    @objc dynamic var pojPriority = 0
    @objc dynamic var kipPriority = 0
    
    /*
        0: KIP
        1: TaijitToaSutian
        2: TJ
     */
    @objc dynamic var srcDict = 0
    
    override static func primaryKey() -> String? {
        return "wordId"
    }
    
    override static func indexedProperties() -> [String] {
        return [
            "pojSujip",
            "pojSujipBoSooji",
            "pojSujipThauJibo",
            "kipSujip",
            "kipSujipBoSooji",
            "kipSujipThauJibo",
            "pojPriority",
            "kipPriority",
        ]
    }
    
    func detached() -> ImeDictModel {
        let detached = ImeDictModel()
        
        detached.wordId = self.wordId
        detached.poj = self.poj
        detached.pojSujip = self.pojSujip
        detached.pojSujipBoSooji = self.pojSujipBoSooji
        detached.pojSujipThauJibo = self.pojSujipThauJibo
        detached.kip = self.kip
        detached.kipSujip = self.kipSujip
        detached.kipSujipBoSooji = self.kipSujipBoSooji
        detached.kipSujipThauJibo = self.kipSujipThauJibo
        detached.hanji = self.hanji
        
        detached.pojPriority = self.pojPriority
        detached.kipPriority = self.kipPriority
        
        detached.srcDict = self.srcDict
    
        return detached
    }
}
