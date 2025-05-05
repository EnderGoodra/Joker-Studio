![logo](https://github.com/user-attachments/assets/cea75976-2de2-4d35-b7f0-f33a139c5a5a)

The definitive DIY Balatro mod.

## What is the Joker Studio Mod?
This mod adds 5 new Custom Jokers, all of which lack abilities and graphics. *Why?* Because that's where **you** come in!

## Introducing: Studio Cards
![collection](https://github.com/user-attachments/assets/8122a176-2867-4367-af1d-9eb06b62fcbd)

Studio cards a new consumable type that are your method of creating Custom Jokers.
There's 4 tiers of Studio cards:
- Basic
- Gold
- Platinum
- VIP

Each tier offers more benefits than the tier above:
- Higher base values for effects
- Stronger trigger conditions
- Additional palette colours (Config option, off by default)

## Making Custom Jokers
1. Find and use a Studio card to open the Joker Selector.
2. Select which Custom Joker you want to edit or spawn.
3. Click **Edit** to open up the Texture Editor.
4. Once you are satisfied with your texture, click **Save** to apply the texture and move onto the Ability Selector.
5. Cycle through the **conditions** (when the effect should activate) and the **effects** (what happens when activated) and once you've found a combination you want, click **Save**.
6. The Custom Joker is saved and added to your Joker area.

## Modifying Existing Custom Jokers
You can re-edit Custom Jokers you've already made. Do note, however:
- Changes will apply to all existing copies of that Custom Joker.
- The values on a Custom Joker effect will be based on the tier of the used Studio card, potentially overwriting better values from a previously used higher tier Studio card.

## Purging Custom Jokers
You can purge all Custom Jokers through the mod config menu, reverting them to their initial unmodified state.

# Cross-mod Support

Below are functions that can be added to your mods to create new conditions and effects. Any mods that wish to use the below functions must have a priority greater than **-10**.

**Please note:** All below index values must be numerical, otherwise they are reset upon restarting the game.

## `JokerStudio.addNewCondition(condition, condition_index)`
Sets a new condition at position `condition_index` within the condition list.

Conditions are defined as a table containing 3 values:
- `loc_key (string)` - Localization key for the condition text.
- `min_tier (number)` - The minimum tier of studio card needed for this option to be selectable. Defaults to 1 if not specified.
- `effects (table)` - A table containing all effects relating to this condition. See further below for an example of an effect.

Conditions also have 2 additional unused values:
- `type (string)` - A unique identifier for this condition, currently unused.
- `order (number)` - The order in which this condition appears in the selection menu, currently unused.


## `JokerStudio.addNewEffect(effect, condition_index, effect_index)`
Sets a new effect at position `effect_index` within an existing condition at position `condition_index`.

Effects are defined as a table containing 3 values:
- `loc_key (string)` - Localization key for the effect text.
- `min_tier (number)` - The minimum tier of studio card needed for this option to be selectable. Defaults to 1 if not specified
- `amount (table)` - A table containing 4 values, one per tier of Studio card.
- `func (function)` - A function that contains the calculate logic for each effect.

Effects have 2 additional unused values:
- `type (string)` - A unique identifier for this condition, currently unused.
- `order (number)` - The order in which this condition appears in the selection menu, currently unused.

### Examples

Condition structure
```
{
    loc_key = "key",
    min_tier = 1,
    effects = {}
}
```

Effect structure
```
{
    loc_key = "key",
    min_tier = 1,
    amount = { 1, 2, 3, 4},
    func = function(card, context, effect, amount) end
}
```

Example of complete condition with effect:
```
{
    loc_key = "key",
    min_tier = 1,
    effects = {
        [1] = {
            loc_key = "key",
            min_tier = 1,
            amount = { 1, 2, 3, 4},
            func = function(card, context, effect, amount)
                if context.joker_main then
                    return {
                        message = localize{type='variable',key='a_chips',vars={amount}},
                        chip_mod = amount
                    }
                end
            end
        }
    }
}
```

Example of JokerStudio.addNewCondition usage:
```
if JokerStudio then
    JokerStudio.addNewCondition({
        loc_key = "key",
        order = 3,
        effects = {
            [1] = {
                type = "chips",
                loc_key = "key",
                order = 1,
                amount = { 1, 2, 3, 4},
                func = function(card, context, effect, amount)
                    if context.joker_main then
                        return {
                            message = localize{type='variable',key='a_chips',vars={amount}},
                            chip_mod = amount
                        }
                    end
                end
            }
        }
    }, 10)
}
```
