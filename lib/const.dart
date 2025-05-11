import 'package:flutter/material.dart';
import 'package:layout/layout.dart';

late MediaQueryData mediaQueryData;
late double screenHeight;
late double screenWidth;
late ThemeData theme;
late ColorScheme colorScheme;

Text slash(BuildContext context) => Text(
      "  /  ",
      style: TextStyle(
          fontSize: context.layout.value(xs: 28, sm: 32, md: 36, lg: 48, xl: 60),
          fontFamily: "SourGummy",
          fontVariations: <FontVariation>[FontVariation('wght', 250.0)]),
    );
// SVG Asset Strings
String androidStudio = "assets/images/svg/android-studio.svg";
String android = "assets/images/svg/android.svg";
String api = "assets/images/svg/api.svg";
String appStore = "assets/images/svg/app-store.svg";
String bitbucket = "assets/images/svg/bitbucket.svg";
String dart = "assets/images/svg/dart.svg";
String figma = "assets/images/svg/figma.svg";
String firebase = "assets/images/svg/firebase.svg";
String git = "assets/images/svg/git.svg";
String github = "assets/images/svg/github.svg";
String googleMap = "assets/images/svg/google-map.svg";
String googlePay = "assets/images/svg/google-pay.svg";
String graphql = "assets/images/svg/graphql.svg";
String hive = "assets/images/svg/hive.svg";
String iap = "assets/images/svg/iap.svg";
String injectable = "assets/images/svg/injectable.svg";
String ios = "assets/images/svg/ios.svg";
String javascript = "assets/images/svg/javascript.svg";
String jira = "assets/images/svg/jira.svg";
String json = "assets/images/svg/json.svg";
String js = "assets/images/svg/js.svg";
String kotlin = "assets/images/svg/kotlin.svg";
String postmanIcon = "assets/images/svg/postman-icon.svg";
String provider = "assets/images/svg/provider.svg";
String riverpod = "assets/images/svg/riverpod.svg";
String slack = "assets/images/svg/slack.svg";
String sqlite = "assets/images/svg/sqlite.svg";
String stripe = "assets/images/svg/stripe.svg";
String visualStudioCode = "assets/images/svg/visual-studio-code.svg";
String xcode = "assets/images/svg/xcode.svg";
String linkdin = "assets/images/svg/linkdin.svg";
String workStump = "assets/images/svg/work_stump.svg";
const language = [
  "assets/images/svg/dart.svg",
  "assets/images/svg/js.svg",
  "assets/images/svg/kotlin.svg",
  "assets/images/svg/html.svg", // Markup Language
];

const frameworkPlatform = [
  // Renamed from frameWork for clarity
  "assets/images/svg/android.svg", // Platform/SDK
  "assets/images/svg/node.svg", // Runtime/Platform
  "assets/images/svg/ios.svg", // Platform/SDK
];

const library = [
  "assets/images/svg/bloc.svg",
  "assets/images/svg/getx.svg",
  "assets/images/svg/riverpod.svg",
  "assets/images/svg/provider.svg",
  "assets/images/svg/injectable.svg",
  "assets/images/svg/hive.svg", // Database used as a library
];

const editors = [
  "assets/images/svg/android-studio.svg",
  "assets/images/svg/visual-studio-code.svg",
  "assets/images/svg/xcode.svg",
];

const services = [
  "assets/images/svg/firebase.svg",
  "assets/images/svg/mongodb.svg", // Database often used as a Service (Atlas)
  "assets/images/svg/stripe.svg", // Moved from library
  "assets/images/svg/iap.svg", // Moved from library (In-App Purchase Service)
  "assets/images/svg/figma.svg",
  "assets/images/svg/postman.svg",
  "assets/images/svg/app-store.svg",
  "assets/images/svg/google-play.svg",
  "assets/images/svg/google-map.svg",
  "assets/images/svg/google-pay.svg",
  "assets/images/svg/slack.svg",
  "assets/images/svg/jira.svg",
];

const tools = [
  "assets/images/svg/git.svg",
  "assets/images/svg/bitbucket.svg", // Moved from tools
  "assets/images/svg/github.svg", // Moved from tools

  // "assets/images/svg/sqlite.svg", // Database Engine often used as tool/library
];

// Added new categories for better classification

