"����ļ���ͼʹ�ô��� VIM ��Ŀ���Ӽ򵥷��㡣
"�ٳ��õ�ȫ�������Ѿ��� _vimrc��������
"�ڳ��õ�CPP������InitCPP.vim������
"�ۻ���һЩÿ����Ŀ˽�е����ã�����˵��Ŀ�ĸ�Ŀ¼������ʱ��Ҫ�򿪵��ļ���һ���ϴ���Ŀ¼���õ�
"�ۡ���Ŀ��˽������������ļ��������á�
"

"��ʼ��Main����
source  $VIMPROJ/Tool/main.vim

function! InitWorkSpace()
	normal /Game
	normal o
	normal /MahjongGB
	normal o
	normal /GameTable-gb.cpp
	normal o
	:set rnu

	let g:SSHSendDir="/"
	let g:SSHIPRemote="chiyl@192.168.1.108:/usr/server/Mahjong.gb/Complie/Mahjong/"
	let g:SSHPortRemote=22
endfunction

"Main�����еĲ�������Ŀ���ڵĸ�Ŀ¼
call Main("$YourProject_ROOTDIR/")

