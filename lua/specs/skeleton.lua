return {
  {
    "motosir/skel-nvim",
    config = function()
      local skeld = require("skel-nvim.defaults")
      require("skel-nvim").setup({
        -- dir containing skeleton files (default)
        templates_dir = vim.fn.stdpath("config") .. "/skeleton",
        mappings = {
          ["*.cpp"] = { "cpp.skel" },
          ["*.h"] = { "h.skel", "antidot.h.skel" },
        },
        -- substitutions in templates (default)
        -- can be a string or a callback function
        -- these are the set of default placeholders provided by the plugin
        substitutions = {
          ["FILENAME"] = skeld.get_filename,
          ["NAME"] = skeld.get_author,
          ["DATE"] = skeld.get_date,
          ["YEAR"] = function()
            return os.date("%Y")
          end,
          ["CPP_HDR_GUARD"] = skeld.get_cppheaderguard,
          ["CPP_TEST_HDR_GUARD"] = skeld.get_testheaderguard,
          ["CPP_HDR_INCLUDE"] = skeld.get_headerinclude,
          ["CLASS_NAME"] = skeld.get_classname2,
          ["NAMESPACE_OPEN"] = skeld.get_namespaceopen,
          ["NAMESPACE_CLOSE"] = skeld.get_namespaceclose,
        },
      })
    end,
  },
}
