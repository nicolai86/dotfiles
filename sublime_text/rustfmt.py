import sublime, sublime_plugin
import subprocess
from os.path import expanduser

class RustfmtCommand(sublime_plugin.WindowCommand):
  def run(self):
    view = self.window.active_view()
    current_path = view.file_name()
    spec_command = ['/usr/local/bin/rustfmt', current_path]
    proc = subprocess.Popen(spec_command, stdout = subprocess.PIPE)
