module Fidelity
  module PaginationHelper
    def paginate options={}
      Pagination.new(options)
    end
    
    class Pagination

      attr_accessor :options, :range, :page, :size
      attr_reader :items
      def initialize options={}
        @options = options
        @range = (options[:range] || (1..10)).to_a
        @page = options[:page] || 1
        @size = options[:size] || 7
        @next = options[:next] || true
        @offset_lenght = [0, @range.size - @size].max.to_i
        @offset_start = ((@range.size / 2) - (@offset_lenght / 2)).ceil.to_i
        @items = init_items(@offset_start, @offset_lenght)
      end

      def back?
        range.first > 1
      end

      def next?
        @next
      end

      def each
        @items.each do |item|
          yield item
        end
      end

      private

      def init_items start, length
        @range.fill(nil, start, length)
        @range.slice!(start, [0, length-1].max)
        [].tap do |a|
          @range.each do |i|
            a << Item.new(i, @page)
          end
        end
      end

      class Item
        attr_accessor :page, :current
        def initialize page=1, current=1
          @page = page
          @current = current==page
        end

        def show?
          !@page.nil?
        end

        def current?
          @current
        end
      end      

    end
    
  end
end
