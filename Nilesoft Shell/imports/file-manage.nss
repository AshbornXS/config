menu(where=sel.count>0 type='file|dir|drive|namespace|back' mode="multiple" title='Manager' image=\uE253)
{
	menu(separator="after" title=title.copy_path image=icon.copy_path)
	{
		item(where=sel.count > 1 title='Copiar (@sel.count) itens selecionados' cmd=command.copy(sel(false, "\n")))
		item(mode="single" title=@sel.path tip=sel.path cmd=command.copy(sel.path))
		item(mode="single" type='file' separator="before" find='.lnk' title='Abrir local do arquivo')
		separator
		item(mode="single" where=@sel.parent.len>3 title=sel.parent cmd=@command.copy(sel.parent))
		separator
		item(mode="single" type='file|dir|back.dir' title=sel.file.name cmd=command.copy(sel.file.name))
		item(mode="single" type='file' where=sel.file.len != sel.file.title.len title=@sel.file.title cmd=command.copy(sel.file.title))
		item(mode="single" type='file' where=sel.file.ext.len>0 title=sel.file.ext cmd=command.copy(sel.file.ext))
	}

	item(mode="single" type="file" title="Mudar extensão" image=\uE0B5 cmd=if(input("Mudar Extensão", "Digite a nova extensão"), 
		io.rename(sel.path, path.join(sel.dir, sel.file.title + "." + input.result))))
	
	menu(separator="after" image=\uE290 title=title.select)
	{
		item(title="Tudo" image=icon.select_all cmd=command.select_all)
		item(title="Inverter" image=icon.invert_selection cmd=command.invert_selection)
		item(title="Nada" image=icon.select_none cmd=command.select_none)
	}
	
	item(type='file|dir|back.dir|drive' title='Tomar Posse' image=[\uE194,#f00] admin
		cmd args='/K takeown /f "@sel.path" @if(sel.type==1,null,"/r /d y") && icacls "@sel.path" /grant *S-1-5-32-544:F @if(sel.type==1,"/c /l","/t /c /l /q")')
	separator
	menu(title="Mostrar/Ocultar" image=icon.show_hidden_files)
	{
		item(title="Arquivos de sistema" image=inherit cmd='@command.togglehidden')
		item(title="Extensões" image=icon.show_file_extensions cmd='@command.toggleext')
	}

	menu(type='file|dir|back.dir' mode="single" title='Atributos' image=\uE253)
	{
		$atrr = io.attributes(sel.path)
		item(title='Oculto' checked=io.attribute.hidden(atrr)
			cmd args='/c ATTRIB @if(io.attribute.hidden(atrr),"-","+")H "@sel.path"' window=hidden)
		
		item(title='Sistema' checked=io.attribute.system(atrr)
			cmd args='/c ATTRIB @if(io.attribute.system(atrr),"-","+")S "@sel.path"' window=hidden)
			
		item(title='Apenas leitura' checked=io.attribute.readonly(atrr)
			cmd args='/c ATTRIB @if(io.attribute.readonly(atrr),"-","+")R "@sel.path"' window=hidden)
			
		item(title='Arquivar' checked=io.attribute.archive(atrr)
			cmd args='/c ATTRIB @if(io.attribute.archive(atrr),"-","+")A "@sel.path"' window=hidden)
		separator
		item(title="CRIADO" keys=io.dt.created(sel.path, 'y/m/d') cmd=io.dt.created(sel.path,2000,1,1))
		item(title="MODIFICADO" keys=io.dt.modified(sel.path, 'y/m/d') cmd=io.dt.modified(sel.path,2000,1,1))
		item(title="ACESSADO" keys=io.dt.accessed(sel.path, 'y/m/d') cmd=io.dt.accessed(sel.path,2000,1,1))
	}

	menu(mode="single" type='file' find='.dll|.ocx' separator="before" title='Registro' image=\uea86)
	{
		item(title='Registrar' admin cmd='regsvr32.exe' args='@sel.path.quote' invoke="multiple")
		item(title='Desregistrar' admin cmd='regsvr32.exe' args='/u @sel.path.quote' invoke="multiple")
	}
	
	item(where=!wnd.is_desktop title=title.folder_options image=icon.folder_options cmd=command.folder_options)
}