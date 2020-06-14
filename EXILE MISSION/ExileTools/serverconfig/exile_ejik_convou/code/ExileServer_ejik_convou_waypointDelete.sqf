/**
 * ExileServer_ejik_convou_waypointDelete
 * © 2018 ejik designer
 *
 */
private["_groups"];
_groups = _this;
{
	deleteWaypoint _x;
}forEach (waypoints _groups);
true