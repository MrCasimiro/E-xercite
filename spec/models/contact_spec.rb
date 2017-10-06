require 'rails_helper'

RSpec.describe Contact, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  subject { described_class.new(name: "Teste", email: "teste@teste.com", message: "testestesteste")}

  it "is not valid without a name" do
  	subject.name = nil
  	expect(subject).to_not be_valid
  end
  it "is not valid without an email" do
  	subject.email = nil
  	expect(subject).to_not be_valid
  end
  it "is valid without a message" do
  	subject.message = nil
  	expect(subject).to be_valid
  end
  it "is valid without a nickname-invisible" do
  	subject.message = nil
  	expect(subject).to be_valid
  end
  it "email address validation should not accept invalid emails" do
    invalid_address = %w[user@example,com user_at_foo.com user-a-test@ba+.com user_name@foo.com@baar.com]

    invalid_address.each do |invalid_address| 
      subject.email = invalid_address
      expect(subject).to_not be_valid, "#{invalid_address} should not be accept"
    end
  end

  it "test id nil" do
    expect(Contact.new.id).to be_nil
  end

  it "test new record" do
    expect(Contact.new.new_record?).equal? true
  end

end
