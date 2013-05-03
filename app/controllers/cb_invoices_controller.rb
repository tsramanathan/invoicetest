class CbInvoicesController < ApplicationController
  # GET /cb_invoices
  # GET /cb_invoices.json
  def index
    @cb_invoices = CbInvoice.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cb_invoices }
    end
  end

  # GET /cb_invoices/1
  # GET /cb_invoices/1.json
  def show
    @cb_invoice = CbInvoice.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @cb_invoice }
    end
  end

  # GET /cb_invoices/new
  # GET /cb_invoices/new.json
  def new
    @cb_invoice = CbInvoice.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @cb_invoice }
    end
  end

  # GET /cb_invoices/1/edit
  def edit
    @cb_invoice = CbInvoice.find(params[:id])
  end

  # POST /cb_invoices
  # POST /cb_invoices.json
  def create
    @cb_invoice = CbInvoice.new(params[:cb_invoice])

    respond_to do |format|
      if @cb_invoice.save
        format.html { redirect_to @cb_invoice, notice: 'Cb invoice was successfully created.' }
        format.json { render json: @cb_invoice, status: :created, location: @cb_invoice }
      else
        format.html { render action: "new" }
        format.json { render json: @cb_invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /cb_invoices/1
  # PUT /cb_invoices/1.json
  def update
    @cb_invoice = CbInvoice.find(params[:id])

    respond_to do |format|
      if @cb_invoice.update_attributes(params[:cb_invoice])
        format.html { redirect_to @cb_invoice, notice: 'Cb invoice was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @cb_invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cb_invoices/1
  # DELETE /cb_invoices/1.json
  def destroy
    @cb_invoice = CbInvoice.find(params[:id])
    @cb_invoice.destroy

    respond_to do |format|
      format.html { redirect_to cb_invoices_url }
      format.json { head :no_content }
    end
  end
end
