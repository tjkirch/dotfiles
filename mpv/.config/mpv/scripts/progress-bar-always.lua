local mp = require("mp")

local show_progress = function()
   mp.commandv("show-progress")
end

mp.register_event("file-loaded", show_progress)
mp.add_periodic_timer(1, show_progress)
