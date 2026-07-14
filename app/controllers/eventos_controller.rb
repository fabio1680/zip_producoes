class EventosController < ApplicationController
  before_action :set_evento, only: %i[show edit update destroy contrato]

  # GET /eventos
  def index
    @eventos = Evento.all
  end

  # GET /eventos/1
  def show
  end

  # GET /eventos/new
  def new
    @evento = Evento.new
  end

  # GET /eventos/1/edit
  def edit
  end

  # POST /eventos
  def create
    @evento = Evento.new(evento_params)

    respond_to do |format|
      if @evento.save
        format.html { redirect_to @evento, notice: "Evento criado com sucesso." }
        format.json { render :show, status: :created, location: @evento }
      else
        format.html { render :new, status: :unprocessable_content }
        format.json { render json: @evento.errors, status: :unprocessable_content }
      end
    end
  end

  # PATCH/PUT /eventos/1
  def update
    respond_to do |format|
      if @evento.update(evento_params)
        format.html { redirect_to @evento, notice: "Evento atualizado com sucesso.", status: :see_other }
        format.json { render :show, status: :ok, location: @evento }
      else
        format.html { render :edit, status: :unprocessable_content }
        format.json { render json: @evento.errors, status: :unprocessable_content }
      end
    end
  end

  # DELETE /eventos/1
  def destroy
    @evento.destroy!

    respond_to do |format|
      format.html { redirect_to eventos_path, notice: "Evento excluído com sucesso.", status: :see_other }
      format.json { head :no_content }
    end
  end

  # GET /eventos/:id/contrato
  def contrato
  end

  private

  # Busca o evento
  def set_evento
    @evento = Evento.find(params[:id])
  end

  # Parâmetros permitidos

def evento_params
  params.require(:evento).permit(
    :cliente_id,
    :tipo,
    :data,
    :hora,
    :local,
    :valor,
    :entrada,
    :recebido,
    :restante,
    :status_pagamento,
    :situacao,
    :equipe,
    :observacoes
  )
  end
end 