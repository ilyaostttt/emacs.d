(defclass record () ; No superclasses
  ((name :initarg :name
         :initform ""
         :type string
         :custom string
         :documentation "The name of a person.")
   (birthday :initarg :birthday
             :initform "Jan 1, 1970"
             :custom string
             :type string
             :documentation "The person's birthday.")
   (phone :initarg :phone
          :initform ""
          :documentation "Phone number."))
  "A single record for tracking people I know.")

(setq simon (make-instance 'record :name "Simon" :phone "1234"))

(oref simon name)
(oref simon phone)

(setq Jane (make-instance 'record :name "Jane" :phone "1234"))
(oref Jane name)
(oref Jane phone)

(setq bob (record "Bob" :name "Bob" :birthday "1987"))
(oref bob name)
(oref bob birthday)

