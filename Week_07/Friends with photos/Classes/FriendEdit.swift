//
//  FriendEdit.swift
//  Friends
//
//  Created by Peter McIntyre on 2015-02-11.
//  Copyright (c) 2015 School of ICT, Seneca College. All rights reserved.
//

import UIKit

class FriendEdit: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    // MARK: - Properties
    
    var delegate: EditItemDelegate?
    var model: Model!
    var friend: Friend?
    var photo: UIImage?
    
    // MARK: - User interface
    
    @IBOutlet weak var friendName: UITextField!
    @IBOutlet weak var course: UITextField!
    @IBOutlet weak var phone: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var selectedPhoto: UIImageView!
    
    // MARK: - User actions
    
    @IBAction func takePhoto(sender: UIButton) {

        // Create an instance of the image picker
        let imagePicker = UIImagePickerController()
        
        // Check whether the device has a camera - if not, we'll use the photo library
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera) {
            
            // Camera action
            imagePicker.sourceType = UIImagePickerControllerSourceType.Camera
            
        } else {
            
            // Photo library action
            imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        }
        
        // Set this object to be its delegate; we do this for code-created controllers/objects
        imagePicker.delegate = self
        
        // Don't support editing for now
        imagePicker.allowsEditing = false
        
        // Present the image picker
        self.presentViewController(imagePicker, animated: true, completion: nil)
    }

    @IBAction func cancel(sender: UIBarButtonItem) {
        
        delegate?.editItemDelegate(self, didEditItem: nil)
    }
    
    @IBAction func save(sender: UIBarButtonItem) {

        // If a passed-in Friend object exists,
        // we're in 'edit item' mode
        // Otherwise, we're in 'add item' mode,
        // and we need to create a new Friend object

        if friend == nil {
            
            friend = model.addNew("Friend") as? Friend
        }

        // Configure the object's attributes
        friend?.friendName = friendName.text
        friend?.course = course.text
        friend?.phone = phone.text
        friend?.email = email.text
        friend?.dateAdded = NSDate()
        friend?.photo = UIImagePNGRepresentation(self.photo)

        delegate?.editItemDelegate(self, didEditItem: friend)
    }
    
    // MARK: - View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // If a Friend object was passed in, 
        // use its values to configure the user interface
        
        if let f = friend {
            
            friendName.text = f.friendName
            course.text = f.course
            phone.text = f.phone
            email.text = f.email
            selectedPhoto.image = UIImage(data: f.photo)
        }
    }
    
    // MARK: - Delegate methods

    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {

        // Get the image that was selected
        let selectedImage: UIImage = (info as NSDictionary).objectForKey("UIImagePickerControllerOriginalImage") as UIImage
        
        let imgRef: CGImageRef = selectedImage.CGImage
        let w: UInt = CGImageGetWidth(imgRef)
        let h: UInt = CGImageGetHeight(imgRef)
        let orient: UIImageOrientation = selectedImage.imageOrientation

        // If the image is too big, scale it smaller

        var image: UIImage? = nil
        
        // Save the image to a property of this class
        // Which can then be used by the 'save' method
        
        self.photo = selectedImage
        
        selectedPhoto.image = selectedImage
        
        // Dismiss the view controller
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
}

protocol EditItemDelegate {
    
    func editItemDelegate(controller: AnyObject, didEditItem item: AnyObject?)
}
