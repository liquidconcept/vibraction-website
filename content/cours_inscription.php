<?php
header('Content-type: text/html; charset=utf-8');
?>

<div id="main">
<div class="container">
  <h1>Inscription à un cours</h1>
  <p>Merci de complèter le formulaire d'inscription ci-dessous. Je vous contacterai dans les prochains jours pour vous donner les informations complémentaires liées au cours que vous venez de choisir.</p>
  <?php if ($_GET['callback'] == 'success') {  ?>
    <p class="info-succes">Votre email a bien été envoyé</p>
  <?php } else if ($_GET['callback'] == 'error') { ?>
    <p class="info-error">Votre email n'a pas été envoyé</p>
  <?php } ?>
  <div class="twocol">
    <div class="col1">
      <form action="./sendmail_cours.php" method="post">
          <input name="process" value="1" type="hidden" />

          <input name="email_to" value="info@vibraction.ch" type="hidden" />
          <input name="email_subject" value="Vibraction.ch - Inscription" type="hidden" />

        <table>
          <tr>
          <td><input name="input_list[cours_name]" value="Cours" type="hidden" />
            <p><label for="cours_name">Cours</label></p></td>
            <td><p>
              <input id="cours_name" class="text" name="cours_name_view" size="40" type="text" value="<?php echo $_GET['cours_name']  ?>" disabled="disabled" />
              <input name="cours_name" type="hidden" value="<?php echo $_GET['cours_name']  ?>" />
            </p></td>
          </tr>
          <tr>
          <tr>
          <td><input name="input_list[cours_date]" value="Date" type="hidden" />
            <p><label for="cours_date">Dates</label></p></td>
            <td><p>
              <input id="cours_date" class="text" name="cours_date_view" size="40" type="text" value="<?php echo $_GET['cours_date']  ?>" disabled="disabled" />
              <input name="cours_date" type="hidden" value="<?php echo $_GET['cours_date']  ?>" />
            </p></td>
          </tr>
          <tr>
          <tr>
          <td><input name="input_list[nom]" value="Nom" type="hidden" />
            <p><label for="nom">Nom</label></p></td>
          <td><p><input id="nom" class="text" name="nom" size="40" type="text" /></p></td>
          </tr>
          <tr>
          <td><input name="input_list[prenom]" value="Prénom" type="hidden" />
            <p><label for="prenom">Prénom</label></p></td>
          <td><p><input id="prenom" class="text" name="prenom" size="40" type="text" /></p></td>
          </tr>
          <tr>
          <td><input name="input_list[email_from]" value="E-Mail" type="hidden" />
            <p><label for="email_from">Email</label></p></td>
          <td><p><input id="email_from" class="text" name="email_from" size="40" type="text" /></p></td>
          </tr>
          <tr>
          <td><input name="input_list[tel]" value="Tél." type="hidden" />
            <p><label for="tel">Téléphone</label></p></td>
          <td><p><input id="tel" class="text" name="tel" size="40" type="text" /></p></td>
          </tr>
          <tr>
          <td><input name="input_list[address_1]" value="Adresse 1" type="hidden" />
            <p><label for="address-1">Adresse</label></p></td>
          <td><p><input id="address-1" class="text" name="address_1" size="40" type="text" /></p></td>
          </tr>
          <tr>
          <td><input name="input_list[address_2]" value="Adresse 2" type="hidden" />
            <p><label for="address-2">&nbsp;</label></p></td>
          <td><p><input id="address-2" class="text" name="address_2" size="40" type="text" /></p></td>
          </tr>
          <tr>
          <td><input name="input_list[npa]" value="NPA" type="hidden" />
            <p><label for="npa">NPA</label></p></td>
          <td><p><input id="npa" class="text" name="npa" size="40" type="text" /></p></td>
          </tr>
          <tr>
          <td><input name="input_list[city]" value="Ville" type="hidden" />
            <p><label for="city">Ville</label></p></td>
          <td><p><input id="city" class="text" name="city" size="40" type="text" /></p></td>
          </tr>
          <tr>
          <td><input name="input_list[comment]" value="Commentaire" type="hidden" />
            <p><label for="comment">Commentaire</label></p></td>
          <td><p><textarea id="comment" class="text" name="comment" cols="40" rows="10" ></textarea></p></td>
          </tr>
        </table>


          <p class="right">Merci pour votre inscription. A bientôt, Corinne.

          <input name="redirect_to" value="http://www.vibraction.ch" type="hidden" />
          <input class="submit" name="submit" value="Envoyer" type="submit" /></p>
        </form>
    <div class="col2">
    </div>
    </div>
    <hr class="clear" />
  </div>

</div>
