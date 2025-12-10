require("cnt.globals")
require("cnt.settings")

local utils = require("cnt.utils")
utils.glob_require("cnt/remaps")
utils.glob_require("cnt/autocmds")

require("cnt.lazy_init")
