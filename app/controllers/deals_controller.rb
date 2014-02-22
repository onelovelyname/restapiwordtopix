  # Make these helpers available to the view too
  helper_method :deal, :deals

  respond_to :html, :json, :xml
    
  def index
    respond_with deals
  end

  def show
    respond_with deal
  end

  def create
    deal.save
    respond_with deal
  end

  def update
    deal.update_attributes(params[:deal])
    respond_with deal
  end

  def destroy
    deal.destroy
    respond_with deal
  end
  
  private

  
  def deal
    # If the action is new or create...
    if @deal = params[:action] =~ /new|create/
      Deal.new(params[:deal])
    else
      Deal.find(params[:id])
    end
  end

  def deals
    @deals = Deal.all
  end
