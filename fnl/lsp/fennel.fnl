(fn root-dir [bufnr on-dir]
  (let [fname (vim.api.nvim_buf_get_name bufnr)]
    (fn has-fls-project-cfg [path]
      (let [fnlpath (vim.fs.joinpath path :flsproject.fnl)]
        (= (. (or (vim.uv.fs_stat fnlpath) {}) :type) :file)))

    (on-dir (or (: (vim.iter (vim.fs.parents fname)) :find has-fls-project-cfg)
                (vim.fs.root 0 :.git)))))

{:cmd [:fennel-ls]
 :filetypes [:fennel]
 :root_dir root-dir
 :settings {}
 :capabilities {:offsetEncoding [:utf-8 :utf-16]}}
