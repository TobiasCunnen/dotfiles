import { WindowProps } from "types/widgets/window";
import { RevealerProps } from "types/widgets/revealer";

interface PopUpWindowsProps {
    monitor?: number;
    windowName: string;
    anchor?: WindowProps['anchor'];
    exclusivity?: WindowProps['exclusivity'];
    layer?: WindowProps['layer'];
    margin?: WindowProps['margin'];
    keymode?: WindowProps['keymode'];
    transition?: RevealerProps['transition'];
    transitionDuration?: number;
    child: WindowProps['child'];
    revealVar;
}

export function PopUpWindow(
    {
        monitor = 0,
        windowName,
        anchor = [],
        exclusivity = 'normal',
        layer = 'top',
        margin = 0,
        keymode = 'none',
        transition = 'crossfade',
        transitionDuration = 300,
        child,
        revealVar,
    }: PopUpWindowsProps) {

    return Widget.Window({
        monitor: monitor,
        name: windowName,
        anchor: anchor,
        exclusivity: exclusivity,
        layer: layer,
        margin: margin,
        keymode: keymode,
        css: 'background-color: transparent;',
        child: Widget.Box({
            css: 'padding: 1px; background-color: transparent;',
            child: Widget.Revealer({
                setup: self => self.hook(revealVar, () => {
                    if (revealVar.value) {
                        App.openWindow(windowName);
                        self.reveal_child = true;
                        return;
                    }
                    App.closeWindow(windowName);
                    self.reveal_child = false;
                }),
                revealChild: false,
                transition: transition,
                transitionDuration: transitionDuration,
                child: child,
            })
        })
    });
}

