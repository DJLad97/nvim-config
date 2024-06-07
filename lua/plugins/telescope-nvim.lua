
return {
    'nvim-telescope/telescope.nvim',
    opts = {
      defaults = {
            vimgrep_arguments = {
              'rg',
              '--column',
              '--ignore-case',
              '--fixed-strings'
            },
			file_ignore_patterns = {
				"node%_modules/.*",
				"public/vendor/.*",
				"public/*.",
				"imports/*.",
				"package%-lock.json",
				"package.json",
				"composer.json",
				"composer.lock",
				"yarn.lock" ,
				"vendor%-src/.*",
				"%_ide%_helper.php",
			},
			path_display = { truncate = 5 },
        },
    },
    config = function(_, opts)
        local telescope_extensions = require('custom.telescope_extensions')

        opts.defaults.file_sorter = telescope_extensions.file_sorter

        require('telescope').setup(opts)
    end,
}