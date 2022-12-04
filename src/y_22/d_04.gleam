import gleam/erlang/file
import gleam/int
import gleam/io
import gleam/list
import gleam/option.{Some}
import gleam/regex.{Match}
import gleam/set
import gleam/string

pub fn solve_1() {
  assert Ok(input) = file.read("./input/d_04.txt")

  input
  |> string.trim()
  |> string.split("\n")
  |> list.filter(fn(x) {
    assert Ok(re) = regex.from_string("(\\d*)-(\\d*),(\\d*)-(\\d*)")
    let capture = case regex.scan(re, x) {
      [Match(_, [Some(a), Some(b), Some(c), Some(d)])] -> [a, b, c, d]
      _ -> []
    }

    let [Ok(a), Ok(b), Ok(c), Ok(d)] =
      capture
      |> list.map(fn(x) { int.parse(x) })

    let first = set.from_list(list.range(a, b))
    let second = set.from_list(list.range(c, d))
    let intersection = set.intersection(first, second)

    intersection == first || intersection == second
  })
  |> list.length()
  |> io.debug()
}

pub fn solve_2() {
  assert Ok(input) = file.read("./input/d_04.txt")

  input
  |> string.trim()
  |> string.split("\n")
  |> list.filter(fn(x) {
    assert Ok(re) = regex.from_string("(\\d*)-(\\d*),(\\d*)-(\\d*)")
    let capture = case regex.scan(re, x) {
      [Match(_, [Some(a), Some(b), Some(c), Some(d)])] -> [a, b, c, d]
      _ -> []
    }

    let [Ok(a), Ok(b), Ok(c), Ok(d)] =
      capture
      |> list.map(fn(x) { int.parse(x) })

    let first = set.from_list(list.range(a, b))
    let second = set.from_list(list.range(c, d))
    let intersection = set.intersection(first, second)

    set.size(intersection) > 0
  })
  |> list.length()
  |> io.debug()
}
