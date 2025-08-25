/**
 * External plugins added through the server-side FieldFactory are automatically registered.
 * Other external plugins (e.g. client-only) may still be registered here (and subsequently added via config.extraPlugins).
 *
 * e.g. if your plugin resides in src/main/resources/VAADIN/js:
 * CKEDITOR.plugins.addExternal("abbr", CKEDITOR.vaadinDirUrl + "js/abbr/");
 *
 * Mind the trailing slash in path or CKEDITOR won't be able to calculate the plugin path correctly.
 * See also https://ckeditor.com/docs/ckeditor4/latest/api/CKEDITOR_plugins.html#method-addExternal
 */
var VAADIN_DIR_URL = typeof CKEDITOR.vaadinDirUrl !== 'undefined'? CKEDITOR.vaadinDirUrl : "../../../";

// Loads magnoliaFileBrowser replacing CKEditor file browser. This is added to the custom config below at config.extraPlugins
CKEDITOR.plugins.addExternal('magnoliaFileBrowser', VAADIN_DIR_URL + 'js/filebrowser/');

CKEDITOR.editorConfig = function( config ) {

    // MIRROR info.magnolia.ui.field.RichTextFieldDefinition
	definition = {
		alignment: true,
		images: true,
		lists: true,
		source: true,
		tables: true,

		colors: null,
		fonts: null,
		fontSizes: null
	}

	// MIRROR info.magnolia.ui.field.RichTextFieldDefinition
	removePlugins = [];

	// CONFIGURATION FROM DEFINITION
	if (!definition.alignment) {
		removePlugins.push("justify");
	}
	if (!definition.images) {
		removePlugins.push("image");
	}
	if (!definition.lists) {
		// In CKEditor 4.1.1 enterkey depends on indent which itself depends on list
		removePlugins.push("enterkey");
		removePlugins.push("indent");
		removePlugins.push("list");
	}
	if (!definition.source) {
		removePlugins.push("sourcearea");
	}
	if (!definition.tables) {
		removePlugins.push("table");
		removePlugins.push("tabletools");
	}

	/* B-FY Customization
	/* Allow to specify text color
	******************************/
	/*
	if (definition.colors != null) {
		config.colorButton_colors = definition.colors;
		config.colorButton_enableMore = false;
		removePlugins.push("colordialog");
	} else {
		removePlugins.push("colorbutton");
		removePlugins.push("colordialog");
	}
	*/
	config.colorButton_colors = "fe5000,2b2b2b,8c8c8c,f4f4f4,333333,151515,777777,535353,FAFAFA,D6D6D6,212121,404040,f1f1f1,2e9935";
	config.colorButton_enableMore = true;

	if (definition.fonts != null) {
		config.font_names = definition.fonts;
	} else {
		config.removeButtons = "Font";
	}
	if (definition.fontSizes != null) {
		config.fontSize_sizes = definition.fontSizes;
	} else {
		config.removeButtons = "FontSize";
	}
	if (definition.fonts == null && definition.fontSizes == null) {
		removePlugins.push("font");
		removePlugins.push("fontSize");
	}

	// magnolialink AND REMOVAL OF elementspath FROM DEFAULT RICH TEXT FIELD FACTORY
	removePlugins.push("elementspath");
	removePlugins.push("filebrowser");
	config.removePlugins = removePlugins.join(",");
	config.extraPlugins = "magnolialink,magnoliaexpand,magnoliaFileBrowser";

	config.baseFloatZIndex = 150;
	config.resize_enabled = false;
	config.toolbar = "Magnolia";
	config.toolbar_Magnolia = [
		{ name: "basicstyles",   items: [ "Bold", "Italic", "Underline", "Strike", "Subscript", "Superscript", "SpecialChar" ] },
		{ name: "paragraph",     items: [ "NumberedList", "BulletedList", "JustifyLeft", "JustifyCenter", "JustifyRight", "JustifyBlock", "Image", "Table" ] },
		{ name: "links",         items: [ "Link", "InternalLink", "DamLink", "Unlink" ] },
		{ name: "styles",        items: [ "Format", "Font", "FontSize", "TextColor" ] },
		{ name: "clipboard",     items: [ "Cut", "Copy", "Paste", "PasteText", "PasteFromWord" ] },
		{ name: "undo",          items: [ "Undo", "Redo" ] },
		{ name: "tools",         items: [ "Source" ] },
		{ name: "view",          items: [ "Expand" ] }
	];
};
