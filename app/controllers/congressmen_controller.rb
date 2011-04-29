class CongressmenController < ApplicationController
  def index
    congressmen = Congressman.all

    current = congressmen.map(&:attributes)

    congressmen.each do |c|
      c.revert_to(c.version - 1)
    end

    prev = congressmen.map(&:attributes)

    @data = current.zip(prev)
  end
end
