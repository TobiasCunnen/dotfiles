import { NotificationPopups } from "./notifications/notifications.js"
import { PowerMenuWindow } from "./power-menu/power-menu.js"

App.config({
    style: App.configDir + "/style.css",
    icons: "./icons/",
    windows: [
        NotificationPopups(),
        PowerMenuWindow(),
    ],
})
