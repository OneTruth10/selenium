strings = "-able
-ac
-acity
-ade
-age
-aholic
-al
-algia
-an
-ance
-ant
-ar
-ard
-arian
-arium
-ary
-ate
-ation
-ative
-cide
-cracy
-crat
-cule
-cy
-cycle
-dom
-dox
-ectomy
-ed
-ee
-eer
-emia
-en
-ence
-ency
-ent
-er
-ern
-ery
-escence
-ese
-esque
-ess
-est
-etic
-ette
-ful
-fy
-gam
-gamy
-gate
-gon
-gonic
-hood
-hoop
-ial
-ian
-iasis
-iatric
-ible
-ic
-ical
-ify
-ile
-ily
-ine
-ing
-ion
-ious
-ise
-ish
-ism
-ist
-ite
-itis
-ity
-ive
-ization
-ize
-less
-let
-like
-ling
-log
-loger
-logist
-logy
-ly
-ment
-ness
-nomy
-ocity
-oholic
-oid
-ology
-oma
-onym
-opia
-opsy
-or
-orium
-ory
-osis
-ostomy
-otomy
-ous
-path
-pathy
-phile
-phobia
-phone
-phyte
-plegia
-plegic
-pnea
-scope
-scopy
-scribe
-script
-sect
-ship
-sion
-some
-sophic
-sophy
-th
-tion
-tome
-tomy
-trophy
-tude
-ty
-ular
-uous
-ure
-ward
-ware
-wise
"
arr = strings.split
i = 0
arr.each{|x| arr[i] = x.tr('-','')
             i+=1}
puts "#{arr}"