App.addIcons(`${App.configDir}/icons`)

const audio = await Service.import('audio')
export const showVolume = Variable(false)
globalThis.showVolume = showVolume;

function SliderIndicator(windowName = 'slider-inidicator', monitor = 0, icon, bindValue, signalVar) {
    return Widget.Window({
        monitor: monitor,
        layer: 'overlay',
        name: windowName,
        visible: false,
        anchor: ['right'],
        margins: [0, 25],
        css: 'background: transparent;',
        child: Widget.Box({
            css: 'padding:1px; background-color: transparent;',
            cursor: 'pointer',
            child: Widget.Revealer({
                transition: 'slide_right',
                transitionDuration: 500,
                revealChild: true,
                setup: self => self.hook(signalVar, () => {
                    if (signalVar.value){
                        App.openWindow(windowName);
                        self.reveal_child = true;
                        setTimeout(() => { signalVar.value = false; }, 3000)
                        return;
                    }
                    App.closeWindow(windowName);
                    self.reveal_child = false;
                }),
                child: Widget.Box({
                    vertical: true,
                    className: 'slider-inidicator-window',
                    children: [
                        Widget.Icon({
                            icon: icon,
                            className: 'slider-indicator-icon',
                        }),
                        Widget.LevelBar({
                            vertical: true,
                            widthRequest: 40,
                            heightRequest: 350,
                            maxValue: 1,
                            inverted: true,
                            value: bindValue,
                        }),
                    ]
                })
            })
        })
    })
}

export function VolumeIndicator() {
    return SliderIndicator('volume-indicator', 0, 'volume-high-symbolic', audio['speaker'].bind('volume'), showVolume)
}
