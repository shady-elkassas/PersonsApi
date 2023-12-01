// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let personModel = try? JSONDecoder().decode(PersonModel.self, from: jsonData)

import Foundation

// MARK: - PersonModel
struct PersonModel: Codable {
    let success: Bool?
    let data: [Datum]?
    let additionalData: AdditionalData?
    let relatedObjects: RelatedObjects?

    enum CodingKeys: String, CodingKey {
        case success, data
        case additionalData = "additional_data"
        case relatedObjects = "related_objects"
    }
}

// MARK: - AdditionalData
struct AdditionalData: Codable {
    let pagination: Pagination?
}

// MARK: - Pagination
struct Pagination: Codable {
    let start, limit: Int?
    let moreItemsInCollection: Bool?
    let nextStart: Int?

    enum CodingKeys: String, CodingKey {
        case start, limit
        case moreItemsInCollection = "more_items_in_collection"
        case nextStart = "next_start"
    }
}

// MARK: - Datum
struct Datum: Codable {
    let id, companyID: Int?
    let ownerID: OwnerID?
    let orgID: OrgID?
    let name, firstName, lastName: String?
    let openDealsCount, relatedOpenDealsCount, closedDealsCount, relatedClosedDealsCount: Int?
    let participantOpenDealsCount, participantClosedDealsCount, emailMessagesCount, activitiesCount: Int?
    let doneActivitiesCount, undoneActivitiesCount, filesCount, notesCount: Int?
    let followersCount, wonDealsCount, relatedWonDealsCount, lostDealsCount: Int?
    let relatedLostDealsCount: Int?
    let activeFlag: Bool?
    let phone, email: [Email]?
    let primaryEmail, firstChar, updateTime, addTime: String?
    let visibleTo, marketingStatus: String?
    let pictureID: PictureID?
    let nextActivityDate, nextActivityTime: String?
    let nextActivityID, lastActivityID: Int?
    let lastActivityDate, lastIncomingMailTime, lastOutgoingMailTime: String?
    let label: Int?
    let orgName, ownerName, ccEmail: String?

    enum CodingKeys: String, CodingKey {
        case id
        case companyID = "company_id"
        case ownerID = "owner_id"
        case orgID = "org_id"
        case name
        case firstName = "first_name"
        case lastName = "last_name"
        case openDealsCount = "open_deals_count"
        case relatedOpenDealsCount = "related_open_deals_count"
        case closedDealsCount = "closed_deals_count"
        case relatedClosedDealsCount = "related_closed_deals_count"
        case participantOpenDealsCount = "participant_open_deals_count"
        case participantClosedDealsCount = "participant_closed_deals_count"
        case emailMessagesCount = "email_messages_count"
        case activitiesCount = "activities_count"
        case doneActivitiesCount = "done_activities_count"
        case undoneActivitiesCount = "undone_activities_count"
        case filesCount = "files_count"
        case notesCount = "notes_count"
        case followersCount = "followers_count"
        case wonDealsCount = "won_deals_count"
        case relatedWonDealsCount = "related_won_deals_count"
        case lostDealsCount = "lost_deals_count"
        case relatedLostDealsCount = "related_lost_deals_count"
        case activeFlag = "active_flag"
        case phone, email
        case primaryEmail = "primary_email"
        case firstChar = "first_char"
        case updateTime = "update_time"
        case addTime = "add_time"
        case visibleTo = "visible_to"
        case marketingStatus = "marketing_status"
        case pictureID = "picture_id"
        case nextActivityDate = "next_activity_date"
        case nextActivityTime = "next_activity_time"
        case nextActivityID = "next_activity_id"
        case lastActivityID = "last_activity_id"
        case lastActivityDate = "last_activity_date"
        case lastIncomingMailTime = "last_incoming_mail_time"
        case lastOutgoingMailTime = "last_outgoing_mail_time"
        case label
        case orgName = "org_name"
        case ownerName = "owner_name"
        case ccEmail = "cc_email"
    }
}

// MARK: - Email
struct Email: Codable {
    let value: String?
    let primary: Bool?
    let label: String?
}

// MARK: - OrgID
struct OrgID: Codable {
    let name: String?
    let peopleCount, ownerID: Int?
    let address: String?
    let activeFlag: Bool?
    let ccEmail: String?
    let value, id: Int?

    enum CodingKeys: String, CodingKey {
        case name
        case peopleCount = "people_count"
        case ownerID = "owner_id"
        case address
        case activeFlag = "active_flag"
        case ccEmail = "cc_email"
        case value, id
    }
}

// MARK: - OwnerID
struct OwnerID: Codable {
    let id: Int?
    let name, email: String?
    let hasPic: Int?
    let picHash: String?
    let activeFlag: Bool?
    let value: Int?

    enum CodingKeys: String, CodingKey {
        case id, name, email
        case hasPic = "has_pic"
        case picHash = "pic_hash"
        case activeFlag = "active_flag"
        case value
    }
}

// MARK: - PictureID
struct PictureID: Codable {
    let itemType: String?
    let itemID: Int?
    let activeFlag: Bool?
    let addTime, updateTime: String?
    let addedByUserID: Int?
    let pictures: [String: String]?
    let value, id: Int?

    enum CodingKeys: String, CodingKey {
        case itemType = "item_type"
        case itemID = "item_id"
        case activeFlag = "active_flag"
        case addTime = "add_time"
        case updateTime = "update_time"
        case addedByUserID = "added_by_user_id"
        case pictures, value, id
    }
}

// MARK: - RelatedObjects
struct RelatedObjects: Codable {
    let organization: Organization?
    let user: User?
    let picture: Picture?
}

// MARK: - Organization
struct Organization: Codable {
    let the1: OrgID?

    enum CodingKeys: String, CodingKey {
        case the1 = "1"
    }
}

// MARK: - Picture
struct Picture: Codable {
    let the1: PictureID?

    enum CodingKeys: String, CodingKey {
        case the1 = "1"
    }
}

// MARK: - User
struct User: Codable {
    let the123: OwnerID?

    enum CodingKeys: String, CodingKey {
        case the123 = "123"
    }
}
