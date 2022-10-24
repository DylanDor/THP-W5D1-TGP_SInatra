class Com
    attr_accessor :id, :author, :content

    def initialize(id, author, content)
        @id = id
        @author = author
        @content = content
    end

    def save
        CSV.open("./db/comment.csv", "ab") do |csv|
          csv << [@id, @author, @content]
        end
    end

    def self.all
        comment_array = []
        CSV.read("./db/comment.csv").each do |csv_line|
          comment_array << Com.new(csv_line[0], csv_line[1], csv_line[2])
        end
        return comment_array
    end

    def self.select_by_id(id)
        self.all.select {|index| index.id.to_i == id}
    end
end