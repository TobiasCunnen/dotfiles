App.addIcons(`${App.configDir}/icons`)
const WINDOW_NAME = 'power-menu'

export const showPowerMenu = Variable(false)
globalThis.showPowerMenu = showPowerMenu;

export function PowerMenuWindow(monitor = 0) {
    return Widget.Window({
        monitor: monitor,
        layer: 'overlay',
        visible: false,
        name: WINDOW_NAME,
        anchor: ['right'],
        margins: [0, 25],
        css: 'background: transparent;',
        keymode: 'exclusive',
        setup: self => self.keybind('Escape', () => {
            App.closeWindow(WINDOW_NAME)
            showPowerMenu.value = false;
        }).keybind('q', () => {
            App.closeWindow(WINDOW_NAME);
            showPowerMenu.value = false;
        }).keybind('s', () => {
            Sleep()
        }).keybind('l', () => {
            Logout()
        }).keybind('r', () => {
            Reboot()
        }).keybind('p', () => {
            Shutdown()
        }),
        child: Widget.Box({
            css: 'padding:1px; background-color:transparent;',
            child: Widget.Revealer({
                transition: 'slide_right',
                transitionDuration: 300,
                revealChild: false,
                setup: self => self.hook(showPowerMenu, () => {
                    if (showPowerMenu.value) {
                        App.openWindow(WINDOW_NAME);
                        self.reveal_child = true;
                        return;
                    }
                    App.closeWindow(WINDOW_NAME);
                    self.reveal_child = false;
                }),
                child: Widget.Box({
                    vertical: true,
                    className: 'power-menu-window',
                    children: [
                        PowerMenuItem('slumber-symbolic', Sleep, 's'),
                        PowerMenuItem('logout-symbolic', Logout, 'l'),
                        PowerMenuItem('reboot-symbolic', Reboot, 'r'),
                        PowerMenuItem('power-off-symbolic', Shutdown, 'p'),
                    ]
                })
            })
        })
    })
}

function PowerMenuItem(icon, onClick, key) {
    return Widget.Button({
        child: Widget.Icon(icon),
        tooltipText: `Shortcut: ${key}`,
        cursor: 'pointer',
        className: 'power-menu-item',
        onClicked: () => onClick(),
    })
}

function Sleep() {
    App.closeWindow(WINDOW_NAME)
    Utils.exec('systemctl suspend')
}

function Logout() {
    App.closeWindow('power-menu-0')
    Utils.exec('hyprctl dispatch exit')
}

function Reboot() {
    Utils.exec('reboot')
}

function Shutdown() {
    Utils.exec('shutdown now')
}