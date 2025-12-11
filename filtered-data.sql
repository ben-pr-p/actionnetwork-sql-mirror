-- Filtered views for network_id = {{ filtered_network_id }}
-- Generated from template. Do not edit directly.

-- ============================================================================
-- FILTERING BY NETWORK ID
-- Tables that have a direct network_id column
-- ============================================================================

-- Networks table (filtered by id)
CREATE OR REPLACE VIEW `{{ target_dataset_name }}.networks` AS
SELECT *
FROM `actionnetwork_cleaned.cln_actionnetwork__networks`
WHERE id = {{ filtered_network_id }};

-- Tables with network_id column
CREATE OR REPLACE VIEW `{{ target_dataset_name }}.collections` AS
SELECT *
FROM `actionnetwork_cleaned.cln_actionnetwork__collections`
WHERE network_id = {{ filtered_network_id }};

CREATE OR REPLACE VIEW `{{ target_dataset_name }}.groups` AS
SELECT *
FROM `actionnetwork_cleaned.cln_actionnetwork__groups`
WHERE network_id = {{ filtered_network_id }};

CREATE OR REPLACE VIEW `{{ target_dataset_name }}.networks_users` AS
SELECT *
FROM `actionnetwork_cleaned.cln_actionnetwork__networks_users`
WHERE network_id = {{ filtered_network_id }};

-- ============================================================================
-- FILTERING BY GROUP ID
-- Tables that have group_id, filtered via subquery on groups.network_id
-- ============================================================================

CREATE OR REPLACE VIEW `{{ target_dataset_name }}.action_keywords` AS
SELECT *
FROM `actionnetwork_cleaned.cln_actionnetwork__action_keywords`
WHERE group_id IN (SELECT id FROM `actionnetwork_cleaned.cln_actionnetwork__groups` WHERE network_id = {{ filtered_network_id }});

CREATE OR REPLACE VIEW `{{ target_dataset_name }}.call_campaigns` AS
SELECT *
FROM `actionnetwork_cleaned.cln_actionnetwork__call_campaigns`
WHERE group_id IN (SELECT id FROM `actionnetwork_cleaned.cln_actionnetwork__groups` WHERE network_id = {{ filtered_network_id }});

CREATE OR REPLACE VIEW `{{ target_dataset_name }}.campaigns` AS
SELECT *
FROM `actionnetwork_cleaned.cln_actionnetwork__campaigns`
WHERE group_id IN (SELECT id FROM `actionnetwork_cleaned.cln_actionnetwork__groups` WHERE network_id = {{ filtered_network_id }});

CREATE OR REPLACE VIEW `{{ target_dataset_name }}.child_permissions` AS
SELECT *
FROM `actionnetwork_cleaned.cln_actionnetwork__child_permissions`
WHERE group_id IN (SELECT id FROM `actionnetwork_cleaned.cln_actionnetwork__groups` WHERE network_id = {{ filtered_network_id }});

CREATE OR REPLACE VIEW `{{ target_dataset_name }}.collections_groups` AS
SELECT *
FROM `actionnetwork_cleaned.cln_actionnetwork__collections_groups`
WHERE group_id IN (SELECT id FROM `actionnetwork_cleaned.cln_actionnetwork__groups` WHERE network_id = {{ filtered_network_id }});

CREATE OR REPLACE VIEW `{{ target_dataset_name }}.comments` AS
SELECT *
FROM `actionnetwork_cleaned.cln_actionnetwork__comments`
WHERE group_id IN (SELECT id FROM `actionnetwork_cleaned.cln_actionnetwork__groups` WHERE network_id = {{ filtered_network_id }});

CREATE OR REPLACE VIEW `{{ target_dataset_name }}.core_field_syndications` AS
SELECT *
FROM `actionnetwork_cleaned.cln_actionnetwork__core_field_syndications`
WHERE group_id IN (SELECT id FROM `actionnetwork_cleaned.cln_actionnetwork__groups` WHERE network_id = {{ filtered_network_id }});

CREATE OR REPLACE VIEW `{{ target_dataset_name }}.d12y_stats` AS
SELECT *
FROM `actionnetwork_cleaned.cln_actionnetwork__d12y_stats`
WHERE group_id IN (SELECT id FROM `actionnetwork_cleaned.cln_actionnetwork__groups` WHERE network_id = {{ filtered_network_id }});

CREATE OR REPLACE VIEW `{{ target_dataset_name }}.donation_payments` AS
SELECT *
FROM `actionnetwork_cleaned.cln_actionnetwork__donation_payments`
WHERE group_id IN (SELECT id FROM `actionnetwork_cleaned.cln_actionnetwork__groups` WHERE network_id = {{ filtered_network_id }});

CREATE OR REPLACE VIEW `{{ target_dataset_name }}.donation_recipients` AS
SELECT *
FROM `actionnetwork_cleaned.cln_actionnetwork__donation_recipients`
WHERE group_id IN (SELECT id FROM `actionnetwork_cleaned.cln_actionnetwork__groups` WHERE network_id = {{ filtered_network_id }});

CREATE OR REPLACE VIEW `{{ target_dataset_name }}.email_activities` AS
SELECT *
FROM `actionnetwork_cleaned.cln_actionnetwork__email_activities`
WHERE group_id IN (SELECT id FROM `actionnetwork_cleaned.cln_actionnetwork__groups` WHERE network_id = {{ filtered_network_id }});

