class Word < ApplicationRecord
    validates_uniqueness_of :term
    validates_presence_of :term
    validates_presence_of :term_definition
    has_many :follow_by_ips, dependent: :destroy

    before_create do
      self.search_count = 0
    end

    def create_search_count(ip)
      already_searched = self.follow_by_ips.where('(created_at BETWEEN ? AND ?) and ip = ?', DateTime.now.beginning_of_day, DateTime.now.end_of_day, ip)
      if already_searched.count == 0
        self.follow_by_ips.create(ip: ip)
        self.increment!(:search_count)
      end
    end
end
