App.addIcons(`${App.configDir}/icons`)

const audio = await Service.import('audio')
export const showVolume = Variable(false)
globalThis.showVolume = showVolume;

//TODO: make the setup function more generic
function SliderIndicator(windowName = 'slider-inidicator', monitor = 0, icon, value) {
    return Widget.Window({
        monitor: monitor,
        layer: 'overlay',
        name: windowName,
        visible: false,
        anchor: ['right'],
        margins: [0, 25],
        css: 'background: transparent;',
        setup: self => self.hook(showVolume, () => {
            if (self.visible) {
                self.visible = false;
            } else if (showVolume.value) {
                self.visible = true;
                setTimeout(() => { showVolume.value = !showVolume.value }, 3000)
            }
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
                    value: value,
                }),
            ]
        })
    })
}

export function VolumeIndicator() {
    return SliderIndicator('volume-indicator', 0, 'volume-high-symbolic', audio['speaker'].bind('volume'))
}
