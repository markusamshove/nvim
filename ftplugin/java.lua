local java_home = os.getenv('JAVA_HOME')
local user_home = os.getenv('HOME')
local jdtls_path = user_home .. '/Software/java-ls/jdtls'
local formatter_path = user_home .. '/Software/java-ls/formatter.xml'

vim.lsp.config('jdtls', {
    cmd = {
        java_home .. '/bin/java',
        '-Declipse.application=org.eclipse.jdt.ls.core.id1',
        '-Dosgi.bundles.defaultStartLevel=4',
        '-Declipse.product=org.eclipse.jdt.ls.core.product',
        '-Dlog.protocol=true',
        '-Dlog.level=ALL',
        '-Xms3g',
        '-javaagent:' .. jdtls_path .. '/plugins/lombok.jar',
        '--add-modules=ALL-SYSTEM',
        '--add-opens', 'java.base/java.util=ALL-UNNAMED',
        '--add-opens', 'java.base/java.lang=ALL-UNNAMED',

        '-jar', vim.fn.glob(jdtls_path .. '/plugins/org.eclipse.equinox.launcher_*.jar'),

        '-configuration', jdtls_path .. '/config_linux',

        '-data', jdtls_path .. '/.workspace'
    },
    flags = {
        allow_incremental_sync = true,
    },
    settings = {
        ['java.format.settings.url'] = formatter_path,
        java = {
            signatureHelp = { enabled = true },
            referenceCodeLens = { enabled = true },
            implementationsCodeLens = { enabled = true },
            completion = {
                matchCase = 'FIRSTLETTER',
                guessMethodArguments = true,
                favoriteStaticMembers = {
                    "org.assertj.core.api.AssertionsForInterfaceTypes.assertThat",
                    "java.util.Objects.requireNonNull",
                    "java.util.Objects.requireNonNullElse",
                    "org.mockito.Mockito.*",
                },
                importOrder = {
                    "#",
                    ""
                }
            },
            import = {
                gradle = {
                    enabled = true,
                    home = user_home .. ".gradle/",
                    offline = {
                        enabled = true,
                    },
                    java = {
                        home = java_home
                    },
                    wrapper = {
                        checksums = {
                            {
                                sha256 = '7e3076c1709741964baa432ffd88e8f24627d05daf6d86ed360b09e49ea0ca9b',
                                allowed = true
                            },
                            {
                                sha256 = "76805e32c009c0cf0dd5d206bddc9fb22ea42e84db904b764f3047de095493f3",
                                allowed = true
                            }
                        },
                    }
                }
            }
        }
    }
})

vim.lsp.enable('jdtls')
