class ApplicationController < ActionController::API

    def get_current_user
        id = decoded_token['id']
        User.find_by(id: id)
    end
    
    def decoded_token
        begin 
            JWT.decode(token, secret).first # {id: id_number}
        rescue
            {}
        end
    end
    
    def token
        request.headers['Authorization']
    end
    
    def issue_token(data)
        JWT.encode(data, secret)
    end
    
    def secret
        ENV['MY_SECRET']
    end
end
