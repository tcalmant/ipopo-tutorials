#!/usr/bin/python
# -- Content-Encoding: UTF-8 --

from pelix.ipopo.decorators import ComponentFactory, Requires, \
    Provides, Instantiate
import pelix.shell

@ComponentFactory("my-shell-commands-factory")
@Provides(pelix.shell.SERVICE_SHELL_COMMAND)
@Instantiate("my-shell-commands")
class MyCommands(object):
    def get_namespace(self):
        return "sample"

    def get_methods(self):
        return [("hello", self.say_hello),]

    def say_hello(self, session, name=None):
        """ Command help """
        session.write_line("Hello, {0} !", name or "World")
