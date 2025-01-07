settings
{
	priority=1
	exclude.where = !process.is_explorer
	showdelay = 200
	modify.remove.duplicate=1
	tip.enabled=true
}

import 'imports/theme.nss'
import 'imports/images.nss'

import 'imports/modify.nss'

menu(mode="multiple" vis=key.shift() title="Fixar/Desfixar" image=icon.pin)
{
}

import 'imports/terminal.nss'
import 'imports/file-manage.nss'
import 'imports/develop.nss'
import 'imports/goto.nss'
import 'imports/control-panels.nss'
import 'imports/taskbar.nss'

menu(mode="multiple" title=title.more_options image=icon.more_options)
{
}