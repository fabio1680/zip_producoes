class ClientesController < ApplicationController
  before_action :set_cliente, only: %i[ show edit update destroy ]

  # GET /clientes or /clientes.json
  def index
    @clientes = Cliente.all
  end

  # GET /clientes/1 or /clientes/1.json
  def show
  end

  # GET /clientes/new
  def new
    @cliente = Cliente.new
  end

  # GET /clientes/1/edit
  def edit
  end

  # POST /clientes
def create
  @cliente = Cliente.new(cliente_params)

  respond_to do |format|
    if @cliente.save

      # Enviar WhatsApp automaticamente
      WhatsappService.enviar(numero, mensagem)

      format.html do
        redirect_to @cliente,
        notice: "Cliente cadastrado com sucesso! Mensagem enviada."
      end

      format.json do
        render :show, status: :created, location: @cliente
      end

    else
      format.html { render :new, status: :unprocessable_content }
      format.json { render json: @cliente.errors, status: :unprocessable_content }
    end
  end
end

  # PATCH/PUT /clientes/1 or /clientes/1.json
  def update
    respond_to do |format|
      if @cliente.update(cliente_params)
        format.html { redirect_to @cliente, notice: "Cliente was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @cliente }
      else
        format.html { render :edit, status: :unprocessable_content }
        format.json { render json: @cliente.errors, status: :unprocessable_content }
      end
    end
  end

  # DELETE /clientes/1 or /clientes/1.json
  def destroy
    @cliente.destroy!

    respond_to do |format|
      format.html { redirect_to clientes_path, notice: "Cliente was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  def cadastro_rapido
  @cliente = Cliente.new
end

def salvar_rapido
  @cliente = Cliente.new(
    nome: params[:cliente][:nome],
    whatsapp: params[:cliente][:whatsapp]
  )

  if @cliente.save
  WhatsappService.enviar(
    @cliente.whatsapp,
    "Olá #{@cliente.nome}! Seja bem-vindo à ZIP Produções. Seu cadastro foi realizado com sucesso."
  )

  redirect_to @cliente, notice: "Cliente cadastrado com sucesso!"
else
  render :new, status: :unprocessable_entity
    end
end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cliente
      @cliente = Cliente.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def cliente_params
      params.expect(cliente: [ :nome, :cpf, :telefone, :whatsapp, :email, :endereco, :cidade, :estado, :cep, :observacoes ])
    end
end

