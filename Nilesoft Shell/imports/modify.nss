modify(mode=mode.multiple
	where=str.equals(this.name, ["open in terminal", "open linux shell here", "Adicionar aos favoritos", "Verificar com o Microsoft Defender...", "PowerShell 7 (x86)", "Abrir em nova guia", "Abrir em nova janela"]) || this.id(id.restore_previous_versions,id.cast_to_device,id.open_powershell_window_here,id.give_access_to,id.extract_all)
	vis=vis.remove)

modify(type="recyclebin" where=window.is_desktop and this.id==id.empty_recycle_bin pos=1 sep)

modify(find="Desafixar*" pos="bottom" menu="Fixar/Desfixar")
modify(find="Fixar*" pos="top" menu="Fixar/Desfixar")
modify(find="Remover do*" pos="top" menu="Fixar/Desfixar")

modify(find="*Komorebi*" pos="middle" sep="top" menu="Manager")
modify(where=this.id==id.copy_as_path menu="Manager")

modify(type="dir.back|drive.back" where=this.id==id.customize_this_folder pos=1 sep="top" menu="Manager")

modify(find="*WinRAR*" pos="top" menu="Manager")

modify(find="*Code*" pos="top" menu="Code")

modify(find="*VS Code*" pos="top" menu="Code")

modify(find="*IntelliJ*" pos="middle" menu="Code")

modify(find="*PyCharm*" pos="middle" menu="Code")

modify(find="Intel*" pos="top" menu="Painéis de Controle")

modify(find="*NVIDIA*" pos="top" menu="Painéis de Controle")

modify(find="*Terminal*" pos="top" menu="Terminal")

modify(find="*Git*" pos="bottom" sep=sep.top menu="Terminal")

modify(find="*Linux*" pos="bottom" menu="Terminal")

modify(where=str.equals(this.name, ["Abrir"]) image=\uE0A4)

modify(mode=multiple find="Adicionar para*" pos="bottom" sep=sep.top image=[\uE0AA,#fdb900] menu="Manager")

modify(where=str.equals(this.name, ["Extrair aqui"])
	pos="bottom" image=[\uE0AA,#fdb900] menu="Manager" sep=sep.top)

modify(find="*Microsoft Defender*" vis=key.shift())

modify(mode=mode.multiple sep=sep.top
	where=str.equals(this.name, ["Assinar e encriptar", "Mais opções do GpgEX", "Solucionar problemas de compatibilidade", "Compartilhar"]) ||
		this.id(
		id.send_to,
		id.share,
		id.create_shortcut,
		id.set_as_desktop_background,
		id.rotate_left,
		id.rotate_right,
		id.map_network_drive,
		id.disconnect_network_drive,
		id.format,
		id.eject,
		id.include_in_library,
		id.print
	)
	pos="bottom" menu=title.more_options)