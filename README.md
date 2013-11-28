caraq-help-script
=================

Script used to accelerate the development speed for CaraQ Avafie app.

###`animeScriptToJsonString.pl`
Use to parse the action script to machine readable JSON-format string. __Must run this script first!!__

###`animeFXsListing.pl`
List all the FX textures required by specific action script.

* param: the file generated through the processing of script `animeScriptToJsonString.pl`.


###`animeFXsResourcesCopyHelper.pl`
Help rearrange the TGA files into the same folder which are named by the _serial number_ of TGA files.
for example:

- other_999_A.tga
- other_999_B.tga
- other_999_C.tga
- other_999_D.tga
- other_999_E.tga
- other_999_F.tga
- other_999_G.tga
- other_999_H.tga

will be kept in the same folder.
The default cpoy destination path is `/tmp/10_others/`, you could change it by modify script.




