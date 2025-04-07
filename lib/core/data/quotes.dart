import "dart:math";

final _random = Random();

List<String> quoteHistory = []; // future feature
// tracks last quote and stores them and it will help
// find out what quote not to use next to no create
// dups, uses its own grabage collector also

// takes a list and pop out p% of the list for the start
void listWipeout(List list, int p) {
  // if (p < 0 || p > 100) => raise Value error
  
}

String randomQuote() {
  String quote = quoteHanger[_random.nextInt(quoteHanger.length)];
  return quote;
}

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
  "The best views follow hard climbs.",
  "Discipline fuels success.",
  "Nothing changes if nothing changes.",
  "Action beats intention every time.",
  "Comfort zones kill dreams.",
  "Excuses don’t build empires.",
  "Energy flows where focus goes.",
  "Burn the bridges to excuses.",
  "Success is rented, paid daily.",
  "Doubt poisons potential.",
  "Stop wishing, start working.",
  "You don’t find time, you make it.",
  "Winners don’t wait, they create.",
  "Results come from relentless effort.",
  "Hard choices, easy life.",
  "Weakness is a choice.",
  "Do it scared, but do it.",
  "Fear fades with action.",
  "Your habits shape your destiny.",
  "Be addicted to self-improvement.",
  "The grind beats talent.",
  "Your actions prove your priorities.",
  "Deadlines destroy procrastination.",
  "Dream big, execute bigger.",
  "Work until luck finds you.",
  "Talk less, achieve more.",
  "Losers wait, winners work.",
  "No one cares, work harder.",
  "Let your grind be louder than words.",
  "Kill distractions, grow focus.",
  "Rest later, build now.",
  "No guts, no glory.",
  "Stop stopping yourself.",
  "Push past pain, find strength.",
  "Turn adversity into fuel.",
  "One more rep, one more step.",
  "What you allow, continues.",
  "Success demands obsession.",
  "The mirror reflects your effort.",
  "Mediocrity is self-inflicted.",
  "Self-discipline equals self-respect.",
  "Sacrifice now or regret later.",
  "Be so good they can't ignore you.",
  "Fear is temporary, regret is forever.",
  "Persistence outlasts talent.",
  "Hard work compounds, excuses don't.",
  "Take action. Now.",
  "Everything you want is earned.",
  "No one is coming to save you.",
  "You versus yesterday’s version.",
  "The world owes you nothing.",
  "Complaining changes nothing. Ever.",
  "Your excuses die tonight.",
  "Either evolve or repeat.",
  "Victory belongs to the relentless.",
  "Silence doubt with action.",
  "Your ceiling is self-imposed.",
  "Stop romanticizing procrastination.",
  "Potential means nothing undelivered.",
  "Bleed now or bleed later.",
  "Regret weighs more than sweat.",
  "Your habits don’t lie.",
  "Weakness is a slow leak.",
  "Burn the plan B.",
  "Accountability is your armor.",
  "Silence the victim mentality.",
  "Every no brings you closer.",
  "You atrophy in comfort.",
  "Suffer now or suffer forever.",
  "Your comfort zone is decaying.",
  "Mindsets outlive motivation.",
  "Delayed gratification builds empires.",
  "You’re the bottleneck.",
  "Falling isn’t failure—staying down is.",
  "Scars prove you showed up.",
  "Tomorrow’s you is watching.",
  "Your actions answer your doubts.",
  "Surrender is a habit.",
  "The grind never negotiates.",
  "You starve distractions to feed focus.",
  "Average is a choice.",
  "Talent without grit is graffiti.",
  "Your pain is the tuition.",
  "Stop rehearsing defeat.",
  "Insecurity is a tax on greatness.",
  "The mountain doesn’t care how you feel.",
  "Your only limit is your surrender.",
  "Motivation fades—discipline compounds.",
  "You’re either building or decaying.",
  "Excuses are the currency of losers.",
  "The mirror doesn’t negotiate.",
  "Hustle is the antidote to luck.",
  "Your future self is begging you to act.",
  "Winners edit out the noise.",
  "The trophy goes to the obsessed.",
  "You can’t negotiate with gravity.",
  "Self-pity is self-sabotage.",
  "Your legacy is built daily.",
  "The universe favors the stubborn.",
  "You either lead or bleed.",
  "Your hustle is your resume.",
  "The fire for greatness is self-lit.",
  "You can’t outsource your grind.",
  "The hunger decides the outcome.",
  "Your demons train when you sleep.",
  "Opportunity meets the prepared—always.",
  "You’re the architect of your chaos.",
  "Victimhood is a prison you built.",
  "The cost of quitting compounds.",
  "Your darkest hour is your forge.",
  "Adversity is the refiner’s fire.",
  "You’re paid in proportion to your grit.",
  "The throne belongs to the relentless.",
  "Your habits outlive your motivation.",
  "You’re either climbing or sliding.",
  "The world ignores entitled.",
  "Excuses are the nails in your coffin.",
  "The game respects only the obsessed.",
  "Your mediocrity is a slow suicide.",
  "Hesitation is the cousin of regret.",
  "The grind is the only truth.",
  "Your comfort is the enemy of growth.",
  "You can’t heal what you won’t face.",
  "The wolves only respect strength.",
  "Your effort is your signature.",
  "The universe rewards the unreasonable.",
  "You’re either predator or prey.",
  "Your discipline is your dignity.",
  "The scoreboard doesn’t lie.",
  "You’re the CEO of your life.",
  "Your hustle is your hymn.",
  "The relentless inherit the earth.",
  "You’re paid in scars, not wishes.",
  "The mirror reflects your truth.",
  "Your grit is your gravity.",
  "The weak negotiate—the dominant execute.",
  "The arena doesn’t care about your fears.",
  "Your actions echo in eternity.",
  "The hungry don’t beg—they take.",
  "You’re the sum of your daily battles.",
  "The throne awaits—earn it.",
];