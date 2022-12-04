import gleam/bit_string
import gleam/erlang/file
import gleam/int
import gleam/io
import gleam/list
import gleam/set
import gleam/string

pub fn solve_1() {
  assert Ok(input) = file.read("./input/d_03.txt")

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
  |> list.fold(0, alphanumeric_conversion)
  |> io.debug()
}

pub fn solve_2() {
  assert Ok(input) = file.read("./input/d_03.txt")

  input
  |> string.split("\n")
  |> list.sized_chunk(3)
  |> list.map(fn(group) {
    let pack =
      group
      |> list.map(fn(x) { string.to_graphemes(x) })

    assert Ok(#(x, y, z)) = case pack {
      [a, b, c] -> Ok(#(a, b, c))
      _ -> Error(Nil)
    }

    set.intersection(set.from_list(x), set.from_list(y))
    |> set.intersection(set.from_list(z))
    |> set.to_list()
  })
  |> list.flatten()
  |> list.fold(0, alphanumeric_conversion)
  |> io.debug()
}

fn alphanumeric_conversion(acc, letter) {
  case bit_string.from_string(letter) {
    <<a>> ->
      case a < 97 {
        True -> a - 38 + acc
        False -> a - 96 + acc
      }
    _ -> 0
  }
}
