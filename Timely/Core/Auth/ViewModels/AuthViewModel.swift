//
//  AuthViewModel.swift
//  Timely2.0
//
//  Created by user2 on 06/02/24.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

protocol AuthenticationFormProtocol{
    var formIsValid: Bool {get}
}


@MainActor
class AuthViewModel: ObservableObject{
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    
    init(){
        self.userSession = Auth.auth().currentUser
        Task{
            await fetchUser()
        }
    }
    
    func signIn(withEmail email: String, password: String) async throws {
        do{
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            await fetchUser()
        } catch {
            print("failed to login with error \(error.localizedDescription)")
        }
    }
    
    
    func createUser(withEmail email: String, password: String, username: String) async throws{
        do{
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            let user = User(id: result.user.uid, username: username, email: email)
            let encodedUser = try Firestore.Encoder().encode(user)
            try await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
            await fetchUser()
        }catch{
            print("failed \(error.localizedDescription)")
        }
    }
    
    func createTask(venue: String, dateTime: Date, category: String ) async {
           guard let userId = Auth.auth().currentUser?.uid else { return }

           do {
               let task = UserTask(id:userId , venue: venue,dateTime: dateTime, category: category, isCompleted: false)
               
               // Encode and store the task in Firestore under the "tasks" collection
               let encodedTask = try Firestore.Encoder().encode(task)
               let documentRef = try await Firestore.firestore().collection("tasks").document(userId).setData(encodedTask)
               
               // Get the auto-generated task ID and associate it with the user
               let taskId = documentRef.documentID
               try await Firestore.firestore().collection("tasks").document(userId).updateData(["tasks": FieldValue.arrayUnion([taskId])])
               
               // Fetch the user to update the currentUser
               await fetchUser()
           } catch {
               print("Failed to create task: \(error.localizedDescription)")
           }
       }
//
//       func fetchTasks() async {
//           guard let userId = Auth.auth().currentUser?.uid else { return }
//
//           do {
//               // Fetch the user to get the task IDs associated with the user
//               let userSnapshot = try await Firestore.firestore().collection("users").document(userId).getDocument()
//               if let taskIds = userSnapshot.data()?["tasks"] as? [String] {
//                   // Fetch each task using its ID
//                   let tasks = try await Task.fetchTasks(taskIds: taskIds)
//                   print("Fetched tasks: \(tasks)")
//               }
//           } catch {
//               print("Failed to fetch tasks: \(error.localizedDescription)")
//           }
//       }
   
    
    func signOut(){
        do{
            try Auth.auth().signOut()
            self.userSession = nil
            self.currentUser = nil
        }catch{
            print("fail to signout\(error.localizedDescription)")
        }
    }
    func deleteAccount(){
        
    }
    func fetchUser() async {
        guard let uid = Auth.auth().currentUser?.uid else {return}
        
        guard let snapshot = try? await Firestore.firestore().collection("users").document(uid).getDocument() else {return}
                
        self.currentUser = try? snapshot.data(as: User.self)
        
    }
}
