class CostsController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @costs = Cost.all.order(date: "DESC")
    @events = Event.all
  end

  def new
    @cost = Cost.new
  end

  def create
    @cost = Cost.new(cost_params)
    if @cost.save
      redirect_to root_path
    else
      render "new"
    end
  end

  def show
    @cost = Cost.find(params[:id])
    @data = [['食材原価', @cost.food_cost], ['光熱費', @cost.utility_cost], ['人件費', @cost.labor_cost], ['家賃', @cost.rent], ['消耗品費', @cost.supply], ['その他', @cost.other]]
    @data_all = [['食材原価', @cost.food_cost], ['光熱費', @cost.utility_cost], ['人件費', @cost.labor_cost], ['家賃', @cost.rent], ['消耗品費', @cost.supply], ['その他', @cost.other], ['当月棚卸金額', @cost.inventory]]
    @genkaritu = sprintf("%.2f",(@cost.last_inventory + @cost.food_cost - @cost.inventory) * 100 / @cost.sale.to_f)
    @arari = (@cost.sale - @cost.food_cost) / 1000
    @eigyourieki = (@cost.sale - (@cost.food_cost + @cost.utility_cost + @cost.labor_cost + @cost.rent + @cost.supply + @cost.other)) / 1000
  end

  def cost_params
    params.require(:cost).permit(:sale, :food_cost, :utility_cost, :labor_cost, :rent, :supply, :other, :inventory, :last_inventory, :date).merge(user_id: current_user.id)
  end

end
