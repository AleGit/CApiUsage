import CTptpParsing

struct Parsing {
  static func demoStore() {
    print("\(#function)")
    var store = prlcCreateStore(10000)
    prlcParsingStore = store
    defer {
      prlcDestroyStore(&store)
      prlcParsingStore = nil
    }
    guard let hello = prlcStoreSymbol(store,"Hello, World."),
    let s = String(validatingUTF8:hello) else { print("Hu?")
    return
  }
    print(s)
  }

}
