import CreatePagePlugin from '@magnolia/cli-create-page-plugin';
import CreateComponentPlugin from '@magnolia/cli-create-component-plugin';
import CreateVirtualUriPlugin from '@magnolia/cli-create-virtual-uri-plugin';
import CreateContentTypePlugin from '@magnolia/cli-create-content-type-plugin';
import CreateAppPlugin from '@magnolia/cli-create-app-plugin';
import CreateLightModulePlugin from '@magnolia/cli-create-light-module-plugin';
import StartPlugin from '@magnolia/cli-start-plugin';
export default {
	analytics: {
		enabled: false,
	},
	plugins: [
		new CreatePagePlugin(),
		new CreateComponentPlugin(),
		new CreateVirtualUriPlugin(),
		new CreateContentTypePlugin({
			lightModule: 'b-fy',
		}),
		new CreateAppPlugin({
			lightModule: 'b-fy',
		}),
		new CreateLightModulePlugin(),
		new StartPlugin({
			tomcatPath: './apache-tomcat',
		}),
	],
	lightModulesPath: './light-modules',
};
