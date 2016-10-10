class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def genre_id=(genre_id)
    self.genre = Genre.find(genre_id)
  end
  def genre_id
    begin
    self.genre.id
    rescue
      "No Name given"
    end
  end
  def genre_name=(genre_name)
    self.genre = Genre.find_or_create_by(name:genre_name)
  end
  def genre_name
    begin
    self.genre.name
    rescue
      "No Name given"
    end
  end

   def artist_name=(artist_name)
    #  self.artist = Artist.find_or_create_by(:name => artist_name)
     artist = Artist.find_or_create_by(name: artist_name)
     self.artist = artist
   end
   def artist_name
     begin
       self.artist.name
     rescue
       "No Name given"
     end
   end

   def note_contents=(notes_content)

     notes_content.each do |note_content|
      #  note = Note.find_or_create_by(content: note_content)
       note = Note.create(content: note_content)
       self.notes << note
     end
   end
   #
   def note_contents
     arr = []
     begin
     self.notes.each do |note|
       arr << note.content
     end
     arr.reject { |c| c.empty? }
    rescue
      " "
    end
   end



end
