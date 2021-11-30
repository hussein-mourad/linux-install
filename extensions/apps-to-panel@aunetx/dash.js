// -*- mode: js; js-indent-level: 4; indent-tabs-mode: nil -*-
/*jshint esnext: true */
/*jshint indent: 4 */
const Lang = imports.lang;
const Main = imports.ui.main;

const Dash = new Lang.Class({
    Name: 'Dash',

    _init: function () {
        this._dash = Main.overview.dash;
    },

    showShowAppsButton: function () {
        this._dash.showAppsButton.visible = true
        this._dash.showAppsButton.set_width(-1)
        this._dash.showAppsButton.set_height(-1)
    },

    hideShowAppsButton: function () {
        if (this._dash.constructor.name != "DashToDock_MyDash") {
            this._dash.showAppsButton.hide()
            this._dash.showAppsButton.set_width(0)
            this._dash.showAppsButton.set_height(0)
        }
    }
});
