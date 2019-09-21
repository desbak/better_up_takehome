require 'test_helper'

class AppointmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @appointment = appointments(:one)
    @coach1 = coaches(:one)
    @coach2 = coaches(:two)
    @ab1 = availability_blocks(:one)  # coach1
    @ab2 = availability_blocks(:two)  # coach1
    @ab3 = availability_blocks(:three)  # coach2
  end

  # test "should get index" do
  #   get appointments_url
  #   assert_response :success
  # end

  test "should get new" do
    get new_appointment_url, params: { :coach_id => @coach1.id,
                                       :availability_block_id => @ab1.id,
                                       :date => '2019-09-23' }
    assert_response :success
  end

  test "should create appointment" do
    assert_difference('Appointment.count') do
      post appointments_url, params: { appointment: { availability_block_id: @ab2.id,
                                                      client_name: 'Other Name',
                                                      coach_id: @coach1.id,
                                                      date: '2019-09-24' } }
    end

    assert_redirected_to appointment_url(Appointment.last)
  end

  test "should not create appointment if the time is already taken" do
    post appointments_url, params: { appointment: { availability_block_id: @ab2.id,
                                                      client_name: 'Other Name',
                                                      coach_id: @coach1.id,
                                                      date: '2019-09-24' } }
    assert_no_difference('Appointment.count') do
      post appointments_url, params: { appointment: { availability_block_id: @ab2.id,
                                                      client_name: 'Confliced',
                                                      coach_id: @coach1.id,
                                                      date: '2019-09-24' } }

      post appointments_url, params: { appointment: { availability_block_id: @ab1.id,
                                                      client_name: 'Confliced',
                                                      coach_id: @coach1.id,
                                                      date: '2019-09-23' } }
    end

  end

  # test "should show appointment" do
  #   get appointment_url(@appointment)
  #   assert_response :success
  # end

  # test "should get edit" do
  #   get edit_appointment_url(@appointment)
  #   assert_response :success
  # end

  # test "should update appointment" do
  #   patch appointment_url(@appointment), params: { appointment: { availability_block_id: @appointment.availability_block_id, client_name: @appointment.client_name, coach_id: @appointment.coach_id, date: @appointment.date } }
  #   assert_redirected_to appointment_url(@appointment)
  # end

  # test "should destroy appointment" do
  #   assert_difference('Appointment.count', -1) do
  #     delete appointment_url(@appointment)
  #   end

  #   assert_redirected_to appointments_url
  # end
end
