# The Api:V1:PrayersController provides a backend API for manipulating prayer requests.
# 
# @since 0.1.0
# @author Robert Klubenspies
class Api::V1::PrayersController < Api::V1::BaseController
  # Retrieves a feed of 10 prayer requests at a time
  # 
  # @since 0.1.0
  # @author Robert Klubenspies
  def index
    # Determine when the oldest prayer's timestamp from params[:last] OR use the current time + 1 second
    last = params[:last].blank? ? Time.now.utc + 1.second : Time.parse(params[:last])
    
    # Retrieve 10 prayer requests based on the timestamp
    @prayers = Prayer.feed(last)
    
    # Respond to multiple request types
    respond_to do |format|
      format.json { render :json => @prayers }  # Render JSON response
      format.xml  { render :xml => @prayers }   # Render XML response
    end
  end
  
  # Retrieves a single prayer request
  # 
  # @since 0.1.0
  # @author Robert Klubenspies
  def show
    # Retrieve prayer request by params[:id]
    @prayer = Prayer.find(params[:id])
    
    # Respond to multiple request types
    respond_to do |format|
      format.json { render :json => @prayer }   # Render JSON response
      format.xml  { render :xml => @prayer }    # Render XML response
    end
  end
  
  # Creates a prayer request
  # 
  # @todo Make the create action actually persist data
  # @since 0.1.0
  # @author Robert Klubenspies
  def create
  end
end