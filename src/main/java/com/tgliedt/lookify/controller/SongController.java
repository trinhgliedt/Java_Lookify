package com.tgliedt.lookify.controller;
import java.util.List;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.tgliedt.lookify.models.Song;
import com.tgliedt.lookify.services.SongService;

@Controller
public class SongController {
private final SongService songService;
    
    public SongController(SongService songService) {
        this.songService = songService;
    }
    
    @RequestMapping("/")
    public String index() {
        return "index.jsp";
    }
    
    @RequestMapping("/dashboard")
    public String dashboard(Model model) {
        List<Song> songs = songService.allSongs();
        model.addAttribute("songs", songs);
        return "dashboard.jsp";
    }
    
    @RequestMapping("/search/topTen")
	public String topTen(Model model) {
		List<Song> songs = songService.findTopTen();
		model.addAttribute("songs", songs);
		return "topTen.jsp";
	}
    
    @PostMapping("/search")
	public String renderSearchQuery(@RequestParam(value="artist") String searchedArtist, Model model) {
    	System.out.println("In search Post route");
    	List<Song> filteredSongs = songService.filteredSongs(searchedArtist);
        model.addAttribute("songs", filteredSongs);
        model.addAttribute("artist", searchedArtist);
		return "redirect:/search/"+searchedArtist;
	}
    
    @RequestMapping("/search/{searchedArtist}")
    public String search(@PathVariable("searchedArtist") String searchedArtist, Model model) {
    	System.out.println("In search get route");
        List<Song> filteredSongs = songService.filteredSongs(searchedArtist);
        model.addAttribute("songs", filteredSongs);
        model.addAttribute("artist", searchedArtist);
        return "search.jsp";
    }
    
    @RequestMapping("/new")
    public String newSong(@ModelAttribute("song") Song song) {
        return "new.jsp";
    }
    
//    @RequestMapping(value="/", method=RequestMethod.POST)
    @PostMapping("/dashboard")
    public String create(Model model, @Valid @ModelAttribute("song") Song song, BindingResult result) {
//    	List<Song> songs = songService.allSongs();
//		model.addAttribute("songs", songs);
        if (result.hasErrors()) {
            return "new.jsp";
        } else {
            songService.createSong(song);
            return "redirect:/dashboard";
        }
    }

    
    @RequestMapping("/{id}")
    public String Song(@PathVariable("id") Long id, Model model) {
    	Song song = songService.findSong(id);
    	model.addAttribute(song);
        return "/singleSong.jsp";
    }
    
    
    
    
    @RequestMapping("/{id}/edit")
    public String edit(@PathVariable("id") Long id, Model model) {
        Song Song = songService.findSong(id);
        model.addAttribute("Song", Song);
        return "/edit.jsp";
    }
    
    @RequestMapping(value="/{id}", method=RequestMethod.PUT)
    public String update(@Valid @ModelAttribute("Song") Song song, BindingResult result) {
        if (result.hasErrors()) {
            return "/edit.jsp";
        } else {
            songService.updateSong(song);
            return "redirect:/dashboard";
        }
    }
    
    
    
   
    @RequestMapping(value="/delete/{id}", method=RequestMethod.DELETE)
	public String destroy(@PathVariable("id") Long id) {
		songService.deleteSong(id);
		return "redirect:/dashboard";
	}
}
