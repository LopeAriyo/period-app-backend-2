class UsersController < ApplicationController
    def signin
        user = User.find_by(email: params[:email])

        if user && user.authenticate(params[:password])
            render json: { user:  user, token: issue_token({ id: user.id }) }
        else
            render json: {error: "E-mail Address or Password Invalid"}, status: 403
        end
    end

    def validate
        user = get_current_user
        if user
            render json: { user:  user, token: issue_token({ id: user.id }) }
        else
            render json: { error: 'You are not authorized.' }, status: 401
        end
    end
    
    # def cycle
    #     user = get_current_user 
    #     if user
    #         render json: user.first_name
    #     else
    #         render json: { error: 'You are not authorized.' }, status: 401
    #     end
    # end

end
