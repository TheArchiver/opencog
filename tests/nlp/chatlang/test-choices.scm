(use-modules (opencog)
             (opencog nlp)
             (opencog nlp chatlang))

(define w (cons 'word "drink"))
(define l (cons 'lemma "eat"))
(define p (cons 'phrase "John Smith"))
(define c (cons 'concept "play"))
(define choices (choices (list w l p c)))

; Check the EvaluationLink created
(define test-choices-result
    (let ((c (car (cdr choices))))
        (and (eq? (cog-type c) 'EvaluationLink)
             (equal? (gar c) (GroundedPredicateNode "scm: chatlang-choices?"))
             (equal? (gadr c) (ListLink (WordNode "drink")
                                        (LemmaNode "eat")
                                        (PhraseNode "John Smith")
                                        (ConceptNode "play"))))))
