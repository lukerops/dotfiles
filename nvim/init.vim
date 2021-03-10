if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd!
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.config/nvim/plugged')

  " icons
  " Plug 'kyazdani42/nvim-web-devicons'

  " file browsing
  Plug 'kyazdani42/nvim-tree.lua'

  " finder
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'

  " lsp
  Plug 'neovim/nvim-lspconfig'
  Plug 'nvim-lua/completion-nvim'

  " highlight
  Plug 'nvim-treesitter/nvim-treesitter'

  " tab line
  Plug 'romgrk/barbar.nvim'

  " status line:
  Plug 'itchyny/lightline.vim'

  " colortheme
  Plug 'joshdick/onedark.vim'

call plug#end()

set encoding=utf8
set number
set signcolumn=yes
set noswapfile

set ignorecase

set clipboard+=unnamedplus
set mouse+=a
if &term =~ '^screen'
  " tmux knows the extended mouse mode
  set ttymouse=xterm2
endif

syntax on
set cursorline
set termguicolors
colorscheme onedark

" file browsing (nvim-tree)
let g:nvim_tree_ignore = [ '.git', 'node_modules' ]
let g:nvim_tree_show_icons = {
    \ 'git': 0,
    \ 'folders': 0,
    \ 'files': 0,
    \ }

highlight NvimTreeFolderIcon guibg=blue

nnoremap nt  :NvimTreeToggle<CR>
nnoremap ntr :NvimTreeRefresh<CR>


" finder (telescope)
nnoremap <C-p>      <cmd>Telescope find_files<cr>
nnoremap <C-A-f>    <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>


" lsp
lua << EOF
  local lspconfig = require'lspconfig'
  local completion = require'completion'

  lspconfig.gopls.setup{
    on_attach = completion.on_attach,
    cmd = {"gopls", "serve"},
      settings = {
        gopls = {
          analyses = {
            unusedparams = true,
          },
          staticcheck = true,
        },
      },
  }

  lspconfig.graphql.setup{
    on_attach = completion.on_attach;
  }

  function goimports(timeoutms)
    local context = { source = { organizeImports = true } }
    vim.validate { context = { context, "t", true } }

    local params = vim.lsp.util.make_range_params()
    params.context = context

    -- See the implementation of the textDocument/codeAction callback
    -- (lua/vim/lsp/handler.lua) for how to do this properly.
    local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, timeout_ms)
    if not result or next(result) == nil then return end
    local actions = result[1].result
    if not actions then return end
    local action = actions[1]

    -- textDocument/codeAction can return either Command[] or CodeAction[]. If it
    -- is a CodeAction, it can have either an edit, a command or both. Edits
    -- should be executed first.
    if action.edit or type(action.command) == "table" then
      if action.edit then
        vim.lsp.util.apply_workspace_edit(action.edit)
      end
      if type(action.command) == "table" then
        vim.lsp.buf.execute_command(action.command)
      end
    else
      vim.lsp.buf.execute_command(action)
    end
  end
EOF

nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>

nnoremap <silent> <leader>fc <cmd>lua vim.lsp.buf.formatting()<CR>
nnoremap <silent> <leader>rn <cmd>lua vim.lsp.buf.rename()<CR>

" autoformat on save
autocmd BufWritePre *.go lua vim.lsp.buf.formatting()
autocmd BufWritePre *.go lua goimports(1000)

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect
imap <silent> <C-SPACE> <Plug>(completion_trigger)


" tabline (barbar)
" NOTE: If barbar's option dict isn't created yet, create it
let bufferline = get(g:, 'bufferline', {})

" Enable/disable icons
" if set to 'numbers', will show buffer index in the tabline
" if set to 'both', will show buffer index and icons in the tabline
let bufferline.icons = 'numbers'

" Enable/disable auto-hiding the tab bar when there is a single buffer
let bufferline.auto_hide = v:false

" Configure icons on the bufferline.
let bufferline.icon_separator_active = '▎'
let bufferline.icon_separator_inactive = '▎'
let bufferline.icon_close_tab = '✕'
let bufferline.icon_close_tab_modified = '●'

" Re-order to previous/next
nnoremap <silent> <A-<> :BufferMovePrevious<CR>
nnoremap <silent> <A->> :BufferMoveNext<CR>
" Move to previous/next
nnoremap <silent> <A-,>  :BufferPrevious<CR>
nnoremap <silent> <A-.> :BufferNext<CR>
" Goto buffer in position...
nnoremap <silent> <A-1> :BufferGoto 1<CR>
nnoremap <silent> <A-2> :BufferGoto 2<CR>
nnoremap <silent> <A-3> :BufferGoto 3<CR>
nnoremap <silent> <A-4> :BufferGoto 4<CR>
nnoremap <silent> <A-5> :BufferGoto 5<CR>
nnoremap <silent> <A-6> :BufferGoto 6<CR>
nnoremap <silent> <A-7> :BufferGoto 7<CR>
nnoremap <silent> <A-8> :BufferGoto 8<CR>
nnoremap <silent> <A-9> :BufferLast<CR>
" Close buffer
nnoremap <silent> <A-c> :BufferClose<CR>
nnoremap <silent> <A-n> :tabnew<CR>


" hightligh (nvim-treesitter)
lua <<EOF
  require'nvim-treesitter.configs'.setup {
    ensure_installed = { "go", "graphql", "json", "yaml" },

    highlight = { enable = true },
    incremental_selection = { enable = true },
  }
EOF

autocmd BufEnter *.graphql setf graphql

" status line (lightline)
let g:lightline = {
  \ 'colorscheme': 'onedark',
  \ }
set noshowmode
