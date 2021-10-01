import Foundation

let json = """
{
    "planes": [
        {
          "manufacturer": "Cessna",
          "model": "172 Skyhawk",
          "seats": 4
    }, {
          "manufacturer": "Piper",
          "model": "PA-28 Cherokee",
          "seats": 4
    } ]
}
""".data(using: .utf8)!

let decoder = JSONDecoder()
if let keyedPlanes = try? decoder.decode([String: [Plane]].self, from: json) {
    
    let planes = keyedPlanes["planes"]
    for plane in planes! {
        print(plane.manufacturer)
        print(plane.model)
        print(plane.seats)
    }
    let encoder = JSONEncoder()
    encoder.outputFormatting = .prettyPrinted
   
    let reencodedJSON = try! encoder.encode(planes)
    print(String(data: reencodedJSON, encoding: .utf8)!)
}
