import gleam/erlang/file
import gleam/io
import gleam/int
import gleam/list
import gleam/result
import gleam/string

pub fn solve_1() {
  assert Ok(input) = file.read("./input/one.txt")

  input
  |> string.trim()
  |> string.split("\n\n")
  |> list.map(fn(x) {
    x
    |> string.split("\n")
    |> list.fold(
      0,
      fn(acc, x) {
        x
        |> int.parse()
        |> result.unwrap(0)
        |> int.add(acc)
      },
    )
  })
  |> list.sort(by: int.compare)
  |> list.reverse()
  |> list.first()
  |> result.unwrap(0)
  |> int.to_string()
  |> io.println()
}

pub fn solve_2() {
  assert Ok(input) = file.read("./input/one.txt")

  input
  |> string.trim()
  |> string.split("\n\n")
  |> list.map(fn(x) {
    x
    |> string.split("\n")
    |> list.fold(
      0,
      fn(acc, x) {
        x
        |> int.parse()
        |> result.unwrap(0)
        |> int.add(acc)
      },
    )
  })
  |> list.sort(by: int.compare)
  |> list.reverse()
  |> list.take(3)
  |> list.fold(0, fn(acc, x) { x + acc })
  |> int.to_string()
  |> io.println()
}
