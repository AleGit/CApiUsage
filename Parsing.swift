import CTptpParsing

protocol FILEProtocol {

}

extension FILE : FILEProtocol {

}

extension UnsafeMutablePointer where Pointee : FILEProtocol {

}

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

static func size(file: UnsafeMutablePointer<FILE>) -> size_t {
  var size = 0 as size_t
  fseek(file,0,SEEK_END)
  size = ftell(file)
  rewind(file)
  return size

}


static func demoParse() {
  let path = "PUZ001-1.p"
  guard let file = fopen(path, "r") else {
    print("could not open a file \(path)")
    return
  }
  defer {
    fclose(file)
  }


  let size = self.size(file:file)
  guard size > 0 else {
    print("empty file '\(path)'")
    return
  }

  print(path, size)

var store = prlcCreateStore(size)


defer {
  prlcDestroyStore(&store)
}

/* parsing */

prlc_in = file;
prlc_restart(file);
prlc_lineno = 1;

prlcParsingStore = store
prlcParsingRoot = prlcStoreNodeFile (prlcParsingStore,path,nil);
let code = prlc_parse ()
// let root = prlcParsingRoot
prlcParsingStore = nil
prlcParsingRoot = nil
/* parsing end */

guard let first = prlcFirstSymbol(store) else {
  print("ERROR: no first symbol found")
  return
}

print(first)
}

}
