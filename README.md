# qadr_scratchcard

Inspired by the [flux_scratchcard](https://github.com/xFluXioN/flux_scratchcard) repo.
 
# Description
After scraping the card, you can close it with ESC.

Add this item to your inventory config
```lua
    ["scratchcard"] = {
        label = "scratchcard",
        description = "scratchcard",
        weight = 0.1,
        canBeDropped = true,
        canBeUsed = true,
        requireLvl = 0,
        limit = 20,
        imgsrc = "items/scratchcard.png",
        type = "item_standard",
    }
```

You can change prize and chance in the config file.
```lua
    qadr_scratchcard = {
        prizes = {
            min = 0,
            max = 10000,
        },
        chance = 30, -- %30 chance to get a prize
    }
```


# Installation
Download the repo and put it in your `resource` folder. Folder name must be `qadr_scratchcard`.