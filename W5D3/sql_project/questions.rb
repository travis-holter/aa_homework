
require_relative 'questions_database.rb'
require_relative 'users.rb'
require_relative 'replies.rb'
require_relative 'questions_follows.rb'


class Question
    attr_accessor :id, :title, :body, :users_id

    def self.all
        data = QuestionsDatabase.instance.execute("SELECT * FROM questions")
        data.map { |datum| Question.new(datum) }
    end
    
    def self.find_by_id(id)
        question = QuestionsDatabase.instance.execute(<<-SQL, id)
        SELECT
            *
        FROM
            questions
        WHERE
            id = ?
        SQL
        return nil unless question.length > 0
        Question.new(question.first)
    end

    def self.find_by_users_id(users_id)
        question = QuestionsDatabase.instance.execute(<<-SQL, users_id)
        SELECT
            *
        FROM
            questions
        WHERE
            users_id = ?
        SQL
        return nil unless question.length > 0
        Question.new(question.first)
    end

    def initialize(options)
        @id = options['id']
        @title = options['title']
        @body = options['body']
        @users_id = options['users_id']
    end
    
    def insert
        raise "#{self} already exists" if self.id
        QuestionsDatabase.instance.execute(<<-SQL, self.title, self.body, self.users_id)
        INSERT INTO
            questions (title, body, users_id)
        VALUES
            (?,?,?)

        SQL
        self.id = QuestionsDatabase.instance.last_insert_row_id
    end

    def update
        raise "#{self} does not exists" unless self.id
        QuestionsDatabase.instance.execute(<<-SQL, self.title, self.body, self.users_id, self.id)
        UPDATE
            questions
        SET
        title = ?, body = ?, users_id = ?
        WHERE
            id = ?
        SQL
    end

    def author
        id = self.users_id
        User.find_by_id(id)
    end

    def replies
        id = self.users_id
        Reply.find_by_id(id)
    end

    def followers
        QuestionFollow.followers_for_questions_id(self.id)
    end
end

