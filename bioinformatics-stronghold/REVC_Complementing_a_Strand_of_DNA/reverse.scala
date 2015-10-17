val dna_string = scala.io.Source.fromFile(args(0)).getLines().next()
def revc(source: String) = ("" /: source)((a,x) =>  x match
  {
    case 'T' => 'A' + a
    case 'A' => 'T' + a
    case 'G' => 'C' + a
    case 'C' => 'G' + a
  }
)
println(revc(dna_string))
