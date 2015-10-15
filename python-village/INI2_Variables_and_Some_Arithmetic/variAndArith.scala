// Program: 'variAndArith.scala'
// Given: Two positive integers a and b, each less than 1000
// Return: The integer corresponding to the square of the hypotenuse of the
//     right triangle whose legs have lengths a and b
// Date: 2015 Oct 14
// Version: 2.11.7

import io.Source

// read data in as array
val source = Source.fromFile("rosalind_ini2.txt")
val lines = source.getLines.next.split(" ")

var total = 0;

// loop through array and add to total
for (n <- lines) total += math.pow(n.toInt, 2).toInt

// write answer to output file
scala.tools.nsc.io.File("out.txt").writeAll(total.toString)
