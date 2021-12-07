
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

const Gtk = imports.gi.Gtk;
const GObject = imports.gi.GObject;
const Gio = imports.gi.Gio;
const GioSSS = Gio.SettingsSchemaSource;
const ExtensionUtils = imports.misc.extensionUtils;
const Gettext = imports.gettext;

const Config = imports.misc.config;

var _ = Gettext.domain('apps-to-panel').gettext;

const SCHEMA = 'org.gnome.shell.extensions.apps-to-panel';

var settings;

function init() {
    initTranslations();
    settings = get_schema(SCHEMA);
}

function initTranslations() {
    let extension = ExtensionUtils.getCurrentExtension();

    let localedir = extension.dir.get_child('locale');
    if (localedir.query_exists(null))
        Gettext.bindtextdomain('apps-to-panel', localedir.get_path());
    else
        Gettext.bindtextdomain('apps-to-panel', Config.LOCALEDIR);
}

function get_schema(schema) {
    let extension = ExtensionUtils.getCurrentExtension();

    // check if this extension was built with "make zip-file", and thus
    // has the schema files in a subfolder
    // otherwise assume that extension has been installed in the
    // same prefix as gnome-shell (and therefore schemas are available
    // in the standard folders)
    let schemaDir = extension.dir.get_child('schemas');
    let schemaSource;
    if (schemaDir.query_exists(null))
        schemaSource = GioSSS.new_from_directory(schemaDir.get_path(), GioSSS.get_default(), false);
    else
        schemaSource = GioSSS.get_default();

    let schemaObj = schemaSource.lookup(schema, true);
    if (!schemaObj)
        throw new Error('Schema ' + schema + ' could not be found for extension ' + extension.metadata.uuid + '. Please check your installation.');

    return new Gio.Settings({ settings_schema: schemaObj });
}

function buildPrefsWidget() {
    initTranslations();
    let frame = new Gtk.Box({ orientation: Gtk.Orientation.VERTICAL, border_width: 10, spacing: 10 });

    frame.add(buildSelector('applications-view', _("Show for Applications"), { 'icon': _("Icon"), 'text': _("Text"), 'both': _("Icon+Text"), 'hide': _("Hide") }));
    frame.add(buildSelector('activities-view', _("Show for Activities"), { 'icon': _("Icon"), 'text': _("Text"), 'both': _("Icon+Text"), 'hide': _("Hide") }));
    frame.add(buildSwitcher('animate-show-apps', _("Show Animate to Apps")));

    frame.show_all();
    return frame;
}

function buildSwitcher(key, labelText) {
    let hbox = new Gtk.Box({ orientation: Gtk.Orientation.HORIZONTAL, spacing: 10 });
    let label = new Gtk.Label({ label: labelText, xalign: 0 });
    let switcher = new Gtk.Switch({ active: settings.get_boolean(key) });
    settings.bind(key, switcher, 'active', 3);
    hbox.pack_start(label, true, true, 0);
    hbox.add(switcher);
    return hbox;
}

function buildSelector(key, labelText, elements) {
    let listStore = new Gtk.ListStore();
    listStore.set_column_types ([GObject.TYPE_STRING, GObject.TYPE_STRING]);
    let schemaKey = settings.settings_schema.get_key(key);
    let values = schemaKey.get_range().get_child_value(1).get_child_value(0).get_strv();
    for (let val of values) {
        let iter = listStore.append();
        let visibleText = val;
        if (visibleText in elements)
            visibleText = elements[visibleText];
        listStore.set (iter, [0, 1], [visibleText, val]);
    }
    let hbox = new Gtk.Box({ orientation: Gtk.Orientation.HORIZONTAL, spacing: 10 });
    let label = new Gtk.Label({ label: labelText, xalign: 0 });
    let combo = new Gtk.ComboBox({model: listStore});
    let rendererText = new Gtk.CellRendererText();
    combo.pack_start (rendererText, false);
    combo.add_attribute (rendererText, 'text', 0);
    combo.set_id_column(1);
    settings.bind(key, combo, 'active-id', 3);
    hbox.pack_start(label, true, true, 0);
    hbox.add(combo);
    return hbox;
}

function get_applications_view() {
    return settings.get_string('applications-view');
}

function get_activities_view() {
    return settings.get_string('activities-view');
}
