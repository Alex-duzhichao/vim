"��ʼ��CPP����
source  $VIMPROJ/Tool/InitCPP.vim
"��ʼ������Ŀ¼
source  $VIMPROJ/Tool/SwitchDir.vim

function! Main(pa)
		"��󻯴���
		:simalt ~x
		let s:path=a:pa
		let s:filename=s:path
		call InitCPP()
		call SwitchDir(s:path)
		call Do_CsTag()
		:silent! Tlist
		:NERDTree
		:set rnu
		call InitWorkSpace()
		"execute "source ".a:initfile
endfunction