CREATE OR REPLACE VIEW `{{ target_dataset_name }}.email_campaigns` AS
SELECT *
FROM `actionnetwork_cleaned.cln_actionnetwork__email_campaigns`
WHERE group_id IN (SELECT id FROM `actionnetwork_cleaned.cln_actionnetwork__groups` WHERE network_id = {{ filtered_network_id }});

CREATE OR REPLACE VIEW `{{ target_dataset_name }}.email_templates` AS
SELECT *
FROM `actionnetwork_cleaned.cln_actionnetwork__email_templates`
WHERE group_id IN (SELECT id FROM `actionnetwork_cleaned.cln_actionnetwork__groups` WHERE network_id = {{ filtered_network_id }});

CREATE OR REPLACE VIEW `{{ target_dataset_name }}.emails` AS
SELECT *
FROM `actionnetwork_cleaned.cln_actionnetwork__emails`
WHERE group_id IN (SELECT id FROM `actionnetwork_cleaned.cln_actionnetwork__groups` WHERE network_id = {{ filtered_network_id }});

CREATE OR REPLACE VIEW `{{ target_dataset_name }}.event_campaigns` AS
SELECT *
FROM `actionnetwork_cleaned.cln_actionnetwork__event_campaigns`
WHERE group_id IN (SELECT id FROM `actionnetwork_cleaned.cln_actionnetwork__groups` WHERE network_id = {{ filtered_network_id }});

CREATE OR REPLACE VIEW `{{ target_dataset_name }}.events` AS
SELECT *
FROM `actionnetwork_cleaned.cln_actionnetwork__events`
WHERE group_id IN (SELECT id FROM `actionnetwork_cleaned.cln_actionnetwork__groups` WHERE network_id = {{ filtered_network_id }});

CREATE OR REPLACE VIEW `{{ target_dataset_name }}.field_names_groups` AS
SELECT *
FROM `actionnetwork_cleaned.cln_actionnetwork__field_names_groups`
WHERE group_id IN (SELECT id FROM `actionnetwork_cleaned.cln_actionnetwork__groups` WHERE network_id = {{ filtered_network_id }});

CREATE OR REPLACE VIEW `{{ target_dataset_name }}.filter_actions` AS
SELECT *
FROM `actionnetwork_cleaned.cln_actionnetwork__filter_actions`
WHERE group_id IN (SELECT id FROM `actionnetwork_cleaned.cln_actionnetwork__groups` WHERE network_id = {{ filtered_network_id }});

CREATE OR REPLACE VIEW `{{ target_dataset_name }}.forms` AS
SELECT *
FROM `actionnetwork_cleaned.cln_actionnetwork__forms`
WHERE group_id IN (SELECT id FROM `actionnetwork_cleaned.cln_actionnetwork__groups` WHERE network_id = {{ filtered_network_id }});

CREATE OR REPLACE VIEW `{{ target_dataset_name }}.fundraisings` AS
SELECT *
FROM `actionnetwork_cleaned.cln_actionnetwork__fundraisings`
WHERE group_id IN (SELECT id FROM `actionnetwork_cleaned.cln_actionnetwork__groups` WHERE network_id = {{ filtered_network_id }});

CREATE OR REPLACE VIEW `{{ target_dataset_name }}.group_growth_by_source_actions` AS
SELECT *
FROM `actionnetwork_cleaned.cln_actionnetwork__group_growth_by_source_actions`
WHERE group_id IN (SELECT id FROM `actionnetwork_cleaned.cln_actionnetwork__groups` WHERE network_id = {{ filtered_network_id }});

CREATE OR REPLACE VIEW `{{ target_dataset_name }}.group_growth_by_source_codes` AS
SELECT *
FROM `actionnetwork_cleaned.cln_actionnetwork__group_growth_by_source_codes`
WHERE group_id IN (SELECT id FROM `actionnetwork_cleaned.cln_actionnetwork__groups` WHERE network_id = {{ filtered_network_id }});

CREATE OR REPLACE VIEW `{{ target_dataset_name }}.group_invites` AS
SELECT *
FROM `actionnetwork_cleaned.cln_actionnetwork__group_invites`
WHERE group_id IN (SELECT id FROM `actionnetwork_cleaned.cln_actionnetwork__groups` WHERE network_id = {{ filtered_network_id }});

CREATE OR REPLACE VIEW `{{ target_dataset_name }}.groups_syndications` AS
SELECT *
FROM `actionnetwork_cleaned.cln_actionnetwork__groups_syndications`
WHERE group_id IN (SELECT id FROM `actionnetwork_cleaned.cln_actionnetwork__groups` WHERE network_id = {{ filtered_network_id }});

CREATE OR REPLACE VIEW `{{ target_dataset_name }}.groups_users` AS
SELECT *
FROM `actionnetwork_cleaned.cln_actionnetwork__groups_users`
WHERE group_id IN (SELECT id FROM `actionnetwork_cleaned.cln_actionnetwork__groups` WHERE network_id = {{ filtered_network_id }});

CREATE OR REPLACE VIEW `{{ target_dataset_name }}.ladders` AS
SELECT *
FROM `actionnetwork_cleaned.cln_actionnetwork__ladders`
WHERE group_id IN (SELECT id FROM `actionnetwork_cleaned.cln_actionnetwork__groups` WHERE network_id = {{ filtered_network_id }});

CREATE OR REPLACE VIEW `{{ target_dataset_name }}.letters` AS
SELECT *
FROM `actionnetwork_cleaned.cln_actionnetwork__letters`
WHERE group_id IN (SELECT id FROM `actionnetwork_cleaned.cln_actionnetwork__groups` WHERE network_id = {{ filtered_network_id }});

