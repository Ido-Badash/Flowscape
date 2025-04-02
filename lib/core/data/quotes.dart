import "dart:math";

List<String> quoteHanger = [  
  "Focus makes the impossible real.",  
  "Stay present, see real results.",  
  "Your focus shapes your world.",  
  "Clarity unlocks hidden potential.",  
  "Do what you can, not what you can't.",  
  "Schedule priorities, not tasks.",  
  "Distraction destroys focus.",  
  "Day one or one day? You choose.",  
  "Small steps lead to big results.",  
  "The secret? Just start.",  
  "Grow by achieving your goals.",  
  "Make time don’t wait for it.",  
  "Love your work to do great work.",  
  "Simplify—cut the excess.",  
  "Do the right things well.",  
  "Believe, and you're halfway there.",  
  "Doubt is your true limit.",  
  "Change thoughts, change life.",  
  "What’s inside is always stronger.",  
  "It’s never too late to start.",  
  "Start now. No excuses.",  
  "Live your life, not theirs.",  
  "Every journey starts with a step.",  
  "Keep going, no matter how slow.",  
  "Do what scares you most.",  
  "Believe in your dreams.",  
  "Improve yourself, help others.",  
  "Find joy in simple things.",  
  "Happiness comes from action.",  
  "Decide who you want to be.",  
  "Start today or regret it later.",  
  "You're stronger than you think.",  
  "Be the change you seek.",  
  "Every try gets you closer.",  
  "Success is the best revenge.",  
  "Rise after every single fall.",  
  "Turn obstacles into chances.",  
  "Always stand back up.",  
  "React with a positive mind.",  
  "Your mind creates your world.",  
  "Hard roads lead to beauty.",  
  "Challenges create true strength.",  
  "Courage is action despite fear.",  
  "Take the first step now.",  
  "Pain today builds strength.",  
  "Doubt kills more dreams.",  
  "Believe in the impossible.",  
  "You shape your own life.",  
  "The best views follow hard climbs."  
];


String randomQuote({List<String>? quoteList}) {
  final quotes = quoteList ?? quoteHanger;
  String quote = quotes[_random.nextInt(quotes.length)];
  return quote;
}

final _random = Random();
