module BgChangeHelper
  def bg_image
    current_time = Time.now.to_i
    midnight = Time.now.beginning_of_day.to_i
    noon = Time.now.middle_of_day.to_i

    five_pm = Time.now.change(:hour => 17 ).to_i
    eight_pm = Time.now.change(:hour => 20 ).to_i

    case
     when midnight.upto(noon).include?(current_time)
      image_url('1.JPG')
     when noon.upto(five_pm).include?(current_time)
      image_url('2.JPG')
     when five_pm.upto(eight_pm).include?(current_time)
      image_url('3.JPG')
     when eight_pm.upto(midnight + 1.day).include?(current_time)
      image_url('4.JPG')
    end

  end
end