CREATE OR REPLACE VIEW `{{ target_dataset_name }}.lists` AS
SELECT *
FROM `actionnetwork_cleaned.cln_actionnetwork__lists`
WHERE group_id IN (SELECT id FROM `actionnetwork_cleaned.cln_actionnetwork__groups` WHERE network_id = {{ filtered_network_id }});

CREATE OR REPLACE VIEW `{{ target_dataset_name }}.mobile_messages` AS
SELECT *
FROM `actionnetwork_cleaned.cln_actionnetwork__mobile_messages`
WHERE group_id IN (SELECT id FROM `actionnetwork_cleaned.cln_actionnetwork__groups` WHERE network_id = {{ filtered_network_id }});

CREATE OR REPLACE VIEW `{{ target_dataset_name }}.page_wrappers` AS
SELECT *
FROM `actionnetwork_cleaned.cln_actionnetwork__page_wrappers`
WHERE group_id IN (SELECT id FROM `actionnetwork_cleaned.cln_actionnetwork__groups` WHERE network_id = {{ filtered_network_id }});

CREATE OR REPLACE VIEW `{{ target_dataset_name }}.petitions` AS
SELECT *
FROM `actionnetwork_cleaned.cln_actionnetwork__petitions`
WHERE group_id IN (SELECT id FROM `actionnetwork_cleaned.cln_actionnetwork__groups` WHERE network_id = {{ filtered_network_id }});

CREATE OR REPLACE VIEW `{{ target_dataset_name }}.queries` AS
SELECT *
FROM `actionnetwork_cleaned.cln_actionnetwork__queries`
WHERE group_id IN (SELECT id FROM `actionnetwork_cleaned.cln_actionnetwork__groups` WHERE network_id = {{ filtered_network_id }});

CREATE OR REPLACE VIEW `{{ target_dataset_name }}.questions` AS
SELECT *
FROM `actionnetwork_cleaned.cln_actionnetwork__questions`
WHERE group_id IN (SELECT id FROM `actionnetwork_cleaned.cln_actionnetwork__groups` WHERE network_id = {{ filtered_network_id }});

CREATE OR REPLACE VIEW `{{ target_dataset_name }}.reports` AS
SELECT *
FROM `actionnetwork_cleaned.cln_actionnetwork__reports`
WHERE group_id IN (SELECT id FROM `actionnetwork_cleaned.cln_actionnetwork__groups` WHERE network_id = {{ filtered_network_id }});

CREATE OR REPLACE VIEW `{{ target_dataset_name }}.sms_message_activities` AS
SELECT *
FROM `actionnetwork_cleaned.cln_actionnetwork__sms_message_activities`
WHERE group_id IN (SELECT id FROM `actionnetwork_cleaned.cln_actionnetwork__groups` WHERE network_id = {{ filtered_network_id }});

CREATE OR REPLACE VIEW `{{ target_dataset_name }}.sms_messages` AS
SELECT *
FROM `actionnetwork_cleaned.cln_actionnetwork__sms_messages`
WHERE group_id IN (SELECT id FROM `actionnetwork_cleaned.cln_actionnetwork__groups` WHERE network_id = {{ filtered_network_id }});

CREATE OR REPLACE VIEW `{{ target_dataset_name }}.sms_status_logs` AS
SELECT *
FROM `actionnetwork_cleaned.cln_actionnetwork__sms_status_logs`
WHERE group_id IN (SELECT id FROM `actionnetwork_cleaned.cln_actionnetwork__groups` WHERE network_id = {{ filtered_network_id }});

CREATE OR REPLACE VIEW `{{ target_dataset_name }}.sms_statuses` AS
SELECT *
FROM `actionnetwork_cleaned.cln_actionnetwork__sms_statuses`
WHERE group_id IN (SELECT id FROM `actionnetwork_cleaned.cln_actionnetwork__groups` WHERE network_id = {{ filtered_network_id }});

CREATE OR REPLACE VIEW `{{ target_dataset_name }}.subscription_statuses` AS
SELECT *
FROM `actionnetwork_cleaned.cln_actionnetwork__subscription_statuses`
WHERE group_id IN (SELECT id FROM `actionnetwork_cleaned.cln_actionnetwork__groups` WHERE network_id = {{ filtered_network_id }});

CREATE OR REPLACE VIEW `{{ target_dataset_name }}.subscriptions` AS
SELECT *
FROM `actionnetwork_cleaned.cln_actionnetwork__subscriptions`
WHERE group_id IN (SELECT id FROM `actionnetwork_cleaned.cln_actionnetwork__groups` WHERE network_id = {{ filtered_network_id }});

CREATE OR REPLACE VIEW `{{ target_dataset_name }}.syndications` AS
SELECT *
FROM `actionnetwork_cleaned.cln_actionnetwork__syndications`
WHERE group_id IN (SELECT id FROM `actionnetwork_cleaned.cln_actionnetwork__groups` WHERE network_id = {{ filtered_network_id }});

CREATE OR REPLACE VIEW `{{ target_dataset_name }}.tag_syndications` AS
SELECT *
FROM `actionnetwork_cleaned.cln_actionnetwork__tag_syndications`
WHERE group_id IN (SELECT id FROM `actionnetwork_cleaned.cln_actionnetwork__groups` WHERE network_id = {{ filtered_network_id }});

