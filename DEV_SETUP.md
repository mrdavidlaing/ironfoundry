## Recommended development setup:

### Prerequisits:

#### Dev machine
1.  Visual Studio 2010 SP1 Ultimate
1.  WiX 3.7 - http://wix.codeplex.com/releases/view/99514
1.  Ruby 1.9.3 - http://rubyinstaller.org/downloads/
1.  Ruby DevKit - http://rubyinstaller.org/downloads/ (installation instructions at https://github.com/oneclick/rubyinstaller/wiki/Development-Kit
1.  ?? What is required for the IronFoundry.VisualStudioExtension project?

#### Developing against a Stackato Micro Cloud
1. Stackato Micro Cloud VM v2.6.7 - http://www.activestate.com/stackato/download_vm
1. Login to the Stackato Web control panel to create your administrator account.
1. Make note of:
	1. Stackato host name (without https://)
	1. IP address: 
	1. Administrator password: *****
1. Ensure you can deploy a sample app (eg, https://github.com/Stackato-Apps/node-env) to the Stackato Micro cloud 
as per these instructions - http://docs.stackato.com/quick-start/index.html
1. Register your development .NET DEA
	1. Open a ruby command prompt AS ADMINISTRATOR
	1. cd to {IronFoundry_working_dir}\tools\register-with-microcloud
	1. run ```ruby setup.rb```
	1.  To test, run ```stackato runtimes``` and look for aspnet40


