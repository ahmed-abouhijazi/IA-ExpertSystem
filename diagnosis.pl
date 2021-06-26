:- use_module(library(jpl)).
go:-
hypothesis(Disease),
write('I believe that the patient have'),
nl,
write(Disease),
nl,
write('TAKE CARE '),
undo.

/*Hypothesis Identification Rules */
hypothesis(covid):- covid, !.
hypothesis(cold):- cold, !.
hypothesis(malaria):- malaria, !.
hypothesis(coqueluche):- coqueluche, !.
hypothesis(pneumoconiose):- pneumoconiose, !.
hypothesis(sarcoidose):- sarcoidose, !.
hypothesis(flu):-flu, !.
hypothesis(tuberculose):- tuberculose, !.
hypothesis(pneumonie):- pneumonie, !.
hypothesis(byssinose):- byssinose, !.
hypothesis(unknown). /* no diagnosis*/



cold :-
verify(headache),
verify(runny_nose),
verify(sneezing),
verify(sore_throat),
write('Advices and Sugestions:'),
nl,
write('1: Tylenol/tab'),
nl,
write('2: panadol/tab'),
nl,
write('3: Nasal spray'),
nl,
write('Please weare warm cloths Because'),
nl.

flu :-
verify(fever),
verify(headache),
verify(body_achs),
verify(conjunctivities),
verify(sore-throat),
verify(runny_nose),
verify(dry_cough),
nl.

malaria :-
verify(fever),
verify(headache),
verify(sweating),
verify(nausea),
verify(vomiting),
verify(diarrhea),
write('Advices and Sugestions:'),
nl,
write('1: Aralen/tab'),
nl,
write('2: Qualaquin/tab'),
nl,
write('3: Plaquenil/tab'),
nl,
write('4: Mefloquine'),
nl,
write('Please do not sleep in open air and cover your full skin Because'),
nl.


covid :-
verify(fever),
verify(dry_cough),
verify(diarrhea),
verify(loss_of_smell_ot_taste),
verify(loss_of_speech_or_motor_skills),
verify(shortness_of_breath),
write('Advices and Suggestions:'),
nl.

coqueluche :-
verify(runny_nose),
verify(mild_fever),
nl.

pneumoconiose:-
verify(shortness_of_breath),
verify(chronic_cough),
nl.

sarcoidose :-
verify(fever),
verify(dry_cough),
verify(shortness_of_breath),
verify(mild_chest_pain),
verify(scaly_rush),
verify(irritated_eyes),
verify(ankles_inflees),
write('Maybe you have an Sarcoidose'),
nl.

tuberculose:-
verify(fever),
verify(persistant_cough),
verify(constant_fatigue),
verify(weight_loss),
verify(appetite_lack),
verify(cough_seigient),
verify(night_sweats),
nl.

pneumonie:-
verify(fever),
verify(cough),
verify(chills),
verify(shortness_of_breath),
nl.

byssinose:-
verify(chest_tightness),
verify(cough),
verify(wheezing),
nl.

ask(Question) :-
write('Does the patient have following symptom:'),
write(Question),
write('?'),
read(Response),
nl,
( (Response == yes ; Response == y)
  ->
assert(yes(Question));
assert(no(Question)),fail).

:- dynamic yes/1,no/1.
/*How to verify something */

verify(S):-
(yes(S)
  ->
true ;
(no(S)
   ->
fail ;
ask(S))).

undo :-retract(yes(_)),fail.
undo :-retract(no(_)),fail.
undo.


