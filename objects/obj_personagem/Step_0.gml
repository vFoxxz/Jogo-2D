 //Variáveis
 var move, left, right, jump, dash, val_dash
 
//ANDAR
  

left = keyboard_check(ord("A"))
right = keyboard_check(ord("D"))//Verifica clique da tecla, sendo o - para esquerda e o + para direita
jump = keyboard_check_pressed(vk_space)
dash = keyboard_check_pressed(vk_shift)


vsp += grav

if(estado == "andando") {
move = right - left
hsp = move*spd
}



//Sistema de Dash

if(estado == "dash") {
	if(hsp > 0) {
	instance_create_layer(x, y, "Instances", obj_personagem_sombraRight)
	}
	if(hsp < 0) {
	instance_create_layer(x, y, "Instances", obj_personagem_sombraLeft)
	}
	
	val_dash = (right-left) * tamanho_dash
	hsp = lerp(hsp, val_dash, 0.2)
	x += hsp
}

if (dash && dar_dash == true) {
	
	dar_dash = false
	estado = "dash"
	if(ala_dash == false) 
	{
	alarm[0] = room_speed * 0.1
	ala_dash = true
	}
}

if(place_meeting(x, y+1, obj_colisores)) {
	dar_dash = true
}



//Colisão Horizontal
if(place_meeting(x+hsp, y, obj_colisores)) {
	estado = "andando"
	while(!place_meeting(x+sign(hsp), y, obj_colisores)) {
		x+=sign(hsp)
	}
	hsp = 0
}

x+=hsp
	
	
	
//Colisão Vertical
if(place_meeting(x, y+vsp, obj_colisores)) {
	
	while(!place_meeting (x, y+sign(vsp), obj_colisores)) {
		y+=sign(vsp)
	}
	vsp = 0
}

y+=vsp


//Pular
 if(place_meeting(x, y+1, obj_colisores) && jump) {
	pulos = 2
	vsp = -10
}


//Pulo Duplo
if keyboard_check_pressed(vk_space) && pulos > 0 {
	vsp = jspd 
	pulos -=1
}




//Virar boneco
if(hsp < 0) {
image_xscale = -1
}
if(hsp > 0) {
image_xscale = 1
}


//Animação
if(hsp = 0) {
if place_meeting(x, y+1, obj_colisores)
{
sprite_index = spr_playerIdle
}
}


if(hsp != 0) {
if place_meeting(x, y+1, obj_colisores)
{
sprite_index = spr_playerWalk
}
}

if(keyboard_check_pressed(vk_space)) {
	sprite_index = spr_playerJump
}











 




                 