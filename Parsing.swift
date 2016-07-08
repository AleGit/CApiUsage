import CTptpParsing

extension UnsafeMutablePointer where Pointee : Equatable {

}

struct Parsing {
  static func demoStore() {
    print("\(#function)")
    var store = prlcCreateStore(10000)
    prlcParsingStore = store
    defer {
      prlcDestroyStore(store)
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

prlc_in = file;
prlc_restart(file);
prlc_lineno = 1;

prlcParsingStore = prlcCreateStore(size)
prlcParsingRoot = prlcStoreNodeFile (prlcParsingStore,path,nil);

defer {
  prlcDestroyStore(prlcParsingStore)
}

if let s = String(validatingUTF8:prlcParsingRoot.pointee.symbol) {
  print("root.symbol", s)
}

let code = prlc_parse ();

var len = 0 as UInt
let off = 3 as UInt
var cname = prlcFirstSymbol(prlcParsingStore)
while let ccname = cname {
  len += strlen(ccname) + off
  if len > 89 || cname == prlcParsingRoot.pointee.symbol {
    print(" ")
    len = strlen(ccname) + off
  }
  print(" ", String(validatingUTF8:ccname))
  cname = prlcNextSymbol(prlcParsingStore, ccname)
}



}

}
