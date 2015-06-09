//
//  CommentEntity.swift
//
//  This code was generated by AlecrimCoreData code generator tool.
//
//  Changes to this file may cause incorrect behavior and will be lost if
//  the code is regenerated.
//

import Foundation
import CoreData

import AlecrimCoreData

public class CommentEntity: NSManagedObject {

    @NSManaged public var content: String?
    @NSManaged public var creationDate: NSDate?
    @NSManaged public var id: Int32 // cannot mark as optional because Objective-C compatibility issues
    @NSManaged public var modifiedDate: NSDate?
    @NSManaged public var status: String?

    @NSManaged public var author: AuthorEntity?
    @NSManaged public var notification: NotificationEntity?
    @NSManaged public var parent: CommentEntity?
    @NSManaged public var post: BlogPostEntity?

}

// MARK: - AlecrimCoreData query attributes

extension CommentEntity {

    public static let content = AlecrimCoreData.Attribute<String?>("content")
    public static let creationDate = AlecrimCoreData.Attribute<NSDate?>("creationDate")
    public static let id = AlecrimCoreData.Attribute<Int32?>("id")
    public static let modifiedDate = AlecrimCoreData.Attribute<NSDate?>("modifiedDate")
    public static let status = AlecrimCoreData.Attribute<String?>("status")

    public static let author = AuthorEntityAttribute<AuthorEntity?>("author")
    public static let notification = NotificationEntityAttribute<NotificationEntity?>("notification")
    public static let parent = CommentEntityAttribute<CommentEntity?>("parent")
    public static let post = BlogPostEntityAttribute<BlogPostEntity?>("post")

}

public class CommentEntityAttribute<T>: AlecrimCoreData.SingleEntityAttribute<T> {

    public override init(_ name: String) { super.init(name) }

    public lazy var content: AlecrimCoreData.Attribute<String?> = { AlecrimCoreData.Attribute<String?>("\(self.___name).content") }()
    public lazy var creationDate: AlecrimCoreData.Attribute<NSDate?> = { AlecrimCoreData.Attribute<NSDate?>("\(self.___name).creationDate") }()
    public lazy var id: AlecrimCoreData.Attribute<Int32?> = { AlecrimCoreData.Attribute<Int32?>("\(self.___name).id") }()
    public lazy var modifiedDate: AlecrimCoreData.Attribute<NSDate?> = { AlecrimCoreData.Attribute<NSDate?>("\(self.___name).modifiedDate") }()
    public lazy var status: AlecrimCoreData.Attribute<String?> = { AlecrimCoreData.Attribute<String?>("\(self.___name).status") }()

    public lazy var author: AuthorEntityAttribute<AuthorEntity?> = { AuthorEntityAttribute<AuthorEntity?>("\(self.___name).author") }()
    public lazy var notification: NotificationEntityAttribute<NotificationEntity?> = { NotificationEntityAttribute<NotificationEntity?>("\(self.___name).notification") }()
    public lazy var parent: CommentEntityAttribute<CommentEntity?> = { CommentEntityAttribute<CommentEntity?>("\(self.___name).parent") }()
    public lazy var post: BlogPostEntityAttribute<BlogPostEntity?> = { BlogPostEntityAttribute<BlogPostEntity?>("\(self.___name).post") }()

}