CREATE OR REPLACE VIEW `{{ target_dataset_name }}.tags` AS
SELECT *
FROM `actionnetwork_cleaned.cln_actionnetwork__tags`
WHERE group_id IN (SELECT id FROM `actionnetwork_cleaned.cln_actionnetwork__groups` WHERE network_id = {{ filtered_network_id }});

CREATE OR REPLACE VIEW `{{ target_dataset_name }}.targets` AS
SELECT *
FROM `actionnetwork_cleaned.cln_actionnetwork__targets`
WHERE group_id IN (SELECT id FROM `actionnetwork_cleaned.cln_actionnetwork__groups` WHERE network_id = {{ filtered_network_id }});

CREATE OR REPLACE VIEW `{{ target_dataset_name }}.ticketed_events` AS
SELECT *
FROM `actionnetwork_cleaned.cln_actionnetwork__ticketed_events`
WHERE group_id IN (SELECT id FROM `actionnetwork_cleaned.cln_actionnetwork__groups` WHERE network_id = {{ filtered_network_id }});

CREATE OR REPLACE VIEW `{{ target_dataset_name }}.triggers` AS
SELECT *
FROM `actionnetwork_cleaned.cln_actionnetwork__triggers`
WHERE group_id IN (SELECT id FROM `actionnetwork_cleaned.cln_actionnetwork__groups` WHERE network_id = {{ filtered_network_id }});

CREATE OR REPLACE VIEW `{{ target_dataset_name }}.unsubscriptions` AS
SELECT *
FROM `actionnetwork_cleaned.cln_actionnetwork__unsubscriptions`
WHERE group_id IN (SELECT id FROM `actionnetwork_cleaned.cln_actionnetwork__groups` WHERE network_id = {{ filtered_network_id }});

CREATE OR REPLACE VIEW `{{ target_dataset_name }}.user_files` AS
SELECT *
FROM `actionnetwork_cleaned.cln_actionnetwork__user_files`
WHERE group_id IN (SELECT id FROM `actionnetwork_cleaned.cln_actionnetwork__groups` WHERE network_id = {{ filtered_network_id }});

CREATE OR REPLACE VIEW `{{ target_dataset_name }}.user_tags` AS
SELECT *
FROM `actionnetwork_cleaned.cln_actionnetwork__user_tags`
WHERE group_id IN (SELECT id FROM `actionnetwork_cleaned.cln_actionnetwork__groups` WHERE network_id = {{ filtered_network_id }});

CREATE OR REPLACE VIEW `{{ target_dataset_name }}.webhook_messages` AS
SELECT *
FROM `actionnetwork_cleaned.cln_actionnetwork__webhook_messages`
WHERE group_id IN (SELECT id FROM `actionnetwork_cleaned.cln_actionnetwork__groups` WHERE network_id = {{ filtered_network_id }});

CREATE OR REPLACE VIEW `{{ target_dataset_name }}.webhooks` AS
SELECT *
FROM `actionnetwork_cleaned.cln_actionnetwork__webhooks`
WHERE group_id IN (SELECT id FROM `actionnetwork_cleaned.cln_actionnetwork__groups` WHERE network_id = {{ filtered_network_id }});

-- ============================================================================
-- FILTERING BY ROOT_GROUP_ID
-- Users table filtered via root_group_id -> groups.network_id
-- ============================================================================

CREATE OR REPLACE VIEW `{{ target_dataset_name }}.users` AS
SELECT *
FROM `actionnetwork_cleaned.cln_actionnetwork__users`
WHERE root_group_id IN (SELECT id FROM `actionnetwork_cleaned.cln_actionnetwork__groups` WHERE network_id = {{ filtered_network_id }});

-- ============================================================================
-- FILTERING BY FUNDRAISING_ID
-- Tables filtered via fundraising_id -> fundraisings.group_id -> groups.network_id
-- ============================================================================

CREATE OR REPLACE VIEW `{{ target_dataset_name }}.donations` AS
SELECT *
FROM `actionnetwork_cleaned.cln_actionnetwork__donations`
WHERE fundraising_id IN (
    SELECT id FROM `actionnetwork_cleaned.cln_actionnetwork__fundraisings`
    WHERE group_id IN (SELECT id FROM `actionnetwork_cleaned.cln_actionnetwork__groups` WHERE network_id = {{ filtered_network_id }})
);

-- ============================================================================
-- FILTERING BY EVENT_ID
-- Tables filtered via event_id -> events.group_id -> groups.network_id
-- ============================================================================

CREATE OR REPLACE VIEW `{{ target_dataset_name }}.rsvps` AS
SELECT *
FROM `actionnetwork_cleaned.cln_actionnetwork__rsvps`
WHERE event_id IN (
    SELECT id FROM `actionnetwork_cleaned.cln_actionnetwork__events`
    WHERE group_id IN (SELECT id FROM `actionnetwork_cleaned.cln_actionnetwork__groups` WHERE network_id = {{ filtered_network_id }})
);

-- ============================================================================
-- FILTERING BY PETITION_ID
-- Tables filtered via petition_id -> petitions.group_id -> groups.network_id
-- ============================================================================

CREATE OR REPLACE VIEW `{{ target_dataset_name }}.signatures` AS
SELECT *
FROM `actionnetwork_cleaned.cln_actionnetwork__signatures`
WHERE petition_id IN (
    SELECT id FROM `actionnetwork_cleaned.cln_actionnetwork__petitions`
    WHERE group_id IN (SELECT id FROM `actionnetwork_cleaned.cln_actionnetwork__groups` WHERE network_id = {{ filtered_network_id }})
);

