# Rails Icons

> [!NOTE]
> This README is for the main branch. For the latest stable version, see the [release branch README](https://github.com/Rails-Designer/rails_icons/blob/18deb5326d621d5766595222af6ad77bb3361713/README.md)

Add any icon library to a Rails app. Rails Icons has first-party support for a [handful of libraries](#first-party-libraries). It is library agnostic so it can be used with any icon library using the same interface.

```erb
# Using the default icon library
<%= icon "check", class: "text-gray-500" %>

# Using any custom library
<%= icon "apple", library: "simple_icons", class: "text-black" %>
```

The icons are pulled from their respective GitHub repositories, keeping Rails icons' core lightweight.


**Sponsored By [Rails Designer](https://railsdesigner.com/)**

<a href="https://railsdesigner.com/" target="_blank">
  <img src="https://raw.githubusercontent.com/Rails-Designer/rails_icons/main/docs/rails_designer_icon.jpg" alt="Rails Designer logo"  width="240" />
</a>


## Install

Add the rails_icons gem:
```bash
bundle add rails_icons
```

Install, choosing one of the supported libraries
```bash
rails generate rails_icons:install --libraries=LIBRARY_NAME
```

**Example**:
```bash
rails generate rails_icons:install --libraries=heroicons
```

Or multiple at once:
```bash
rails generate rails_icons:install --libraries=heroicons,lucide
```


## Sync icons

If a library gets updated, sync the icons to your app by running:

```bash
rails generate rails_icons:sync --libraries=LIBRARY_NAME
```

**Example**:
```bash
rails generate rails_icons:sync --libraries=heroicons
```

Or multiple at once:
```bash
rails generate rails_icons:sync --libraries=heroicons,lucide
```


## Usage

```ruby
# Uses the default library and variant defined in config/initializer/rails_icons.rb
icon "check"

# Use another variant
icon "check", variant: "solid"

# Set library explictly
icon "check", library: "heroicons"

# Add CSS
icon "check", class: "text-green-500"

# Add data attributes
icon "check", data: { controller: "swap" }

# Set the stroke-width
icon "check", stroke_width: 2
```


## First-party libraries

- [Feather](https://github.com/feathericons/feather)
- [Heroicons](https://github.com/tailwindlabs/heroicons)
- [Lucide](https://github.com/lucide-icons/lucide)
- [Tabler](https://github.com/tabler/tabler-icons)


## Animated icons

Rails Icons also includes a few animated icons. Great for loading states and so on. These are currently included:

- `faded-spinner`
- `trailing-spinner`
- `fading-dots`
- `bouncing-dots`

Use like this: `icon "faded-spinner", library: "animated"`. The same attributes as other libraries are available.


## Custom icon library

Need to use an icon from another library?

1. add the (SVG) icon to **app/assets/svg/icons/LIBRARY_NAME/DEFAULT_VARIANT**;
2. run `rails generate rails_icons:initializer --library=custom`;
3. update the initializer with the library name and, optionally, default variant.

Every custom icon can now be used with the same interface as first-party icon libraries.

```ruby
icon "apple", library: "simple_icons", class: "text-black"
```


## Contributing

This project uses [Standard](https://github.com/testdouble/standard) for formatting Ruby code. Please make sure to run `be standardrb` before submitting pull requests. Run tests via `rails test`.


## License

Rails Icons is released under the [MIT License](https://opensource.org/licenses/MIT).
