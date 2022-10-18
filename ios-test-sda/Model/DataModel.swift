//
//  DataModel.swift
//  ios-test-sda
//
//  Created by Tenti Atika Putri on 16/10/22.
//

import Foundation

struct DataModel: Decodable {
    let page, perPage, total, totalPages: Int
    let data: [userData]

    enum CodingKeys: String, CodingKey {
        case page
        case perPage = "per_page"
        case total
        case totalPages = "total_pages"
        case data
    }
}

struct userData: Decodable {
    let id: Int
    let email, firstName, lastName: String
    let avatar: String

    enum CodingKeys: String, CodingKey {
        case id, email
        case firstName = "first_name"
        case lastName = "last_name"
        case avatar
    }
}

struct DummyCoordinatesModel {
    let id: Int
    let latitude, longitude: Double
}

let dummyDataModel = [
    DummyCoordinatesModel(
        id: 1,
        latitude: 46.920042474467316,
        longitude: -123.20909152037318
    ), DummyCoordinatesModel(
        id: 2,
        latitude: 46.92006570744287,
        longitude: -123.1959577120827
    ), DummyCoordinatesModel(
        id: 3,
        latitude: 47.08508535995386,
        longitude: -122.41653442382814
    ), DummyCoordinatesModel(
        id: 4,
        latitude: 47.09139684143848,
        longitude: -122.40709304809572
    ), DummyCoordinatesModel(
        id: 5,
        latitude: 47.09455230173162,
        longitude: -122.39112854003908
    ), DummyCoordinatesModel(
        id: 6,
        latitude: 47.087306151678725,
        longitude: -122.39009857177734
    ), DummyCoordinatesModel(
        id: 7,
        latitude: 47.08204623176737,
        longitude: -122.39099979400636
    ), DummyCoordinatesModel(
        id: 8,
        latitude: 47.08201700853939,
        longitude: -122.40048408508302
    ), DummyCoordinatesModel(
        id: 9,
        latitude: 47.08040970631566,
        longitude: -122.41644859313966
    ), DummyCoordinatesModel(
        id: 10,
        latitude: 47.087306151678725,
        longitude: -122.39258766174318
    ), DummyCoordinatesModel(
        id: 11,
        latitude: 47.08175399876639,
        longitude: -122.3913860321045
    ), DummyCoordinatesModel(
        id: 12,
        latitude: 47.10033682668275,
        longitude: -122.39996910095216
    ), DummyCoordinatesModel(
        id: 13,
        latitude: 47.098554792538714,
        longitude: -122.40451812744142
    ), DummyCoordinatesModel(
        id: 14,
        latitude: 47.09665583805799,
        longitude: -122.3806142807007
    ), DummyCoordinatesModel(
        id: 15,
        latitude: 47.101680616262186,
        longitude: 47.101680616262186
    ),
]
