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

## Examples

### Example one: sendind messages from one node to another

* Start node 1

  ```powershell
  docker-compose run iex
  # or
  iex --sname foo -S mix
  ```

* Start node 2

  ```powershell
  docker-compose run iex
  # or
  iex --sname bar -S mix
  ```

* Connect the nodes

  ```elixir
  Node.ping :"bar@<container_id>"
  ```

* Register and send messages

  ```elixir
  # foo node
  Chat.register("cassio")

  # bar node
  Chat.send_message("cassio", "hello")
  ```

### Example two: showing how failover and takeover works

* Starting node 1

  ```powershell
  iex --sname foo -pa _build/dev/lib/chat/ebin --app chat --erl "-config config/foo.config"
  # or
  iex.bat --sname foo -pa _build/dev/lib/chat/ebin --app chat --erl "-config config/foo.config"
  ```

* Starting node 2

  ```powershell
  iex --sname bar -pa _build/dev/lib/chat/ebin --app chat --erl "-config config/bar.config"
  # or
  iex.bat --sname bar -pa _build/dev/lib/chat/ebin --app chat --erl "-config config/bar.config"
  ```

  > You don't need to connect the nodes manually, they will connect automatically

  > You need to adjust the files `config/foo.config` and `config/bar.config` to match the hostname of your machine (use the command `hostname` to discover your hostname)

* Exit of IEx of node 1, you'll see an output like:

  ```
  21:44:59.219 [info]  Application is started on bar@CASSIO-NOTE
  ```

* Start the node 1 again, you'll see an output like:

  ```
  21:45:54.607 [info]  foo@CASSIO-NOTE is taking over bar@CASSIO-NOTE
  ```

## :white_check_mark: Test

To run tests:

* Run with `mix test --cover`

## :page_facing_up: License

* [MIT](/LICENSE.txt)
