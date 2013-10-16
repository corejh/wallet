class TransactionsController < ApplicationController
  before_action :set_transaction, only: [:show, :edit, :update, :destroy]
  before_action :new_transaction, only: [:new, :deposit, :withdraw, :transfer]
  # GET /transactions
  # GET /transactions.json
  def index
    @transactions = Transaction.all
  end

  # GET /transactions/1
  # GET /transactions/1.json
  def show
  end

  # GET /transactions/new
  def new
    @transaction = Transaction.new
  end

  # GET /transactions/1/edit
  def edit
  end

  # POST /transactions
  # POST /transactions.json
  def create
    @transaction = Transaction.new(transaction_params)

    respond_to do |format|
      
      response = ""
      if @transaction.transaction_type == 1
        response = 1
      elsif @transaction.transaction_type == 2
        response = 2
      elsif @transaction.transaction_type == 3 and @transaction.source_account_id == current_user.id
        response = 3
      else
        response = 4
      end
      
      if @transaction.save
        format.json { render action: 'show', status: :created, location: @transaction }
        if response == 1
          format.html { redirect_to account_path(@transaction.source_account_id), notice: 'Withdrawl completed.' }
        elsif response == 2
          format.html { redirect_to account_path(@transaction.destination_account_id), notice: 'Deposit completed.' }
        elsif response == 3
          format.html { redirect_to account_path(@transaction.source_account_id), notice: 'Transfer complete.' }
        else
          format.html { redirect_to account_path(@transaction.destination_account_id), notice: 'Transfer completed.' }
        end
      else
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
        if response == 1
          format.html { render action: 'withdraw' }
        elsif response == 2
          format.html { render action: 'deposit' }
        else
          format.html { render action: 'transfer' }
        end
      end
    end
  end

  # PATCH/PUT /transactions/1
  # PATCH/PUT /transactions/1.json
  def update
    respond_to do |format|
      if @transaction.update(transaction_params)
        format.html { redirect_to @transaction, notice: 'Transaction was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transactions/1
  # DELETE /transactions/1.json
  def destroy
    @transaction.destroy
    respond_to do |format|
      format.html { redirect_to transactions_url }
      format.json { head :no_content }
    end
  end

  def withdraw
  end
  
  def deposit    
  end
  
  def transfer
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transaction
      @transaction = Transaction.find(params[:id])
    end
    
    def new_transaction
      @transaction = Transaction.new
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def transaction_params
      params[:transaction].permit(:user_id, :source_account_id, :destination_account_id, :transaction_type, :destination_balance, :source_balance, :amount)
    end
end
