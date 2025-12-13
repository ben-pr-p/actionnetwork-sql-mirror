-- Filtered views for {{ property_name }} = '{{ property_value }}'
-- Generated from template. Do not edit directly.

-- ============================================================================
-- FILTERED USERS (foundation for all other filtered views)
-- Users who have the specified custom property value
-- ============================================================================

CREATE OR REPLACE VIEW `{{ target_dataset_name }}.filtered_users` AS
SELECT DISTINCT u.user_id
FROM `actionkit_cleaned.cln_actionkit__core_user` u
INNER JOIN `actionkit_cleaned.cln_actionkit__core_userfield` uf ON u.user_id = uf.parent_id
WHERE uf.name = '{{ property_name }}'
  AND uf.value = '{{ property_value }}';

-- ============================================================================
-- CORE USER TABLES (direct user_id relationship)
-- ============================================================================

CREATE OR REPLACE VIEW `{{ target_dataset_name }}.core_user` AS
SELECT u.*
FROM `actionkit_cleaned.cln_actionkit__core_user` u
WHERE user_id IN (SELECT user_id FROM `{{ target_dataset_name }}.filtered_users`);

CREATE OR REPLACE VIEW `{{ target_dataset_name }}.core_userfield` AS
SELECT *
FROM `actionkit_cleaned.cln_actionkit__core_userfield`
WHERE parent_id IN (SELECT user_id FROM `{{ target_dataset_name }}.filtered_users`);

CREATE OR REPLACE VIEW `{{ target_dataset_name }}.core_usergeofield` AS
SELECT *
FROM `actionkit_cleaned.cln_actionkit__core_usergeofield`
WHERE user_id IN (SELECT user_id FROM `{{ target_dataset_name }}.filtered_users`);

CREATE OR REPLACE VIEW `{{ target_dataset_name }}.core_location` AS
SELECT *
FROM `actionkit_cleaned.cln_actionkit__core_location`
WHERE user_id IN (SELECT user_id FROM `{{ target_dataset_name }}.filtered_users`);

CREATE OR REPLACE VIEW `{{ target_dataset_name }}.core_phone` AS
SELECT *
FROM `actionkit_cleaned.cln_actionkit__core_phone`
WHERE user_id IN (SELECT user_id FROM `{{ target_dataset_name }}.filtered_users`);

CREATE OR REPLACE VIEW `{{ target_dataset_name }}.core_subscription` AS
SELECT *
FROM `actionkit_cleaned.cln_actionkit__core_subscription`
WHERE user_id IN (SELECT user_id FROM `{{ target_dataset_name }}.filtered_users`);

CREATE OR REPLACE VIEW `{{ target_dataset_name }}.core_subscriptionhistory` AS
SELECT *
FROM `actionkit_cleaned.cln_actionkit__core_subscriptionhistory`
WHERE user_id IN (SELECT user_id FROM `{{ target_dataset_name }}.filtered_users`);

CREATE OR REPLACE VIEW `{{ target_dataset_name }}.core_usermailing` AS
SELECT *
FROM `actionkit_cleaned.cln_actionkit__core_usermailing`
WHERE user_id IN (SELECT user_id FROM `{{ target_dataset_name }}.filtered_users`);

CREATE OR REPLACE VIEW `{{ target_dataset_name }}.core_user_page_tags` AS
SELECT *
FROM `actionkit_cleaned.cln_actionkit__core_user_page_tags`
WHERE user_id IN (SELECT user_id FROM `{{ target_dataset_name }}.filtered_users`);

CREATE OR REPLACE VIEW `{{ target_dataset_name }}.core_bounce_soft` AS
SELECT *
FROM `actionkit_cleaned.cln_actionkit__core_bounce_soft`
WHERE user_id IN (SELECT user_id FROM `{{ target_dataset_name }}.filtered_users`);

CREATE OR REPLACE VIEW `{{ target_dataset_name }}.core_click` AS
SELECT *
FROM `actionkit_cleaned.cln_actionkit__core_click`
WHERE user_id IN (SELECT user_id FROM `{{ target_dataset_name }}.filtered_users`);

CREATE OR REPLACE VIEW `{{ target_dataset_name }}.core_open` AS
SELECT *
FROM `actionkit_cleaned.cln_actionkit__core_open`
WHERE user_id IN (SELECT user_id FROM `{{ target_dataset_name }}.filtered_users`);

CREATE OR REPLACE VIEW `{{ target_dataset_name }}.share_link` AS
SELECT *
FROM `actionkit_cleaned.cln_actionkit__share_link`
WHERE user_id IN (SELECT user_id FROM `{{ target_dataset_name }}.filtered_users`);

-- ============================================================================
-- ORDER TABLES (direct user_id relationship)
-- ============================================================================

