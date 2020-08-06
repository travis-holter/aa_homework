

# ------------------------- REPLY -----------------------

class Reply
    attr_accessor :id, :users_id, :questions_id, :body, :parent_id

    def self.all
        data = QuestionsDatabase.instance.execute("SELECT * FROM replies")
        data.map { |datum| Reply.new(datum) }
    end

    def self.find_by_id(id)
        replies = QuestionsDatabase.instance.execute(<<-SQL, id)
        SELECT
            *
        FROM
            replies
        WHERE
            id = ?
        SQL
        return nil unless replies.length > 0
        Reply.new(replies.first)
    end


    def self.find_by_users_id(users_id)
        replies = QuestionsDatabase.instance.execute(<<-SQL, users_id)
        SELECT
            *
        FROM
            replies
        WHERE
            users_id = ?
        SQL
        return nil unless replies.length > 0
        Reply.new(replies.first)
    end

    def self.find_by_questions_id(questions_id)
        replies = QuestionsDatabase.instance.execute(<<-SQL, questions_id)
        SELECT
            *
        FROM
            replies
        WHERE
            questions_id = ?
        SQL
        return nil unless replies.length > 0
        replies.map {|reply| Reply.new(reply)}
    end

    def initialize(options)
        @id = options['id']
        @body = options['body']
        @parent_id = options['parent_id']
        @questions_id = options['questions_id']
        @users_id = options['users_id']
        
    end
    
    def insert
        raise "#{self} already exists" if self.id
        QuestionsDatabase.instance.execute(<<-SQL, self.body, self.parent_id, self.users_id, self.questions_id)
        INSERT INTO
            replies (body, parent_id, users_id, questions_id)
        VALUES
            (?,?,?,?)

        SQL
        self.id = QuestionsDatabase.instance.last_insert_row_id
    end

    def update
        raise "#{self} does not exists" unless self.id
        QuestionsDatabase.instance.execute(<<-SQL, self.body, self.parent_id, self.users_id, self.questions_id, self.id)
        UPDATE
            replies
        SET
        body = ?, parent_id = ?, users_id = ?, questions_id = ?
        WHERE
            id = ?
        SQL
    end

    def author
        id = self.users_id
        User.find_by_id(id)
    end

    def question
        id = self.questions_id
        Question.find_by_users_id(id)
    end

    def parent_reply
        return self if self.parent_id == nil
        Reply.find_by_id(self.parent_id)
    end
    def child_replies
        replies = QuestionsDatabase.instance.execute(<<-SQL, self.id)
        SELECT
            *
        FROM
            replies
        WHERE
            parent_id = ?
        SQL
        return nil unless replies.length > 0
        replies.map {|reply| Reply.new(reply)}

    end

end