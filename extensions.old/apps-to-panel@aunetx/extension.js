/* Apps To Panel GNOME Shell extension
 *
 * Copyright (C) 2019 Leandro Vital <leavitals@gmail.com>
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

const Main = imports.ui.main;
const Lang = imports.lang;
const PanelMenu = imports.ui.panelMenu;
const St = imports.gi.St;
const Atk = imports.gi.Atk;
const Clutter = imports.gi.Clutter;
const ExtensionUtils = imports.misc.extensionUtils;
const Me = ExtensionUtils.getCurrentExtension();
const Prefs = Me.imports.prefs;
const Dash = Me.imports.dash;
const IconGrid = imports.ui.iconGrid;
const AppDisplay = imports.ui.appDisplay;
const Meta = imports.gi.Meta;

let activities;


const ApplicationsIconMenu = new Lang.Class({
    Name: 'ApplicationsIconMenu',
    Extends: PanelMenu.Button,

    _init()
    {
        this.parent(1, 'ApplicationsIconMenu', false);

        let hbox = new St.BoxLayout({ style_class: 'panel-applications' });

        let pref_applications_view = Prefs.get_applications_view();

        if (pref_applications_view != 'text')
        {
            this._icon = new St.Icon({
                icon_name: 'view-app-grid-symbolic',
                style_class: 'system-status-icon'
            });
            hbox.add_child(this._icon);
        }

        if (pref_applications_view != 'icon')
        {
            this._label = new St.Label({
                text: _('Applications'),
                y_expand: true,
                y_align: Clutter.ActorAlign.CENTER,
            });
            hbox.add_child(this._label);
        }

        this.add_actor(hbox);

        this.pageChangedId = Main.overview.viewSelector.connect('page-changed', () => {
            if (Main.overview.viewSelector._activePage != Main.overview.viewSelector._workspacesPage) {
                this.add_style_pseudo_class('overview');
            } else {
                this.remove_style_pseudo_class('overview');
            }
        });

        this.hidingId = Main.overview.connect('hiding', Lang.bind(this, function() {
            this.remove_style_pseudo_class('overview');
        }));
        this.buttonPressEventId = this.connect('button-press-event', Lang.bind(this, this._onShowAppsButtonToggled));
    },

    _onShowAppsButtonToggled: function() {

        if (Prefs.settings.get_boolean('animate-show-apps')) {
            this._animeteShow();
        }

        let selector = Main.overview.viewSelector;
        if (!Main.overview.visible) {
            Main.overview.viewSelector.showApps();
            return;
        }

        if (Main.overview.visible && !selector._showAppsButton.checked) {
            Main.overview.viewSelector.showApps();
            return;
        }

        if (Main.overview.visible && selector._showAppsButton.checked) {
            Main.overview.hide();
            return;
        }
    },

    _animeteShow: function() {
        let visibleView;
        Main.overview.viewSelector.appDisplay._views.every(function(v, index) {
            if (v.view.actor.visible) {
                visibleView = index;
                return false;
            } else {
                return true;
            }
        });

        let view = Main.overview.viewSelector.appDisplay._views[visibleView].view;
        let grid = view._grid;
        grid.animateSpring(IconGrid.AnimationDirection.IN, this);
    },
    destroy()
    {
        Main.overview.viewSelector.disconnect(this.pageChangedId);
        Main.overview.disconnect(this.hidingId);
        this.disconnect(this.buttonPressEventId);
        this.parent();
    },
});

const ActivitiesIconMenu = new Lang.Class({
    Name: 'ActivitiesIconMenu',
    Extends: PanelMenu.Button,

    _init(labelText)
    {
        this.parent(1, 'ActivitiesIconMenu', false);

        let hbox = new St.BoxLayout({ style_class: 'panel-activities' });

        let pref_activities_view = Prefs.get_activities_view();

        if (pref_activities_view != 'text')
        {
            this._icon = new St.Icon({
                icon_name: 'focus-windows-symbolic',
                style_class: 'system-status-icon'
            });
            hbox.add_child(this._icon);
        }

        if (pref_activities_view != 'icon')
        {
            this._label = new St.Label({
                text: _('Activities'),
                y_expand: true,
                y_align: Clutter.ActorAlign.CENTER,
            });
            hbox.add_child(this._label);
        }

        this.add_actor(hbox);

        this.pageChangedId = Main.overview.viewSelector.connect('page-changed', () => {
            if (Main.overview.viewSelector._activePage == Main.overview.viewSelector._workspacesPage) {
                this.add_style_pseudo_class('overview');
            } else {
                this.remove_style_pseudo_class('overview');
            }
        });

        this.hidingId = Main.overview.connect('hiding', Lang.bind(this, function() {
            this.remove_style_pseudo_class('overview');
        }));

        this.buttonPressEventId = this.connect('button-press-event', Lang.bind(this, this._onShowActivitiesButtonToggled));
    },

    _onShowActivitiesButtonToggled: function() {

        let selector = Main.overview.viewSelector;

        if (!Main.overview.visible) {
            Main.overview.show();
            return;
        }

        if (Main.overview.visible && selector._showAppsButton.checked) {
            selector._showAppsButton.checked = false;
            Main.overview.show();
            return;
        }

        if (Main.overview.visible) {
            Main.overview.hide();
            return;
        }

    },

    destroy()
    {
        Main.overview.viewSelector.disconnect(this.pageChangedId);
        Main.overview.disconnect(this.hidingId);
        this.disconnect(this.buttonPressEventId);
        this.parent();
    }
});

function _animateIn(page) {

    let oldPage = page;

    if (oldPage) {
        oldPage.hide();
    }

    let vs = Main.overview.viewSelector;

    vs.emit('page-empty');
    vs._activePage.show();
    vs._fadePageIn();
}

function _animateOut(page) {

    let oldPage = page;

    let vs = Main.overview.viewSelector;

    vs._animateIn(oldPage);
    vs._fadePageOut(page);
}

function init()
{
    this.activities = Main.panel.statusArea['activities'];

    this.dash = new Dash.Dash();

    Prefs.init();
    Prefs.settings.connect('changed', _refresh);
}

function enable()
{
    let pref_applications_view = Prefs.get_applications_view();
    let pref_activities_view = Prefs.get_activities_view();

    this.activities.container.hide();
    this.dash.hideShowAppsButton();

    if (pref_applications_view != 'hide') {
        this.showAppsButton = new ApplicationsIconMenu();
        Main.panel.addToStatusArea('applicationsiconmenu', this.showAppsButton, 0, 'left');
    }
    else {
        this.showAppsButton = null;
    }

    if (pref_activities_view != 'hide') {
        this.workspacesButton = new ActivitiesIconMenu();
        Main.panel.addToStatusArea('activitiesiconmenu', this.workspacesButton, 1, 'left');
    }
    else {
        this.workspacesButton = null;
    }

    if (this.showAppsButton != null || this.workspacesButton !=null ) {
        Main.overview.viewSelector._animateIn = _animateIn;
        Main.overview.viewSelector._animateOut = _animateOut;
    }

}


function disable()
{
    if (this.showAppsButton != null) {
        this.showAppsButton.destroy();
    }

    if (this.workspacesButton != null) {
        this.workspacesButton.destroy();
    }

    this.dash.showShowAppsButton();
    this.activities.container.show();
}

var _refresh = function ()
{
    disable();
    enable();
}
