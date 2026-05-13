# frozen_string_literal: true

class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def home
  end

  def aikku_plann
  end

  def aikku_coopcomm
  end
  
  def aikku_access
  end

  def services
  end

  def qui_sommes_nous
  end

  def mentions_légales
  end

  def contact
  end

  def contact_submit
    message = {
      email: params[:email],
      nom: params[:nom],
      contenu: params[:contenu],
    }
    ContactMailer.submitted(message).deliver_now
    
    # On ajoute status: :see_other pour aider Turbo
    redirect_to root_path, notice: "Votre message a été envoyé avec succès. Nous vous répondrons dans les plus brefs délais.", status: :see_other
  end

end

