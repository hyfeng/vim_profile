# vim的配置
## 使用bundle管理，可以把bundle的命令去掉
### format.vim 放到.vim路径
如果~/.vim 不存在，创建一个目录  

创建目录 mkdir -p ~/.vim/bundle
进入目录 cd ～/.vim/bundle
git 下载Vundle 命令：git clone https://github.com/VundleVim/Vundle.vim.git
将format.vim copy到 ~/.vim 目录

使用bundl更新（安装）插件：用vim打开.vimrc  :PluginInstall 命令即可安装配置的插件   
增加新插件， 在vimrc中 增加Plugin 'github 路径，参照taglist'  ; 使用搜索引擎搜索vundle 插件管理 能获得一切

tags生成
ctags -R --fields=+iaS --extra=+q --c++-kinds=+p
