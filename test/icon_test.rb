require "test_helper"
require "rails_icons/icon"

class IconTest < ActiveSupport::TestCase
  test "it returns an icon SVG" do
    assert_match(/\A<svg[^>]*class="".*<\/svg>\z/m, icon("academic-cap"), "Expected SVG to start with <svg and contain 'class=\"\"'")
  end

  test "it should not include height" do
    refute_match(/height=/i, icon("academic-cap"), "SVG should not contain a 'height' attribute")
  end

  test "it returns a SVG with custom class" do
    assert_match(/class="w-4 h-4"/, icon("academic-cap", class: "w-4 h-4"), "SVG should contain 'class=\"w-h h-4\"'")
  end

  test "it returns a SVG with custom data attributes" do
    assert_match(/data-controller="swap"/, icon("academic-cap", data: {controller: "swap"}), "SVG should contain 'data-attributes'")
  end

  test "it returns a SVG with custom strokeWidth" do
    assert_match(/stroke-width="3"/, icon("academic-cap", stroke_width: 3), "SVG should contain 'stroke-width=\"3\"'")
  end

  test "setting variant, it returns a SVG" do
    assert_nothing_raised do
      icon("academic-cap", variant: "mini")
    end
  end

  test "setting variant as symbol, it returns a SVG" do
    assert_nothing_raised do
      icon("academic-cap", variant: :mini)
    end
  end

  test "using feather library, it returns a SVG" do
    assert_nothing_raised do
      icon("activity", library: "feather")
    end
  end

  test "without variant, using default configuration, it returns a SVG" do
    assert_nothing_raised do
      icon_with_no_variant("academic-cap")
    end
  end

  test "using lucide library, it returns a SVG" do
    assert_nothing_raised do
      icon("graduation-cap", library: "lucide")
    end
  end

  test "using lucide library, without passing variant, it returns a SVG" do
    assert_nothing_raised do
      icon_with_no_variant("graduation-cap", library: "lucide")
    end
  end

  test "using tabler library, it returns a SVG" do
    assert_nothing_raised do
      icon("thumbs-up", library: "tabler")
    end
  end

  test "using tabler library, without passing variant, it returns a SVG" do
    assert_nothing_raised do
      icon_with_no_variant("thumbs-up", library: "tabler")
    end
  end

  test "it raises RailsIcons::NotFound error" do
    assert_raises(RailsIcons::NotFound) do
      icon("non-existing-icon")
    end
  end

  private

  def icon(name, library: "heroicons", variant: "outline", **args)
    RailsIcons::Icon.new(name: name, library:, variant:, args:).svg
  end

  def icon_with_no_variant(name, library: "heroicons", **args)
    RailsIcons::Icon.new(name: name, library:, args:).svg
  end
end
