require "rails_icons/icon/attributes"

class RailsIcons::Icon
  def initialize(name:, library:, args:, set: nil)
    @name = name
    @library = library.to_s
    @set = set.to_s
    @args = args
  end

  def svg
    raise RailsIcons::NotFound, error_message unless File.exist?(file_path)

    svg_file = Nokogiri::HTML::DocumentFragment.parse(File.read(file_path)).at_css("svg")

    attach_attributes to: svg_file

    svg_file.to_html.html_safe
  end

  private

  def error_message
    attributes = [
      @library,
      set,
      @name
    ].compact_blank

    "Icon not found: `#{attributes.join(" / ")}`"
  end

  def file_path
    return custom_library.dig("path") if custom_library?

    path_parts = [
      "app",
      "assets",
      "svg",
      "icons",
      @library,
      set,
      "#{@name}.svg"
    ].compact_blank

    Rails.root.join(*path_parts)
  end

  def custom_library?
    custom_library.present?
  end

  def attach_attributes(to:)
    RailsIcons::Icon::Attributes
      .new(default_attributes: default_attributes, args: @args)
      .attach(to: to)
  end

  def default_attributes
    {
      "stroke-width": default_stroke_width,
      class: default_css,
      data: default_data
    }
  end

  def set
    @set.presence
  end

  def default_css
    library_set_attributes.dig(:default, :css)
  end

  def default_data
    library_set_attributes.dig(:default, :data)
  end

  def default_stroke_width
    library_set_attributes.dig(:default, :stroke_width)
  end

  def library_set_attributes
    return custom_library || {} if custom_library?

    RailsIcons.configuration.libraries.dig(@library, set) || {}
  end

  def custom_library
    RailsIcons
      .configuration
      .libraries
      .dig("custom")
      &.with_indifferent_access
      &.dig(*set ? [@library, set] : [@library]) || {}
  end
end
