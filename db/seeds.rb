# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(
              [
                { first_name: 'Monica', last_name: 'Geller', email: 'monica@gmail.com' },
                { first_name: 'Joe', last_name: '', email: 'joe@gmail.com' },
                { first_name: 'Ross', last_name: 'Geller', email: 'ross@gmail.com' },
                { first_name: 'Chandler', last_name: 'Bing', email: 'chandler@gmail.com' },
                { first_name: 'Rachel', last_name: 'Green', email: 'rachel@gmail.com' },
                { first_name: 'Erica', last_name: '', email: 'erica@gmail.com' }
              ]
            )

Post.create(
            [
              { title: 'Blog Title 1', content: 'Content 1', summary: 'Summary 1', author_id: 1, status: 3 },
              { title: 'Blog Title 2', content: 'Content 2', summary: 'Summary 2', author_id: 2, status: 2 },
              { title: 'Blog Title 3', content: 'Content 3', summary: 'Summary 3', author_id: 2, status: 3 },
              { title: 'Blog Title 4', content: 'Content 4', summary: 'Summary 4', author_id: 3, status: 2 },
              { title: 'Blog Title 5', content: 'Content 5', summary: 'Summary 5', author_id: 3, status: 3 }
            ]
           )

Comment.create(
                [
                  { user_id: 4, post_id: 1, content: 'Comment 1' },
                  { user_id: 4, post_id: 1, content: 'Comment 2' },
                  { user_id: 4, post_id: 1, content: 'Comment 3' },
                  { user_id: 5, post_id: 2, content: 'Comment 4' },
                  { user_id: 5, post_id: 3, content: 'Comment 5' },
                  { user_id: 5, post_id: 3, content: 'Comment 6' },
                  { user_id: 5, post_id: 2, content: 'Comment 7' },
                  { user_id: 2, post_id: 4, content: 'Comment 8' },
                  { user_id: 2, post_id: 4, content: 'Comment 9' },
                  { user_id: 1, post_id: 5, content: 'Comment 10' },
                  { user_id: 1, post_id: 5, content: 'Comment 11' }
                ]
              )

CommentReaction.create(
                        [
                          { user_id: 5, comment_id: 1, reaction_type: 0 },
                          { user_id: 5, comment_id: 2, reaction_type: 1 },
                          { user_id: 5, comment_id: 3, reaction_type: 2 },
                          { user_id: 5, comment_id: 4, reaction_type: 1 },
                          { user_id: 5, comment_id: 7, reaction_type: 2 },
                          { user_id: 6, comment_id: 3, reaction_type: 2 },
                          { user_id: 6, comment_id: 1, reaction_type: 1 },
                          { user_id: 6, comment_id: 2, reaction_type: 1 },
                          { user_id: 6, comment_id: 4, reaction_type: 0 },
                          { user_id: 6, comment_id: 7, reaction_type: 0 },
                          { user_id: 6, comment_id: 8, reaction_type: 1 }
                        ]
                      )