
cc.FileUtils:getInstance():setPopupNotify(false)
cc.FileUtils:getInstance():addSearchPath("src/")
cc.FileUtils:getInstance():addSearchPath("res/")

require "config"
require "cocos.init"

local function main()
    local app = require("app.MyApp"):create()
    app:run()
    cc.exports.app = app
end

local status, msg = xpcall(main, __G__TRACKBACK__)
if not status then
    print(msg)
end
