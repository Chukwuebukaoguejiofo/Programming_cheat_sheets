
/**
 * Need to add TAX(1.2% of propPrice per year), INSURANCE.
 */
foo = (propPrice) => {
  let downPaymentPercentage = 20;

  let downPayment = 
  (propPrice / 100 ) * downPaymentPercentage;

  let closingCosts =
  (propPrice / 100) * 5;

  /**
   * 0.25 is what I should have payed in tax,
   * but since it is deductable, I get back that money!
   */
  let depreciationYear = 
  (propPrice / 27.5) * 0.25;

  let depreciationMonth =
  (depreciationYear / 12);

  let appreciationYear = 
  (propPrice * 0.03);

  let appreciationMonth =
  (appreciationYear / 12);

  let loan =
  (propPrice / 100 ) * (100 - downPaymentPercentage)
  
  let mortgageMonth = loan * 0.005; // between 0.005 - 0.008 (lower is better)

  let totalPayed = // at the end of 30 years
  (mortgageMonth * 12 * 30);

  let totalInterest =
  (mortgageMonth * 12 * 30) - loan;

  let totalPrincipalPayed =
  (mortgageMonth * 12 * 30) - totalInterest;
  
  /**
   * Add vacancy, repairs
   */
  let monthOperatingExpenses =
  (mortgageMonth * 1.4);

  let rentMonth = 
  (propPrice * 0.007);

  let rentYear = 
  (propPrice * 0.007) * 12;

  let managementMonth = 
  (rentMonth * 0.1); // 10% of rent for management

  let profitPerMonth = 
  (rentMonth - mortgageMonth - managementMonth) + depreciationMonth + appreciationMonth;

  let profitPerYear = 
  profitPerMonth * 12;

  let returnOnDownPayment =
  (profitPerYear / downPayment) * 100;

  let capRate = 
  (profitPerYear / propPrice) * 100;

  console.log('propPrice', propPrice/1000 + 'K');
  console.log('downPayment', downPayment/1000 + 'K');
  console.log('loan', loan/1000 + 'K');
  console.log('mortgage/mo', mortgageMonth/1000 + 'K');
  console.log('totalPayed', totalPayed/1000 + 'K');
  console.log('totalInterest', totalInterest/1000 + 'K');
  console.log('totalPrincipalPayed', totalPrincipalPayed/1000 + 'K');
  console.log('monthOperatingExpenses', monthOperatingExpenses/1000 + 'K');
  console.log('rentMonth', rentMonth/1000 + 'K');
  console.log('rentYear', rentYear/1000 + 'K');
  console.log('profitPerMonth', profitPerMonth/1000 + 'K');
  console.log('profitPerYear', profitPerYear/1000 + 'K');
  console.log('returnOnDownPayment', returnOnDownPayment + '%');
  console.log('capRate', capRate + '%');
  console.log('closingCosts', closingCosts/1000 + 'K');
  console.log('closingCosts + downPayment', (closingCosts + downPayment)/1000 + 'K');

  console.log('depreciationMonth', depreciationMonth/1000 + 'K');
  console.log('depreciationYear', depreciationYear/1000 + 'K');

  console.log('========================');
  console.log('returnOnDownPayment', returnOnDownPayment + '%');
  console.log('closingCosts + downPayment', (closingCosts + downPayment)/1000 + 'K');
  console.log('profitPerMonth', profitPerMonth/1000 + 'K');
  // console.log('profitPerYear', profitPerYear/1000 + 'K');
};

foo(300000);



/*
propPrice 300K
downPayment 60K
loan 240K
mortgage/mo 1.2K
totalPayed 432K
totalInterest 192K
totalPrincipalPayed 240K
monthOperatingExpenses 1.68K
rentMonth 2.1K
rentYear 25.2K
profitPerMonth 1.6672727272727272K
profitPerYear 20.007272727272728K
returnOnDownPayment 33.345454545454544%
capRate 6.669090909090909%
closingCosts 15K
closingCosts + downPayment 75K
depreciationMonth 0.2272727272727273K
depreciationYear 2.7272727272727275K
========================
returnOnDownPayment 33.345454545454544%
closingCosts + downPayment 75K
profitPerMonth 1.6672727272727272K
*/
