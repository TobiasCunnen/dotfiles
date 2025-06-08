import { WindowProps } from "types/widgets/window";
import { RevealerProps } from "types/widgets/revealer";
import { Variable } from "types/variable";

interface PopUpWindowsProps {
    monitor?: number;
    windowName: string;
    anchor?: WindowProps['anchor'];
    exclusivity?: WindowProps['exclusivity'];
    layer?: WindowProps['layer'];
    margins?: WindowProps['margins'];
    keymode?: WindowProps['keymode'];
    transition?: RevealerProps['transition'];
    transitionDuration?: number;
    child: WindowProps['child'];
    revealVar: Variable<any>;
}

export function PopUpWindow(
    {
        monitor = 0,
        windowName,
        anchor = [],
        exclusivity = 'normal',
        layer = 'top',
        margins = [0, 0],
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
        margins: margins,
        keymode: keymode,
        visible: false,
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

