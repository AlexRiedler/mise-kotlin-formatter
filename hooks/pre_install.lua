function PLUGIN:PreInstall(ctx)
    local version = ctx.version

    local url = "https://github.com/block/kotlin-formatter/releases/download/"
        .. version
        .. "/kotlin-formatter-dist-"
        .. version
        .. ".zip"

    return {
        version = version,
        url = url,
        note = "Downloading kotlin-formatter " .. version,
    }
end
