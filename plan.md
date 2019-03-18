# Schema

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
* person
* person_name < person
  * *fk: person_id*
  * *fk: core_name_type_id*
  * first
  * middle
  * last
* person_photo
  * *fk: person_id*
  * image
  * current
* core_name_type
  * identity
    * legal_primary
    * legal_alias
    * preferred
    * former
    * other_alias
  * display
    * Legal Primary
    * Legal Alias
    * Preferred
    * Former
    * Other Alias
* personal_demography < person
  * *fk: person_id*
  * birthdate
  * alt_birthdate
  * *fk: core_sex_id*
  * *fk: core_gender_id*
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
* employee < person
  * *fk: person_id*
  * *fk: employee_type_id*
  * position
  * *fk: department_id*
  * earnings
  * *fk: earnings_type_id*
  * *fk: currency_id*
  * upper_level
* core_employee_type
  * identity
    * full_time
    * part_time
    * temporary
* department < division
  * *fk: division_id*
  * name
* division
  * name
* core_earnings_type
  * identity
    * annual
    * hourly
* core_earnings_type
  * identity
    * usd
* contractor < person
  * contract_starts_at
  * contract_ends_at
  * contract_renewable
  * *fk: company_id*
  * earnings
  * *fk: earnings_type_id*
  * *fk: currency_id*
  * reason
  * explanation
* company
  * name
  * specialty
* benefactor < person
  * *fk: person_id*
  * title
  * *fk: company_id*
  * worth
  * *fk: currency_id*
* contribution < benefactor
  * *fk: benefactor_id*
  * amount
  * *fk: currency_id*
  * contributed_at
* poi < person
  * *fk: poi_category_id*
  * title
* poi_category
  * category
* prospect < person
  * *fk: person_id*
  * *fk: academic_career_id*
* core_academic_career
  * identity
    * undergraduate
    * graduate
* prospect_interest < prospect
  * *fk: prospect_id*
  * *fk: interest_id*
  * *fk: strength_id*
  * primary
* interest
  * name
* core_strength
  * identity
    * strong
    * medium
    * weak
* student < person
  * *person_id*
  * *fk: academic_career_id*
  * *fk: academic_major_id*
* academic_major < academic_program
  * *fk: academic_program_id*
  * name
  * active
* academic_program
  * name
  * active
* alumnus < person
  * *fk: person_id*
* alumnus_data
  * *fk: alumnus_id*
  * *fk: academic_career_id*
  * *fk: academic_major_id*
  * graduated_at
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
