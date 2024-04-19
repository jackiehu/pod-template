module Pod

  class ConfigureSwiftUI
    attr_reader :configurator

    def self.perform(options)
      new(options).perform
    end

    def initialize(options)
      @configurator = options.fetch(:configurator)
    end

    def perform

      Pod::ProjectManipulator.new({
        :configurator => @configurator,
        :xcodeproj_path => "templates/swiftui/Example/Example.xcodeproj",
        :platform => :ios,
        :prefix => ""
      }).run

      # There has to be a single file in the Classes dir
      # or a framework won't be created
      
#     `touch Sources/PROJECT/ReplaceMe.swift`

      `mv ./templates/swiftui/* ./`

    end
  end

end
