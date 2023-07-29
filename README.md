# stores

This repository stores my neovim settings, some of which require configuration.
Several dependencies are required (maybe more):
```
nodejs, g++, npm
```

If you want to write latex files in vim, 
you need to install a tex compiler that works on your computer

- vim-plug: I use vim-plug to manage my plugins, so vim-plug should be installed.
    ```shell
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    ```
    This installs vim-plug on Unix. 
    If it does not work,
    check the official site for more information:
    ```
    https://github.com/junegunn/vim-plug
    ```

- coc.nvim language servers and coc-snippets: 
    ```shell
    CocInstall coc-clangd coc-pyright coc-json coc-sumneko-lua coc-snippets coc-lists coc-pairs
    CocCommand clangd.install
    ```

- Copilot:
    ```shell
    Copilot auth
    ```
