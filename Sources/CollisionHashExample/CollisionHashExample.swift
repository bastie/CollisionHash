import CollisionHash
import CryptoKit



extension CollisionHashExample {
  
  static func example (algorithm : CollisionHashImpl) {
    var input : (UInt8,UInt8) = (0,0)
    print ("Input \(input)     => Output \(algorithm.hash(input))") // expected on result.1 is 0
    input = (127,255)
    print ("Input \(input) => Output \(algorithm.hash(input))") // expected on result.1 is 127
    input = (128,0)
    print ("Input \(input)   => Output \(algorithm.hash(input))") // expected on result.1 is 128
    input = (255,255)
    print ("Input \(input) => Output \(algorithm.hash(input))") // expected on result.1 is 255
  }
  
}

@main
struct CollisionHashExample {
  
  
  static func main () {
    #if DEBUG
    print("Where I am? Here: \(CommandLine.arguments[0])")
    #endif
    
    /// 
    if #available(macOS 10.15, *) {
      let collision = Insecure.CollisionHash()
      example(algorithm: collision)
    } else {
      let collision = CollisionHash ()
      example(algorithm: collision)
    }
  }
  
}