CREATE OR REPLACE VIEW `{{ target_dataset_name }}.core_order` AS
SELECT *
FROM `actionkit_cleaned.cln_actionkit__core_order`
WHERE user_id IN (SELECT user_id FROM `{{ target_dataset_name }}.filtered_users`);

CREATE OR REPLACE VIEW `{{ target_dataset_name }}.core_orderrecurring` AS
SELECT *
FROM `actionkit_cleaned.cln_actionkit__core_orderrecurring`
WHERE user_id IN (SELECT user_id FROM `{{ target_dataset_name }}.filtered_users`);

-- ============================================================================
-- ORDER-LINKED TABLES (via order_id -> core_order.user_id)
-- ============================================================================

CREATE OR REPLACE VIEW `{{ target_dataset_name }}.core_order_detail` AS
SELECT *
FROM `actionkit_cleaned.cln_actionkit__core_order_detail`
WHERE order_id IN (SELECT id FROM `{{ target_dataset_name }}.core_order`);

CREATE OR REPLACE VIEW `{{ target_dataset_name }}.core_transaction` AS
SELECT *
FROM `actionkit_cleaned.cln_actionkit__core_transaction`
WHERE order_id IN (SELECT id FROM `{{ target_dataset_name }}.core_order`);

-- ============================================================================
-- ACTION TABLES (via user_id)
-- ============================================================================

CREATE OR REPLACE VIEW `{{ target_dataset_name }}.core_action` AS
SELECT *
FROM `actionkit_cleaned.cln_actionkit__core_action`
WHERE user_id IN (SELECT user_id FROM `{{ target_dataset_name }}.filtered_users`);

-- ============================================================================
-- ACTION-LINKED TABLES (via action_id or action_ptr_id)
-- ============================================================================

CREATE OR REPLACE VIEW `{{ target_dataset_name }}.core_actionfield` AS
SELECT *
FROM `actionkit_cleaned.cln_actionkit__core_actionfield`
WHERE parent_id IN (SELECT id FROM `{{ target_dataset_name }}.core_action`);

CREATE OR REPLACE VIEW `{{ target_dataset_name }}.core_donationaction` AS
SELECT *
FROM `actionkit_cleaned.cln_actionkit__core_donationaction`
WHERE action_ptr_id IN (SELECT id FROM `{{ target_dataset_name }}.core_action`);

CREATE OR REPLACE VIEW `{{ target_dataset_name }}.core_letteraction` AS
SELECT *
FROM `actionkit_cleaned.cln_actionkit__core_letteraction`
WHERE action_ptr_id IN (SELECT id FROM `{{ target_dataset_name }}.core_action`);

CREATE OR REPLACE VIEW `{{ target_dataset_name }}.core_lteaction` AS
SELECT *
FROM `actionkit_cleaned.cln_actionkit__core_lteaction`
WHERE action_ptr_id IN (SELECT id FROM `{{ target_dataset_name }}.core_action`);

CREATE OR REPLACE VIEW `{{ target_dataset_name }}.core_petitionaction` AS
SELECT *
FROM `actionkit_cleaned.cln_actionkit__core_petitionaction`
WHERE action_ptr_id IN (SELECT id FROM `{{ target_dataset_name }}.core_action`);

CREATE OR REPLACE VIEW `{{ target_dataset_name }}.core_signupaction` AS
SELECT *
FROM `actionkit_cleaned.cln_actionkit__core_signupaction`
WHERE action_ptr_id IN (SELECT id FROM `{{ target_dataset_name }}.core_action`);

CREATE OR REPLACE VIEW `{{ target_dataset_name }}.core_surveyaction` AS
SELECT *
FROM `actionkit_cleaned.cln_actionkit__core_surveyaction`
WHERE action_ptr_id IN (SELECT id FROM `{{ target_dataset_name }}.core_action`);

CREATE OR REPLACE VIEW `{{ target_dataset_name }}.core_unsubscribeaction` AS
SELECT *
FROM `actionkit_cleaned.cln_actionkit__core_unsubscribeaction`
WHERE action_ptr_id IN (SELECT id FROM `{{ target_dataset_name }}.core_action`);

CREATE OR REPLACE VIEW `{{ target_dataset_name }}.core_cwcdeliverylog` AS
SELECT *
FROM `actionkit_cleaned.cln_actionkit__core_cwcdeliverylog`
WHERE action_id IN (SELECT id FROM `{{ target_dataset_name }}.core_action`);

CREATE OR REPLACE VIEW `{{ target_dataset_name }}.share_action` AS
SELECT *
FROM `actionkit_cleaned.cln_actionkit__share_action`
WHERE action_id IN (SELECT id FROM `{{ target_dataset_name }}.core_action`);
