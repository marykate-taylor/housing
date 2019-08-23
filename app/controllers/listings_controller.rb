class ListingsController < ApplicationController

  def index
    #all listings
    @price = params[:price]
    #is there a filter for price
    if @price.present?
      #filter by price
      @listings = Listing.where(price: @price)
    else
      #all the reviews
      @listings = Listing.all
    end
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

def edit
#find listing to edit
@listing = Listing.find(params[:id])
end

def update
#find listing
@listing = Listing.find(params[:id])
#update with new info
@listing.update(params.require(:listing).permit(:title, :body, :address, :price))
#redirect somewhere new
redirect_to listing_path(@listing)
end

def form_params
  params.require(:listing).permint(:title, :body, :address, :price)
end




end
