class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def create
     @recipe = Recipe.new(params[:recipe])
     
     @twilio_client.account.sms.messages.create(
             :from => '+14158675309',
             :to => '+14158675309',
             :body => "#{@recipe.title} was added successfully."
           )
    
      if @recipe.save
        redirect_to "/recipes/index"
      else
        render :new
      
      end
  end

   def update
      @recipe = Recipe.find(params[:id])

      if @recipe.update_attributes(params[:recipe])
        redirect_to "/recipes/index"
      else
        render :edit
        # In Sinatra, it would be `erb :edit`.
      end
    end

    def destroy
      @recipe = Recipe.find(params[:id])
      @recipe.destroy
      redirect_to "/recipes/index"
    end
end
