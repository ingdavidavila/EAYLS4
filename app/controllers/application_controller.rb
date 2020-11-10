class ApplicationController < ActionController::Base

    helper_method :usuario_ensesion, :sesion_iniciada?

      def usuario_ensesion
        @usuario_ensesion ||= User.find(session[:user_id]) if session[:user_id]
      end

      def sesion_iniciada?
        !!usuario_ensesion
      end

      def requerir_usuario
        if !sesion_iniciada?
          flash[:alert] = "Debes De Iniciar Sesion Para Acceder A Esta Accion"
          redirect_to ingresar_path
        end
      end

end
