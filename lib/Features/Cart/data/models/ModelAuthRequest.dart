/// profile : {"id":863272,"user":{"id":1517211,"username":"01142436770","first_name":"Mohamed","last_name":"Mostafa","date_joined":"2023-07-24T12:03:56.171861","email":"ww.mohamed.ali15987@gmail.com","is_active":true,"is_staff":false,"is_superuser":false,"last_login":null,"groups":[],"user_permissions":[160,116,119,115,213,137,204,118,131,122,128,127,203,123,140,139,455,454,130,266,124,259,121,133,206,125,129,136,185,146,126,604,258,135,138,205,117,120,186,132,134,277]},"created_at":"2023-07-24T12:03:56.196574","active":true,"profile_type":"Merchant","phones":["+201142436770"],"company_emails":["ww.mohamed.ali15987@gmail.com"],"company_name":"mohamed","state":"","country":"EGY","city":"Cairo","postal_code":"","street":"","email_notification":false,"order_retrieval_endpoint":null,"delivery_update_endpoint":null,"logo_url":null,"is_mobadra":false,"sector":"other","activation_method":1,"signed_up_through":0,"failed_attempts":0,"custom_export_columns":[],"server_IP":[],"username":null,"primary_phone_number":"+201142436770","primary_phone_verified":true,"is_temp_password":false,"otp_sent_at":"2023-07-24T12:03:57.745774","otp_sent_to":"01142436770","otp_validated_at":"2023-07-24T12:04:14.271809","awb_banner":null,"email_banner":null,"identification_number":null,"delivery_status_callback":"","merchant_external_link":null,"merchant_status":0,"deactivated_by_bank":false,"bank_deactivation_reason":null,"bank_merchant_status":0,"national_id":null,"super_agent":null,"wallet_limit_profile":null,"address":null,"commercial_registration":null,"commercial_registration_area":null,"distributor_code":null,"distributor_branch_code":null,"allow_terminal_order_id":false,"allow_encryption_bypass":false,"wallet_phone_number":null,"suspicious":0,"latitude":null,"longitude":null,"bank_staffs":{},"bank_rejection_reason":null,"bank_received_documents":false,"bank_merchant_digital_status":0,"bank_digital_rejection_reason":null,"filled_business_data":true,"day_start_time":"00:00:00","day_end_time":null,"withhold_transfers":false,"sms_sender_name":"PayMob","withhold_transfers_reason":null,"withhold_transfers_notes":null,"can_bill_deposit_with_card":false,"can_topup_merchants":false,"topup_transfer_id":null,"referral_eligible":false,"is_eligible_to_be_ranger":false,"is_ranger":false,"is_poaching":false,"paymob_app_merchant":false,"settlement_frequency":null,"day_of_the_week":null,"day_of_the_month":null,"allow_transaction_notifications":false,"allow_transfer_notifications":false,"sallefny_amount_whole":0.0,"sallefny_fees_whole":0.0,"paymob_app_first_login":null,"paymob_app_last_activity":null,"payout_enabled":false,"payout_terms":false,"is_bills_new":false,"can_process_multiple_refunds":false,"settlement_classification":0,"instant_settlement_enabled":false,"instant_settlement_transaction_otp_verified":false,"instant_settlement_mobile_otp_verified":false,"preferred_language":null,"acq_partner":null,"dom":null,"bank_related":null,"permissions":[]}
/// token : "ZXlKaGJHY2lPaUpJVXpVeE1pSXNJblI1Y0NJNklrcFhWQ0o5LmV5SmpiR0Z6Y3lJNklrMWxjbU5vWVc1MElpd2ljSEp2Wm1sc1pWOXdheUk2T0RZek1qY3lMQ0p3YUdGemFDSTZJbU5sWkRCaE1UZzJPVFE0TVRoak1HWTRPRGsxTkRsak4yUTBZVGxoTXpkaU9ERTNZemhtTmpnME1tRmhabUZtTmpkbU1URmxZamcxWldObVlqVXhZbVVpTENKbGVIQWlPakUyT1RBeE9UTTVNVFY5LjBIOXNYT0wwX1VhUmF3ZUp3VHl6T2M1eWpRdjdmeHljcU03cHRMd3hfZG45MENVMzM2LTlHNDk1cW5EbnQ1YTJiSXk5cVFOcVFzYnFPbFhDdDJZNVBB"

class ModelAuthRequest {
  ModelAuthRequest({

      this.token,});

  ModelAuthRequest.fromJson(dynamic json) {
    token = json['token'];
  }

  String? token;


  }
