class Journey

  attr_reader :current_journey

  def initialize
    @current_journey = {}
  end

  def entrance(station)
    @current_journey[:entry_station] = station
  end

  def finish(exit_station)
    @current_journey[:exit_station] = exit_station
  end

<<<<<<< HEAD
  def fare
    if @current_journey[:exit_station] != nil
=======
  def complete?
    @current_journey[:entry_station] && @current_journey[:exit_station]
  end

  def touch_in_fare
    if complete?
>>>>>>> b410f1b4dcd59f6666134f2eee3a8327a201e3a8
      1
    else
      6
    end
  end
<<<<<<< HEAD
=======

  def touch_out_fare
    if complete?
      6
    else
      1
    end
  end

>>>>>>> b410f1b4dcd59f6666134f2eee3a8327a201e3a8
end
