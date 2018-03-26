require 'selenium-webdriver'

class SeleniumDemoReg

  # page_url
  PAGE_URL = 'http://demoqa.com/registration/'
  # Page field
  FIRST_NAME_FIELD = "name_3_firstname" # id
  LAST_NAME_FIELD = "name_3_lastname" # id
  MARITAL_STATUS = "radio_4[]" # name
  HOBBY_STATUS = "checkbox_5[]" # name
  COUNTRY_DROP_DOWN_LIST = "dropdown_7" # name
  DOB_MONTH_DROPDOWN_LIST = "mm_date_8" # id
  DOB_DAY_DROPDOWN_LIST = "dd_date_8" # id
  DOB_YEAR_DROPDOWN_LIST = "yy_date_8" # id
  PHONE_NUMBER_FIELDS = "phone_9" # id
  USERNAME_FIELD = "username" # id
  EMAIL_FIELD = "email_1" # id
  PROFILE_PICTURE_BUTTON = "profile_pic_10" # id
  DESCRIPTION_FIELD = "description" # id
  PASSWORD_FIELD = "password_2" # id
  CONFIRM_PASSWORD_FIELD = "confirm_password_password_2" # id
  SUBMIT_BUTTON = "pie_submit" # name
  REGISTRATION_CONFIRMATION = "piereg_message" #class

  def initialize
    # set up driver
    @chrome_driver = Selenium::WebDriver.for :chrome
  end

  def access_registration_form
    @chrome_driver.get(PAGE_URL)
  end

  def current_url
    @chrome_driver.current_url
  end

  # first name field management - Difficulty Easy

  def set_first_name_field(first_name)
    basic_setter(:id,FIRST_NAME_FIELD,first_name)
  end

  def get_first_name_field_value
    basic_getter(:id,FIRST_NAME_FIELD)
  end

  def first_name_field_displayed
    basic_displayed(:id,FIRST_NAME_FIELD)
  end

  # last name field management - Difficulty Easy

  def set_last_name_field(last_name)
    basic_setter(:id,LAST_NAME_FIELD,last_name)
  end

  def get_last_name_field_value
    basic_getter(:id,LAST_NAME_FIELD)
  end

  def last_name_field_displayed
    basic_displayed(:id,LAST_NAME_FIELD)
  end

  # Marital option management - Difficulty Medium

  def select_marital_option(marital_status)
    # Consider something like a case statement and check the selenium selected? method
    @chrome_driver.find_elements(:name, MARITAL_STATUS).each do |status|
      if status["value"] == marital_status
        status.click
      end
    end
  end

  def get_marital_option
    @chrome_driver.find_elements(:name, MARITAL_STATUS).each do |status|
      if status.selected?
        return status["value"]
      end
    end
  end

  # hobby option management - Difficulty Medium

  def select_hobby_option(hobbies)
    # Consider something like a case statement and check the selenium selected? method
    # Note: the cricket option has the text value "cricket "
    hobbies.split(",").each do |hobby|
      @chrome_driver.find_elements(:name, HOBBY_STATUS).each do |status|
        if status["value"].delete(" ") == hobby
          status.click
        end
      end
    end
  end

  def get_hobby_option
    arr =[]
    @chrome_driver.find_elements(:name, HOBBY_STATUS).each do |status|
      if status.selected?
        arr << status["value"].delete(" ")
      end
    end
    arr
  end

  # Select Country - Difficulty HARD

  # Look online how to handle option lists with Selenium in Ruby - you need to get used to solving problems
  # If you are spending too long see if anyone else has been successful
  # If no solution then a run through will happen once finished

  def get_selected_country
    basic_getter(:id, COUNTRY_DROP_DOWN_LIST)
  end

  def country_dropdown_list_select(country)
    dropdown_selector(:id, COUNTRY_DROP_DOWN_LIST,country)
  end

  # DOB management - Difficulty HARD

  # Look online how to handle option lists with Selenium in Ruby - you need to get used to solving problems
  # If you are spending too long see if anyone else has been successful
  # If no solution then a run through will happen once finished

  def get_month
    basic_getter(:id, DOB_MONTH_DROPDOWN_LIST)
  end

  def get_day
    basic_getter(:id, DOB_DAY_DROPDOWN_LIST)
  end

  def get_year
    basic_getter(:id, DOB_YEAR_DROPDOWN_LIST)
  end

  def dob_month_list_select(month_value)
    dropdown_selector(:id, DOB_MONTH_DROPDOWN_LIST,month_value)
  end

  def dob_day_list_select(day_value)
    dropdown_selector(:id, DOB_DAY_DROPDOWN_LIST,day_value)
  end

  def dob_year_list_select(year_value)
    dropdown_selector(:id, DOB_YEAR_DROPDOWN_LIST,year_value)
  end


  # Phone number field management - Difficulty Easy

  def set_phone_number_field(phone_number)
    basic_setter(:id,PHONE_NUMBER_FIELDS,phone_number)
  end

  def get_phone_number_field_value
    basic_getter(:id,PHONE_NUMBER_FIELDS)
  end

  #  username field management - Difficulty Easy

  def set_user_name_field(user_name)
    basic_setter(:id,USERNAME_FIELD,user_name)
  end

  def get_user_name_field_value
    basic_getter(:id,USERNAME_FIELD)
  end

  # Email field management - Difficulty Easy

  def set_email_field(email)
    basic_setter(:id,EMAIL_FIELD,email)
  end

  def get_email_field_value
    basic_getter(:id,EMAIL_FIELD)
  end

  # about yourself / description field - Difficulty Easy

  def set_about_yourself_field(details)
    basic_setter(:id,DESCRIPTION_FIELD,details)
  end

  def get_about_yourself_value
    basic_getter(:id,DESCRIPTION_FIELD)
  end

  # Password management - Difficulty Easy

  def set_password_field(password)
    basic_setter(:id,PASSWORD_FIELD,password)
  end

  def get_password_value
    basic_getter(:id,PASSWORD_FIELD)
  end

  def set_confirmation_password_field(password)
    basic_setter(:id,CONFIRM_PASSWORD_FIELD,password)
  end

  def get_confirmation_password_value
    basic_getter(:id,CONFIRM_PASSWORD_FIELD)
  end

  # registration confirmation - Difficulty Easy

  def click_submit
    @chrome_driver.find_element(:name,SUBMIT_BUTTON).click
  end

  def check_registration_successful
    basic_getter(:class,REGISTRATION_CONFIRMATION)
  end

  def basic_getter(tag_name,path)
    @chrome_driver.find_element(tag_name,path)["value"]
  end
  def basic_setter(tag_name,path,key_word)
    @chrome_driver.find_element(tag_name,path).send_key(key_word)
  end
  def basic_displayed(tag_name,path)
    @chrome_driver.find_element(tag_name,path).displayed?
  end
  def dropdown_selector(tag_name,path,key_word)
    @chrome_driver.find_element(tag_name, path).find_elements(:tag_name, "option").each do |current|
      if current["value"]==key_word
        current.click
      end
    end
  end
end
