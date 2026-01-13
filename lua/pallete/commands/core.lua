local registry = require("pallete.registry")

registry.register({
  id = "file.save",
  title = "Save File",
  category = "file",
  description = "Write current buffer to disk",
  keywords = { "write", "save" },
  action = "write",
})

registry.register({
  id = "file.quit",
  title = "Quit Buffer",
  category = "file",
  action = "bdelete",
})