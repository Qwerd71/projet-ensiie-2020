<?php
session_start();
set_include_path('.:' . $_SERVER['DOCUMENT_ROOT'] . '/../src');

include_once 'Playlist/Playlist.php';
include_once 'Karas/Kara.php';
include_once 'Karas/KaraRepository.php';
include_once 'Factory/DbAdaperFactory.php';
include_once 'Playlist/PlaylistRepository.php';

if ( !isset($dbAdapter) )
    $dbAdapter = (new DbAdaperFactory())->createService();
if ( !isset($karaRepository) )
    $karaRepository = new \Kara\KaraRepository($dbAdapter);
if ( !isset($playlistRepository) )
    $playlistRepository = new \Playlist\PlaylistRepository($dbAdapter);


try
{
    $playlist_id = htmlspecialchars($_GET['playlist_id']);
    $playlist_all = $playlistRepository->fetchPlaylist($playlist_id, $_SESSION['id'], 1);
    $playlist = $playlist_all[0];
    $karasInPlaylist = $playlist_all[1];
    $karas = $karaRepository->fetchAllNotInPlaylist($playlist_id);
}

catch ( Exception $e )
{
    echo "Error : " . $e->getMessage();
}

catch ( PDOException $err )
{
    header('Location /error.php?error=sqlerror');
    exit();
}
?>

<h1>Playlist consultation :</h1></br>

<a href="/playlists/playlists.php">Go back to all playlists</a>

<h3>Playlist : <?= $playlist->getName()?></h3>
<p>By: <?= $playlist->getCreatorUsername()?></p>
<p>Id: <?= $playlist->getId()?></p>

<div id="karainPlaylistList">
    <ul>
        <?php foreach ($karasInPlaylist as $kara): ?>
            <form method="POST" action="/playlists/deleteKara.php">
                <li id="aKaraInKaraList">
                    <input name="playlist_id" value="<?= $playlist->getId()?>" hidden>
                    <input name="kara_id" value="<?= $kara->getId()?>" hidden>
                    <button class="lebutton" type="button" onclick="toggleKaraInfo(<?= $kara->getId()?>)">Infos</button>
                    <span><?= $kara->getString()?></span>
                    <div id=KaraInfo_<?= $kara->getId()?> style="display: none">
                        <h3>Infos</h3>
                        <ul>
                            <li>Source Name : <?= $kara->getSourceName()?></li>
                            <li>Song Name : <?= $kara->getSongName()?></li>
                            <li>Category : <?php    echo $kara->getCategory();
                                                    echo $kara->getSongNumber();?></li>
                            <li>Author Name : <?= $kara->getAuthorName()?></li>
                            <li>Language : <?= $kara->getLanguage()?></li>
                            <li>ID : <?= $kara->getID()?></li>
                        </ul>
                    </div>
                </li>
            </form>
        <?php endforeach; ?>
    </ul>
</div> 

<script src="/scripts/karaList.js"></script>
