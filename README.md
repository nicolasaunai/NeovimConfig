# Neovim Configuration

![image](https://user-images.githubusercontent.com/3200931/210149073-61275f5b-c3bf-4b58-82ea-944da04e35d7.png)

# Installation

 

```bash
sudo dnf install neovim
`git clone https://github.com/nicolasaunai/neovimconf.git ~/.config/nvim`
git clone --depth 1 https://github.com/wbthomason/packer.nvim  ~/.local/share/nvim/site/pack/packer/start/packer.nvim
`cd ~/.config/nvim/lua/nico`
`nvim packer.lua`
```

then in neovim, source the file `packer.lua` with  `:so`
and run `PackerSync` to install all plugins


Then run `:Mason` and install:


- clang-format
- clangd
- cmake-language-server
- cpptools
- debugpy
- html-lsp
- json-lsp
- pylint
- pyright
- texlab




# Cheat Sheet



## Motions

- `gd`             : **G**oto **D**efinition
- `gD`             : **G**oto **D**eclaration
- `gr`             : list **R**eferences of word under cursor
- `<leader>D`      : type **D**efinition of the variable under cursor


## Types informations

- `<leader>D`      : type **D**efinition of the variable under cursor
- `K`              : hover documentation


## Completion

- `<Ctrl-y>`       : Confirms selection.
- `<Ctrl-e>`       : Cancel the completion.
- `<Down>`         : Navigate to the next item on the list.
- `<Up>`           : Navigate to previous item on the list.
- `<Ctrl-n>`       : Go to the next item in the completion menu, or trigger completion menu.
- `<Ctrl-p>`       : Go to the previous item in the completion menu, or trigger completion menu.
- `<Ctrl-d>`       : Scroll down in the item's documentation.
- `<Ctrl-u>`       : Scroll up in the item's documentation.
- `<Ctrl-f>`       : Go to the next placeholder in the snippet.
- `<Ctrl-b>`       : Go to the previous placeholder in the snippet.
- `<Tab>`          : Enables completion when the cursor is inside a word. If the completion menu is visible it will navigate to the next item in the list.
- `<Shift-Tab>`    : When the completion menu is visible navigate to the previous item in the list.
- `<Shift-Tab>`    : Accept Copilot suggestion
- `<C-j>`          : Next copilot suggestion
- `<C-k>`          : Previous copilot suggestion


## NVimTree

- `f`              : Fuzzy file filter
- `F`              : close the file filter
- `<C-K>`          : display file informations
- `H`              : show/hide **H**idden files (.files)
- `E`              : **E**xpand all
- `W`              : Collapse all
- `r`              : **R**ename the file under cursor
- `a`              : create file or folder
- `d`              : **D**elete file or folder under cursor


## Symbols

- `<leader>ds`     : list **D**ocument **S**ymbols
- `<leader>ws`     : list **W**orkspace **S**ymbols
- `<leader>sw`     : fuzzy **S**earch **W**ord under cursor in workspace
- `<leader>sg`     : fuzzy **S**earch **G**rep in workspace
- `<leader>r`      : [R]ename


## Commenting code

In  NORMAL mode: 
- `gcc`                : Toggles the current line using linewise comment
- `gbc`                : Toggles the current line using blockwise comment
- `[count]gcc`         : Toggles the number of line given as a prefix-count using linewise
- `[count]gbc`         : Toggles the number of line given as a prefix-count using blockwise
- `gc[count]{motion}`  :(Op-pending) Toggles the region using linewise comment
- `gb[count]{motion}`  :(Op-pending) Toggles the region using blockwise comment

In VISUAL mode: 
- `gc` : Toggles the region using linewise comment
- `gb` : Toggles the region using blockwise comment

Linewise:


- `gcw`  : Toggle from the current cursor position to the next word
- `gc$`  : Toggle from the current cursor position to the end of line
- `gc}`  : Toggle until the next blank line
- `gc5j` : Toggle 5 lines after the current cursor position
- `gc8k` : Toggle 8 lines before the current cursor position
- `gcip` : Toggle inside of paragraph
- `gca}` : Toggle around curly brackets

# Blockwise

- `gb2}` : Toggle until the 2 next blank line
- `gbaf` : Toggle comment around a function (w/ LSP/treesitter support)
- `gbac` : Toggle comment around a class (w/ LSP/treesitter support)


## git

- `<leader>gs`     : [G]it [S]tatus
- `<leader>gb`     : [G]it [B]lame
- `<leader>gc`     : [G]it **C**ommit
- `<leader>lgc`    : [L]ist [G]it **C**ommits
- `<leader>lgb`    : [L]ist [G]it **B**ranches


## File & Buffers

- `<leader>f`       : fuzzy **F**ind file in workspace
- `<C-p>`           : fuzzy **F**ind file in git repository
- `<leader><leader>`: list existing **B**uffers 
- `<leader>sr`      : [S]earch [R]ecently opened files
- `<leader>rn`      : **R**e**N**ame  current buffer
- `<leader>wa`      : **W**orkspace **A**dd folder 
- `<leader>wr`      : **W**orkspace **R**emove folder 
- `<leader>wl`      : **L**ist workspace folders
- `<leader>cl`      : **CL**ose buffer
- `<TAB>`           : next buffer
- `<S-TAB>`         : previous buffer


## File Tree

- `<C-n>`           : display tree
- `<leader>f`       : find file



## Window

- `<leader>v`       : *V*ertical split
- `<leader>h`       : *H*orizontal split


## NeoVim

- `<leader>ev`      : open neovim config directory
- `<leader>sv`      : source root init.lua config file
- `<leader>sm`      : fuzzy search in keymaps



## Help
- `<leader>sh`     : fuzzy **S**earch **H**help
- `<leader>sd`     : **S**earch in **D**iagnostics




## Mason

- `:Mason`         : Run Mason to install/uninstall LSP, DAP, Linters, Formatters
- `:MasonUpdate`   : Update all managed registries


## Packer

- `source ~/.config/nvim/lua/nico/packer.lua`   : source the packer config
- `:PackerSync`     : Perform `PackerUpdate` and then `PackerCompile`
- `PackerCompile`   : Regenerate compiled loader file
- `PackerClean`     : Remove any disabled or unused plugins
- `PackerUpdate`    : Clean, then update and install plugins


