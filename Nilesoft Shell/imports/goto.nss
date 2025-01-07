menu(type='*' where=window.is_taskbar||sel.count mode=mode.multiple title=title.go_to image=\uE14A)
{
	menu(title='Pastas' image=\uE1F4)
	{
		item(title='Windows' image=inherit cmd=if(window.name=='CabinetWClass' and !keys.shift(), command.navigate(sys.dir), sys.dir))
		item(title='System' image=inherit cmd=if(window.name=='CabinetWClass' and !keys.shift(), command.navigate(sys.bin), sys.bin))
		item(title='Program Files' image=inherit cmd=if(window.name=='CabinetWClass' and !keys.shift(), command.navigate(sys.prog), sys.prog))
		item(title='Program Files x86' image=inherit cmd=if(window.name=='CabinetWClass' and !keys.shift(), command.navigate(sys.prog32), sys.prog32))
		item(title='ProgramData' image=inherit cmd=if(window.name=='CabinetWClass' and !keys.shift(), command.navigate(sys.programdata), sys.programdata))
		item(title='Applications' image=inherit cmd='shell:appsfolder')
		item(title='Users' image=inherit cmd=if(window.name=='CabinetWClass' and !keys.shift(), command.navigate(sys.users), sys.users))
		separator
		//item(title='@user.name@@@sys.name' vis=label)
		item(title='Desktop' image=inherit cmd=if(window.name=='CabinetWClass' and !keys.shift(), command.navigate(user.desktop), user.desktop))
		item(title='Downloads' image=inherit cmd=if(window.name=='CabinetWClass' and !keys.shift(), command.navigate(user.downloads), user.downloads))
		item(title='Pictures' image=inherit cmd=if(window.name=='CabinetWClass' and !keys.shift(), command.navigate(user.pictures), user.pictures))
		item(title='Documents' image=inherit cmd=if(window.name=='CabinetWClass' and !keys.shift(), command.navigate(user.documents), user.documents))
		item(title='Startmenu' image=inherit cmd=if(window.name=='CabinetWClass' and !keys.shift(), command.navigate(user.startmenu), user.startmenu))
		item(title='Profile' image=inherit cmd=if(window.name=='CabinetWClass' and !keys.shift(), command.navigate(user.dir), user.dir))
		item(title='AppData' image=inherit cmd=if(window.name=='CabinetWClass' and !keys.shift(), command.navigate(user.appdata), user.appdata))
		item(title='Temp' image=inherit cmd=if(window.name=='CabinetWClass' and !keys.shift(), command.navigate(user.temp), user.temp))
	}
	item(title=title.control_panel image=\uE0F3 cmd='shell:::{5399E694-6CE5-4D6C-8FCE-1D8870FDCBA0}')
	item(title=title.run image=\uE14B cmd='shell:::{2559a1f3-21d7-11d4-bdaf-00c04f60b9f0}')
}