# fizz-buzz-like
iOS fizz-buzz app where you can specify different parameters instead of the classical 3, 5, fizz and buzz inputs.

Here is a description of what is expected from this project:

The original fizz-buzz consists in writing all numbers from 1 to 100, and just replacing all multiples of 3 by "fizz", all multiples of 5 by "buzz", and all multiples of 15 by "fizzbuzz". The output would look like this: "1,2,fizz,4,buzz,fizz,7,8,fizz,buzz,11,fizz,13,14,fizzbuzz,16,...".

The goal is to implement an application that:
- Have a form that accepts five parameters: three integers int1, int2 and limit, and two strings str1 and str2.
- Display a list of strings with numbers from 1 to limit, where: all multiples of int1 are replaced by str1, all multiples of int2 are replaced by str2, all multiples of int1 and int2 are replaced by str1str2.
- Display a statistics view allowing users to know what the most frequent request has been. This view should display a graphical representation of the parameters corresponding to the most completed form, as well as the number of hits for this form.

## Architecture

The architecture is a clean code architecture kind of simplify for this project. You may notice the fizz buzz computation could have been made in a dedicated repository, but since there is nothing to store during the computation and in order to keep this project simple to understand, I've decided to do it in the interactor (see `ComputeFizzBuzzInteractorImplementation`).

Dependancy injection has not been implemented and all the business class initialization are in the AppCoordinator.

## Unit tests

Some relevant unit tests on logical layer has been developed.

## Statistics

What is expected on the statistics view is not explicit. For instance, I'm not sure if *the most frequent request* and *the most completed form* refers to the same thing. Hence I've decided to render a graphical representation of the fizz buzz request (first and second dividers, limit, first and second replacing texts) the most requested (actually there could be multiple favorite requests) along with a graphical representation of the other requests.
