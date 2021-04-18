# Chat

[![Language](https://img.shields.io/badge/language-elixir-purple)](https://img.shields.io/badge/language-elixir-purple) [![License](https://img.shields.io/badge/license-MIT-lightgrey)](/LICENSE)

A simple chat using Elixir.

## :rocket: Techs

* [Elixir](https://elixir-lang.org/)

## :wrench: Setup

* Install dependencies with `mix deps.get`
* For interactive testing use `iex -S mix`

## :speech_balloon: Usage

* `Chat.register("nickname")`
* `Chat.send_message("nickname", "message")`

You can send messages from different nodes, if they are connected. 

Example:

* Start node 1

  ```powershell
  docker-compose run iex
  iex --sname foo -S mix
  ```

* Start node 2

  ```powershell
  docker-compose run iex
  iex --sname bar -S mix
  ```

* Connect the nodes

  ```elixir
  Node.pong :"bar@<container_id>"
  ```

* Register and send messages

  ```elixir
  # foo node
  Chat.register("cassio")

  # bar node
  Chat.send_message("cassio", "hello")
  ```

## :white_check_mark: Test

To run tests:

* Run with `mix test --cover`

## :page_facing_up: License

* [MIT](/LICENSE.txt)
