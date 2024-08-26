#!/usr/bin/python
# -- Content-Encoding: UTF-8 --

from pelix.ipopo.decorators import (
    ComponentFactory,
    Requires,
    Provides,
    Instantiate,
)
from pelix.shell import ShellCommandsProvider, ShellSession


@ComponentFactory("my-shell-commands-factory")
@Provides(pelix.shell.ShellCommandsProvider)
@Instantiate("my-shell-commands")
class MyCommands(object):
    def get_namespace(self):
        return "sample"

    def get_methods(self):
        return [
            ("hello", self.say_hello),
        ]

    def say_hello(self, session: ShellSession, name: str | None = None) -> None:
        """Command help"""
        session.write_line(f"Hello, {name or 'World'} !")