-- ============================================================================
-- FILTERING BY CAMPAIGN_ID
-- Tables filtered via campaign_id -> campaigns.group_id -> groups.network_id
-- ============================================================================

CREATE OR REPLACE VIEW `{{ target_dataset_name }}.actions` AS
SELECT *
FROM `actionnetwork_cleaned.cln_actionnetwork__actions`
WHERE campaign_id IN (
    SELECT id FROM `actionnetwork_cleaned.cln_actionnetwork__campaigns`
    WHERE group_id IN (SELECT id FROM `actionnetwork_cleaned.cln_actionnetwork__groups` WHERE network_id = {{ filtered_network_id }})
);

CREATE OR REPLACE VIEW `{{ target_dataset_name }}.action_questions` AS
SELECT *
FROM `actionnetwork_cleaned.cln_actionnetwork__action_questions`
WHERE action_id IN (
    SELECT id FROM `actionnetwork_cleaned.cln_actionnetwork__actions`
    WHERE campaign_id IN (
        SELECT id FROM `actionnetwork_cleaned.cln_actionnetwork__campaigns`
        WHERE group_id IN (SELECT id FROM `actionnetwork_cleaned.cln_actionnetwork__groups` WHERE network_id = {{ filtered_network_id }})
    )
);

CREATE OR REPLACE VIEW `{{ target_dataset_name }}.notification_settings` AS
SELECT *
FROM `actionnetwork_cleaned.cln_actionnetwork__notification_settings`
WHERE action_id IN (
    SELECT id FROM `actionnetwork_cleaned.cln_actionnetwork__actions`
    WHERE campaign_id IN (
        SELECT id FROM `actionnetwork_cleaned.cln_actionnetwork__campaigns`
        WHERE group_id IN (SELECT id FROM `actionnetwork_cleaned.cln_actionnetwork__groups` WHERE network_id = {{ filtered_network_id }})
    )
);

CREATE OR REPLACE VIEW `{{ target_dataset_name }}.message_actions` AS
SELECT *
FROM `actionnetwork_cleaned.cln_actionnetwork__message_actions`
WHERE action_id IN (
    SELECT id FROM `actionnetwork_cleaned.cln_actionnetwork__actions`
    WHERE campaign_id IN (
        SELECT id FROM `actionnetwork_cleaned.cln_actionnetwork__campaigns`
        WHERE group_id IN (SELECT id FROM `actionnetwork_cleaned.cln_actionnetwork__groups` WHERE network_id = {{ filtered_network_id }})
    )
);

-- ============================================================================
-- FILTERING BY CALL_CAMPAIGN_ID
-- Tables filtered via call_campaign_id -> call_campaigns.group_id -> groups.network_id
-- ============================================================================

CREATE OR REPLACE VIEW `{{ target_dataset_name }}.calls` AS
SELECT *
FROM `actionnetwork_cleaned.cln_actionnetwork__calls`
WHERE call_campaign_id IN (
    SELECT id FROM `actionnetwork_cleaned.cln_actionnetwork__call_campaigns`
    WHERE group_id IN (SELECT id FROM `actionnetwork_cleaned.cln_actionnetwork__groups` WHERE network_id = {{ filtered_network_id }})
);

CREATE OR REPLACE VIEW `{{ target_dataset_name }}.call_targets` AS
SELECT *
FROM `actionnetwork_cleaned.cln_actionnetwork__call_targets`
WHERE call_id IN (
    SELECT id FROM `actionnetwork_cleaned.cln_actionnetwork__calls`
    WHERE call_campaign_id IN (
        SELECT id FROM `actionnetwork_cleaned.cln_actionnetwork__call_campaigns`
        WHERE group_id IN (SELECT id FROM `actionnetwork_cleaned.cln_actionnetwork__groups` WHERE network_id = {{ filtered_network_id }})
    )
);

-- ============================================================================
-- FILTERING BY LETTER_ID
-- Tables filtered via letter_id -> letters.group_id -> groups.network_id
-- ============================================================================

CREATE OR REPLACE VIEW `{{ target_dataset_name }}.deliveries` AS
SELECT *
FROM `actionnetwork_cleaned.cln_actionnetwork__deliveries`
WHERE letter_id IN (
    SELECT id FROM `actionnetwork_cleaned.cln_actionnetwork__letters`
    WHERE group_id IN (SELECT id FROM `actionnetwork_cleaned.cln_actionnetwork__groups` WHERE network_id = {{ filtered_network_id }})
);

CREATE OR REPLACE VIEW `{{ target_dataset_name }}.delivery_targets` AS
SELECT *
FROM `actionnetwork_cleaned.cln_actionnetwork__delivery_targets`
WHERE delivery_id IN (
    SELECT id FROM `actionnetwork_cleaned.cln_actionnetwork__deliveries`
    WHERE letter_id IN (
        SELECT id FROM `actionnetwork_cleaned.cln_actionnetwork__letters`
        WHERE group_id IN (SELECT id FROM `actionnetwork_cleaned.cln_actionnetwork__groups` WHERE network_id = {{ filtered_network_id }})
    )
);

CREATE OR REPLACE VIEW `{{ target_dataset_name }}.letter_templates` AS
SELECT *
FROM `actionnetwork_cleaned.cln_actionnetwork__letter_templates`
WHERE letter_id IN (
    SELECT id FROM `actionnetwork_cleaned.cln_actionnetwork__letters`
    WHERE group_id IN (SELECT id FROM `actionnetwork_cleaned.cln_actionnetwork__groups` WHERE network_id = {{ filtered_network_id }})
);

