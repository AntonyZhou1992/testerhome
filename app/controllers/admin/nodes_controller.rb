module Admin
  class NodesController < Admin::ApplicationController
    def index
      @nodes = Node.sorted.includes(:section)
    end

    def show
      @node = Node.find(params[:id])
    end

    def new
      @node = Node.new
    end

    def edit
      @node = Node.find(params[:id])
    end

    def create
      @node = Node.new(params[:node].permit!)

      if @node.save
        redirect_to(admin_nodes_path, notice: 'Node was successfully created.')
      else
        render action: 'new'
      end
    end

    def update
      @node = Node.find(params[:id])

      if @node.update_attributes(params[:node].permit!)
        redirect_to(admin_nodes_path, notice: 'Node was successfully updated.')
      else
        render action: 'edit'
      end
    end

    def destroy
      @node = Node.find(params[:id])
      @node.destroy

      redirect_to(admin_nodes_url)
    end
  end
end
