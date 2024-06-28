class KittensController < ApplicationController
    def index
        @kittens = Kitten.all

        respond_to do |format|
            format.html
            format.json {render json: @kittens}
        end
    end

    def new
        @kitten = Kitten.new
    end

    def show
        @kitten = Kitten.find(params[:id])
    end

    def create
        @kitten = Kitten.new(kitten_params)

        if @kitten.save
            flash[:success] = "kitten created successfuly"
            # redirect_to kitten_path(@kitten.id)
            redirect_to kittens_path, notice: "object was successfully created."
        else
            flash.now[:error] = "something went wrong. Please try again."
            render :new, status: :unprocessable_entity
        end
    end

    # def create
    #     @kitten = Kitten.new(kitten_params)
      
    #     if @kitten.save
    #       flash[:success] = "Kitten created successfully"
    #       render turbo_stream: turbo_stream.replace(@kitten, partial: "kittens/kitten", locals: { kitten: @kitten })
    #     else
    #       flash.now[:error] = "Something went wrong. Please try again."
    #       render :new, status: :unprocessable_entity
    #     end
    # end

    def edit
        @kitten = Kitten.find(params[:id])
    end

    def update
        @kitten = Kitten.find(params[:id])

        if @kitten.update(kitten_params)
            flash[:success] = "User updated successfully."
            redirect_to @kitten#kitten_path(@kitten.id)
        else
            flash.now[:error] = "Couldn't update kitten."
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @kitten = Kitten.find(params[:id])
        @kitten.destroy

        redirect_to root_path, notice: "kitten deleted successfully."
    end

    private

    def kitten_params
        params.require(:kitten).permit(:name, :age, :cuteness, :softness);
    end
        
end
