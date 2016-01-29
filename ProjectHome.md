# Blade Anti-Cheat #

## Introduction ##
Blade Anti-Cheat was originally closed source, but now has been released open source by the maker himself - DarK\_St3alth. This is a LUA Based Anti-Cheat system for the Source Engine based game, Garry's Mod. This Anti-Cheat was developed as an **addition** to VAC and Script Enforcer. Valve Anti Cheat does not detect LUA cheats, and Script Enforcer can be bypassed to run these hacks/cheats. Using both these products may not provide enough protection - as I've seen in many cases.

## So What's the Point of This? ##
As stated before, Valve Anti Cheat does not detect LUA cheats/hacks, and Script Enforcer can be bypassed. Many lua cheats use a bypass to work while Script Enforcer is enabled, however their hooks, convars and console commands can be detected. Blade Anti-Cheat is the next step. Instead of having a strict white list, (which can be a pain when you want to add tools and other things to your servers) this code uses a black list and will feature a Script Enforcer check (which isn't included with Garry's mod for unknown reasons) to make sure that it isn't bypassed.

Another thing that is important to note with this code is that it can detect Modified Resources and convars that act like cheats. No other code does this at the time of writing. VAC, Script Enforcer and the game it's self do not check whether someone has loaded materials for models to make them show though walls (RP servers).

## Any Problems That Could Come From Using Blade? ##
Yes, one major one is that your server may become targeted since it's the "untested" anti-cheat out there. When v2 comes out, it will be stable enough to block cheaters before they use their cheats and hacks.