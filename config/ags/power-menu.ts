import { PopUpWindow } from 'pop-up-window'
import Box from 'types/widgets/box';
import Button from 'types/widgets/button';

App.addIcons(`${App.configDir}/icons`)
const WINDOW_NAME = 'power-menu'
export const showPowerMenu = Variable(false)
globalThis.showPowerMenu = showPowerMenu;

function PowerMenu(): Box<any, any> {
    return Widget.Box({
        vertical: true,
        className: 'power-menu-window',
        children: [
            PowerMenuItem('slumber-symbolic', Sleep, 's'),
            PowerMenuItem('logout-symbolic', Logout, 'l'),
            PowerMenuItem('reboot-symbolic', Reboot, 'r'),
            PowerMenuItem('power-off-symbolic', Shutdown, 'p'),
        ]
    })
}

export const PowerMenuWindow = PopUpWindow({
    windowName: WINDOW_NAME,
    keymode: 'exclusive',
    anchor: ['right'],
    margins: [0, 25],
    transition: 'slide_right',
    revealVar: showPowerMenu,
    child: PowerMenu(),
}).keybind('Escape', () => {
    // App.closeWindow(WINDOW_NAME);
    showPowerMenu.value = false;
}).keybind('q', () => {
    // App.closeWindow(WINDOW_NAME);
    showPowerMenu.value = false;
}).keybind('s', () => {
    Sleep()
}).keybind('l', () => {
    Logout()
}).keybind('r', () => {
    Reboot()
}).keybind('p', () => {
    Shutdown()
});

function PowerMenuItem(icon: string, onClick: () => void, key: string): Button<any, any> {
    return Widget.Button({
        child: Widget.Icon(icon),
        tooltipText: `Shortcut: ${key}`,
        cursor: 'pointer',
        className: 'power-menu-item',
        onClicked: () => onClick(),
    })
}

function Sleep() {
    App.closeWindow(WINDOW_NAME);
    showPowerMenu.value = false;
    Utils.execAsync('systemctl suspend')
}

function Logout() {
    App.closeWindow(WINDOW_NAME);
    showPowerMenu.value = false;
    Utils.execAsync('hyprctl dispatch exit')
}

function Reboot() {
    App.closeWindow(WINDOW_NAME);
    showPowerMenu.value = false;
    Utils.execAsync('reboot')
}

function Shutdown() {
    App.closeWindow(WINDOW_NAME);
    showPowerMenu.value = false;
    Utils.execAsync('shutdown now')
}
