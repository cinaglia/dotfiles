local iterm = hs.appfinder.appFromName("iTerm2")

function applicationWatcher(name, event, app)
    if (event == hs.application.watcher.activated) then
        -- hs.alert.show(name);
        if (app == iterm) then
          hs.keycodes.setLayout("U.S.")
        else
          hs.keycodes.setLayout("U.S. International - PC")
        end
    end
end

appWatcher = hs.application.watcher.new(applicationWatcher)
appWatcher:start()
