"��ʼ��CPP����
source  $VIMPROJ/Tool/InitCPP.vim
"��ʼ��LUA����
source  $VIMPROJ/Tool/InitLua.vim
"��ʼ��PKM����
source  $VIMPROJ/Tool/InitPkm.vim
"��ʼ��PHP����
source  $VIMPROJ/Tool/InitPHP.vim
"��ʼ������Ŀ¼
source  $VIMPROJ/Tool/SwitchDir.vim

function! Main(pa)
        "��󻯴���
        :simalt ~x
        let s:path=a:pa
        let s:filename=s:path
        call InitCPP()
        call InitLua()
        call InitPkm()
        call InitPHP()
        call SwitchDir(s:path)
        :silent! Tlist
        :NERDTree
        :set rnu
        call InitWorkSpace()
        :echo call(function(g:chiylown_func_dict.getprojtypefunc("CSTAG")),[])
endfunction


