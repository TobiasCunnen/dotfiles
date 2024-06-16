import { NotificationPopups } from "./notifications/notifications.js"
import { PowerMenuWindow } from "./power-menu"
import { VolumeIndicator } from "./volume-indicator.js"
import { AppLauncherWindow } from 'app-launcher'

const WINDOW_CLOSE_DELAY = 350

App.config({
    style: App.configDir + '/style.css',
    icons: './icons/',
    closeWindowDelay: {
        'volume-indicator': WINDOW_CLOSE_DELAY,
        'power-menu': WINDOW_CLOSE_DELAY,
        'app-launcher': WINDOW_CLOSE_DELAY,
    },
    windows: [
        NotificationPopups(),
        VolumeIndicator(),
        AppLauncherWindow,
        PowerMenuWindow,
    ],
})
