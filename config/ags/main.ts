import { NotificationPopups } from "./notifications/notifications.js"
import { PowerMenuWindow } from "./power-menu"
import { VolumeIndicator } from "./volume-indicator.js"
import { AppLauncherWindow } from 'app-launcher'

globalThis.windowCloseDelay = 350

App.config({
    style: App.configDir + '/style.css',
    icons: './icons/',
    closeWindowDelay: {
        'volume-indicator': globalThis.windowCloseDelay,
        'power-menu': globalThis.windowCloseDelay,
        'app-launcher': globalThis.windowCloseDelay,
    },
    windows: [
        NotificationPopups(),
        VolumeIndicator(),
        AppLauncherWindow,
        PowerMenuWindow,
    ],
})
