
public struct Route: Decodable {
    public struct Airport: Decodable {
        public var code: String
        public var name: String
    }
    
    public var points: [Airport]
    
    private struct CodingKeys: CodingKey {
        var stringValue: String
        var intValue: Int? {
            return nil
        }
        
        init?(stringValue: String) {
            self.stringValue = stringValue
        }
        
        init?(intValue: Int) {
            return nil
        }
        
        static let points = CodingKeys(stringValue: "points")!
    }
    /*
     Теперь в инициализаторе init(from:) мы можем динамически создавать
     список аэропортов на основе массива кодов, декодированных для ключа .points
     */
    public init(from coder: Decoder) throws {
        let container = try coder.container(keyedBy: CodingKeys.self)
        
        var points: [Airport] = []
        let codes = try container.decode([String].self, forKey: .points)
        print("CODES: \(codes)")
        for code in codes {
            let key = CodingKeys(stringValue: code)!
            print("KEY: \(key)")
            let airport = try container.decode(Airport.self, forKey: key)
            print("AIRPORT: \(airport)")
            points.append(airport)
        }
        self.points = points
        print("points = \(points)")
    }
}
