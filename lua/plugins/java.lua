ocal lspconfig = require 'lspconfig'

local home = os.getenv 'HOME'
local jdtls_path = home .. '/.local/share/jdtls/1.19.0'

require('jdtls').start_or_attach {
  cmd = {
    'java',
    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    '-Dlog.protocol=true',
    '-Dlog.level=ALL',
    '-Xmx1g',
    '--add-modules=ALL-SYSTEM',
    '--add-opens',
    'java.base/java.util=ALL-UNNAMED',
    '--add-opens',
    'java.base/java.lang=ALL-UNNAMED',
    '-jar',
    vim.fn.glob(jdtls_path .. '/plugins/org.eclipse.equinox.launcher_*.jar'),
    '-configuration',
    jdtls_path .. '/config_linux',
    '-data',
    vim.fn.stdpath 'data' .. '/site/java/workspace/',
  },
  root_dir = require('jdtls.setup').find_root { '.git', 'mvnw', 'gradlew' },
}
