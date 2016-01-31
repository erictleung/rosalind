// Scala 2.11.7

import io.Source
import java.io.PrintWriter

// read in data
val data = Source.fromFile(args(0))
val lines = source.getLines.next.split(" ")

// write output
val out = new PrintWriter("out.txt")
out.println(VARIABLE)
out.close()
