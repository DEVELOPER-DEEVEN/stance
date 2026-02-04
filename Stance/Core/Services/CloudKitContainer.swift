import Foundation
import SwiftData

extension ModelContainer {
    static var sharedCloudContainer: ModelContainer = {
        let schema = Schema([
            Claim.self,
            Parameter.self
        ])
        
        let modelConfiguration = ModelConfiguration(
            schema: schema,
            isStoredInMemoryOnly: false,
            cloudKitDatabase: .automatic
        )

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create CloudKit ModelContainer: \(error)")
        }
    }()
}
