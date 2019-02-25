# Schema

* person
  * _Just the standard columns_
* name < person
  * *fk: person_id*
  * *fk: name_type_id*
  * active
  * first
  * middle
  * last
* name_type
  * type
    * legal_primary
    * legal_alias
    * preferred
    * former
    * other_alias
* personal_data
  * *fk: person_id*
  * birth_date
  * *fk: sex_id*
  * *fk: gender_id*
  * gender_description
* core_sex
  * identity
    * female
    * intersex
    * male
* core_gender
  * identity
    * cis_female
    * cis_male
    * non_binary
    * trans_female
    * trans_male
* relationship
  * *fk: person_id*
  * *fk: employee_id*
  * *fk: contractor_id*
  * *fk: benefactor_id*
  * *fk: poi_id*
    * _(Person of Importance)_
  * *fk: prospect_id*
  * *fk: student_id*
  * *fk: alumnus_id*
  * *fk: user_id*
* user < person
  * password
  * *fk: role_id*
    * _Encrypted_
* user_permission
  * *fk: model_id*
  * *fk: action_id*
  * *fk: user_id*
* role_permission
  * *fk: model_id*
  * *fk: action_id*
  * *fk: role_id*
* permission_role
  * name
  * description
* core_permission_model
  * model
* core_permission_action
  * action
    * create
    * read
    * update
    * delete
    * ALL
    * NOT_DELETE
