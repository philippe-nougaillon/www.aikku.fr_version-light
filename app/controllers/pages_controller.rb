# frozen_string_literal: true

class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def home
  end

  def aikku_plann
  end

  def aikku_coopcomm

    if params[:locale]=="fr"
      @features = [
            { icon: "boxes", title: "Gestion des actifs", text: "Suivi de l'inventaire du matériel et des prêts. Localisez facilement votre matériel grâce à notre carte interactive." },
            { icon: "handyman", title: "Interventions", text: "Demande émise par l'adhérent, réalisée par l'agent sur le terrain et validée en un clic." },
            { icon: "users", title: "Agents et Managers", text: "Accès segmentés : données terrain pour les agents, vision stratégique complète pour les managers." },
            { icon: "qrcode", title: "Pointage par QR Code", text: "Gagnez du temps : scannez le code pour ouvrir directement l'intervention sans saisie manuelle." },
            { icon: "euro", title: "Maîtrise budgétaire", text: "Tableau de bord en temps réel pour suivre vos indicateurs clés et vos dépenses." },
            { icon: "gears", title: "Workflow", text: "Automatisation des processus et notifications intelligentes à chaque changement d'état." },
            { icon: "message", title: "Messagerie instantanée", text: "Communication directe entre managers et agents avec modération intégrée." },
            { icon: "bell", title: "Notifications et alertes", text: "Alertes automatiques par e-mail ou WhatsApp pour informer toutes les parties prenantes." },
            { icon: "robot", title: "Prévision d'intervention (IA)", text: "Une intelligence artificielle suggère les interventions à prévoir selon l'historique." }
          ]
    elsif params[:locale]=="en"
        @features = [
          { icon: "boxes", title: " Asset management", text: "Track inventory and equipment loans. Manage all usage of your assets during field operations. Easily locate your equipment using our interactive map." },
          { icon: "handyman", title: " Operations", text: "A service request is submitted by a member to a local team. The agent goes on-site, records the information, and the member validates the intervention. " },
          { icon: "users", title: "Agents and managers", text: " Agents have limited access to data related to their operations. Managers have full access to their organization’s data." },
          { icon: "qrcode", title: "QR code tracking", text: " For recurring operations, create a template intervention and print its QR code. By scanning it, the agent directly opens the intervention without manual input. " },
          { icon: "euro", title: "Budget control", text: " A management dashboard allows members and managers to track key indicators in real time." },
          { icon: "gears", title: "Workflow", text: "  Each operation moves from one state to another through predefined actions. Some actions automatically trigger notifications." },
          { icon: "message", title: "Instant messaging", text: "  A real-time communication space allows managers to directly interact with agents, with built-in moderation features." },
          { icon: "bell", title: "Notifications and alerts", text: "Certain state changes trigger email or WhatsApp notifications to keep all stakeholders informed." },
          { icon: "robot", title: "Intervention forecasting (AI)", text: " Based on previous operations, artificial intelligence suggests upcoming interventions to plan." }
        ]
    end
    
  end

  def aikku_ia
  end

  def presto_facto
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
    unless verify_recaptcha
      flash.now[:alert] = I18n.t("contact.recaptcha_problem")
      return render :contact, status: :unprocessable_entity
    end

    message = {
      email: params[:email],
      nom: params[:nom],
      contenu: params[:contenu],
    }
    ContactMailer.submitted(message).deliver_now
    
    # On ajoute status: :see_other pour aider Turbo
    redirect_to root_path,
    notice: I18n.t("contact.message_sent"),
    status: :see_other
  end

end

