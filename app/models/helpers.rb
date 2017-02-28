class Helpers

def self.check_if_exists(params, figure)
  if !params[:landmark][:name].empty?
    if Landmark.find_by(name: params[:landmark][:name])
      figure.landmarks << Landmark.find_by(name: params[:landmark][:name])
    else figure.landmarks << Landmark.create(params[:landmark])
    end
    figure.save
  end
  if !params[:title][:name].empty?
    if Title.find_by(name: params[:title][:name])
      figure.titles << Title.find_by(name: params[:title][:name])
    else figure.titles << Title.create(params[:title])
    end
    figure.save
  end
end

end
