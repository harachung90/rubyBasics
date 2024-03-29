module LaserBots

  module Console
    class Command
    end
  end

  module World
    class Player
      attr_reader :name

      def initialize(name)
        @name = name
      end
    end

    class Robot
      attr_reader :name

      def initialize(name)
        @name = name
      end

      def target_player(player)
        Player.new(name)
      end
    end
  end
end

player = LaserBots::World::Player.new("Hara")
puts player.name