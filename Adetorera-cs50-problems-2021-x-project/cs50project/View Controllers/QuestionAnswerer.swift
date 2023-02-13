struct MyQuestionAnswerer {
    func responseTo(question: String) -> String {
        
        if question.contains("What are angel numbers") {
            return "Angel numbers are sequences of repeating numbers that show up noticeably more frequently than others,letting you know that you’re not alone and you’re on the right path."
        } else if question.contains("what are angel numbers") {
            return "Angel numbers are sequences of repeating numbers that show up noticeably more frequently than others. They act as a gentle nudge from your protective angels and higher power about the path you’re on.Think of angel numbers as numeric messages from the other side, letting you know that you’re not alone and you’re on the right path."
        }
        else if question.contains("How to manifest angel numbers") {
            return "By writing magic numeric codes on your wrist, combining angel numbers with candle magic, and using angel numbers with water manifestation techniques."
        }
        else if question.contains("how to manifest angel numbers") {
            return "By writing magic numeric codes on your wrist, combining angel numbers with candle magic, and using angel numbers with water manifestation techniques."
        }
        
        else if question.contains("What to do when you see angel numbers") {
            return "Repeat As A Mantra."
        }
        else if question.contains("what to do when you see angel numbers") {
            return "Repeat As A Mantra."
        }
        
        else if question.contains("How many angel numbers exist") {
            return "There are countless, chances are if you constantly see a set of numbers, it is a sign and you shoud look into it."
        }
        else if question.contains("how many angel numbers exist") {
            return "There are countless, chances are if you constantly see a set of numbers, it is a sign and you shoud look into it."
        }
        
        else if question.contains("How to manifest") {
            return "Be clear about what you want. Figure out how what you want makes you feel. Create a plan – and stick to it."
        }
        else if question.contains("how to manifest") {
            return "Be clear about what you want. Figure out how what you want makes you feel. Create a plan – and stick to it."
        }
        
        else if question.contains("What to manifest") {
            return "You can manifest love, money, your perfect home, a dream job – anything you desire! "
        }
        else if question.contains("what to manifest") {
            return "You can manifest love, money, your perfect home, a dream job – anything you desire! "
        }
        
        else if question.contains("Is it okay to skip a day of manifestation") {
            return " It is okay if you do it one day a bit later because you had to work a little longer than expected or for whatever reason as long it won't be a habit to do it irregularly."
        }
        else if question.contains("is it okay to skip a day of manifestation") {
            return " It is okay if you do it one day a bit later because you had to work a little longer than expected or for whatever reason as long it won't be a habit to do it irregularly."
        }
        
        else if question.contains("Is it okay to tell people about my manifestation") {
            return "Absolutely."
        }
        else if question.contains("is it okay to tell people about my manifestation") {
            return "Absolutely."
        }
        
        else if question.contains("Most effective type of manifestation") {
            return "Pen and paper."
        }
        else if question.contains("Most effective type of manifestation") {
            return "Pen and paper."
        }
        
        else if question.contains("What is 369") {
            return "The 369 method involves writing down what you'd like to manifest three times in the morning, six times during the day, and nine times in the evening."
        }
        else if question.contains("what is 369") {
            return "The 369 method involves writing down what you'd like to manifest three times in the morning, six times during the day, and nine times in the evening."
        }
        
    
        else if question.contains("Who is nikola tesla") {
            return "A Serbian-American engineer and physicist"
        }
        else if question.contains("who is nikola tesla") {
            return "A Serbian-American engineer and physicist."
        }
        
        
        else if question.contains("Why is my manifestation not working") {
            return "You’re unknowingly reading the wrong message at the wrong time"
        }
        else if question.contains("why is my manifestation not working") {
            return "You’re unknowingly reading the wrong message at the wrong time."
        }
        
        else {
            return "I do not understand your question"
        }
    }

}



