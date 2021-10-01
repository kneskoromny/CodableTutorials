import Foundation

let json = """
{
    "manufacturer": "Cessna",
    "model": "172 Skyhawk",
    "seats": 4,
}
""".data(using: .utf8)!

let decoder = JSONDecoder()
if let plane = try? decoder.decode(Plane.self, from: json) {
    print(plane.manufacturer)
    print(plane.model)
    print(plane.seats)
    
    let encoder = JSONEncoder()
    encoder.outputFormatting = .prettyPrinted
    
    let reencodedJSON = try! encoder.encode(plane)
    print(String(data: reencodedJSON, encoding: .utf8)!)
}
