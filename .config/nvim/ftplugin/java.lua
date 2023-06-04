-- Eclipse Java development tools (JDT) Language Server downloaded from:
-- https://www.eclipse.org/downloads/download.php?file=/jdtls/milestones/1.21.0/jdt-language-server-1.21.0-202303161431.tar.gz
local jdtls = require('jdtls')
-- Change or delete this if you don't depend on nvim-cmp for completions.
local cmp_nvim_lsp = require('cmp_nvim_lsp')

local jdtls_dir = vim.fn.stdpath('data') .. '/mason/packages/jdtls'

local has = vim.fn.has
local is_mac = has 'macunix'
local is_win = has 'win32'
local is_linux = has 'unix'

local config_dir
if is_linux == 1 then
    config_dir = jdtls_dir .. '/config_linux'
end
if is_mac == 1 then
    config_dir = jdtls_dir .. '/config_mac'
end
if is_win == 1 then
    config_dir = jdtls_dir .. '/config_win'
end

local plugins_dir = jdtls_dir .. '/plugins'
--local path_to_jar = plugins_dir .. '/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar'
local path_to_jar = vim.fn.glob(plugins_dir .. '/org.eclipse.equinox.launcher_*.jar')
local path_to_lombok = jdtls_dir .. '/lombok.jar'

local root_markers = { '.git', 'mvnw', 'gradlew', 'pom.xml', 'build.gralde' }
local root_dir = require('jdtls.setup').find_root(root_markers)
if root_dir == "" then
    return
end

local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local workspace_dir = vim.fn.stdpath('data') .. '/site/java/workspace-root/' .. project_name
os.execute('mkdir ' .. workspace_dir)

-- for completions
local client_capabilities = vim.lsp.protocol.make_client_capabilities()
local capabilities = cmp_nvim_lsp.default_capabilities(client_capabilities)

-- Main Config
local config = {
    capabilities = capabilities,
    -- The command that starts the language server
    -- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
    cmd = {
        'java',
        '-Declipse.application=org.eclipse.jdt.ls.core.id1',
        '-Dosgi.bundles.defaultStartLevel=4',
        '-Declipse.product=org.eclipse.jdt.ls.core.product',
        '-Dlog.protocol=true',
        '-Dlog.level=ALL',
        '-javaagent:' .. path_to_lombok,
        '-Xmx1g',
        '--add-modules=ALL-SYSTEM',
        '--add-opens', 'java.base/java.util=ALL-UNNAMED',
        '--add-opens', 'java.base/java.lang=ALL-UNNAMED',

        -- 💀
        '-jar', path_to_jar,

        -- 💀
        '-configuration', config_dir,

        -- 💀
        -- See `data directory configuration` section in the README
        '-data', workspace_dir,
    },

    root_dir = root_dir,

    settings = {
        java = {
            eclipse = {
                downloadSources = true,
            },
            configuration = {
                updateBuildConfiguration = "interactive",
            },
            maven = {
                downloadSources = true,
            },
            implementationsCodeLens = {
                enabled = true,
            },
            referencesCodeLens = {
                enabled = true,
            },
            references = {
                includeDecompiledSources = true,
            }
        },
        signatureHelp = {
            enabled = true,
        },
    },
    flags = {
        allow_incremental_sync = true,
    },
    init_options = {
        -- https://github.com/eclipse/eclipse.jdt.ls/wiki/Language-Server-Settings-&-Capabilities#extended-client-capabilities
        extendedClientCapabilities = jdtls.extendedClientCapabilities,
    },
}

jdtls.start_or_attach(config)
