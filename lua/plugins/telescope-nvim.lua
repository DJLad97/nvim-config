local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local make_entry = require "telescope.make_entry"

local enhance_find_files = function(opts)
    local results = {}  -- telescope oldfiles results
    pickers
        .new(opts, {
            prompt_title = "OOOOOOOO",
            finder = finders.new_table {
                results = results,
                entry_maker = opts.entry_maker or make_entry.gen_from_file(opts),
            },
            sorter = conf.file_sorter(opts),
            previewer = conf.file_previewer(opts),
            on_input_filter_cb = function(prompt)
                local is_empty = prompt == nil or prompt == ""

                if is_empty then
                    return {
                        prompt = prompt,
                        updated_finder = finders.new_table {
                            results = results,
                            entry_maker = opts.entry_maker or make_entry.gen_from_file(opts),
                        },
                    }
                end

                --  use telescope built-in find_files.
                return {
                    prompt = prompt,
                    updated_finder = finders.new_oneshot_job(find_command, opts),
                }
            end,
        })
        :find()
end

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
				"vendor%-src/.*"
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