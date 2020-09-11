/// @description  Inherit damage logic
event_inherited();


/// Piercing logic

if (team == -1) { exit; }
if (other.team == team) { exit; }

if (!piercing) {
  if (on_death) {
    script_execute(on_death, other.id);
  }
  instance_destroy();
}

