import gleam/erlang/file
import gleam/io
import gleam/list
import gleam/set
import gleam/string

pub fn run_1() {
  assert Ok(input) = file.read("./input/d_06.txt")
  input
  |> string.trim()
  |> string.split("")
  |> detect_marker(0, 4)
}

pub fn run_2() {
  assert Ok(input) = file.read("./input/d_06.txt")
  input
  |> string.trim()
  |> string.split("")
  |> detect_marker(0, 14)
}

fn detect_marker(signal, accumulator, pattern) {
  let markers =
    signal
    |> list.take(pattern)
    |> set.from_list()

  case set.size(markers) {
    size if size == pattern -> io.debug(accumulator + pattern)
    _ -> detect_marker(list.drop(signal, 1), accumulator + 1, pattern)
  }
}
