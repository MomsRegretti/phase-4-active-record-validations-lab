class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, presence: true, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: ["Fiction","Non-Fiction"]}

    validate :title_is_clickbait

    def title_is_clickbait
        if title && !(self.title.include?("Won't Believe") || self.title.include?("Secret")  || self.title.include?("Top [number]") || self.title.include?("Guess"))
            errors.add(:title, "this is not clickbait!")
        end
    end
    # def title_is_clickbait
    #     self.title.include?("Won't Believe") || self.title.include?("Secret")  || self.title.include?("Top [number]") || self.title.include?("Guess")
    #         errors.add("not clickbait-y")
    #     end
    # end
end
