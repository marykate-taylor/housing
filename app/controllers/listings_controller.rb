class ListingsController < ApplicationController

  def index
    #all listings
    @listings = Listing.all
  end


  def new
    # form for adding new review
    @listing = Listing.new
  end

  def create
        #take info from form and add to database
      @listing = Listing.new(params.require(:listing).permit(:title, :body, :address, :price))
        #save to database
      @listing.save

        #redirect to homepage
      redirect_to root_path
  end

  def show
    #individual listing page
    @listing = Listing.find(params[:id])
  end


def destroy

#find individual review
@listing = Listing.find(params[:id])
# destroy
@listing.destroy
#redirect to homepage
redirect_to root_path

end



end
