
# ------------------------- USERS -----------------------
# require_relative "questions_follow.rb"


class User
    attr_accessor :id, :fname, :lname

    def self.all
        data = QuestionsDatabase.instance.execute("SELECT * FROM users")
        data.map { |datum| User.new(datum) }
    end

    def self.find_by_id(id)
        users = QuestionsDatabase.instance.execute(<<-SQL, id)
        SELECT
            *
        FROM
            users
        WHERE
            id = ?
        SQL
        return nil unless users.length > 0
        User.new(users.first)
    end

    def self.find_by_name(fname, lname)
        users = QuestionsDatabase.instance.execute(<<-SQL, fname, lname)
        SELECT
            *
        FROM
            users
        WHERE
            fname = ?
            AND
            lname = ?
        SQL
        return nil unless users.length > 0
        User.new(users.first)
    end

    def initialize(options)
        @id = options['id']
        @fname = options['fname']
        @lname = options['lname']
    end

    def insert
        raise "#{self} already exists" if self.id
        QuestionsDatabase.instance.execute(<<-SQL, self.fname, self.lname)
        INSERT INTO
            users (fname, lname)
        VALUES
            (?,?)

        SQL
        self.id = QuestionsDatabase.instance.last_insert_row_id
    end

    def update
        raise "#{self} does not exists" unless self.id
        QuestionsDatabase.instance.execute(<<-SQL, self.fname, self.lname, self.id)
        UPDATE
            users
        SET
        fname = ?, lname = ?
        WHERE
            id = ?
        SQL
    end


    def authored_questions
        id = User.find_by_name(self.fname, self.lname).id
        Question.find_by_users_id(id)
    end

    def authored_replies
        id = User.find_by_name(self.fname, self.lname).id
        Reply.find_by_users_id(id)
    end

    def followed_questions
        QuestionFollow.followed_questions_users_id(self.id)
    end

    
end