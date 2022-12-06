class Student 
    attr_accessor :name, :reg_no
    def getDetails()
        puts "\n\Name : #{name},\nRegister number : #{reg_no}"
    end
end
class Candidate < Student
    attr_accessor :votes, :is_winner
    def initialize()
        puts "\n\n************************************************* \n\nEnter candidate name and register number!"
        name = gets.chomp
        reg_no = gets.chomp
        @name = name
        @reg_no = reg_no
        @votes = 0
        @is_winner = false
        
    end 
    def increaseVote()
        @votes +=1
    end
    def getCandidateDetails()
        puts "\n\Name : #{name},\nRegister number : #{reg_no},\nVotes : #{votes}\n"
    end
    def getVotes()
        return self.votes
    end
end 
class Voter < Student
    attr_accessor :is_voted
    def initialize()
        puts "\n\n************************************************* \n\nEnter your name and register number!"
        name = gets.chomp
        reg_no = gets.chomp
        @name = name
        @reg_no = reg_no
        @is_voted = false   
    end
end



candidate_array = [Candidate.new()]
loop do 
    puts "Do you want to create more candidates? (press 'y' or 'n')"
    create_more_candidate = gets.chomp
   if create_more_candidate == 'n'
        break
   elsif create_more_candidate == 'y'
    candidate_array.push(Candidate.new())
   else
        puts "Please press 'y' or 'n'"
   end
end

def candidate_list(candidate_list)
    puts "\n\n----------------------------------------------"
    puts "Candidate list::"
    for i in 0..candidate_list.length-1 do
        sleep 0.5
        puts "\nCandidate no:#{i+1}"
        puts "\n#{candidate_list[i].getDetails()}"
    end
    loop do
        sleep 0.5
        puts "-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+"
        puts "Enter candidate number to vote!"
        voter_input = gets.chomp
        if voter_input.to_i>0 && voter_input.to_i<=candidate_list.length
            candidate_list[voter_input.to_i-1].increaseVote()
            break
        else 
            sleep 0.5
            puts "\nEnter a valid candidate number!\n"
            
        end
    end
end

voter_array = [Voter.new()]
candidate_list(candidate_array)
loop do
    puts "Do you want to vote again? (press 'y' or 'n')"
    create_more_voter = gets.chomp
   if create_more_voter == 'n'
        break
   elsif create_more_voter == 'y'
        voter_array.push(Voter.new())
        candidate_list(candidate_array)
   else
        puts "Please press 'y' or 'n'"
   end
end

winner = nil
max_votes = 0
is_tie = false
for i in candidate_array
    if i.getVotes() > max_votes
        winner = i
        max_votes = i.getVotes()
        is_tie = false
    elsif i.getVotes() == max_votes
        is_tie = true
    end
end


puts "\n\n\n----------------------------------------------"
if !is_tie
    puts "\nThe winner is"
    winner.getCandidateDetails()
else
    puts "The result is a tie!"
end
# for i in candidate_array
#     i.getCandidateDetails()
# end