-- ============================================================================
-- FILTERING BY EMAIL_ID
-- Tables filtered via email_id -> emails.group_id -> groups.network_id
-- ============================================================================

CREATE OR REPLACE VIEW `{{ target_dataset_name }}.email_campaign_members` AS
SELECT *
FROM `actionnetwork_cleaned.cln_actionnetwork__email_campaign_members`
WHERE email_id IN (
    SELECT id FROM `actionnetwork_cleaned.cln_actionnetwork__emails`
    WHERE group_id IN (SELECT id FROM `actionnetwork_cleaned.cln_actionnetwork__groups` WHERE network_id = {{ filtered_network_id }})
);

CREATE OR REPLACE VIEW `{{ target_dataset_name }}.email_fields` AS
SELECT *
FROM `actionnetwork_cleaned.cln_actionnetwork__email_fields`
WHERE email_id IN (
    SELECT id FROM `actionnetwork_cleaned.cln_actionnetwork__emails`
    WHERE group_id IN (SELECT id FROM `actionnetwork_cleaned.cln_actionnetwork__groups` WHERE network_id = {{ filtered_network_id }})
);

CREATE OR REPLACE VIEW `{{ target_dataset_name }}.email_stats` AS
SELECT *
FROM `actionnetwork_cleaned.cln_actionnetwork__email_stats`
WHERE email_id IN (
    SELECT id FROM `actionnetwork_cleaned.cln_actionnetwork__emails`
    WHERE group_id IN (SELECT id FROM `actionnetwork_cleaned.cln_actionnetwork__groups` WHERE network_id = {{ filtered_network_id }})
);

CREATE OR REPLACE VIEW `{{ target_dataset_name }}.email_tests` AS
SELECT *
FROM `actionnetwork_cleaned.cln_actionnetwork__email_tests`
WHERE email_id IN (
    SELECT id FROM `actionnetwork_cleaned.cln_actionnetwork__emails`
    WHERE group_id IN (SELECT id FROM `actionnetwork_cleaned.cln_actionnetwork__groups` WHERE network_id = {{ filtered_network_id }})
);

-- ============================================================================
-- FILTERING BY EVENT_CAMPAIGN_ID
-- Tables filtered via event_campaign_id -> event_campaigns.group_id -> groups.network_id
-- ============================================================================

CREATE OR REPLACE VIEW `{{ target_dataset_name }}.event_campaign_invites` AS
SELECT *
FROM `actionnetwork_cleaned.cln_actionnetwork__event_campaign_invites`
WHERE event_campaign_id IN (
    SELECT id FROM `actionnetwork_cleaned.cln_actionnetwork__event_campaigns`
    WHERE group_id IN (SELECT id FROM `actionnetwork_cleaned.cln_actionnetwork__groups` WHERE network_id = {{ filtered_network_id }})
);

CREATE OR REPLACE VIEW `{{ target_dataset_name }}.event_campaign_uploads` AS
SELECT *
FROM `actionnetwork_cleaned.cln_actionnetwork__event_campaign_uploads`
WHERE event_campaign_id IN (
    SELECT id FROM `actionnetwork_cleaned.cln_actionnetwork__event_campaigns`
    WHERE group_id IN (SELECT id FROM `actionnetwork_cleaned.cln_actionnetwork__groups` WHERE network_id = {{ filtered_network_id }})
);

CREATE OR REPLACE VIEW `{{ target_dataset_name }}.locations` AS
SELECT *
FROM `actionnetwork_cleaned.cln_actionnetwork__locations`
WHERE event_id IN (
    SELECT id FROM `actionnetwork_cleaned.cln_actionnetwork__events`
    WHERE group_id IN (SELECT id FROM `actionnetwork_cleaned.cln_actionnetwork__groups` WHERE network_id = {{ filtered_network_id }})
);

-- ============================================================================
-- FILTERING BY MOBILE_MESSAGE_ID
-- Tables filtered via mobile_message_id -> mobile_messages.group_id -> groups.network_id
-- ============================================================================

CREATE OR REPLACE VIEW `{{ target_dataset_name }}.mobile_message_fields` AS
SELECT *
FROM `actionnetwork_cleaned.cln_actionnetwork__mobile_message_fields`
WHERE mobile_message_id IN (
    SELECT id FROM `actionnetwork_cleaned.cln_actionnetwork__mobile_messages`
    WHERE group_id IN (SELECT id FROM `actionnetwork_cleaned.cln_actionnetwork__groups` WHERE network_id = {{ filtered_network_id }})
);

CREATE OR REPLACE VIEW `{{ target_dataset_name }}.mobile_message_stats` AS
SELECT *
FROM `actionnetwork_cleaned.cln_actionnetwork__mobile_message_stats`
WHERE mobile_message_id IN (
    SELECT id FROM `actionnetwork_cleaned.cln_actionnetwork__mobile_messages`
    WHERE group_id IN (SELECT id FROM `actionnetwork_cleaned.cln_actionnetwork__groups` WHERE network_id = {{ filtered_network_id }})
);

-- ============================================================================
-- FILTERING BY TICKETED_EVENT_ID
-- Tables filtered via ticketed_event_id -> ticketed_events.group_id -> groups.network_id
-- ============================================================================

CREATE OR REPLACE VIEW `{{ target_dataset_name }}.tickets` AS
SELECT *
FROM `actionnetwork_cleaned.cln_actionnetwork__tickets`
WHERE ticketed_event_id IN (
    SELECT id FROM `actionnetwork_cleaned.cln_actionnetwork__ticketed_events`
    WHERE group_id IN (SELECT id FROM `actionnetwork_cleaned.cln_actionnetwork__groups` WHERE network_id = {{ filtered_network_id }})
);

