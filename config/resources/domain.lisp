(in-package :mu-cl-resources)

(define-resource microservice ()
  :class (s-prefix "mu:Microservice")
  :properties `((:title :string ,(s-prefix "dct:title"))
                (:description :string ,(s-prefix "dct:description"))
                (:is-core :boolean ,(s-prefix "ext:isCoreMicroservice"))
                (:repository :url ,(s-prefix "ext:repository")))
  :has-many `((revision :via ,(s-prefix "ext:hasRevision")
                        :as "revisions"))
  :features '(no-pagination-defaults)
  :resource-base (s-url "http://info.mu.semte.ch/microservices/")
  :on-path "microservices")

(define-resource revision ()
  :class (s-prefix "mu:MicroserviceRevision")
  :properties `((:image :string ,(s-prefix "ext:microserviceRevision"))
                (:version :string ,(s-prefix "ext:microserviceVersion")))
  :has-one `((microservice :via ,(s-prefix "ext:hasRevision")
                           :inverse t
                           :as "microservice"))
  :features '(no-pagination-defaults)
  :resource-base (s-url "http://info.mu.semte.ch/microservice-revisions/")
  :on-path "microservice-revisions")
