# Neovim Configuration

![image](https://user-images.githubusercontent.com/3200931/210149073-61275f5b-c3bf-4b58-82ea-944da04e35d7.png)




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


## git

- `<leader>gs`     : **G**it **S**tatus
- `<leader>gb`     : **G**it **B**lame
- `<leader>lgc`    : **L**ist **G**it **C**ommits
- `<leader>lgb`    : **L**ist **G**it **B**ranches


## File & Buffers

- `<leader>f`       : fuzzy **F**ind file in workspace
- `<C-p>`           : fuzzy **F**ind file in git repository
- `<leader><leader>`: list existing **B**uffers 
- `<leader>?`       : list recently opened files
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


