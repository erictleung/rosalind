// Scala 2.11.7

import io.Source
import java.io.PrintWriter

// read in data
val data = Source.fromFile(args(0)).getLines.next.split("\n")

// write output
val out = new PrintWriter("out.txt")
out.println(VARIABLE)
out.close()
