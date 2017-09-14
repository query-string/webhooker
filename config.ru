require 'roda'
require './travis'

class Webhooker < Roda
  route do |r|
    r.on :contenido do
      r.is [:master, :staging] do |branch|
        Travis.(branch)
      end
    end
  end
end

run Webhooker.freeze.app
