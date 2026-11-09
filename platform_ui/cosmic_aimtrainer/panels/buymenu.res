resource/ui/menus/cosmic_aimtrainer/panels/buymenu.res
{
	// One weapon category tab: up to 12 weapon cards (4 x 3), filled by
	// ui_cat_weaponselector.gnut. Port of R5R panels/buymenu1..5.res.
	PanelFrame
	{
		ControlName	Label
		xpos	0
		ypos	0
		wide	%100
		tall	%100
		labelText	""
		visible	1
	}

		CardFrame0
		{
			ControlName	ImagePanel
			xpos	0
			ypos	0
			wide	255
			tall	150
			zpos	1
			visible	1
			scaleImage	1
			fillColor	"30 30 30 200"
			drawColor	"30 30 30 200"
		}

		CardSel0
		{
			ControlName	ImagePanel
			xpos	0
			ypos	0
			wide	255
			tall	150
			zpos	2
			visible	0
			scaleImage	1
			fillColor	"105 63 1 220"
			drawColor	"105 63 1 220"
		}

		CardImg0
		{
			ControlName	RuiPanel
			xpos	28
			ypos	22
			wide	200
			tall	86
			zpos	3
			visible	1
			rui	"ui/basic_image.rpak"
		}

		CardName0
		{
			ControlName	Label
			xpos	0
			ypos	110
			wide	255
			tall	34
			zpos	4
			visible	1
			labelText	""
			textAlignment	center
			font	Default_27
			fontHeight	26
			fgcolor_override	"2 252 240 255"
		}

		CardTag0
		{
			ControlName	Label
			xpos	8
			ypos	4
			wide	240
			tall	22
			zpos	4
			visible	1
			labelText	""
			textAlignment	west
			font	TitleBoldFont
			fontHeight	18
			fgcolor_override	"252 198 3 255"
		}

		CardButton0
		{
			ControlName	RuiButton
			xpos	0
			ypos	0
			wide	255
			tall	150
			zpos	6
			visible	1
			enabled	1
			scriptID	0
			rui	"ui/invisible.rpak"
			labelText	""
			sound_focus	"UI_Menu_Focus"
			sound_accept	"UI_Menu_Accept"
			cursorVelocityModifier	0.7
			rightClickEvents	1
		}

		CardFrame1
		{
			ControlName	ImagePanel
			xpos	275
			ypos	0
			wide	255
			tall	150
			zpos	1
			visible	1
			scaleImage	1
			fillColor	"30 30 30 200"
			drawColor	"30 30 30 200"
		}

		CardSel1
		{
			ControlName	ImagePanel
			xpos	275
			ypos	0
			wide	255
			tall	150
			zpos	2
			visible	0
			scaleImage	1
			fillColor	"105 63 1 220"
			drawColor	"105 63 1 220"
		}

		CardImg1
		{
			ControlName	RuiPanel
			xpos	303
			ypos	22
			wide	200
			tall	86
			zpos	3
			visible	1
			rui	"ui/basic_image.rpak"
		}

		CardName1
		{
			ControlName	Label
			xpos	275
			ypos	110
			wide	255
			tall	34
			zpos	4
			visible	1
			labelText	""
			textAlignment	center
			font	Default_27
			fontHeight	26
			fgcolor_override	"2 252 240 255"
		}

		CardTag1
		{
			ControlName	Label
			xpos	283
			ypos	4
			wide	240
			tall	22
			zpos	4
			visible	1
			labelText	""
			textAlignment	west
			font	TitleBoldFont
			fontHeight	18
			fgcolor_override	"252 198 3 255"
		}

		CardButton1
		{
			ControlName	RuiButton
			xpos	275
			ypos	0
			wide	255
			tall	150
			zpos	6
			visible	1
			enabled	1
			scriptID	1
			rui	"ui/invisible.rpak"
			labelText	""
			sound_focus	"UI_Menu_Focus"
			sound_accept	"UI_Menu_Accept"
			cursorVelocityModifier	0.7
			rightClickEvents	1
		}

		CardFrame2
		{
			ControlName	ImagePanel
			xpos	550
			ypos	0
			wide	255
			tall	150
			zpos	1
			visible	1
			scaleImage	1
			fillColor	"30 30 30 200"
			drawColor	"30 30 30 200"
		}

		CardSel2
		{
			ControlName	ImagePanel
			xpos	550
			ypos	0
			wide	255
			tall	150
			zpos	2
			visible	0
			scaleImage	1
			fillColor	"105 63 1 220"
			drawColor	"105 63 1 220"
		}

		CardImg2
		{
			ControlName	RuiPanel
			xpos	578
			ypos	22
			wide	200
			tall	86
			zpos	3
			visible	1
			rui	"ui/basic_image.rpak"
		}

		CardName2
		{
			ControlName	Label
			xpos	550
			ypos	110
			wide	255
			tall	34
			zpos	4
			visible	1
			labelText	""
			textAlignment	center
			font	Default_27
			fontHeight	26
			fgcolor_override	"2 252 240 255"
		}

		CardTag2
		{
			ControlName	Label
			xpos	558
			ypos	4
			wide	240
			tall	22
			zpos	4
			visible	1
			labelText	""
			textAlignment	west
			font	TitleBoldFont
			fontHeight	18
			fgcolor_override	"252 198 3 255"
		}

		CardButton2
		{
			ControlName	RuiButton
			xpos	550
			ypos	0
			wide	255
			tall	150
			zpos	6
			visible	1
			enabled	1
			scriptID	2
			rui	"ui/invisible.rpak"
			labelText	""
			sound_focus	"UI_Menu_Focus"
			sound_accept	"UI_Menu_Accept"
			cursorVelocityModifier	0.7
			rightClickEvents	1
		}

		CardFrame3
		{
			ControlName	ImagePanel
			xpos	825
			ypos	0
			wide	255
			tall	150
			zpos	1
			visible	1
			scaleImage	1
			fillColor	"30 30 30 200"
			drawColor	"30 30 30 200"
		}

		CardSel3
		{
			ControlName	ImagePanel
			xpos	825
			ypos	0
			wide	255
			tall	150
			zpos	2
			visible	0
			scaleImage	1
			fillColor	"105 63 1 220"
			drawColor	"105 63 1 220"
		}

		CardImg3
		{
			ControlName	RuiPanel
			xpos	853
			ypos	22
			wide	200
			tall	86
			zpos	3
			visible	1
			rui	"ui/basic_image.rpak"
		}

		CardName3
		{
			ControlName	Label
			xpos	825
			ypos	110
			wide	255
			tall	34
			zpos	4
			visible	1
			labelText	""
			textAlignment	center
			font	Default_27
			fontHeight	26
			fgcolor_override	"2 252 240 255"
		}

		CardTag3
		{
			ControlName	Label
			xpos	833
			ypos	4
			wide	240
			tall	22
			zpos	4
			visible	1
			labelText	""
			textAlignment	west
			font	TitleBoldFont
			fontHeight	18
			fgcolor_override	"252 198 3 255"
		}

		CardButton3
		{
			ControlName	RuiButton
			xpos	825
			ypos	0
			wide	255
			tall	150
			zpos	6
			visible	1
			enabled	1
			scriptID	3
			rui	"ui/invisible.rpak"
			labelText	""
			sound_focus	"UI_Menu_Focus"
			sound_accept	"UI_Menu_Accept"
			cursorVelocityModifier	0.7
			rightClickEvents	1
		}

		CardFrame4
		{
			ControlName	ImagePanel
			xpos	0
			ypos	170
			wide	255
			tall	150
			zpos	1
			visible	1
			scaleImage	1
			fillColor	"30 30 30 200"
			drawColor	"30 30 30 200"
		}

		CardSel4
		{
			ControlName	ImagePanel
			xpos	0
			ypos	170
			wide	255
			tall	150
			zpos	2
			visible	0
			scaleImage	1
			fillColor	"105 63 1 220"
			drawColor	"105 63 1 220"
		}

		CardImg4
		{
			ControlName	RuiPanel
			xpos	28
			ypos	192
			wide	200
			tall	86
			zpos	3
			visible	1
			rui	"ui/basic_image.rpak"
		}

		CardName4
		{
			ControlName	Label
			xpos	0
			ypos	280
			wide	255
			tall	34
			zpos	4
			visible	1
			labelText	""
			textAlignment	center
			font	Default_27
			fontHeight	26
			fgcolor_override	"2 252 240 255"
		}

		CardTag4
		{
			ControlName	Label
			xpos	8
			ypos	174
			wide	240
			tall	22
			zpos	4
			visible	1
			labelText	""
			textAlignment	west
			font	TitleBoldFont
			fontHeight	18
			fgcolor_override	"252 198 3 255"
		}

		CardButton4
		{
			ControlName	RuiButton
			xpos	0
			ypos	170
			wide	255
			tall	150
			zpos	6
			visible	1
			enabled	1
			scriptID	4
			rui	"ui/invisible.rpak"
			labelText	""
			sound_focus	"UI_Menu_Focus"
			sound_accept	"UI_Menu_Accept"
			cursorVelocityModifier	0.7
			rightClickEvents	1
		}

		CardFrame5
		{
			ControlName	ImagePanel
			xpos	275
			ypos	170
			wide	255
			tall	150
			zpos	1
			visible	1
			scaleImage	1
			fillColor	"30 30 30 200"
			drawColor	"30 30 30 200"
		}

		CardSel5
		{
			ControlName	ImagePanel
			xpos	275
			ypos	170
			wide	255
			tall	150
			zpos	2
			visible	0
			scaleImage	1
			fillColor	"105 63 1 220"
			drawColor	"105 63 1 220"
		}

		CardImg5
		{
			ControlName	RuiPanel
			xpos	303
			ypos	192
			wide	200
			tall	86
			zpos	3
			visible	1
			rui	"ui/basic_image.rpak"
		}

		CardName5
		{
			ControlName	Label
			xpos	275
			ypos	280
			wide	255
			tall	34
			zpos	4
			visible	1
			labelText	""
			textAlignment	center
			font	Default_27
			fontHeight	26
			fgcolor_override	"2 252 240 255"
		}

		CardTag5
		{
			ControlName	Label
			xpos	283
			ypos	174
			wide	240
			tall	22
			zpos	4
			visible	1
			labelText	""
			textAlignment	west
			font	TitleBoldFont
			fontHeight	18
			fgcolor_override	"252 198 3 255"
		}

		CardButton5
		{
			ControlName	RuiButton
			xpos	275
			ypos	170
			wide	255
			tall	150
			zpos	6
			visible	1
			enabled	1
			scriptID	5
			rui	"ui/invisible.rpak"
			labelText	""
			sound_focus	"UI_Menu_Focus"
			sound_accept	"UI_Menu_Accept"
			cursorVelocityModifier	0.7
			rightClickEvents	1
		}

		CardFrame6
		{
			ControlName	ImagePanel
			xpos	550
			ypos	170
			wide	255
			tall	150
			zpos	1
			visible	1
			scaleImage	1
			fillColor	"30 30 30 200"
			drawColor	"30 30 30 200"
		}

		CardSel6
		{
			ControlName	ImagePanel
			xpos	550
			ypos	170
			wide	255
			tall	150
			zpos	2
			visible	0
			scaleImage	1
			fillColor	"105 63 1 220"
			drawColor	"105 63 1 220"
		}

		CardImg6
		{
			ControlName	RuiPanel
			xpos	578
			ypos	192
			wide	200
			tall	86
			zpos	3
			visible	1
			rui	"ui/basic_image.rpak"
		}

		CardName6
		{
			ControlName	Label
			xpos	550
			ypos	280
			wide	255
			tall	34
			zpos	4
			visible	1
			labelText	""
			textAlignment	center
			font	Default_27
			fontHeight	26
			fgcolor_override	"2 252 240 255"
		}

		CardTag6
		{
			ControlName	Label
			xpos	558
			ypos	174
			wide	240
			tall	22
			zpos	4
			visible	1
			labelText	""
			textAlignment	west
			font	TitleBoldFont
			fontHeight	18
			fgcolor_override	"252 198 3 255"
		}

		CardButton6
		{
			ControlName	RuiButton
			xpos	550
			ypos	170
			wide	255
			tall	150
			zpos	6
			visible	1
			enabled	1
			scriptID	6
			rui	"ui/invisible.rpak"
			labelText	""
			sound_focus	"UI_Menu_Focus"
			sound_accept	"UI_Menu_Accept"
			cursorVelocityModifier	0.7
			rightClickEvents	1
		}

		CardFrame7
		{
			ControlName	ImagePanel
			xpos	825
			ypos	170
			wide	255
			tall	150
			zpos	1
			visible	1
			scaleImage	1
			fillColor	"30 30 30 200"
			drawColor	"30 30 30 200"
		}

		CardSel7
		{
			ControlName	ImagePanel
			xpos	825
			ypos	170
			wide	255
			tall	150
			zpos	2
			visible	0
			scaleImage	1
			fillColor	"105 63 1 220"
			drawColor	"105 63 1 220"
		}

		CardImg7
		{
			ControlName	RuiPanel
			xpos	853
			ypos	192
			wide	200
			tall	86
			zpos	3
			visible	1
			rui	"ui/basic_image.rpak"
		}

		CardName7
		{
			ControlName	Label
			xpos	825
			ypos	280
			wide	255
			tall	34
			zpos	4
			visible	1
			labelText	""
			textAlignment	center
			font	Default_27
			fontHeight	26
			fgcolor_override	"2 252 240 255"
		}

		CardTag7
		{
			ControlName	Label
			xpos	833
			ypos	174
			wide	240
			tall	22
			zpos	4
			visible	1
			labelText	""
			textAlignment	west
			font	TitleBoldFont
			fontHeight	18
			fgcolor_override	"252 198 3 255"
		}

		CardButton7
		{
			ControlName	RuiButton
			xpos	825
			ypos	170
			wide	255
			tall	150
			zpos	6
			visible	1
			enabled	1
			scriptID	7
			rui	"ui/invisible.rpak"
			labelText	""
			sound_focus	"UI_Menu_Focus"
			sound_accept	"UI_Menu_Accept"
			cursorVelocityModifier	0.7
			rightClickEvents	1
		}

		CardFrame8
		{
			ControlName	ImagePanel
			xpos	0
			ypos	340
			wide	255
			tall	150
			zpos	1
			visible	1
			scaleImage	1
			fillColor	"30 30 30 200"
			drawColor	"30 30 30 200"
		}

		CardSel8
		{
			ControlName	ImagePanel
			xpos	0
			ypos	340
			wide	255
			tall	150
			zpos	2
			visible	0
			scaleImage	1
			fillColor	"105 63 1 220"
			drawColor	"105 63 1 220"
		}

		CardImg8
		{
			ControlName	RuiPanel
			xpos	28
			ypos	362
			wide	200
			tall	86
			zpos	3
			visible	1
			rui	"ui/basic_image.rpak"
		}

		CardName8
		{
			ControlName	Label
			xpos	0
			ypos	450
			wide	255
			tall	34
			zpos	4
			visible	1
			labelText	""
			textAlignment	center
			font	Default_27
			fontHeight	26
			fgcolor_override	"2 252 240 255"
		}

		CardTag8
		{
			ControlName	Label
			xpos	8
			ypos	344
			wide	240
			tall	22
			zpos	4
			visible	1
			labelText	""
			textAlignment	west
			font	TitleBoldFont
			fontHeight	18
			fgcolor_override	"252 198 3 255"
		}

		CardButton8
		{
			ControlName	RuiButton
			xpos	0
			ypos	340
			wide	255
			tall	150
			zpos	6
			visible	1
			enabled	1
			scriptID	8
			rui	"ui/invisible.rpak"
			labelText	""
			sound_focus	"UI_Menu_Focus"
			sound_accept	"UI_Menu_Accept"
			cursorVelocityModifier	0.7
			rightClickEvents	1
		}

		CardFrame9
		{
			ControlName	ImagePanel
			xpos	275
			ypos	340
			wide	255
			tall	150
			zpos	1
			visible	1
			scaleImage	1
			fillColor	"30 30 30 200"
			drawColor	"30 30 30 200"
		}

		CardSel9
		{
			ControlName	ImagePanel
			xpos	275
			ypos	340
			wide	255
			tall	150
			zpos	2
			visible	0
			scaleImage	1
			fillColor	"105 63 1 220"
			drawColor	"105 63 1 220"
		}

		CardImg9
		{
			ControlName	RuiPanel
			xpos	303
			ypos	362
			wide	200
			tall	86
			zpos	3
			visible	1
			rui	"ui/basic_image.rpak"
		}

		CardName9
		{
			ControlName	Label
			xpos	275
			ypos	450
			wide	255
			tall	34
			zpos	4
			visible	1
			labelText	""
			textAlignment	center
			font	Default_27
			fontHeight	26
			fgcolor_override	"2 252 240 255"
		}

		CardTag9
		{
			ControlName	Label
			xpos	283
			ypos	344
			wide	240
			tall	22
			zpos	4
			visible	1
			labelText	""
			textAlignment	west
			font	TitleBoldFont
			fontHeight	18
			fgcolor_override	"252 198 3 255"
		}

		CardButton9
		{
			ControlName	RuiButton
			xpos	275
			ypos	340
			wide	255
			tall	150
			zpos	6
			visible	1
			enabled	1
			scriptID	9
			rui	"ui/invisible.rpak"
			labelText	""
			sound_focus	"UI_Menu_Focus"
			sound_accept	"UI_Menu_Accept"
			cursorVelocityModifier	0.7
			rightClickEvents	1
		}

		CardFrame10
		{
			ControlName	ImagePanel
			xpos	550
			ypos	340
			wide	255
			tall	150
			zpos	1
			visible	1
			scaleImage	1
			fillColor	"30 30 30 200"
			drawColor	"30 30 30 200"
		}

		CardSel10
		{
			ControlName	ImagePanel
			xpos	550
			ypos	340
			wide	255
			tall	150
			zpos	2
			visible	0
			scaleImage	1
			fillColor	"105 63 1 220"
			drawColor	"105 63 1 220"
		}

		CardImg10
		{
			ControlName	RuiPanel
			xpos	578
			ypos	362
			wide	200
			tall	86
			zpos	3
			visible	1
			rui	"ui/basic_image.rpak"
		}

		CardName10
		{
			ControlName	Label
			xpos	550
			ypos	450
			wide	255
			tall	34
			zpos	4
			visible	1
			labelText	""
			textAlignment	center
			font	Default_27
			fontHeight	26
			fgcolor_override	"2 252 240 255"
		}

		CardTag10
		{
			ControlName	Label
			xpos	558
			ypos	344
			wide	240
			tall	22
			zpos	4
			visible	1
			labelText	""
			textAlignment	west
			font	TitleBoldFont
			fontHeight	18
			fgcolor_override	"252 198 3 255"
		}

		CardButton10
		{
			ControlName	RuiButton
			xpos	550
			ypos	340
			wide	255
			tall	150
			zpos	6
			visible	1
			enabled	1
			scriptID	10
			rui	"ui/invisible.rpak"
			labelText	""
			sound_focus	"UI_Menu_Focus"
			sound_accept	"UI_Menu_Accept"
			cursorVelocityModifier	0.7
			rightClickEvents	1
		}

		CardFrame11
		{
			ControlName	ImagePanel
			xpos	825
			ypos	340
			wide	255
			tall	150
			zpos	1
			visible	1
			scaleImage	1
			fillColor	"30 30 30 200"
			drawColor	"30 30 30 200"
		}

		CardSel11
		{
			ControlName	ImagePanel
			xpos	825
			ypos	340
			wide	255
			tall	150
			zpos	2
			visible	0
			scaleImage	1
			fillColor	"105 63 1 220"
			drawColor	"105 63 1 220"
		}

		CardImg11
		{
			ControlName	RuiPanel
			xpos	853
			ypos	362
			wide	200
			tall	86
			zpos	3
			visible	1
			rui	"ui/basic_image.rpak"
		}

		CardName11
		{
			ControlName	Label
			xpos	825
			ypos	450
			wide	255
			tall	34
			zpos	4
			visible	1
			labelText	""
			textAlignment	center
			font	Default_27
			fontHeight	26
			fgcolor_override	"2 252 240 255"
		}

		CardTag11
		{
			ControlName	Label
			xpos	833
			ypos	344
			wide	240
			tall	22
			zpos	4
			visible	1
			labelText	""
			textAlignment	west
			font	TitleBoldFont
			fontHeight	18
			fgcolor_override	"252 198 3 255"
		}

		CardButton11
		{
			ControlName	RuiButton
			xpos	825
			ypos	340
			wide	255
			tall	150
			zpos	6
			visible	1
			enabled	1
			scriptID	11
			rui	"ui/invisible.rpak"
			labelText	""
			sound_focus	"UI_Menu_Focus"
			sound_accept	"UI_Menu_Accept"
			cursorVelocityModifier	0.7
			rightClickEvents	1
		}

}
