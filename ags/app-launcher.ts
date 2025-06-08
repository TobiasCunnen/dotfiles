import { PopUpWindow } from 'pop-up-window'
import { type Entry } from 'types/widgets/entry'
import { type Application } from 'types/service/applications'
import { type Button } from 'types/widgets/button'
import { type Revealer } from 'types/widgets/revealer'
import { type Box } from 'types/widgets/box'
App.addIcons(`${App.configDir}/icons`)
const { query } = await Service.import('applications')

export const showAppLauncher = Variable(false)
globalThis.showAppLauncher = showAppLauncher;
const WINDOW_NAME = 'app-launcher'
let showList = Variable(true)

function SearchField(applications: Button<any, any>[]): Entry<unknown> {
    return Widget.Entry({
        className: 'app-launcher-search',
        hexpand: true,
        placeholderText: 'Search for an app...',
        on_accept: () => {
            const results = applications.filter((item) => item.visible);
            if (results[0]) {
                App.closeWindow(WINDOW_NAME)
                showAppLauncher.value = false
                results[0].attribute.app.launch()
            }
        },
        on_change: ({ text }) => {
            const results = applications.filter((item) => item.attribute.app.match(text ?? ""));
            if (results.length == 0) {
                showList.value = false;
                return;
            }

            showList.value = true;
            applications.forEach(item => {
                item.visible = item.attribute.app.match(text ?? "");
            });
        },
    });
}

function AppItem(app: Application): Button<any, any> {
    let icon = app.icon_name
    if (icon == null) {
        icon = 'cube-symbolic'
    }

    return Widget.Button({
        onClicked: () => {
            App.closeWindow(WINDOW_NAME);
            showAppLauncher.value = false;
            app.launch();
        },
        cursor: 'pointer',
        attribute: { app },
        className: 'app-launcher-item',
        child: Widget.Box({
            vertical: true,
            children: [
                Widget.Icon({
                    icon: icon,
                    size: 80,
                }),
                Widget.Label({
                    label: app.name,
                    justification: 'center',
                    truncate: 'end',
                })
            ]
        })
    })
}

function AppList(applications: Button<any, any>[]): Revealer<any, any> {
    return Widget.Revealer({
        revealChild: true,
        transition: 'slide_up',
        transitionDuration: 300,
        setup: self => self.hook(showList, () => {
            self.reveal_child = showList.value;
        }),
        child: Widget.Box({
            children: [
                Widget.Scrollable({
                    vscroll: 'never',
                    hscroll: 'always',
                    hexpand: true,
                    child: Widget.Box({
                        children: applications,
                    })
                }),
            ]
        }),
    })
}

function AppLauncher(): Box<any, any> {
    let applications = query("").map(AppItem)
    let search = SearchField(applications)
    let apps = AppList(applications)
    return Widget.Box({
        className: 'app-launcher',
        vertical: true,
        setup: self => self.hook(App, (_, windowName, visible) => {
            if (windowName !== WINDOW_NAME)
                return

            if (visible) {
                search.text = ""
                search.grab_focus()
            }
        }),
        children: [
            search,
            apps,
        ]
    })
}

export const AppLauncherWindow = PopUpWindow({
    windowName: WINDOW_NAME,
    anchor: ['top'],
    keymode: 'exclusive',
    transition: 'slide_up',
    revealVar: showAppLauncher,
    child: AppLauncher(),
}).keybind('Escape', () => {
    App.closeWindow(WINDOW_NAME);
    showAppLauncher.value = false;
})