const apiTech = [
  // New Category: API Technologies/Styles
  "assets/images/svg/json.svg", "assets/images/svg/graphql.svg", // Moved from library
  "assets/images/svg/rest-api.svg", // Moved from tools
];
// Your JSON string
String jsonString = """
  {
       "quotes": [
{
       "quote":"Life isn’t about getting and having, it’s about giving and being.","author":"Kevin Kruse"},
{
       "quote":"Whatever the mind of man can conceive and believe, it can achieve.","author":"Napoleon Hill"},
{
       "quote":"Strive not to be a success, but rather to be of value.","author":"Albert Einstein"},
{
       "quote":"Two roads diverged in a wood, and I—I took the one less traveled by, And that has made all the difference.","author":"Robert Frost"},
{
       "quote":"I attribute my success to this: I never gave or took any excuse.","author":"Florence Nightingale"},
{
       "quote":"You miss 100% of the shots you don’t take.","author":"Wayne Gretzky"},
{
       "quote":"I’ve missed more than 9000 shots in my career. I’ve lost almost 300 games. 26 times I’ve been trusted to take the game winning shot and missed. I’ve failed over and over and over again in my life. And that is why I succeed.","author":"Michael Jordan"},
{
       "quote":"The most difficult thing is the decision to act, the rest is merely tenacity.","author":"Amelia Earhart"},
{
       "quote":"Every strike brings me closer to the next home run.","author":"Babe Ruth"},
{
       "quote":"Definiteness of purpose is the starting point of all achievement.","author":"W. Clement Stone"},
{
       "quote":"We must balance conspicuous consumption with conscious capitalism.","author":"Kevin Kruse"},
{
       "quote":"Life is what happens to you while you’re busy making other plans.","author":"John Lennon"},
{
       "quote":"We become what we think about.","author":"Earl Nightingale"},
{
       "quote":"Twenty years from now you will be more disappointed by the things that you didn’t do than by the ones you did do, so throw off the bowlines, sail away from safe harbor, catch the trade winds in your sails.  Explore, Dream, Discover.","author":"Mark Twain"},
{
       "quote":"Life is 10% what happens to me and 90% of how I react to it.","author":"Charles Swindoll"},
{
       "quote":"The most common way people give up their power is by thinking they don’t have any.","author":"Alice Walker"},
{
       "quote":"The mind is everything. What you think you become.","author":"Buddha"},
{
       "quote":"The best time to plant a tree was 20 years ago. The second best time is now.","author":"Chinese Proverb"},
{
       "quote":"An unexamined life is not worth living.","author":"Socrates"},
{
       "quote":"Eighty percent of success is showing up.","author":"Woody Allen"},
{
       "quote":"Your time is limited, so don’t waste it living someone else’s life.","author":"Steve Jobs"},
{
       "quote":"Winning isn’t everything, but wanting to win is.","author":"Vince Lombardi"},
{
       "quote":"I am not a product of my circumstances. I am a product of my decisions.","author":"Stephen Covey"},
{
       "quote":"Every child is an artist.  The problem is how to remain an artist once he grows up.","author":"Pablo Picasso"},
{
       "quote":"You can never cross the ocean until you have the courage to lose sight of the shore.","author":"Christopher Columbus"},
{
       "quote":"I’ve learned that people will forget what you said, people will forget what you did, but people will never forget how you made them feel.","author":"Maya Angelou"},
{
       "quote":"Either you run the day, or the day runs you.","author":"Jim Rohn"},
{
       "quote":"Whether you think you can or you think you can’t, you’re right.","author":"Henry Ford"},
{
       "quote":"The two most important days in your life are the day you are born and the day you find out why.","author":"Mark Twain"},
{
       "quote":"Whatever you can do, or dream you can, begin it.  Boldness has genius, power and magic in it.","author":"Johann Wolfgang von Goethe"},
{
       "quote":"The best revenge is massive success.","author":"Frank Sinatra"},
{
       "quote":"People often say that motivation doesn’t last. Well, neither does bathing.  That’s why we recommend it daily.","author":"Zig Ziglar"},
{
       "quote":"Life shrinks or expands in proportion to one’s courage.","author":"Anais Nin"},
{
       "quote":"If you hear a voice within you say “you cannot paint,” then by all means paint and that voice will be silenced.","author":"Vincent Van Gogh"},
{
       "quote":"There is only one way to avoid criticism: do nothing, say nothing, and be nothing.","author":"Aristotle"},
{
       "quote":"Ask and it will be given to you; search, and you will find; knock and the door will be opened for you.","author":"Jesus"},
{
       "quote":"The only person you are destined to become is the person you decide to be.","author":"Ralph Waldo Emerson"},
{
       "quote":"Go confidently in the direction of your dreams.  Live the life you have imagined.","author":"Henry David Thoreau"},
{
       "quote":"When I stand before God at the end of my life, I would hope that I would not have a single bit of talent left and could say, I used everything you gave me.","author":"Erma Bombeck"},
{
       "quote":"Few things can help an individual more than to place responsibility on him, and to let him know that you trust him.","author":"Booker T. Washington"},
{
       "quote":"Certain things catch your eye, but pursue only those that capture the heart.","author":" Ancient Indian Proverb"},
{
       "quote":"Believe you can and you’re halfway there.","author":"Theodore Roosevelt"},
{
       "quote":"Everything you’ve ever wanted is on the other side of fear.","author":"George Addair"},
{
       "quote":"We can easily forgive a child who is afraid of the dark; the real tragedy of life is when men are afraid of the light.","author":"Plato"},
{
       "quote":"Teach thy tongue to say, “I do not know,” and thous shalt progress.","author":"Maimonides"},
{
       "quote":"Start where you are. Use what you have.  Do what you can.","author":"Arthur Ashe"},
{
       "quote":"When I was 5 years old, my mother always told me that happiness was the key to life.  When I went to school, they asked me what I wanted to be when I grew up.  I wrote down ‘happy’.  They told me I didn’t understand the assignment, and I told them they didn’t understand life.","author":"John Lennon"},
{
       "quote":"Fall seven times and stand up eight.","author":"Japanese Proverb"},
{
       "quote":"When one door of happiness closes, another opens, but often we look so long at the closed door that we do not see the one that has been opened for us.","author":"Helen Keller"},
{
       "quote":"Everything has beauty, but not everyone can see.","author":"Confucius"},
{
       "quote":"How wonderful it is that nobody need wait a single moment before starting to improve the world.","author":"Anne Frank"},
{
       "quote":"When I let go of what I am, I become what I might be.","author":"Lao Tzu"},
{
       "quote":"Life is not measured by the number of breaths we take, but by the moments that take our breath away.","author":"Maya Angelou"},
{
       "quote":"Happiness is not something readymade.  It comes from your own actions.","author":"Dalai Lama"},
{
       "quote":"If you’re offered a seat on a rocket ship, don’t ask what seat! Just get on.","author":"Sheryl Sandberg"},
{
       "quote":"First, have a definite, clear practical ideal; a goal, an objective. Second, have the necessary means to achieve your ends; wisdom, money, materials, and methods. Third, adjust all your means to that end.","author":"Aristotle"},
{
       "quote":"If the wind will not serve, take to the oars.","author":"Latin Proverb"},
{
       "quote":"You can’t fall if you don’t climb.  But there’s no joy in living your whole life on the ground.","author":"Unknown"},
{
       "quote":"We must believe that we are gifted for something, and that this thing, at whatever cost, must be attained.","author":"Marie Curie"},
{
       "quote":"It does not matter how slowly you go as long as you do not stop.","author":"Confucius"},
{
       "quote":"If you look at what you have in life, you’ll always have more. If you look at what you don’t have in life, you’ll never have enough.","author":"Oprah Winfrey"},
{
       "quote":"Remember that not getting what you want is sometimes a wonderful stroke of luck.","author":"Dalai Lama"},
{
       "quote":"You can’t use up creativity.  The more you use, the more you have.","author":"Maya Angelou"},
{
       "quote":"Dream big and dare to fail.","author":"Norman Vaughan"},
{
       "quote":"Our lives begin to end the day we become silent about things that matter.","author":"Martin Luther King Jr."},
{
       "quote":"Do what you can, where you are, with what you have.","author":"Teddy Roosevelt"},
{
       "quote":"If you do what you’ve always done, you’ll get what you’ve always gotten.","author":"Tony Robbins"},
{
       "quote":"Dreaming, after all, is a form of planning.","author":"Gloria Steinem"},
{
       "quote":"It’s your place in the world; it’s your life. Go on and do all you can with it, and make it the life you want to live.","author":"Mae Jemison"},
{
       "quote":"You may be disappointed if you fail, but you are doomed if you don’t try.","author":"Beverly Sills"},
{
       "quote":"Remember no one can make you feel inferior without your consent.","author":"Eleanor Roosevelt"},
{
       "quote":"Life is what we make it, always has been, always will be.","author":"Grandma Moses"},
{
       "quote":"The question isn’t who is going to let me; it’s who is going to stop me.","author":"Ayn Rand"},
{
       "quote":"When everything seems to be going against you, remember that the airplane takes off against the wind, not with it.","author":"Henry Ford"},
{
       "quote":"It’s not the years in your life that count. It’s the life in your years.","author":"Abraham Lincoln"},
{
       "quote":"Change your thoughts and you change your world.","author":"Norman Vincent Peale"},
{
       "quote":"Either write something worth reading or do something worth writing.","author":"Benjamin Franklin"},
{
       "quote":"Nothing is impossible, the word itself says, “I’m possible!”","author":"–Audrey Hepburn"},
{
       "quote":"The only way to do great work is to love what you do.","author":"Steve Jobs"},
{
       "quote":"If you can dream it, you can achieve it.","author":"Zig Ziglar"}
]
}
  """;
