package spring.jpa.repository;
import java.util.Date;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import spring.jpa.model.Produit;
public interface ProduitRepository extends JpaRepository<Produit, Long> {
// Retourner la page des Produits selon une recherche par designation
Page<Produit> findByDesignationLike(String mc, Pageable pageable);
Page<Produit> findByDesignationLikeAndActif(String mc,boolean actif, Pageable pageable);
Page<Produit> findByDateAchatBetween(Date dateDebut, Date dateFin, Pageable pageable);
Page<Produit> findByCategorieLibelleLike(String mg, Pageable pageable);
Page<Produit> findByDateAchatBefore(Date dateAvant, Pageable pageable);
Page<Produit> findByDateAchatAfter(Date dateApres, Pageable pageable);
}