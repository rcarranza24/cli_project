class Cli
    def run
        print_welcome
        Api.get_rickmorty
        main
    end

    def main
        print_all
        print_selection_prompt
        id = valid_id?(prompt_selection)
        updated_rickmorty = get_rickmorty_details(id)
        print_details(updated_rickmorty)
        print_continue
        continue?(prompt_selection)
        
        
    end

    def print_all
        Rickmorty.all.each { |p| puts "#{p.id}.) #{p.name}" }
    end

    def print_selection_prompt
        puts "Please choose a number for more information."
    end

    def print_error
        puts "I don't understand, please try again!"
    end

    def print_details(rickmorty)
        puts "Name: #{rickmorty.name}"
        puts "Gender: #{rickmorty.gender}"
        puts "Species: #{rickmorty.species}"
        puts "Status: #{rickmorty.status}"
    end

    def print_welcome
        puts 'Welcome to the Rick & Morty CLI!'
    end

    def print_continue
        puts "Would you like to continue? (yes/no)"
    end

    def print_goodbye
        puts "Thank you. Goodbye!
───────┌┌──────────────────────────────────────────────────────────┌▌───────────────────────────────
──┌▄▄▄█████▄▄┌──────────────────────────────────────────────╓═────┌█────────────────────────────────
──█████▀▀█████─────────────────────────────────────────────┌█────╒█▌────────────────────────────────
──╟██═─────▀███──▐█──────────▄───────────────────────────▐███────███────────────────▄───────────────
───╟██──────██▀──└▀─────────▐█────╓═─────────────────────█▌╟█▌──▄███───────────────▓▌───────────────
───╙██▌────██▌───┌█────▄▓▄──██─▄▓▀└──────────────▓──────╫█▄└██─▓█▌└█▌──╓▓▓▄─█▓██▌─╒█▀───▐───────────
────████▓██▀╙────┌█──▓█▀───▐███▀╙──────╓█▌─▄─┌▀─▐█──────╟█───█─██▀▐██─██╫██═██▄██▄▓█╓┌──▓█──────────
────╙██▀████▄─────█▌╓██─────▐██▄───────███─███▌▄█▌─────┌██───╙██▌─└██╘█▄─██▄███▄──╟█╙▀▀▀╫██─────────
────╒██───▀▀███───█▌╚█▓██▀═─╟▌─▀█▌────▐█─╟▌█─█████─────███────▀█───██─█████─█─╙█──█▌────└██────┌▄▀──
─────██▀─────╙╙█▄─╟───█─────█───▀█▌──────────────╙─────▐█──────└───└█───────╙──▐▀─╟──────╟██▄█▀╙────
─────╙██────────╙█▄──────────────╙█────────────────────▐█───────────█▌──────────╙─▀──────██▀▀───────
──────██──────────█▌──────────────└──────────────────────────────────╚────────────────┌██▀└─────────
───────────────────└─────────────────────────────────────────────────────────────────▐█▀────────────
───────────────────────────────────────────────────────────────────────────────────╓██──────────────
────────────────────────────────────────────────────────────────────────────────┌▄▀▀────────────────"

end 

    def prompt_selection
        gets.chomp
    end

    def valid_id?(id)
        id = id.to_i
        if id < 1 || id > Rickmorty.all.size
        
            print_error
            sleep 1
            main 
    end
    id
 end

    def continue?(choice)
        if choice == "yes"
            main
        else
            print_goodbye
            exit
        end
    end

    def get_rickmorty_details(id)
        selected_rickmorty = Rickmorty.find_by_id(id)
        Api.get_details_by_id(id) unless selected_rickmorty.has_details?
        selected_rickmorty
    end
end

