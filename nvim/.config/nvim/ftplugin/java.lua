local home = os.getenv("HOME")
if not home then
	error("HOME environment variable is not set")
end

local java_path = home .. "/.sdkman/candidates/java/current/bin/java"
local jdtls_path = home .. "/.local/share/nvim/mason/packages/jdtls"

-- system config
local system_config = jdtls_path .. "/config_linux"

-- workspace dir
local workspace_path = home .. "/.local/share/nvim/jdtls-workspace/"
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local workspace_dir = workspace_path .. project_name

-- jar path
local jdtls_plugins = jdtls_path .. "/plugins/"
local jar_path = vim.fn.glob(jdtls_plugins .. "org.eclipse.equinox.launcher_*.jar")

-- lombok
local lombok_path = jdtls_path .. "/lombok.jar"

-- Root directory detection
local root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew" })

local config = {
	cmd = {
		java_path,
		"-Declipse.application=org.eclipse.jdt.ls.core.id1",
		"-Dosgi.bundles.defaultStartLevel=4",
		"-Declipse.product=org.eclipse.jdt.ls.core.product",
		"-Dlog.protocol=true",
		"-Dlog.level=ALL",
		"-Xmx2g",
		"--add-modules=ALL-SYSTEM",
		"--add-opens",
		"java.base/java.util=ALL-UNNAMED",
		"--add-opens",
		"java.base/java.lang=ALL-UNNAMED",
		"-javaagent:" .. lombok_path,
		"-jar",
		jar_path,
		"-configuration",
		system_config,
		"-data",
		workspace_dir,
	},
	root_dir = root_dir,
	settings = { java = {} },
	init_options = { bundles = {} },
}

require("jdtls").start_or_attach(config)
