class DeliveriesController < ApplicationController


  def index
    the_deliveries = Delivery.all
    @list_of_deliveries = the_deliveries.order({:created_at => :desc})
    @waiting_on_deliveries = @list_of_deliveries.where(:arrived => :false)

    render("deliveries/index")
  end

  def show
    the_id = params.fetch("path_id")

    matching_deliveries = Delivery.where({ :id => the_id })

    @the_delivery = matching_deliveries.at(0)

    render({ :template => "deliveries/show" })
  end

  def create
    @the_delivery = Delivery.new
    @the_delivery.description = params.fetch("query_description")
    @the_delivery.supposed_to_arrive_on = params.fetch("query_supposed_to_arrive_on")
    @the_delivery.details = params.fetch("query_details")
    @the_delivery.arrived = params.fetch("query_arrived", false)

    if @the_delivery.valid?
      @the_delivery.save
      redirect_to("/deliveries", { :notice => "Delivery created successfully." })
    else
      redirect_to("/deliveries", { :alert => @the_delivery.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    @the_delivery = Delivery.where({ :id => the_id }).at(0)

    @the_delivery.description = params.fetch("query_description")
    @the_delivery.supposed_to_arrive_on = params.fetch("query_supposed_to_arrive_on")
    @the_delivery.details = params.fetch("query_details")
    @the_delivery.arrived = true

    if @the_delivery.valid?
      @the_delivery.save
      redirect_to("/deliveries/#{@the_delivery.id}", { :notice => "Marked as Received"} )
    else
      redirect_to("/deliveries/#{@the_delivery.id}", { :alert => @the_delivery.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    @the_delivery = Delivery.where({ :id => the_id }).at(0)

    @the_delivery.destroy

    redirect_to("/deliveries", { :notice => "Delivery deleted successfully."} )
  end



  def create
    @the_delivery = Delivery.new
    @the_delivery.description = params.fetch("query_description")
    @the_delivery.supposed_to_arrive_on = params.fetch("query_supposed_to_arrive_on")
    @the_delivery.details = params.fetch("query_details")
    @the_delivery.arrived = false

    @the_delivery.user_id = current_user.id
    if @the_delivery.valid?
      @the_delivery.save
      redirect_to("/deliveries/#{@the_delivery.id}", { :notice => "Added to list." })
    else
      redirect_to("/deliveries", { :alert => @the_delivery.errors.full_messages.to_sentence })
    end
  end
end
