/*
    Credits:
    * GNOME Shell's volume applet
    * Tudmotu's https://github.com/Tudmotu/gnome-shell-extension-bettervolume
    * vith: https://github.com/Tudmotu/gnome-shell-extension-bettervolume/issues/7#issuecomment-216894518
*/

const Clutter = imports.gi.Clutter;
const Main = imports.ui.main;
const PanelMenu = imports.ui.panelMenu;
const Gvc = imports.gi.Gvc;

let volumeIndicator, _mixerControl, _outputSink;
let _onVolumeIndicatorClickEventId, _mixerControlDefaultSinkChangedId, _mixerControlStateChangedId;

function _onVolumeIndicatorClick(actor, e) {
    if (e.get_button() === Clutter.BUTTON_MIDDLE) {
        if (_outputSink)
            _outputSink.change_is_muted(!_outputSink.is_muted);

        return true;
    }

    return false;
}

function _setSink() {
    _outputSink = _mixerControl.get_default_sink();
}

function _onControlStateChanged() {
    if (_mixerControl.get_state() == Gvc.MixerControlState.READY)
        _setSink();
}

function enable() {
    let aggregateMenu = Main.panel.statusArea.aggregateMenu;

    if (aggregateMenu.hasOwnProperty('_volume') && aggregateMenu._volume instanceof PanelMenu.SystemIndicator) {
        _mixerControl = new Gvc.MixerControl({ name: 'Mute on Middle Click extension' });
        _mixerControlStateChangedId = _mixerControl.connect('state-changed', _onControlStateChanged);
        _mixerControlDefaultSinkChangedId = _mixerControl.connect('default-sink-changed', _setSink);
        _mixerControl.open();

        volumeIndicator = aggregateMenu._volume;
        _onVolumeIndicatorClickEventId = volumeIndicator.indicators.connect('button-press-event', _onVolumeIndicatorClick);
    }
}

function disable() {
    if (_onVolumeIndicatorClickEventId) {
        volumeIndicator.indicators.disconnect(_onVolumeIndicatorClickEventId);
        _onVolumeIndicatorClickEventId = 0;
    }

    if (_mixerControl) {
        if (_mixerControlDefaultSinkChangedId) {
            _mixerControl.disconnect(_mixerControlDefaultSinkChangedId);
            _mixerControlDefaultSinkChangedId = 0;
        }

        if (_mixerControlStateChangedId) {
            _mixerControl.disconnect(_mixerControlStateChangedId);
            _mixerControlStateChangedId = 0;
        }

        _mixerControl.close();
        _mixerControl = null;
    }

    if (_outputSink)
        _outputSink = null;
}

function init() {
}
