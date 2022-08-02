# Fix for the URL-encoded labels
Tested versions: rtorrent v0.9.8 / rutorrent v3.10

This a fix for an issue in rutorrent where labels created via its WebUI are URL-encoded, compared to rtorrent itself where the labels are not encoded and preserve pathnames including spaces.

For example, a label created in rutorrent `/Label1/Label2 with space/Label3` would actually be stored as `Label1%2Label2%20with%20spaces%2Label3`. This is not an issue when creating the label directly in rtorrent via scripting.

This is problematic when scripting in rtorrent.rc and using the label variable `$d.custom1=`, for example when trying to move a torrent based on the label would place the torrent in a pathname `Label1%2Label2%20with%20spaces%2Label3` and not `/Label1/Label2 with space/Label3` as intended.

So the idea is to decode the label. As far as I know, rtorrent scripting doesn't have such a capability, so we have to do it in a bash script then set `$d.custom1=` with the proper string. After a rehash, the label is properly stored in the session file of the torrent.

And indeed, the autotools plugin in rutorrent does decode the label when parsing it and moving torrents https://github.com/Novik/ruTorrent/blob/master/plugins/autotools/move.php#L96

The included .rc and .sh files are well commented and descriptive.

# Issue references
- https://github.com/rakshasa/rtorrent/issues/1174
- https://github.com/rakshasa/rtorrent/issues/1050#issuecomment-1140436216
- https://github.com/Novik/ruTorrent/issues/913
