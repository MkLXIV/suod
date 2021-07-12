# Contributing to suod
Here's a few guidelines and recommendations I've set down to make sure the development of `suod` is consistent and smooth-flowing.

## Configuration variables
When submitting pull requests, ensure the value of all configuration variables in `suod.sh` are at their defaults. A table of configuration variables and their function is shown below.

|Variable|Default Value|Function|
---|---|---
|`FIX_PKG_TYPOS`|`0`|Correction of package manager names when `1`|
|`ENABLE_INSULTS`|`1`|Enable insults when scriipt is executed when `1`, shows corrected command when `0`|

## Adding additional insults
When adding additional insults, take into consideration the following:
* Insults without their enclosing quotes or tabulation should fit within 80 characters. 80 characters is a fairly standard terminal width and keeping insults within that limit ensures they won't span multiple lines at that width.
* Don't add anything genuinely offensive. The insults can include curse words and are supposed to make people feel goofy, but please avoid using genuinely offensive language targeted towards specific groups of people. What's considered "genuinely offensive" will be determined on an individual basis.
* Keep them inside the `insults` array and keep the same formatting. The code should be clean and readable.