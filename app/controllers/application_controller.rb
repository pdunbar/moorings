class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  def us_states
    [
      ['AL', 'AL'],
      ['AK', 'AK'],
      ['AZ', 'AZ'],
      ['AR', 'AR'],
      ['CA', 'CA'],
      ['CO', 'CO'],
      ['CT', 'CT'],
      ['DE', 'DE'],
      ['DC', 'DC'],
      ['FL', 'FL'],
      ['GA', 'GA'],
      ['HI', 'HI'],
      ['ID', 'ID'],
      ['IL', 'IL'],
      ['IN', 'IN'],
      ['IA', 'IA'],
      ['KS', 'KS'],
      ['KY', 'KY'],
      ['LA', 'LA'],
      ['ME', 'ME'],
      ['MD', 'MD'],
      ['MA', 'MA'],
      ['MI', 'MI'],
      ['MN', 'MN'],
      ['MS', 'MS'],
      ['MO', 'MO'],
      ['MT', 'MT'],
      ['NE', 'NE'],
      ['NV', 'NV'],
      ['NH', 'NH'],
      ['NJ', 'NJ'],
      ['NM', 'NM'],
      ['NY', 'NY'],
      ['NC', 'NC'],
      ['ND', 'ND'],
      ['OH', 'OH'],
      ['OK', 'OK'],
      ['OR', 'OR'],
      ['PA', 'PA'],
      ['PR', 'PR'],
      ['RI', 'RI'],
      ['SC', 'SC'],
      ['SD', 'SD'],
      ['TN', 'TN'],
      ['TX', 'TX'],
      ['UT', 'UT'],
      ['VT', 'VT'],
      ['VA', 'VA'],
      ['WA', 'WA'],
      ['WV', 'WV'],
      ['WI', 'WI'],
      ['WY', 'WY']
    ]
  end

  helper_method :us_states
  protect_from_forgery with: :exception
end
