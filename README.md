# Brotato-Brotils

Set of utilities and helpers for Brotato modding.

## Usage

Extends vanilla's *Utils.gd*, so all methods are used with the `Utils` class, eg `Utils.brotils_method()`. All Brotils methods are prefixed with `brotils_*`.

Mods will need to add Brotils as a dependency in their *manifest.json*:

```json
{
	"dependencies": ["Darkly77-Brotils"],
}
```

## Methods List

### Player

| Name | Summary |
| ---- | ------- |
| [brotils_get_current_character](#brotils_get_current_character)  | Get the current character object |
| [brotils_current_character_is](#brotils_current_character_is)    | Check if the current character matches the provided string |
| [brotils_get_player](#brotils_get_player)                        | Gets the player object |
| [brotils_get_current_weapons](#brotils_get_current_weapons)      | Get the array of currently held weapons |
| [brotils_get_current_items](#brotils_get_current_items)          | Get the array of currently held items |
| [brotils_has_weapon_specific](#brotils_has_weapon_specific)      | Check if the player is holding a certain weapon of *a specific* tier |
| [brotils_has_weapon_any_tier](#brotils_has_weapon_any_tier)      | Check if the player is holding a certain weapon of *any* tier |
| [brotils_has_item](#brotils_has_item)                            | Check if the player is holding a specific item |

### Stats

| Name | Summary |
| ---- | ------- |
| [brotils_get_primary_stat_keys](#brotils_get_primary_stat_keys)             | Get an array of the primary stat keys |
| [brotils_get_random_primary_stat_key](#brotils_get_random_primary_stat_key) | Get a random primary stat key |
| [brotils_get_primary_stats_by_sign](#brotils_get_primary_stats_by_sign)     | Get primary stat keys - By current sign (pos/neg) |
| [brotils_get_positive_primary_stats](#brotils_get_positive_primary_stats)   | Get primary stat keys - Positive only |
| [brotils_get_negative_primary_stats](#brotils_get_negative_primary_stats)   | Get primary stat keys - Negative only |
| [brotils_get_neutral_primary_stats](#brotils_get_neutral_primary_stats)     | Get primary stat keys - Neutral only |

### Numbers

| Name | Summary |
| ---- | ------- |
| [brotils_rng_chance_int](#brotils_rng_chance_int)             | RNG roll for ints |
| [brotils_rng_chance_float](#brotils_rng_chance_float)         | RNG roll for floats |
| [brotils_int_percent_decrease](#brotils_int_percent_decrease) | Decrease an int by a percent float |
| [brotils_int_percent_increase](#brotils_int_percent_increase) | Increase an int by a percent float |
| [brotils_cap_between](#brotils_cap_between)                   | Cap a number between two values |
| [brotils_cap_below](#brotils_cap_below)                       | Cap a number below a value |
| [brotils_cap_above](#brotils_cap_above)                       | Cap a number above a value |

### Text

| Name | Summary |
| ---- | ------- |
| [brotils_text_color](#brotils_text_color) | Wrap a string in a BBCode color |


## Player

### brotils_get_current_character

	brotils_get_current_character():

Get the current character object. Wrapper for `RunData.current_character`.

### brotils_current_character_is

	brotils_current_character_is(character_id:String)->bool:

Check if the current character matches the provided string. Uses a character's `my_id` property.

```gdscript
var char_is_brawler = Utils.brotils_current_character_is("character_brawler")
```

### brotils_get_player

	brotils_get_player():

Gets the player object. Wrapper for `TempStats.player`.

### brotils_get_current_weapons

	brotils_get_current_weapons()->Array:

Get the array of currently held weapons.

### brotils_get_current_items

	brotils_get_current_items()->Array:

Get the array of currently held items

### brotils_has_weapon_specific

	brotils_has_weapon_specific(my_id:String)->bool:

Check if the player is holding a certain weapon of *a specific* tier (ie. if they're holding the exact weapon specified). This func accepts the weapon's own `my_id`, which is unique to each weapon in each tier.

### brotils_has_weapon_any_tier

	brotils_has_weapon_any_tier(weapon_id:String)->bool:

Check if the player is holding a certain weapon of *any* tier. This func accepts a weapon's `weapon_id`, which is shared across all of its tiers.

### brotils_has_item

	brotils_has_item(my_id)->bool:

Check if the player is holding a specific item. Accepts the item's `my_id`.

```gdscript
# Example
var player_has_acid = Utils.brotils_has_item("item_acid")
```

## Stats

### brotils_get_primary_stat_keys

	brotils_get_primary_stat_keys()->Array:

Get an array of the primary stats (`stat_max_hp`, `stat_armor`, etc)`. Unlike vanilla's *temp_stats.gd*, this doesn't include explosion-related stats.

### brotils_get_random_primary_stat_key

	brotils_get_random_primary_stat_key()->bool:

Get a random primary stat key (eg. `stat_max_hp`).

### brotils_get_primary_stats_by_sign

	brotils_get_primary_stats_by_sign(target_stat_sign:int)->Array:

Returns an array of primary stats that match the provided sign.

| Sign | Arg |
| ---- | --- |
| Positive | `1` |
| Negative | `-1` |
| Zero | `0` |

```gdscript
# Example:
var negative_stats = Utils.brotils_get_primary_stats_by_sign(-1)
```

### brotils_get_positive_primary_stats

	brotils_get_positive_primary_stats()->Array:

Returns an array of primary stats that are currently **positive** in the current run.

### brotils_get_negative_primary_stats

	brotils_get_negative_primary_stats()->Array:

Returns an array of primary stats that are currently **negative** in the current run.

### brotils_get_neutral_primary_stats

	brotils_get_neutral_primary_stats()->Array:

Returns an array of primary stats that are currently **neutral** in the current run.


## Numbers

### brotils_rng_chance_int

	brotils_rng_chance_int(chance_int:int, max_chance:float = 1.0)->bool:

RNG roll for ints

### brotils_rng_chance_float

	brotils_rng_chance_float(chance_float:float, max_chance:float = 1.0)->bool:

RNG roll for floats

### brotils_int_percent_decrease

	brotils_int_percent_decrease(orig_val, multiply_with):

Decrease an int by a percent float

### brotils_int_percent_increase

	brotils_int_percent_increase(orig_val, multiply_with):

Increase an int by a percent float

### brotils_cap_between

	brotils_cap_between(val, lowest, highest):

Cap a number between two values. Wrapper for `min(highest, max(lowest, val))`.

### brotils_cap_below

	brotils_cap_below(val, highest):

Cap a number below a value. Wrapper for `min(highest, val)`.

### brotils_cap_above

	brotils_cap_above(val, lowest):

Cap a number above a value. Wrapper for `max(lowest, val)`.


## Text

### brotils_text_color

	brotils_text_color(text:String, clr:String)->String:

Wraps the supplied string in [color BBCode](https://docs.godotengine.org/en/stable/tutorials/ui/bbcode_in_richtextlabel.html)

```gdscript
# Example:
var my_color_str = Utils.brotils_text_color("hello_world", "positive")

# Result:
var my_color_str = "[color=#00ff0]hello_world[/color]"
```

**Supported Colors:**

| Name        | Hex       | Notes |
| ----------- | --------- | ----- |
| `white`     | `white`   | White |
| `green`     | `#00ff00` | Bright green |
| `positive`  | `#00ff00` | Alias for green |
| `red`       | `red`     | Bright red |
| `negative`  | `red`     | Alias for red |
| `gray`      | `#555555` | Gray |
| `grey`      | `#555555` | Alias for gray |
| `materials` | `#76FF76` | Bright pastel green |
| `secondary` | `#EAE2B0` | Yellow/cream |
| `tier1`     | `#C8C8C8` | Tier 1 - Wiki grey (vanilla uses white) |
| `tier2`     | `#4A9BD1` | Tier 2 - Blue |
| `tier3`     | `#AD5AFF` | Tier 3 - Purple |
| `tier4`     | `#FF3B3B` | Tier 4 - Red |