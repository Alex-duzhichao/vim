function! SwitchDir()
    echo s:filename
    if !isdirectory(s:filename)
        if exists("*mkdir")
            call mkdir(s:filename,"p",0755)
        endif
    endif
    execute ":cd ".s:filename
endfunction

function! InitWorkSpace()
    :e makefile
    :45split  main.cpp
    :50vsplit ��Ŀ.txt
endfunction

function! InitCPP()
    " OmniCppComplete
    let OmniCpp_NamespaceSearch = 1
    let OmniCpp_GlobalScopeSearch = 1
    let OmniCpp_ShowAccess = 1
    let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
    let OmniCpp_MayCompleteDot = 1 " autocomplete after .
    let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
    let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
    let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
    " automatically open and close the popup menu / preview window
    au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
    set completeopt=menuone,menu,longest
    :set tags+=D:/vimlib/addcpplib/tags
    :set path+=D:/vimlib/addcpplib/cpp_src
    :set tags+=F:/temp/boost_1_49_0/tags_boost
    :set path+=F:/temp/boost_1_49_0/boost
endfunction

"��󻯴���
:simalt ~x
let s:path="F:/temp/testboost"
let s:tip="��ѡ����Ŀ����\nĿǰ�Ѵ��ڵ���Ŀ����:\n"
let s:tip=s:tip.system("ls ".s:path)
echo s:tip
let s:input=input("������Ŀ����:")
if s:input==""
    :exit
endif
let s:filename=s:path."/".s:input
call SwitchDir()
call InitWorkSpace()
call InitCPP()
:map <F5> :!main.exe<CR>
