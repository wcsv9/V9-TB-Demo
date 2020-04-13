/**
 * @license Copyright (c) 2003-2014, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see LICENSE.md or http://ckeditor.com/licensePortions Copyright IBM Corp., 2009-2015.
 */

CKEDITOR.plugins.setLang( 'a11yhelp', 'zh-tw',
{
	//do not translate anything with the form ${xxx} 
	
	title : "說明",
	contents : "說明內容。若要關閉此對話框，請按 ESC。",
	legend :
	[
		{
			name : "協助工具指示",
			items :
			[
				{
					name : "編輯器工具列",
					legend: "按 ${toolbarFocus}，可導覽至工具列。 " +
						"使用 TAB 鍵及 SHIFT+TAB 鍵，來移至下一個及上一個工具列群組。" +
						"使用右移鍵或左移鍵，來移至下一個及上一個工具列按鈕。 " +
						"按空格鍵或 ENTER 鍵，來啟動工具列按鈕。"
				},

				{
					name: "編輯器對話框",
					legend:
						"在對話框內部，按 TAB 鍵以導覽至下一個對話框元素，按 SHIFT+TAB 鍵以移至上一個對話框元素，按 ENTER 鍵以提交對話框，按 ESC 鍵以取消對話框。" +
						"如果一個對話框具有多個標籤，則可以使用 ALT+F10 鍵，或使用 TAB 鍵依照對話框定位順序，來存取標籤清單。" +
						"聚焦標籤清單後，分別使用右移鍵來移至下一個標籤，使用左移鍵來移至上一個標籤。"
				},

				{
					name : "編輯器快速功能表",
					legend :
						"按 ${contextMenu} 或 APPLICATION KEY，可開啟快速功能表。 " +
						"接著，使用 TAB 或下移箭，可移至下一個功能表選項。 " +
						"使用 SHIFT+TAB 或上移箭，可移至前一個選項。 " +
						"按空格鍵或 ENTER，可選取功能表選項。 " +
						"使用空格鍵或 ENTER 或右移箭，可開啟現行選項的子功能表。 " +
						"使用 ESC 或左移箭，可回到母項功能表項目。 " +
						"使用 ESC 可關閉快速功能表。"
				},

				{
					name : "編輯器清單框",
					legend :
						"在清單框內，使用 TAB 或下移鍵，可移至下一個清單項目。 " +
						"使用 SHIFT + TAB 或上移鍵，可移至前一個清單。 " +
						"按空格鍵或 ENTER，可選取清單選項。 " +
						"按 ESC，可關閉清單框。"
				},

				{
					name : "編輯器元素路徑列（如果可用的話*）",
					legend :
						"按 ${elementsPathFocus}，可導覽至元素路徑列。 " +
						"使用 TAB 或右移箭，可移至下一個元素按鈕。 " +
						"使用 SHIFT+TAB 或左移箭，可移至前一個按鈕。 " +
						"按空格鍵或 ENTER，可選取編輯器中的元素。"
				}
			]
		},
		{
			name : "指令",
			items :
			[
				{
					name : " 復原指令",
					legend : "按下 ${undo}"
				},
				{
					name : " 重做指令",
					legend : "按下 ${redo}"
				},
				{
					name : " 粗體指令",
					legend : "按下 ${bold}"
				},
				{
					name : " 斜體指令",
					legend : "按下 ${italic}"
				},
				{
					name : " 底線指令",
					legend : "按下 ${underline}"
				},
				{
					name : " 鏈結指令",
					legend : "按下 ${link}"
				},
				{
					name : " 工具列收合指令（如果可用的話*）",
					legend : "按下 ${toolbarCollapse}"
				},
				{
					name: ' 存取前一個焦點空間指令',
					legend: '按下 ${accessPreviousSpace}，可在無法觸及的焦點空間中，緊接在游標之前插入空間。' +
						'無法觸及的焦點空間是指編輯器中，無法使用滑鼠或鍵盤' + 
						'來定位游標的位置。例如：使用此指令在兩個相鄰的表格元素之間插入內容。'
				},
				{
					name: ' 存取下一個焦點空間指令',
					legend: '按下 ${accessNextSpace}，可在無法觸及的焦點空間中，緊接在游標之後插入空間。' +
						'無法觸及的焦點空間是指編輯器中，無法使用滑鼠或鍵盤' +
						'來定位游標的位置。例如：使用此指令在兩個相鄰的表格元素之間插入內容。'
				},
				{
					name : " 增加縮排",
					legend : "按下 ${indent}"
				},
				{
					name : " 減少縮排",
					legend : "按下 ${outdent}"
				},				
				{
					name : " 文字方向由左至右",
					legend : "按下 ${bidiltr}"
				},
				{
					name : " 文字方向由右至左",
					legend : "按下 ${bidirtl}"
				},
				{
					name: ' 奇異筆',
					legend: '按下編輯器內部的 ${ibmpermanentpen}（MAC 上的 Alt+Cmd+T）以啟動/停用奇異筆。'
				},
				{
					name : " 協助工具說明",
					legend : "按下 ${a11yHelp}"
				}
			]
		},
		
		{	//added by ibm
			name : "附註",
			items :
			[
				{	
					name : "",
					legend : "* 部分功能可由管理者停用。"
				}
			]
		}
	],
	backspace: 'Backspace',
	tab: 'Tab',
	enter: 'Enter',
	shift: 'Shift',
	ctrl: 'Ctrl',
	alt: 'Alt',
	pause: 'Pause',
	capslock: 'Caps Lock',
	escape: 'Escape',
	pageUp: 'Page Up',
	pageDown: 'Page Down',
	end: '結束',
	home: '首頁',
	leftArrow: '左移鍵',
	upArrow: '上移鍵',
	rightArrow: '右移鍵',
	downArrow: '下移鍵',
	insert: '插入',
	'delete': '刪除',
	leftWindowKey: '左 Windows 鍵',
	rightWindowKey: '右 Windows 鍵',
	selectKey: '選取鍵',
	numpad0: 'Numpad 0',
	numpad1: 'Numpad 1',
	numpad2: 'Numpad 2',
	numpad3: 'Numpad 3',
	numpad4: 'Numpad 4',
	numpad5: 'Numpad 5',
	numpad6: 'Numpad 6',
	numpad7: 'Numpad 7',
	numpad8: 'Numpad 8',
	numpad9: 'Numpad 9',
	multiply: '乘',
	add: '新增',
	subtract: '減',
	decimalPoint: '小數點',
	divide: '除',
	f1: 'F1',
	f2: 'F2',
	f3: 'F3',
	f4: 'F4',
	f5: 'F5',
	f6: 'F6',
	f7: 'F7',
	f8: 'F8',
	f9: 'F9',
	f10: 'F10',
	f11: 'F11',
	f12: 'F12',
	numLock: 'Num Lock',
	scrollLock: 'Scroll Lock',
	semiColon: '分號',
	equalSign: '等號',
	comma: '逗點',
	dash: '橫線',
	period: '句點',
	forwardSlash: '正斜線',
	graveAccent: '抑音符號',
	openBracket: '左方括弧',
	backSlash: '反斜線',
	closeBracket: '右方括弧',
	singleQuote: '單引號',
	
	ibm :
	{
		helpLinkDescription : "在新視窗中開啟更多說明主題",
		helpLink : "更多說明主題"
	}

});

