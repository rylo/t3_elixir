##Installing Erlang (R16 or greater)

To install the newest Erlang version, first run Homebrew's update:

    brew update

Then install Erlang R16:

    brew install erlang-r16

If you don't use Homebrew, please visit <a href='http://www.erlang.org/doc/installation_guide/INSTALL.html'>Erlang's website</a> for more information on building and installing Erlang.

##Installing Elixir (v0.9.0 or greater)

Once Erlang R16 or higher is installed on your machine, install Elixir from Homebrew (be sure to update Homebrew first!):

    brew install elixir

Again, if you don't use Homebrew, please visit <a href='http://elixir-lang.org/getting_started/1.html'>Elixir's website</a> for installation instructions and precompiled packages.

##Compiling

From the project root directory, run the following in console to compile the application:

    mix compile

Then compile the play task:

    elixirc tasks/play.ex

##Playing a Game

From the project root directory, run the command to start a new game:

    mix play

##Running Tests

From the project root directory, run the following in console:

    mix test