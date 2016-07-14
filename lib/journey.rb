class Journey

  attr_reader :current_journey

  def initialize(entry_station)
    @current_journey = {}
    @current_journey[:entry_station] = entry_station
  end

  def finish(exit_station)
    @current_journey[:exit_station] = exit_station
  end

  def fare
  1
  end  

end
