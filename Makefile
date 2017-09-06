# Copyright (c) Rotorz Limited. All rights reserved.
# Licensed under the MIT license. See LICENSE file in the project root.


default: ;


update-bundled-ngettext:

	# Clone latest version of NGettext from git repository.
	git clone https://github.com/neris/NGettext.git temp/NGettext

	# Remove current bundled copy of NGettext.
	rm -rf assets/Source/ThirdParty/NGettext

	# Move the required files for the bundled copy of NGettext.
	mv temp/NGettext/src/NGettext assets/Source/ThirdParty/NGettext
	mv temp/NGettext/LICENSE assets/Source/ThirdParty/NGettext
	rm -rf temp

	# Remove unwanted Visual Studio project files.
	rm -rf assets/Source/ThirdParty/NGettext/Properties
	rm assets/Source/ThirdParty/NGettext/NGettext.csproj

	# Change the namespace of the bundled copy of NGettext so that it does not clash with
	# if a project already uses the NGettext library.
	find assets/Source/ThirdParty -type f -name '*.cs' | xargs sed -i \
		's/using NGettext./using Rotorz\.Games\.Localization\.Internal\.NGettext./g; s/namespace NGettext/namespace Rotorz\.Games.Localization\.Internal\.NGettext/g'

	# AOT targets do not support `RegexOptions.Compiled`; simply remove.
	find assets/Source/ThirdParty -type f -name '*.cs' | xargs sed -i \
		's/ [|] RegexOptions\.Compiled//g'
