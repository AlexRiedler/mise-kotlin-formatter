function PLUGIN:Available(ctx)
    local http = require("http")
    local json = require("json")

    local repo_url = "https://api.github.com/repos/block/kotlin-formatter/releases"

    local resp, err = http.get({
        url = repo_url,
    })

    if err ~= nil then
        error("Failed to fetch versions: " .. err)
    end
    if resp.status_code ~= 200 then
        error("GitHub API returned status " .. resp.status_code .. ": " .. resp.body)
    end

    local releases = json.decode(resp.body)
    local result = {}

    for _, release in ipairs(releases) do
        local version = release.tag_name
        local is_prerelease = release.prerelease or false

        if not is_prerelease or ctx.args and ctx.args["include-prerelease"] then
            table.insert(result, {
                version = version,
                note = is_prerelease and "pre-release" or nil,
            })
        elseif not is_prerelease then
            table.insert(result, {
                version = version,
            })
        end
    end

    return result
end
