import gleam/erlang/file
import gleam/list
import gleam/string
import gleam/io

pub fn first() {
  assert Ok(input) = file.read("./input/two.txt")

  input
  |> string.split("\n")
  |> list.fold(
    0,
    fn(acc, turn) {
      case turn {
        "A X" -> 1 + 3 + acc
        "A Y" -> 2 + 6 + acc
        "A Z" -> 3 + 0 + acc
        "B X" -> 1 + 0 + acc
        "B Y" -> 2 + 3 + acc
        "B Z" -> 3 + 6 + acc
        "C X" -> 1 + 6 + acc
        "C Y" -> 2 + 0 + acc
        "C Z" -> 3 + 3 + acc
      }
    },
  )
  |> io.debug()
}

pub fn second() {
  assert Ok(input) = file.read("./input/two.txt")

  input
  |> string.split("\n")
  |> list.fold(
    0,
    fn(acc, turn) {
      case turn {
        "A X" -> 3 + 0 + acc
        "A Y" -> 1 + 3 + acc
        "A Z" -> 2 + 6 + acc
        "B X" -> 1 + 0 + acc
        "B Y" -> 2 + 3 + acc
        "B Z" -> 3 + 6 + acc
        "C X" -> 2 + 0 + acc
        "C Y" -> 3 + 3 + acc
        "C Z" -> 1 + 6 + acc
      }
    },
  )
  |> io.debug()
}
