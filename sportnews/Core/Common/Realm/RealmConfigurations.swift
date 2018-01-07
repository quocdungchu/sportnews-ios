import RealmSwift

enum RealmConfigurations {
  
  static var main: Realm.Configuration {
    
    let documentDirectory = try! FileManager.default.url(
      for: .documentDirectory,
      in: .userDomainMask,
      appropriateFor: nil,
      create: false
    )
    let fileURL = documentDirectory.appendingPathComponent("main.realm")
    print("Create realm configuration with file url \(fileURL)")
    
    return Realm.Configuration(fileURL: fileURL, schemaVersion: 1, migrationBlock: { migration, oldSchemaVersion in
    })
  }
}

