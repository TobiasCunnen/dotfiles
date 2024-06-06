import { NotificationPopups } from "./notifications/notifications.js"
import { PowerMenuWindow } from "./power-menu.js"
import { VolumeIndicator } from "./volume-indicator.js"

App.config({
    style: App.configDir + "/style.css",
    icons: "./icons/",
    windows: [
        NotificationPopups(),
        PowerMenuWindow(),
        VolumeIndicator(),
    ],
})
