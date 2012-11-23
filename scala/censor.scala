trait Censor {
  def censorize(words:String, alternatives:Map[String,String]): String = {
    val wordList = words.split(" ")
    val censoredWords = wordList.map { (word) =>
      if (alternatives.contains(word)) {
        alternatives(word)
      }
      else {
        word
      }
    }.mkString(" ")

    return censoredWords
  }
}

class Paragraph(words:String) extends Censor {

  val alternatives:Map[String,String] = Map("shoot" -> "pucky", "darn" -> "beans")

  override def toString(): String = {
    censorize(words, alternatives)
  }

}

val para = new Paragraph("well shoot we should have shot the darn mongrel")
println(para.toString())