CREATE OR REPLACE VIEW `{{ target_dataset_name }}.ticket_receipts` AS
SELECT *
FROM `actionnetwork_cleaned.cln_actionnetwork__ticket_receipts`
WHERE ticketed_event_id IN (
    SELECT id FROM `actionnetwork_cleaned.cln_actionnetwork__ticketed_events`
    WHERE group_id IN (SELECT id FROM `actionnetwork_cleaned.cln_actionnetwork__groups` WHERE network_id = {{ filtered_network_id }})
);

CREATE OR REPLACE VIEW `{{ target_dataset_name }}.user_tickets` AS
SELECT *
FROM `actionnetwork_cleaned.cln_actionnetwork__user_tickets`
WHERE ticket_id IN (
    SELECT id FROM `actionnetwork_cleaned.cln_actionnetwork__tickets`
    WHERE ticketed_event_id IN (
        SELECT id FROM `actionnetwork_cleaned.cln_actionnetwork__ticketed_events`
        WHERE group_id IN (SELECT id FROM `actionnetwork_cleaned.cln_actionnetwork__groups` WHERE network_id = {{ filtered_network_id }})
    )
);

-- ============================================================================
-- FILTERING BY LADDER_ID
-- Tables filtered via ladder_id -> ladders.group_id -> groups.network_id
-- ============================================================================

CREATE OR REPLACE VIEW `{{ target_dataset_name }}.steps` AS
SELECT *
FROM `actionnetwork_cleaned.cln_actionnetwork__steps`
WHERE ladder_id IN (
    SELECT id FROM `actionnetwork_cleaned.cln_actionnetwork__ladders`
    WHERE group_id IN (SELECT id FROM `actionnetwork_cleaned.cln_actionnetwork__groups` WHERE network_id = {{ filtered_network_id }})
);

CREATE OR REPLACE VIEW `{{ target_dataset_name }}.user_ladder_statuses` AS
SELECT *
FROM `actionnetwork_cleaned.cln_actionnetwork__user_ladder_statuses`
WHERE ladder_id IN (
    SELECT id FROM `actionnetwork_cleaned.cln_actionnetwork__ladders`
    WHERE group_id IN (SELECT id FROM `actionnetwork_cleaned.cln_actionnetwork__groups` WHERE network_id = {{ filtered_network_id }})
);

-- ============================================================================
-- FILTERING BY FORM_ID
-- Tables filtered via form_id -> forms.group_id -> groups.network_id
-- ============================================================================

CREATE OR REPLACE VIEW `{{ target_dataset_name }}.answers` AS
SELECT *
FROM `actionnetwork_cleaned.cln_actionnetwork__answers`
WHERE form_id IN (
    SELECT id FROM `actionnetwork_cleaned.cln_actionnetwork__forms`
    WHERE group_id IN (SELECT id FROM `actionnetwork_cleaned.cln_actionnetwork__groups` WHERE network_id = {{ filtered_network_id }})
);

-- ============================================================================
-- FILTERING BY PAGE_WRAPPER_ID
-- Tables filtered via page_wrapper_id -> page_wrappers.group_id -> groups.network_id
-- ============================================================================

CREATE OR REPLACE VIEW `{{ target_dataset_name }}.page_actions` AS
SELECT *
FROM `actionnetwork_cleaned.cln_actionnetwork__page_actions`
WHERE page_wrapper_id IN (
    SELECT id FROM `actionnetwork_cleaned.cln_actionnetwork__page_wrappers`
    WHERE group_id IN (SELECT id FROM `actionnetwork_cleaned.cln_actionnetwork__groups` WHERE network_id = {{ filtered_network_id }})
);

-- ============================================================================
-- FILTERING BY DONATION_ID (chained from fundraising)
-- ============================================================================

CREATE OR REPLACE VIEW `{{ target_dataset_name }}.donations_recurring_donations` AS
SELECT *
FROM `actionnetwork_cleaned.cln_actionnetwork__donations_recurring_donations`
WHERE donation_id IN (
    SELECT id FROM `actionnetwork_cleaned.cln_actionnetwork__donations`
    WHERE fundraising_id IN (
        SELECT id FROM `actionnetwork_cleaned.cln_actionnetwork__fundraisings`
        WHERE group_id IN (SELECT id FROM `actionnetwork_cleaned.cln_actionnetwork__groups` WHERE network_id = {{ filtered_network_id }})
    )
);

CREATE OR REPLACE VIEW `{{ target_dataset_name }}.recurring_donations` AS
SELECT *
FROM `actionnetwork_cleaned.cln_actionnetwork__recurring_donations`
WHERE fundraising_id IN (
    SELECT id FROM `actionnetwork_cleaned.cln_actionnetwork__fundraisings`
    WHERE group_id IN (SELECT id FROM `actionnetwork_cleaned.cln_actionnetwork__groups` WHERE network_id = {{ filtered_network_id }})
);

-- ============================================================================
-- FILTERING BY OWNER_ID (owner_id is a group_id)
-- Tables filtered via owner_id -> groups.network_id
-- ============================================================================

CREATE OR REPLACE VIEW `{{ target_dataset_name }}.core_fields` AS
SELECT *
FROM `actionnetwork_cleaned.cln_actionnetwork__core_fields`
WHERE owner_id IN (SELECT id FROM `actionnetwork_cleaned.cln_actionnetwork__groups` WHERE network_id = {{ filtered_network_id }});

