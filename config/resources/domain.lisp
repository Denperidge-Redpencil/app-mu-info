(in-package :mu-cl-resources)

(defparameter *default-page-size* 100)

(define-resource repo ()
  :class (s-prefix "ext:Repo")
  :properties `((:title :string ,(s-prefix "dct:title"))
                (:description :string ,(s-prefix "dct:description"))
                (:category :url ,(s-prefix "ext:category"))
                (:repo-url :url ,(s-prefix "ext:repositoryUrl"))
                (:image-url :url ,(s-prefix "ext:imageUrl"))
                (:homepage-url :url ,(s-prefix "ext:homepageUrl"))
                )
  :has-many `((revision :via ,(s-prefix "ext:hasRepo")
                        :inverse t
                        :as "revisions"))
  :resource-base (s-url "http://mu.semte.ch/vocabularies/ext/repos/")
  :on-path "repos")

(define-resource revision ()
  :class (s-prefix "ext:RepoRevision")
  :properties `((:image-tag :string ,(s-prefix "ext:revisionImageTag"))
                (:image-url :string ,(s-prefix "ext:revisionImageUrl"))
                (:repo-tag :string ,(s-prefix "ext:revisionRepoTag"))
                (:repo-url :string ,(s-prefix "ext:revisionRepoUrl"))
                
                (:readme :string ,(s-prefix "ext:readme"))
                (:tutorials :string ,(s-prefix "ext:tutorials"))
                (:how-to-guides :string ,(s-prefix "ext:howToGuides"))
                (:explanation :string ,(s-prefix "ext:explanation"))
                (:reference :string ,(s-prefix "ext:reference"))
                )
  :has-one `((repo :via ,(s-prefix "ext:hasRepo")
                           :as "repo"))
  :resource-base (s-url "http://mu.semte.ch/vocabularies/ext/repo-revisions/")
  :on-path "repo-revisions")
