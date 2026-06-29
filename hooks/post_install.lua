function PLUGIN:PostInstall(ctx)
    local sdkInfo = ctx.sdkInfo[PLUGIN.name]
    local path = sdkInfo.path

    local binPath = path .. "/bin/kotlin-format"
    local file = io.open(binPath, "r")
    if file then
        file:close()
        local testResult = os.execute(binPath .. " --help > /dev/null 2>&1")
        if testResult ~= 0 then
            error("kotlin-formatter binary not executable: " .. binPath)
        end
    else
        error("kotlin-formatter binary not found at: " .. binPath)
    end
end
