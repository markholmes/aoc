import gleam/erlang/file
import gleam/int
import gleam/io
import gleam/list
import gleam/regex
import gleam/result
import gleam/string

pub fn run_1() {
  let instructions = parse_instructions()
  let crates = parse_crates()
  move_1(instructions, crates)
  |> list.map(fn(stack) {
    stack
    |> list.reverse()
    |> list.first()
  })
  |> result.values()
  |> string.join("")
  |> io.debug()
}

pub fn run_2() {
  let instructions = parse_instructions()
  let crates = parse_crates()
  move_2(instructions, crates)
  |> list.map(fn(stack) {
    stack
    |> list.reverse()
    |> list.first()
  })
  |> result.values()
  |> string.join("")
  |> io.debug()
}

fn parse_instructions() {
  assert Ok(input) = file.read("./input/d_05.txt")
  assert Ok(re) = regex.from_string("(\\d+)")

  input
  |> string.split("\n")
  |> list.map(fn(x) {
    regex.split(re, x)
    |> list.map(int.parse)
    |> result.values()
  })
}

fn parse_crates() {
  [
    ["N", "C", "R", "T", "M", "Z", "P"],
    ["D", "N", "T", "S", "B", "Z"],
    ["M", "H", "Q", "R", "F", "C", "T", "G"],
    ["G", "R", "Z"],
    ["Z", "N", "R", "H"],
    ["F", "H", "S", "W", "P", "Z", "L", "D"],
    ["W", "D", "Z", "R", "C", "G", "M"],
    ["S", "J", "F", "L", "H", "W", "Z", "Q"],
    ["S", "Q", "P", "W", "N"],
  ]
}

fn move_1(instructions, crates) {
  instructions
  |> list.fold(
    crates,
    fn(crates, instruction) {
      let [amount, from, to] = instruction
      let from = from - 1
      let to = to - 1
      let to_move =
        crates
        |> list.at(from)
        |> result.unwrap([])
        |> list.reverse()
        |> list.take(amount)

      crates
      |> list.index_map(fn(index, stack) {
        case index {
          column if column == to -> list.append(stack, to_move)
          column if column == from ->
            stack
            |> list.reverse()
            |> list.drop(amount)
            |> list.reverse()
          _ -> stack
        }
      })
    },
  )
}

fn move_2(instructions, crates) {
  instructions
  |> list.fold(
    crates,
    fn(crates, instruction) {
      let [amount, from, to] = instruction
      let from = from - 1
      let to = to - 1
      let to_move =
        crates
        |> list.at(from)
        |> result.unwrap([])
        |> list.reverse()
        |> list.take(amount)
        |> list.reverse()

      crates
      |> list.index_map(fn(index, stack) {
        case index {
          column if column == to -> list.append(stack, to_move)
          column if column == from ->
            stack
            |> list.reverse()
            |> list.drop(amount)
            |> list.reverse()
          _ -> stack
        }
      })
    },
  )
}
