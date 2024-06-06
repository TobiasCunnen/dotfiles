App.addIcons(`${App.configDir}/icons`)

export function PowerMenuWindow(monitor = 0) {
    const windowName = `power-menu-${monitor}`
    return Widget.Window({
        monitor: monitor,
        name: windowName,
        anchor: ['right'],
        margins: [0,15],
        css: 'background: transparent;',
        keymode: 'exclusive',
        setup: self => self.keybind('Escape', () => {
            App.closeWindow(windowName)
        }).keybind('q', () => {
            App.closeWindow(windowName)
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
}

function PowerMenuItem(iconPath, onClick, key) {
    return Widget.Button({
        child: Widget.Icon(iconPath),
        tooltipText: `Shortcut: ${key}`,
        cursor: 'pointer',
        className: 'power-menu-item',
        onClicked: () => onClick(),
        setup: self => self.keybind(key, () => onClick()),
    })
}

function Sleep() {

}

function Logout() {

}

function Reboot() {

}

function Shutdown() {
    print('hoooi')
}
