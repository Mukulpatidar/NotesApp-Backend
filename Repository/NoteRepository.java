package com.example.notesapp.Repository;

import com.example.notesapp.Model.*;
import org.springframework.data.jpa.repository.JpaRepository;

public interface NoteRepository extends JpaRepository<Note, Long> {
}
