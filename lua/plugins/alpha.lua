return {
    'goolord/alpha-nvim',               -- Session Manager

    config = function()
        local alpha = require("alpha")
        local dashboard = require("alpha.themes.dashboard")

        local function get_current_datetime()
            local ordinal_numbers = {"st", "nd", "rd"}

            -- Get current day, month, year, hour, and minute
            local day = os.date("%d")
            local month = os.date("%B")
            local weekday = os.date("%A")
            local hour = os.date("%I") -- %I gives the hour in 12-hour format
            local min = os.date("%M")
            local is_pm = os.date("%p") == "PM"

            -- Remove leading zero from day number, if present
            day = tonumber(day)

            -- Get ordinal suffix for day number
            local last_digit = day % 10
            local suffix = (last_digit > 0 and last_digit <= 3) and ordinal_numbers[last_digit] or "th"

            -- Combine all parts into a formatted datetime string
            local formatted_time = string.format("%d%s", day, suffix)
            local formatted_datetime = string.format("%s:%s%s on %s, %s %s", hour, min, is_pm and "pm" or "am", weekday, month, formatted_time)

            return formatted_datetime
        end

        local function footer_info()
            -- Number of plugins
            --local total_plugins = #vim.tbl_keys(packer_plugins)
            local total_plugins = vim.fn.len(vim.fn.globpath("~/.local/share/nvim/site/pack/packer/start", "*", 0, 1))

            local datetime = "📅 " .. get_current_datetime()
            local plugins  = "🔌 " .. total_plugins .. " plugins"
            local version  = "📝 v" .. vim.version().major .. "." .. vim.version().minor .. "." .. vim.version().patch .. "  "
            local plugver = version .. "  " .. plugins

            local fortune = require "alpha.fortune"
            local quote = table.concat(fortune(), "\n")

            -- Determine Quote Width and Plugins/Version Width to find widest non-date line. Center date
            local max_len = 0
            for line in string.gmatch(quote, '([^\n]*)\n?') do
                max_len = math.max(max_len, vim.api.nvim_strwidth(line))
            end

            padding = string.rep(" ", math.floor((max_len - vim.api.nvim_strwidth(datetime))/2))
            datetime = padding .. datetime

            padding = string.rep(" ", math.floor((max_len - vim.api.nvim_strwidth(plugver))/2))
            plugver = "\n" .. padding .. plugver

            local footer_text = datetime ..
                                "\n " .. plugver .. "\n" ..
                                quote

            return footer_text
        end

        local header = {
            "   ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣀⠀⠀⠀⠀⠀⠀                                                       ",
            "   ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ⣴⣿⣿⡿⠀⠀⠀⠀⠀⠀                                                       ",
            "   ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣾⣿⣿⠟⠁⠀⠀⠀⠀⠀⠀                                                       ",
            "   ⠀⠀⠀⢀⣠⣤⣤⣤⣀⣀⠈⠋⠉⣁⣠⣤⣤⣤⣀⡀⠀⠀                                                       ",
            "   ⠀⢠⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⡀                                                       ",
            "   ⣠⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⠋⠀  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗   ",
            "   ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡏⠀⠀⠀  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║   ",
            "   ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║   ",
            "   ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⠀⠀⠀  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║   ",
            "   ⠹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣤⣀  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║   ",
            "    ⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠁  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝   ",
            "   ⠀⠀⠙⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⠁⠀                                                       ",
            "   ⠀⠀⠀ ⠙⢿⣿⣿⣿⠿⠟⠛⠻⠿⣿⣿⣿⡿⠋⠀⠀⠀                                                       ",
            "                                                                                ",
            "                                                                                ",
        }


        local footer = footer_info()

        dashboard.section.header.val = header
        dashboard.section.footer.val = footer

        -- Set menu
        dashboard.section.buttons.val = {
            dashboard.button( "e", "📄 →  New file" , ":ene <BAR> startinsert <CR>"),
            dashboard.button( "n", "📓 →  Notes" , ":e $HOME/Documents/The Vault<CR>"),
            dashboard.button( "f", "🔍 →  Find file", ":cd $HOME/Programming | Telescope find_files<CR>"),
            dashboard.button( "p", "📁 →  Find project", ":Telescope project<CR>"),
            dashboard.button( "r", "🔄 →  Recently used files", ":Telescope oldfiles <CR>"),
            dashboard.button( "s", "⚙️  →  Settings" , ":e $HOME/.config/nvim <CR>"),
          --dashboard.button( "s", "⚙️  →  Settings" , ":e $MYVIMRC | :cd %:p:h | split . | wincmd k | pwd<CR>"),
            dashboard.button( "q", "❌ →  Quit NVIM", ":qa<CR>"),
        }


        --dashboard.section.footer.opts.hl = "Type"
        --dashboard.section.header.opts.hl = "Include"
        --dashboard.section.buttons.opts.hl = "Keyword"

        dashboard.opts.opts.noautocmd = true

        ---- Send config to alpha
        alpha.setup(dashboard.opts)

        -- Disable folding on alpha buffer
        vim.cmd([[
            autocmd FileType alpha setlocal nofoldenable
        ]])
    end
}
