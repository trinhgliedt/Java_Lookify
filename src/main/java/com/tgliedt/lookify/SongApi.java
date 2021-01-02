package com.tgliedt.lookify;
import java.util.List;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.tgliedt.lookify.models.Song;
import com.tgliedt.lookify.services.SongService;


@RestController
public class SongApi {
	private final SongService songService;
    public SongApi(SongService songService){
        this.songService = songService;
    }
    @RequestMapping("/api/songs")
    public List<Song> index() {
        return songService.allSongs();
    }
    
    @RequestMapping(value="/api/songs", method=RequestMethod.POST)
    public Song create(@RequestParam(value="title") String title, @RequestParam(value="artist") String artist, @RequestParam(value="rating") Integer rating) {
        Song song = new Song(title, artist, rating);
        return songService.createSong(song);
    }
    
    @RequestMapping("/api/songs/{id}")
    public Song show(@PathVariable("id") Long id) {
        Song song = songService.findSong(id);
        return song;
    }
    
    @RequestMapping("/api/songs/search/{searchedArtist}")
    public List<Song> search(@PathVariable("searchedArtist") String searchedArtist) {
        return songService.filteredSongs(searchedArtist);
    }
    
    @RequestMapping(value="/api/songs/{id}/edit", method=RequestMethod.PUT)
	public Song update(@ModelAttribute("song") Song song) {
		Song updateSong = songService.updateSong(song);
		return updateSong;
	}
    
    @RequestMapping(value="/api/songs/{id}", method=RequestMethod.DELETE)
    public void destroy(@PathVariable("id") Long id) {
        songService.deleteSong(id);
    }
}
