# lib/recipe.rb
class Recipe
  attr_reader :label, :url

  def initialize(label)
    @label = label
    @url = url
    # Commented out because there's no way I'd be able to remember
    # all this live.
    # @purpose = options[:purpose]
    # @is_archived = options[:is_archived]
    # @is_general = options[:is_archived]
    # @members = options[:members]
  end

  # Send a message to this slack recipe
  # Returns the data from the Slack server's response
  def sendmsg(msg)
  end

  # Create a class-level instance variable.
  # Musch more likely to work as expected than a class variable
  # See http://www.railstips.org/blog/archives/2006/11/18/class-and-instance-variables-in-ruby/
  class << self
    attr_reader :recipes
  end

  # Return a memoized set of all recipes
  def self.search(search_term)
    EdamamApiWrapper.listrecipes(search_term)
  end

  # Foreget all memoized values
  def self.reset
  end

  # Return either the first (probably only) recipe matching
  # the given name, or nil.
  def self.by_name(name)
    matches = all.select do |c|
      c.name == name
    end
    return matches.first
  end

  # Return either the first (probably only) recipe matching
  # the given ID, or nil.
  def self.by_id(id)
  end
end
