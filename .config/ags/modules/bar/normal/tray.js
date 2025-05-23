import Widget from 'resource:///com/github/Aylur/ags/widget.js';
import SystemTray from 'resource:///com/github/Aylur/ags/service/systemtray.js';
import Variable from 'resource:///com/github/Aylur/ags/variable.js';
import Utils from 'resource:///com/github/Aylur/ags/utils.js';

const { Box, Icon, Button, Revealer } = Widget;
const { Gravity } = imports.gi.Gdk;

const BLOCKLIST_PATH = '/home/devon/.config/ags/tray-blocklist.json';

function readBlocklist() {
    try {
        const content = Utils.readFile(BLOCKLIST_PATH);
        return JSON.parse(content);
    } catch (e) {
        print(`Failed to read tray blocklist: ${e}`);
        return [];
    }
}

const hiddenItems = Variable(readBlocklist());

const monitor = Utils.monitorFile(BLOCKLIST_PATH, (file, event) => {
   hiddenItems.setValue(readBlocklist()); 
});

const SysTrayItem = (item) => (item.id !== null && !hiddenItems.value.includes(item.id)) ? Button({
    className: 'bar-systray-item',
    child: Icon({ hpack: 'center' }).bind('icon', item, 'icon'),
    setup: (self) => self
        .hook(item, (self) => self.tooltipMarkup = item['tooltip-markup'])
    ,
    onPrimaryClick: (_, event) => item.activate(event),
    onSecondaryClick: (btn, event) => item.menu.popup_at_widget(btn, Gravity.SOUTH, Gravity.NORTH, null),
}) : null;

export const Tray = (props = {}) => {
    const trayContent = Box({
        className: 'margin-right-5 spacing-h-15',
        setup: (self) => self
            .hook(SystemTray, (self) => {
                self.children = SystemTray.items.map(SysTrayItem);
                self.show_all();
            })
       ,
    });
    const trayRevealer = Widget.Revealer({
        revealChild: true,
        transition: 'slide_left',
        transitionDuration: userOptions.animations.durationLarge,
        child: trayContent,
    });
    return Box({
        ...props,
        children: [trayRevealer],
    });
}
