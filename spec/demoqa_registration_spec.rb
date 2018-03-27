require 'spec_helper'

describe 'testing the demoqa registration page' do

  before(:all) do
    @driver = SeleniumDemoReg.new
    @driver.access_registration_form
  end

  context 'positive paths for the registration form and register' do

    it 'should land on the registration for page' do
      expect(@driver.current_url).to eq('http://demoqa.com/registration/')
    end

    it 'should accept a first name' do
      @driver.set_first_name_field("Mo")
      if @driver.first_name_field_displayed
        expect(@driver.get_first_name_field_value).to eq("Mo")
      else
        return false
      end
    end

    it 'should accept a last name' do
      @driver.set_last_name_field("Uddin")
      if @driver.last_name_field_displayed
        expect(@driver.get_last_name_field_value).to eq("Uddin")
      else
        return false
      end
    end

    it 'should accept a marital status selection of Single' do
      @driver.select_marital_option("single")
      expect(@driver.get_marital_option).to eq("single")
    end

    it 'should accept a marital status selection of Married' do
      @driver.select_marital_option("married")
      expect(@driver.get_marital_option).to eq("married")
    end

    it 'should accept a marital status selection of Divorced' do
      @driver.select_marital_option("divorced")
      expect(@driver.get_marital_option).to eq("divorced")
    end

    it 'should accept a hobby status selection of Dance, Reading, or Cricket' do
      @driver.select_hobby_option("cricket,reading")
      expect(@driver.get_hobby_option).to eq(["reading","cricket"])
    end

    it 'should have a country default of Afghanistan' do
      expect(@driver.get_selected_country).to eq("Afghanistan")
    end

    it 'accept a new DOB' do
      @driver.dob_month_list_select("9")
      @driver.dob_day_list_select("16")
      @driver.dob_year_list_select("1995")
      expect("#{@driver.get_day}.#{@driver.get_month}.#{@driver.get_year}").to eq("16.9.1995")
    end

    it 'should accept a new country value' do
      @driver.country_dropdown_list_select("Brazil")
      expect(@driver.get_selected_country).to eq("Brazil")
    end

    it 'should accept a valid phone number' do
      @driver.set_phone_number_field("07900000000")
      expect(@driver.get_phone_number_field_value).to eq("07900000000")
    end

    it 'should accept a username' do
      @driver.set_user_name_field("user82476724672678")
      expect(@driver.get_user_name_field_value).to eq("user82476724672678")
    end

    it 'should accept a about yourself text' do
      @driver.set_about_yourself_field("My name is chocolate")
      expect(@driver.get_about_yourself_value).to eq("My name is chocolate")
    end

    it 'should accept a password' do
      @driver.set_password_field("password")
      expect(@driver.get_password_value).to eq("password")
    end

    it 'should accept a password confirmation' do
      @driver.set_confirmation_password_field("password")
      expect(@driver.get_confirmation_password_value).to eq("password")
    end

  end

end
