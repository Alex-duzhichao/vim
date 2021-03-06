"函数
function UPFILE_php()
    let vim_proj=$VIMPROJ."/Tool"
    let cygwin_proj=$CYGWINPATH."/mintty.exe"
    let filelist_cmd= "! ".cygwin_proj." ".vim_proj."/SSHFileup_phpfilelist.sh"." ".g:SSHSendDir
    execute filelist_cmd

    if (-1!=getftime("uploadfile.txt"))
        let str_choice=""
        for ff in readfile("uploadfile.txt")
            let str_choice=str_choice."\n".ff
        endfor

        if (str_choice=="")
            let str_choice="file not found"
        endif

        let choice=confirm(str_choice,"&Yes\n&update_timestamp\n&Cancel",1)
        if (choice==1)
            let cmd= "! ".cygwin_proj." ".vim_proj."/SSHFileup_php_upload.sh"." ".g:SSHSendDir." ".g:SSHUSER." ".g:SSHPORT." ".g:SSHRemoteDir." ".choice
            execute cmd
        elseif (choice==2)
            let ctmp=["hello"]
            call writefile(ctmp,"timestamp.txt","b")
            echo "done"
        endif
    endif
endfunction

function CSTAG_php()
    let dir = getcwd()
    if filereadable("tags")
        if(g:iswindows==1)
            let tagsdeleted=delete(dir."\\"."tags")
        else
            let tagsdeleted=delete("./"."tags")
        endif
        if(tagsdeleted!=0)
            echohl WarningMsg | echo "Fail to do tags! I cannot delete the tags" | echohl None
            return
        endif
    endif
    if(executable('ctags_for_php'))
        "silent! execute "!ctags_for_php -R --PHP-kinds=+p --fields=+iaS --extra=+q ."
        silent! execute "!ctags_for_php -R --languages=php ."
    endif
endfunction

"function ASTYLE_cpp()
"    let g:astyle_file=expand("%")
"    silent execute "!astyle -A1M40Sjk1n --mode=c ".getcwd()."/".g:astyle_file
"endfunction

function! InitPHP()
    " OmniCppComplete
    "let OmniCpp_NamespaceSearch = 1
    "let OmniCpp_GlobalScopeSearch = 1
    "let OmniCpp_ShowAccess = 1
    "let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
    "let OmniCpp_MayCompleteDot = 1 " autocomplete after .
    "let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
    "let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
    "let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
    "jquery
    let g:used_javascript_libs = 'jquery'
    autocmd BufReadPre *.js let b:javascript_lib_use_jquery = 1
    au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery

    " automatically open and close the popup menu / preview window
    "au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
    "set completeopt=menuone,menu,longest,preview
    "预览窗口不会自动关闭 by LawrenceChi
    set completeopt=menuone,menu,longest,preview
    ":set tags+=$VIMPROJ/vimlib/tags,$VIMPROJ/vimlib/linux/tags,$VIMPROJ/vimlib/unix_network_programming/tags
    ":set path+=$VIMPROJ/vimlib/cpp_src,$VIMPROJ/vimlib/linux/include,$VIMPROJ/vimlib/linux/include/sys/,$VIMPROJ/vimlib/unix_network_programming/
    let g:chiylown_func_dict["UPFILE"]["php"]="UPFILE_php"
    let g:chiylown_func_dict["CSTAG"]["php"]="CSTAG_php"
    "let g:chiylown_func_dict["ASTYLE"]["cpp"]="ASTYLE_cpp"
endfunction
