import gleam/erlang/file
import gleam/int
import gleam/io
import gleam/list
import gleam/set
import gleam/string

pub fn solve_1() {
  assert Ok(input) = file.read("./input/d_03.txt")

  let final =
    input
    |> string.split("\n")
    |> list.map(fn(x) {
      assert Ok(mid) =
        x
        |> string.length()
        |> int.divide(2)

      let pack =
        x
        |> string.to_graphemes()
        |> list.sized_chunk(mid)

      assert Ok(#(x, y)) = case pack {
        [a, b] -> Ok(#(a, b))
        _ -> Error(Nil)
      }

      set.intersection(set.from_list(x), set.from_list(y))
      |> set.to_list()
    })
    |> list.flatten()
    |> list.fold(
      0,
      fn(acc, x) {
        case x {
          "a" -> 1 + acc
          "b" -> 2 + acc
          "c" -> 3 + acc
          "d" -> 4 + acc
          "e" -> 5 + acc
          "f" -> 6 + acc
          "g" -> 7 + acc
          "h" -> 8 + acc
          "i" -> 9 + acc
          "j" -> 10 + acc
          "k" -> 11 + acc
          "l" -> 12 + acc
          "m" -> 13 + acc
          "n" -> 14 + acc
          "o" -> 15 + acc
          "p" -> 16 + acc
          "q" -> 17 + acc
          "r" -> 18 + acc
          "s" -> 19 + acc
          "t" -> 20 + acc
          "u" -> 21 + acc
          "v" -> 22 + acc
          "w" -> 23 + acc
          "x" -> 24 + acc
          "y" -> 25 + acc
          "z" -> 26 + acc
          "A" -> 27 + acc
          "B" -> 28 + acc
          "C" -> 29 + acc
          "D" -> 30 + acc
          "E" -> 31 + acc
          "F" -> 32 + acc
          "G" -> 33 + acc
          "H" -> 34 + acc
          "I" -> 35 + acc
          "J" -> 36 + acc
          "K" -> 37 + acc
          "L" -> 38 + acc
          "M" -> 39 + acc
          "N" -> 40 + acc
          "O" -> 41 + acc
          "P" -> 42 + acc
          "Q" -> 43 + acc
          "R" -> 44 + acc
          "S" -> 45 + acc
          "T" -> 46 + acc
          "U" -> 47 + acc
          "V" -> 48 + acc
          "W" -> 49 + acc
          "X" -> 50 + acc
          "Y" -> 51 + acc
          "Z" -> 52 + acc
          _ -> acc
        }
      },
    )

  io.debug(final)
}

pub fn solve_2() {
  assert Ok(input) = file.read("./input/d_03.txt")

  input
  |> string.split("\n")
  |> list.sized_chunk(3)
  |> list.map(fn(x) { list.map(x, fn(y) { string.to_graphemes(y) }) })
  |> list.map(fn(x) {
    assert Ok(#(x, y, z)) = case x {
      [a, b, c] -> Ok(#(a, b, c))
      _ -> Error(Nil)
    }

    set.intersection(set.from_list(x), set.from_list(y))
    |> set.intersection(set.from_list(z))
    |> set.to_list()
  })
  |> list.flatten()
  |> list.fold(
    0,
    fn(acc, x) {
      case x {
        "a" -> 1 + acc
        "b" -> 2 + acc
        "c" -> 3 + acc
        "d" -> 4 + acc
        "e" -> 5 + acc
        "f" -> 6 + acc
        "g" -> 7 + acc
        "h" -> 8 + acc
        "i" -> 9 + acc
        "j" -> 10 + acc
        "k" -> 11 + acc
        "l" -> 12 + acc
        "m" -> 13 + acc
        "n" -> 14 + acc
        "o" -> 15 + acc
        "p" -> 16 + acc
        "q" -> 17 + acc
        "r" -> 18 + acc
        "s" -> 19 + acc
        "t" -> 20 + acc
        "u" -> 21 + acc
        "v" -> 22 + acc
        "w" -> 23 + acc
        "x" -> 24 + acc
        "y" -> 25 + acc
        "z" -> 26 + acc
        "A" -> 27 + acc
        "B" -> 28 + acc
        "C" -> 29 + acc
        "D" -> 30 + acc
        "E" -> 31 + acc
        "F" -> 32 + acc
        "G" -> 33 + acc
        "H" -> 34 + acc
        "I" -> 35 + acc
        "J" -> 36 + acc
        "K" -> 37 + acc
        "L" -> 38 + acc
        "M" -> 39 + acc
        "N" -> 40 + acc
        "O" -> 41 + acc
        "P" -> 42 + acc
        "Q" -> 43 + acc
        "R" -> 44 + acc
        "S" -> 45 + acc
        "T" -> 46 + acc
        "U" -> 47 + acc
        "V" -> 48 + acc
        "W" -> 49 + acc
        "X" -> 50 + acc
        "Y" -> 51 + acc
        "Z" -> 52 + acc
        _ -> acc
      }
    },
  )
  |> io.debug()
}
