import sublime, sublime_plugin
import subprocess
from os.path import expanduser

class RspecCurrentFileCommand(sublime_plugin.WindowCommand):
  def run(self):
    self.window.run_command("copy_relative_path")
    spec_path = sublime.get_clipboard()

    if not spec_path:
      print("No file open. Ignoring")
      return

    if "spec" in spec_path:
      print("Looks like a spec. Running rspec")
      home = expanduser("~")
      spec_command = ['/usr/bin/osascript', home + '/.dotfiles/osascript/write_iterm2.scpt', "rspec " + spec_path]
      proc = subprocess.Popen(spec_command, stdout = subprocess.PIPE)
      print(proc.communicate())
    else:
      print("No spec file. Ignoring.")