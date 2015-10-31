// Program: 'vari2.scala'
// Given: Two positive integers a and b, each less than 1000
// Return: The integer corresponding to the square of the hypotenuse of the
//     right triangle whose legs have lengths a and b
// Date: 2015 Oct 30
// Version: 2.11.7

import io.Source

// read data in as array
val source = Source.fromFile("rosalind_ini2.txt")
val lines = source.getLines.next.split(" ")

// create squaring function
val hypo = (a: Int, b: Int) => math.pow(a, 2) + math.pow(b, 2)

val total = hypo(lines(0).toInt, lines(1).toInt).toInt

// write answer to output file
scala.tools.nsc.io.File("out.txt").writeAll(total.toString)
