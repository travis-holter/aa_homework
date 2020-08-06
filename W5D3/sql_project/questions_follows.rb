class QuestionFollow
    attr_accessor :users_id, :questions_id

    def self.all
        data = QuestionsDatabase.instance.execute("SELECT * FROM question_follows")
        data.map { |datum| QuestionFollow.new(datum) }
    end

    def self.followed_questions_users_id(users_id)
        questions = QuestionsDatabase.instance.execute(<<-SQL, users_id)
        SELECT
            *
        FROM
            users
        JOIN
            question_follows ON users.id = questions.users_id
        JOIN 
            questions ON question_follows.questions_id = questions.id
        WHERE
            question_follows.users_id = ?
        SQL
        return nil unless questions.length > 0
        questions.map {|question| Question.new(question)}
    end

    def self.followers_for_questions_id(questions_id)
        users = QuestionsDatabase.instance.execute(<<-SQL, questions_id)
        SELECT
            *
        FROM
            questions
        JOIN
            question_follows ON questions.id = questions_id
        JOIN
            users ON question_follows.users_id = users.id 
        WHERE
            question_follows.questions_id = ?
        SQL
        return nil unless users.length > 0
        users.map {|user| User.new(user)}
    end

    def initialize(options)
        @users_id = options['users_id']
        @questions_id = options['questions_id']
    end

    def insert
         
        QuestionsDatabase.instance.execute(<<-SQL, self.users_id, self.questions_id)
        INSERT INTO
            question_follows (users_id, questions_id)
        VALUES
            (?,?)

        SQL
        
    end

    def delete
        QuestionsDatabase.instance.execute(<<-SQL, self.users_id, self.questions_id)
        DELETE FROM
            question_follows
        WHERE
            users_id = ?
            AND
            questions_id = ?
        SQL
    end


end