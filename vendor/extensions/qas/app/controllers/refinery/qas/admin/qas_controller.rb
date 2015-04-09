module Refinery
  module Qas
    module Admin
      class QasController < ::Refinery::AdminController

        crudify :'refinery/qas/qa',
                :title_attribute => 'question',
                :paginate => false,
                :xhr_paging => false

      protected

        def find_all_qas(args = params)
          @qas = if ( params[:filter].nil? || params[:filter] == "all" )
            Qa.where("page_id is NOT NULL").page(params[:page])
          else
            @faq = Refinery::Page.find(params[:filter])
            @faq.question_answers.page(params[:page])
          end
        end

        def paginate_all_qas
          @qas = find_all_qas.per_page(Refinery::Qas::Qa.count)
        end

      end
    end
  end
end