CREATE OR REPLACE VIEW `{{ target_dataset_name }}.field_names` AS
SELECT *
FROM `actionnetwork_cleaned.cln_actionnetwork__field_names`
WHERE owner_id IN (SELECT id FROM `actionnetwork_cleaned.cln_actionnetwork__groups` WHERE network_id = {{ filtered_network_id }});

CREATE OR REPLACE VIEW `{{ target_dataset_name }}.source_codes` AS
SELECT *
FROM `actionnetwork_cleaned.cln_actionnetwork__source_codes`
WHERE owner_id IN (SELECT id FROM `actionnetwork_cleaned.cln_actionnetwork__groups` WHERE network_id = {{ filtered_network_id }});

CREATE OR REPLACE VIEW `{{ target_dataset_name }}.user_source_codes` AS
SELECT *
FROM `actionnetwork_cleaned.cln_actionnetwork__user_source_codes`
WHERE owner_id IN (SELECT id FROM `actionnetwork_cleaned.cln_actionnetwork__groups` WHERE network_id = {{ filtered_network_id }});

CREATE OR REPLACE VIEW `{{ target_dataset_name }}.phone_change_logs` AS
SELECT *
FROM `actionnetwork_cleaned.cln_actionnetwork__phone_change_logs`
WHERE owner_id IN (SELECT id FROM `actionnetwork_cleaned.cln_actionnetwork__groups` WHERE network_id = {{ filtered_network_id }});

CREATE OR REPLACE VIEW `{{ target_dataset_name }}.phone_dedupe_logs` AS
SELECT *
FROM `actionnetwork_cleaned.cln_actionnetwork__phone_dedupe_logs`
WHERE owner_id IN (SELECT id FROM `actionnetwork_cleaned.cln_actionnetwork__groups` WHERE network_id = {{ filtered_network_id }});

CREATE OR REPLACE VIEW `{{ target_dataset_name }}.sms_unsubscriptions` AS
SELECT *
FROM `actionnetwork_cleaned.cln_actionnetwork__sms_unsubscriptions`
WHERE owner_id IN (SELECT id FROM `actionnetwork_cleaned.cln_actionnetwork__groups` WHERE network_id = {{ filtered_network_id }});

-- ============================================================================
-- FILTERING BY CORE_FIELD_ID
-- Tables filtered via core_field_id -> core_fields.owner_id -> groups.network_id
-- ============================================================================

CREATE OR REPLACE VIEW `{{ target_dataset_name }}.core_field_timezones` AS
SELECT *
FROM `actionnetwork_cleaned.cln_actionnetwork__core_field_timezones`
WHERE core_field_id IN (
    SELECT id FROM `actionnetwork_cleaned.cln_actionnetwork__core_fields`
    WHERE owner_id IN (SELECT id FROM `actionnetwork_cleaned.cln_actionnetwork__groups` WHERE network_id = {{ filtered_network_id }})
);

CREATE OR REPLACE VIEW `{{ target_dataset_name }}.core_fields_counties` AS
SELECT *
FROM `actionnetwork_cleaned.cln_actionnetwork__core_fields_counties`
WHERE core_field_id IN (
    SELECT id FROM `actionnetwork_cleaned.cln_actionnetwork__core_fields`
    WHERE owner_id IN (SELECT id FROM `actionnetwork_cleaned.cln_actionnetwork__groups` WHERE network_id = {{ filtered_network_id }})
);

CREATE OR REPLACE VIEW `{{ target_dataset_name }}.core_fields_ocdids` AS
SELECT *
FROM `actionnetwork_cleaned.cln_actionnetwork__core_fields_ocdids`
WHERE core_field_id IN (
    SELECT id FROM `actionnetwork_cleaned.cln_actionnetwork__core_fields`
    WHERE owner_id IN (SELECT id FROM `actionnetwork_cleaned.cln_actionnetwork__groups` WHERE network_id = {{ filtered_network_id }})
);

-- ============================================================================
-- FILTERING BY FIELD_NAME_ID
-- Tables filtered via field_name_id -> field_names.owner_id -> groups.network_id
-- ============================================================================

CREATE OR REPLACE VIEW `{{ target_dataset_name }}.field_values` AS
SELECT *
FROM `actionnetwork_cleaned.cln_actionnetwork__field_values`
WHERE field_name_id IN (
    SELECT id FROM `actionnetwork_cleaned.cln_actionnetwork__field_names`
    WHERE owner_id IN (SELECT id FROM `actionnetwork_cleaned.cln_actionnetwork__groups` WHERE network_id = {{ filtered_network_id }})
);

-- ============================================================================
-- REFERENCE TABLES (unfiltered - shared lookup data)
-- ============================================================================

CREATE OR REPLACE VIEW `{{ target_dataset_name }}.counties` AS
SELECT *
FROM `actionnetwork_cleaned.cln_actionnetwork__counties`;

CREATE OR REPLACE VIEW `{{ target_dataset_name }}.ocdids` AS
SELECT *
FROM `actionnetwork_cleaned.cln_actionnetwork__ocdids`;

-- ============================================================================
-- SKIPPED TABLES (uncertain filtering strategy)
-- - filters: has polymorphic filterable_id
-- - share_options: has polymorphic share_id
-- - catalist_syncs: has source_id, client_id (unclear relationship)
-- - user_merge_logs: has merged_user_id, removed_user_id (user-level, no group link)
-- ============================================================================
