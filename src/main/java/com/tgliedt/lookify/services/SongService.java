package com.tgliedt.lookify.services;
import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.tgliedt.lookify.models.Song;
import com.tgliedt.lookify.repositories.SongRepository;

@Service
public class SongService {
	// adding the song repository as a dependency
    private final SongRepository songRepository;
    
    public SongService(SongRepository songRepository) {
        this.songRepository = songRepository;
    }
    // returns all the songs
    public List<Song> allSongs() {
        return songRepository.findAll();
    }
    // creates a song
    public Song createSong(Song b) {
        return songRepository.save(b);
    }
    // retrieves a song
    public Song findSong(Long id) {
        Optional<Song> optionalSong = songRepository.findById(id);
        if(optionalSong.isPresent()) {
            return optionalSong.get();
        } else {
            return null;
        }
    }
    
    // filter songs by artist name
    public List<Song> filteredSongs(String searchedArtist) {
        List<Song> filteredSongs = songRepository.findByArtistContaining(searchedArtist);
        System.out.println("In song service filteredSongs");
        return filteredSongs;
    }
  //Get all songs ordered by rating
  	public List<Song> findTopTen(){
  		return songRepository.findFirst10ByOrderByRatingDesc();
  	}

 // update a song
    public Song updateSong(Song song) {
    	return songRepository.save(song);
    }
    
    public void deleteSong(Long id) {
    	if (songRepository.existsById(id)) {
    		songRepository.deleteById(id);
    	}
	}
}
