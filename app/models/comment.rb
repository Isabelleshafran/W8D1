class Comment < ApplicationRecord
    validates :content, :post_id, :author_id, presence: true

    belongs_to :post,
        foreign_key: :post_id,
        class_name: :Post

    belongs_to :author,
        foreign_key: :author_id,
        class_name: :User
end
