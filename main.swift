import CYices

if let version = String.fromCString(yices_version) {
	print("Yices",version,"is installed.")
}
else {
	print("Yices is not installed.")
}
