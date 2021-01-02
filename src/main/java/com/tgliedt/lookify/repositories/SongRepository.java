package com.tgliedt.lookify.repositories;
import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.tgliedt.lookify.models.Song;


@Repository
public interface SongRepository extends CrudRepository<Song, Long> {
	// this method retrieves all the songs from the database
    List<Song> findAll();
    
    List<Song> findByArtistContaining(String searchStr);
    List<Song> findFirst10ByOrderByRatingDesc();
	
	
}
