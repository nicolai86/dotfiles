import sublime, sublime_plugin, json

class PrettifyJsonCommand(sublime_plugin.TextCommand):

    def run(self, edit):
        source = ''
        if self.view.sel()[0].empty():
            region = sublime.Region(0, self.view.size())
            source = self.view.substr(region)
        else:
            region = self.view.sel()[0]
            source = self.view.substr(self.view.sel()[0])
        data = json.loads(source)
        result = json.dumps(data, sort_keys=True, indent=2)
        self.view.replace(edit, region, result)


    def description(self):
        return "Prettify Json"

