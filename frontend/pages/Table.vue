<template>
  <v-row class="text-center">
    <v-col class="mb-4">
      <div class="table-container mt-5">
        <div class="d-flex justify-space-between mb-5">
          <div class="left-spacer"></div>
          <h1>かなローマ字対応表</h1>
          <v-switch
            v-model="isKatakana"
            label="カタカナ"
            class="mt-0"
            hide-details
          ></v-switch>
        </div>
        <table>
          <tbody>
            <tr>
              <td>
                <p v-show="!isKatakana" class="kana">あ</p>
                <p v-show="isKatakana" class="kana">ア</p>
                <p class="alphabet">A</p>
                <p class="alphabet"></p>
              </td>
              <td>
                <p v-show="!isKatakana" class="kana">い</p>
                <p v-show="isKatakana" class="kana">イ</p>
                <p class="alphabet">I</p>
                <p class="alphabet"></p>
              </td>
              <td>
                <p v-show="!isKatakana" class="kana">う</p>
                <p v-show="isKatakana" class="kana">ウ</p>
                <p class="alphabet">U</p>
                <p class="alphabet"></p>
              </td>
              <td>
                <p v-show="!isKatakana" class="kana">え</p>
                <p v-show="isKatakana" class="kana">エ</p>
                <p class="alphabet">E</p>
                <p class="alphabet"></p>
              </td>
              <td>
                <p v-show="!isKatakana" class="kana">お</p>
                <p v-show="isKatakana" class="kana">オ</p>
                <p class="alphabet">O</p>
                <p class="alphabet"></p>
              </td>
              <td class="separator"></td>
              <td>
                <p v-show="!isKatakana" class="kana">ぁ</p>
                <p v-show="isKatakana" class="kana">ァ</p>
                <p class="alphabet">LA</p>
                <p class="alphabet">XA</p>
              </td>
              <td>
                <p v-show="!isKatakana" class="kana">ぃ</p>
                <p v-show="isKatakana" class="kana">ィ</p>
                <p class="alphabet">LI</p>
                <p class="alphabet">XI</p>
              </td>
              <td>
                <p v-show="!isKatakana" class="kana">ぅ</p>
                <p v-show="isKatakana" class="kana">ゥ</p>
                <p class="alphabet">LU</p>
                <p class="alphabet">XU</p>
              </td>
              <td>
                <p v-show="!isKatakana" class="kana">ぇ</p>
                <p v-show="isKatakana" class="kana">ェ</p>
                <p class="alphabet">LE</p>
                <p class="alphabet">XE</p>
              </td>
              <td>
                <p v-show="!isKatakana" class="kana">ぉ</p>
                <p v-show="isKatakana" class="kana">ォ</p>
                <p class="alphabet">LO</p>
                <p class="alphabet">XO</p>
              </td>
            </tr>
            <tr>
              <td class="blank"></td>
              <td class="blank"></td>
              <td class="blank"></td>
              <td class="blank"></td>
              <td class="blank"></td>
              <td class="separator"></td>
              <td>
              </td>
              <td>
                <p v-show="!isKatakana" class="kana">うぃ</p>
                <p v-show="isKatakana" class="kana">ウィ</p>
                <p class="alphabet">WI</p>
                <p class="alphabet">WHI</p>
              </td>
              <td class="blank"></td>
              <td>
                <p v-show="!isKatakana" class="kana">うぇ</p>
                <p v-show="isKatakana" class="kana">ウェ</p>
                <p class="alphabet">WE</p>
                <p class="alphabet">WHE</p>
              </td>
              <td>
                <p v-show="!isKatakana" class="kana">うぉ</p>
                <p v-show="isKatakana" class="kana">ウォ</p>
                <p class="alphabet"></p>
                <p class="alphabet">WHO</p>
              </td>
            </tr>
            <tr>
              <td>
                <p v-show="!isKatakana" class="kana">か</p>
                <p v-show="isKatakana" class="kana">カ</p>
                <p class="alphabet">KA</p>
                <p class="alphabet">CA</p>
              </td>
              <td>
                <p v-show="!isKatakana" class="kana">き</p>
                <p v-show="isKatakana" class="kana">キ</p>
                <p class="alphabet">KI</p>
                <p class="alphabet"></p>
              </td>
              <td>
                <p v-show="!isKatakana" class="kana">く</p>
                <p v-show="isKatakana" class="kana">ク</p>
                <p class="alphabet">KU</p>
                <p class="alphabet">CU</p>
              </td>
              <td>
                <p v-show="!isKatakana" class="kana">け</p>
                <p v-show="isKatakana" class="kana">ケ</p>
                <p class="alphabet">KE</p>
                <p class="alphabet"></p>
              </td>
              <td>
                <p v-show="!isKatakana" class="kana">こ</p>
                <p v-show="isKatakana" class="kana">コ</p>
                <p class="alphabet">KO</p>
                <p class="alphabet">CO</p>
              </td>
              <td class="separator"></td>
              <td>
                <p v-show="!isKatakana" class="kana">きゃ</p>
                <p v-show="isKatakana" class="kana">キャ</p>
                <p class="alphabet">KYA</p>
                <p class="alphabet"></p>
              </td>
              <td>
                <p v-show="!isKatakana" class="kana">きぃ</p>
                <p v-show="isKatakana" class="kana">キィ</p>
                <p class="alphabet">KYI</p>
                <p class="alphabet"></p>
              </td>
              <td>
                <p v-show="!isKatakana" class="kana">きゅ</p>
                <p v-show="isKatakana" class="kana">キュ</p>
                <p class="alphabet">KYU</p>
                <p class="alphabet"></p>
              </td>
              <td>
                <p v-show="!isKatakana" class="kana">きぇ</p>
                <p v-show="isKatakana" class="kana">キェ</p>
                <p class="alphabet">KYE</p>
                <p class="alphabet"></p>
              </td>
              <td>
                <p v-show="!isKatakana" class="kana">きょ</p>
                <p v-show="isKatakana" class="kana">キョ</p>
                <p class="alphabet">KYO</p>
                <p class="alphabet"></p>
              </td>
            </tr>
            <tr>
              <td class="blank"></td>
              <td class="blank"></td>
              <td class="blank"></td>
              <td class="blank"></td>
              <td class="blank"></td>
              <td class="separator"></td>
              <td class="blank"></td>
              <td class="blank"></td>
              <td class="blank"></td>
              <td class="blank"></td>
              <td>
                <p v-show="!isKatakana" class="kana">くぉ</p>
                <p v-show="isKatakana" class="kana">クォ</p>
                <p class="alphabet">QO</p>
                <p class="alphabet">KWO</p>
              </td>
            </tr>
            <tr>
              <td>
                <p v-show="!isKatakana" class="kana">が</p>
                <p v-show="isKatakana" class="kana">ガ</p>
                <p class="alphabet">GA</p>
              </td>
              <td>
                <p v-show="!isKatakana" class="kana">ぎ</p>
                <p v-show="isKatakana" class="kana">ギ</p>
                <p class="alphabet">GI</p>
              </td>
              <td>
                <p v-show="!isKatakana" class="kana">ぐ</p>
                <p v-show="isKatakana" class="kana">グ</p>
                <p class="alphabet">GU</p>
              </td>
              <td>
                <p v-show="!isKatakana" class="kana">げ</p>
                <p v-show="isKatakana" class="kana">ゲ</p>
                <p class="alphabet">GE</p>
              </td>
              <td>
                <p v-show="!isKatakana" class="kana">ご</p>
                <p v-show="isKatakana" class="kana">ゴ</p>
                <p class="alphabet">GO</p>
              </td>
              <td class="separator"></td>
              <td>
                <p v-show="!isKatakana" class="kana">ぎゃ</p>
                <p v-show="isKatakana" class="kana">ギャ</p>
                <p class="alphabet">GYA</p>
              </td>
              <td class="blank"></td>
              <td>
                <p v-show="!isKatakana" class="kana">ぎゅ</p>
                <p v-show="isKatakana" class="kana">ギュ</p>
                <p class="alphabet">GYU</p>
              </td>
              <td class="blank"></td>
              <td>
                <p v-show="!isKatakana" class="kana">ぎょ</p>
                <p v-show="isKatakana" class="kana">ギョ</p>
                <p class="alphabet">GYO</p>
              </td>
            </tr>
            <tr>
              <td>
                <p v-show="!isKatakana" class="kana">さ</p>
                <p v-show="isKatakana" class="kana">サ</p>
                <p class="alphabet">SA</p>
                <p class="alphabet"></p>
              </td>
              <td>
                <p v-show="!isKatakana" class="kana">し</p>
                <p v-show="isKatakana" class="kana">シ</p>
                <p class="alphabet">SI</p>
                <p class="alphabet">SHI</p>
              </td>
              <td>
                <p v-show="!isKatakana" class="kana">す</p>
                <p v-show="isKatakana" class="kana">ス</p>
                <p class="alphabet">SU</p>
                <p class="alphabet"></p>
              </td>
              <td>
                <p v-show="!isKatakana" class="kana">せ</p>
                <p v-show="isKatakana" class="kana">セ</p>
                <p class="alphabet">SE</p>
                <p class="alphabet"></p>
              </td>
              <td>
                <p v-show="!isKatakana" class="kana">そ</p>
                <p v-show="isKatakana" class="kana">ソ</p>
                <p class="alphabet">SO</p>
                <p class="alphabet"></p>
              </td>
              <td class="separator"></td>
              <td>
                <p v-show="!isKatakana" class="kana">しゃ</p>
                <p v-show="isKatakana" class="kana">シャ</p>
                <p class="alphabet">SYA</p>
                <p class="alphabet">SHA</p>
              </td>
              <td class="blank"></td>
              <td>
                <p v-show="!isKatakana" class="kana">しゅ</p>
                <p v-show="isKatakana" class="kana">シュ</p>
                <p class="alphabet">SYU</p>
                <p class="alphabet">SHU</p>
              </td>
              <td>
                <p v-show="!isKatakana" class="kana">しぇ</p>
                <p v-show="isKatakana" class="kana">シェ</p>
                <p class="alphabet">SYE</p>
                <p class="alphabet">SHE</p>
              </td>
              <td>
                <p v-show="!isKatakana" class="kana">しょ</p>
                <p v-show="isKatakana" class="kana">ショ</p>
                <p class="alphabet">SYO</p>
                <p class="alphabet">SHO</p>
              </td>
            </tr>
            <tr>
              <td>
                <p v-show="!isKatakana" class="kana">ざ</p>
                <p v-show="isKatakana" class="kana">ザ</p>
                <p class="alphabet">ZA</p>
                <p class="alphabet"></p>
                <p class="alphabet"></p>
              </td>
              <td>
                <p v-show="!isKatakana" class="kana">じ</p>
                <p v-show="isKatakana" class="kana">ジ</p>
                <p class="alphabet">ZI</p>
                <p class="alphabet">JI</p>
                <p class="alphabet"></p>
              </td>
              <td>
                <p v-show="!isKatakana" class="kana">ず</p>
                <p v-show="isKatakana" class="kana">ズ</p>
                <p class="alphabet">ZU</p>
                <p class="alphabet"></p>
                <p class="alphabet"></p>
              </td>
              <td>
                <p v-show="!isKatakana" class="kana">ぜ</p>
                <p v-show="isKatakana" class="kana">ゼ</p>
                <p class="alphabet">ZE</p>
                <p class="alphabet"></p>
                <p class="alphabet"></p>
              </td>
              <td>
                <p v-show="!isKatakana" class="kana">ぞ</p>
                <p v-show="isKatakana" class="kana">ゾ</p>
                <p class="alphabet">ZO</p>
                <p class="alphabet"></p>
                <p class="alphabet"></p>
              </td>
              <td class="separator"></td>
              <td>
                <p v-show="!isKatakana" class="kana">じゃ</p>
                <p v-show="isKatakana" class="kana">ジャ</p>
                <p class="alphabet">ZYA</p>
                <p class="alphabet">JA</p>
                <p class="alphabet">JYA</p>
              </td>
              <td class="blank"></td>
              <td>
                <p v-show="!isKatakana" class="kana">じゅ</p>
                <p v-show="isKatakana" class="kana">ジュ</p>
                <p class="alphabet">ZYU</p>
                <p class="alphabet">JU</p>
                <p class="alphabet">JYU</p>
              </td>
              <td>
                <p v-show="!isKatakana" class="kana">じぇ</p>
                <p v-show="isKatakana" class="kana">ジェ</p>
                <p class="alphabet">ZYE</p>
                <p class="alphabet">JE</p>
                <p class="alphabet">JYE</p>
              </td>
              <td>
                <p v-show="!isKatakana" class="kana">じょ</p>
                <p v-show="isKatakana" class="kana">ジョ</p>
                <p class="alphabet">ZYO</p>
                <p class="alphabet">JO</p>
                <p class="alphabet">JYO</p>
              </td>
            </tr>
            <tr>
              <td>
                <p v-show="!isKatakana" class="kana">た</p>
                <p v-show="isKatakana" class="kana">タ</p>
                <p class="alphabet">TA</p>
                <p class="alphabet"></p>
                <p class="alphabet"></p>
              </td>
              <td>
                <p v-show="!isKatakana" class="kana">ち</p>
                <p v-show="isKatakana" class="kana">チ</p>
                <p class="alphabet">TI</p>
                <p class="alphabet">CHI</p>
                <p class="alphabet"></p>
              </td>
              <td>
                <p v-show="!isKatakana" class="kana">つ</p>
                <p v-show="isKatakana" class="kana">ツ</p>
                <p class="alphabet">TU</p>
                <p class="alphabet">TSU</p>
                <p class="alphabet"></p>
              </td>
              <td>
                <p v-show="!isKatakana" class="kana">て</p>
                <p v-show="isKatakana" class="kana">テ</p>
                <p class="alphabet">TE</p>
                <p class="alphabet"></p>
                <p class="alphabet"></p>
              </td>
              <td>
                <p v-show="!isKatakana" class="kana">と</p>
                <p v-show="isKatakana" class="kana">ト</p>
                <p class="alphabet">TO</p>
                <p class="alphabet"></p>
                <p class="alphabet"></p>
              </td>
              <td class="separator"></td>
              <td>
                <p v-show="!isKatakana" class="kana">ちゃ</p>
                <p v-show="isKatakana" class="kana">チャ</p>
                <p class="alphabet">TYA</p>
                <p class="alphabet">CYA</p>
                <p class="alphabet">CHA</p>
              </td>
              <td class="blank"></td>
              <td>
                <p v-show="!isKatakana" class="kana">ちゅ</p>
                <p v-show="isKatakana" class="kana">チュ</p>
                <p class="alphabet">TYU</p>
                <p class="alphabet">CYU</p>
                <p class="alphabet">CHU</p>
              </td>
              <td>
                <p v-show="!isKatakana" class="kana">ちぇ</p>
                <p v-show="isKatakana" class="kana">チェ</p>
                <p class="alphabet">TYE</p>
                <p class="alphabet">CYE</p>
                <p class="alphabet">CHE</p>
              </td>
              <td>
                <p v-show="!isKatakana" class="kana">ちょ</p>
                <p v-show="isKatakana" class="kana">チョ</p>
                <p class="alphabet">TYO</p>
                <p class="alphabet">CYO</p>
                <p class="alphabet">CHO</p>
              </td>
            </tr>
            <tr>
              <td class="blank"></td>
              <td class="blank"></td>
              <td class="blank"></td>
              <td class="blank"></td>
              <td class="blank"></td>
              <td class="separator"></td>
              <td class="blank"></td>
              <td>
                <p v-show="!isKatakana" class="kana">てぃ</p>
                <p v-show="isKatakana" class="kana">ティ</p>
                <p class="alphabet">THI</p>
              </td>
              <td>
                <p v-show="!isKatakana" class="kana">てゅ</p>
                <p v-show="isKatakana" class="kana">テュ</p>
                <p class="alphabet">THU</p>
              </td>
              <td class="blank"></td>
              <td>
                <p v-show="!isKatakana" class="kana">とぅ</p>
                <p v-show="isKatakana" class="kana">トゥ</p>
                <p class="alphabet">TWU</p>
              </td>
            </tr>
            <tr>
              <td>
                <p v-show="!isKatakana" class="kana">だ</p>
                <p v-show="isKatakana" class="kana">ダ</p>
                <p class="alphabet">DA</p>
              </td>
              <td>
                <p v-show="!isKatakana" class="kana">ぢ</p>
                <p v-show="isKatakana" class="kana">ヂ</p>
                <p class="alphabet">DI</p>
              </td>
              <td>
                <p v-show="!isKatakana" class="kana">づ</p>
                <p v-show="isKatakana" class="kana">ヅ</p>
                <p class="alphabet">DU</p>
              </td>
              <td>
                <p v-show="!isKatakana" class="kana">で</p>
                <p v-show="isKatakana" class="kana">デ</p>
                <p class="alphabet">DE</p>
              </td>
              <td>
                <p v-show="!isKatakana" class="kana">ど</p>
                <p v-show="isKatakana" class="kana">ド</p>
                <p class="alphabet">DO</p>
              </td>
              <td class="separator"></td>
              <td class="blank"></td>
              <td>
                <p v-show="!isKatakana" class="kana">でぃ</p>
                <p v-show="isKatakana" class="kana">ディ</p>
                <p class="alphabet">DHI</p>
              </td>
              <td>
                <p v-show="!isKatakana" class="kana">でゅ</p>
                <p v-show="isKatakana" class="kana">デュ</p>
                <p class="alphabet">DHU</p>
              </td>
              <td class="blank"></td>
              <td>
                <p v-show="!isKatakana" class="kana">どぅ</p>
                <p v-show="isKatakana" class="kana">ドゥ</p>
                <p class="alphabet">DWU</p>
              </td>
            </tr>
            <tr>
              <td>
                <p v-show="!isKatakana" class="kana">な</p>
                <p v-show="isKatakana" class="kana">ナ</p>
                <p class="alphabet">NA</p>
              </td>
              <td>
                <p v-show="!isKatakana" class="kana">に</p>
                <p v-show="isKatakana" class="kana">ニ</p>
                <p class="alphabet">NI</p>
              </td>
              <td>
                <p v-show="!isKatakana" class="kana">ぬ</p>
                <p v-show="isKatakana" class="kana">ヌ</p>
                <p class="alphabet">NU</p>
              </td>
              <td>
                <p v-show="!isKatakana" class="kana">ね</p>
                <p v-show="isKatakana" class="kana">ネ</p>
                <p class="alphabet">NE</p>
              </td>
              <td>
                <p v-show="!isKatakana" class="kana">の</p>
                <p v-show="isKatakana" class="kana">ノ</p>
                <p class="alphabet">NO</p>
              </td>
              <td class="separator"></td>
              <td>
                <p v-show="!isKatakana" class="kana">にゃ</p>
                <p v-show="isKatakana" class="kana">ニャ</p>
                <p class="alphabet">NYA</p>
              </td>
              <td class="blank"></td>
              <td>
                <p v-show="!isKatakana" class="kana">にゅ</p>
                <p v-show="isKatakana" class="kana">ニュ</p>
                <p class="alphabet">NYU</p>
              </td>
              <td class="blank"></td>
              <td>
                <p v-show="!isKatakana" class="kana">にょ</p>
                <p v-show="isKatakana" class="kana">ニョ</p>
                <p class="alphabet">NYO</p>
              </td>
            </tr>
            <tr>
              <td>
                <p v-show="!isKatakana" class="kana">は</p>
                <p v-show="isKatakana" class="kana">ハ</p>
                <p class="alphabet">HA</p>
                <p class="alphabet"></p>
              </td>
              <td>
                <p v-show="!isKatakana" class="kana">ひ</p>
                <p v-show="isKatakana" class="kana">ヒ</p>
                <p class="alphabet">HI</p>
                <p class="alphabet"></p>
              </td>
              <td>
                <p v-show="!isKatakana" class="kana">ふ</p>
                <p v-show="isKatakana" class="kana">フ</p>
                <p class="alphabet">HU</p>
                <p class="alphabet">FU</p>
              </td>
              <td>
                <p v-show="!isKatakana" class="kana">へ</p>
                <p v-show="isKatakana" class="kana">ヘ</p>
                <p class="alphabet">HE</p>
                <p class="alphabet"></p>
              </td>
              <td>
                <p v-show="!isKatakana" class="kana">ほ</p>
                <p v-show="isKatakana" class="kana">ホ</p>
                <p class="alphabet">HO</p>
                <p class="alphabet"></p>
              </td>
              <td class="separator"></td>
              <td>
                <p v-show="!isKatakana" class="kana">ひゃ</p>
                <p v-show="isKatakana" class="kana">ヒャ</p>
                <p class="alphabet">HYA</p>
                <p class="alphabet"></p>
              </td>
              <td class="blank"></td>
              <td>
                <p v-show="!isKatakana" class="kana">ひゅ</p>
                <p v-show="isKatakana" class="kana">ヒュ</p>
                <p class="alphabet">HYU</p>
                <p class="alphabet"></p>
              </td>
              <td class="blank"></td>
              <td>
                <p v-show="!isKatakana" class="kana">ひょ</p>
                <p v-show="isKatakana" class="kana">ヒョ</p>
                <p class="alphabet">HYO</p>
                <p class="alphabet"></p>
              </td>
            </tr>
            <tr>
              <td class="blank"></td>
              <td class="blank"></td>
              <td class="blank"></td>
              <td class="blank"></td>
              <td class="blank"></td>
              <td class="separator"></td>
              <td>
                <p v-show="!isKatakana" class="kana">ふぁ</p>
                <p v-show="isKatakana" class="kana">ファ</p>
                <p class="alphabet">FA</p>
              </td>
              <td>
                <p v-show="!isKatakana" class="kana">ふぃ</p>
                <p v-show="isKatakana" class="kana">フィ</p>
                <p class="alphabet">FI</p>
              </td>
              <td class="blank"></td>
              <td>
                <p v-show="!isKatakana" class="kana">ふぇ</p>
                <p v-show="isKatakana" class="kana">フェ</p>
                <p class="alphabet">FE</p>
              </td>
              <td>
                <p v-show="!isKatakana" class="kana">ふぉ</p>
                <p v-show="isKatakana" class="kana">フォ</p>
                <p class="alphabet">FO</p>
              </td>
            </tr>
            <tr>
              <td>
                <p v-show="!isKatakana" class="kana">ば</p>
                <p v-show="isKatakana" class="kana">バ</p>
                <p class="alphabet">BA</p>
              </td>
              <td>
                <p v-show="!isKatakana" class="kana">び</p>
                <p v-show="isKatakana" class="kana">ビ</p>
                <p class="alphabet">BI</p>
              </td>
              <td>
                <p v-show="!isKatakana" class="kana">ぶ</p>
                <p v-show="isKatakana" class="kana">ブ</p>
                <p class="alphabet">BU</p>
              </td>
              <td>
                <p v-show="!isKatakana" class="kana">べ</p>
                <p v-show="isKatakana" class="kana">ベ</p>
                <p class="alphabet">BE</p>
              </td>
              <td>
                <p v-show="!isKatakana" class="kana">ぼ</p>
                <p v-show="isKatakana" class="kana">ボ</p>
                <p class="alphabet">BO</p>
              </td>
              <td class="separator"></td>
              <td>
                <p v-show="!isKatakana" class="kana">びゃ</p>
                <p v-show="isKatakana" class="kana">ビャ</p>
                <p class="alphabet">BYA</p>
              </td>
              <td class="blank"></td>
              <td>
                <p v-show="!isKatakana" class="kana">びゅ</p>
                <p v-show="isKatakana" class="kana">ビュ</p>
                <p class="alphabet">BYU</p>
              </td>
              <td class="blank"></td>
              <td>
                <p v-show="!isKatakana" class="kana">びょ</p>
                <p v-show="isKatakana" class="kana">ビョ</p>
                <p class="alphabet">BYO</p>
              </td>
            </tr>
            <tr>
              <td>
                <p v-show="!isKatakana" class="kana">ぱ</p>
                <p v-show="isKatakana" class="kana">パ</p>
                <p class="alphabet">PA</p>
              </td>
              <td>
                <p v-show="!isKatakana" class="kana">ぴ</p>
                <p v-show="isKatakana" class="kana">ピ</p>
                <p class="alphabet">PI</p>
              </td>
              <td>
                <p v-show="!isKatakana" class="kana">ぷ</p>
                <p v-show="isKatakana" class="kana">プ</p>
                <p class="alphabet">PU</p>
              </td>
              <td>
                <p v-show="!isKatakana" class="kana">ぺ</p>
                <p v-show="isKatakana" class="kana">ペ</p>
                <p class="alphabet">PE</p>
              </td>
              <td>
                <p v-show="!isKatakana" class="kana">ぽ</p>
                <p v-show="isKatakana" class="kana">ポ</p>
                <p class="alphabet">PO</p>
              </td>
              <td class="separator"></td>
              <td>
                <p v-show="!isKatakana" class="kana">ぴゃ</p>
                <p v-show="isKatakana" class="kana">ピャ</p>
                <p class="alphabet">PYA</p>
              </td>
              <td class="blank"></td>
              <td>
                <p v-show="!isKatakana" class="kana">ぴゅ</p>
                <p v-show="isKatakana" class="kana">ピュ</p>
                <p class="alphabet">PYU</p>
              </td>
              <td class="blank"></td>
              <td>
                <p v-show="!isKatakana" class="kana">ぴょ</p>
                <p v-show="isKatakana" class="kana">ピョ</p>
                <p class="alphabet">PYO</p>
              </td>
            </tr>
            <tr>
              <td>
                <p v-show="!isKatakana" class="kana">ま</p>
                <p v-show="isKatakana" class="kana">マ</p>
                <p class="alphabet">MA</p>
              </td>
              <td>
                <p v-show="!isKatakana" class="kana">み</p>
                <p v-show="isKatakana" class="kana">ミ</p>
                <p class="alphabet">MI</p>
              </td>
              <td>
                <p v-show="!isKatakana" class="kana">む</p>
                <p v-show="isKatakana" class="kana">ム</p>
                <p class="alphabet">MU</p>
              </td>
              <td>
                <p v-show="!isKatakana" class="kana">め</p>
                <p v-show="isKatakana" class="kana">メ</p>
                <p class="alphabet">ME</p>
              </td>
              <td>
                <p v-show="!isKatakana" class="kana">も</p>
                <p v-show="isKatakana" class="kana">モ</p>
                <p class="alphabet">MO</p>
              </td>
              <td class="separator"></td>
              <td>
                <p v-show="!isKatakana" class="kana">みゃ</p>
                <p v-show="isKatakana" class="kana">ミャ</p>
                <p class="alphabet">MYA</p>
              </td>
              <td class="blank"></td>
              <td>
                <p v-show="!isKatakana" class="kana">みゅ</p>
                <p v-show="isKatakana" class="kana">ミュ</p>
                <p class="alphabet">MYU</p>
              </td>
              <td class="blank"></td>
              <td>
                <p v-show="!isKatakana" class="kana">みょ</p>
                <p v-show="isKatakana" class="kana">ミョ</p>
                <p class="alphabet">MYO</p>
              </td>
            </tr>
            <tr>
              <td>
                <p v-show="!isKatakana" class="kana">や</p>
                <p v-show="isKatakana" class="kana">ヤ</p>
                <p class="alphabet">YA</p>
                <p class="alphabet"></p>
              </td>
              <td class="blank"></td>
              <td>
                <p v-show="!isKatakana" class="kana">ゆ</p>
                <p v-show="isKatakana" class="kana">ユ</p>
                <p class="alphabet">YU</p>
                <p class="alphabet"></p>
              </td>
              <td class="blank"></td>
              <td>
                <p v-show="!isKatakana" class="kana">よ</p>
                <p v-show="isKatakana" class="kana">ヨ</p>
                <p class="alphabet">YO</p>
                <p class="alphabet"></p>
              </td>
              <td class="separator"></td>
              <td>
                <p v-show="!isKatakana" class="kana">ゃ</p>
                <p v-show="isKatakana" class="kana">ャ</p>
                <p class="alphabet">LYA</p>
                <p class="alphabet">XYA</p>
              </td>
              <td class="blank"></td>
              <td>
                <p v-show="!isKatakana" class="kana">ゅ</p>
                <p v-show="isKatakana" class="kana">ュ</p>
                <p class="alphabet">LYU</p>
                <p class="alphabet">XYU</p>
              </td>
              <td class="blank"></td>
              <td>
                <p v-show="!isKatakana" class="kana">ょ</p>
                <p v-show="isKatakana" class="kana">ョ</p>
                <p class="alphabet">LYO</p>
                <p class="alphabet">XYO</p>
              </td>
            </tr>
            <tr>
              <td>
                <p v-show="!isKatakana" class="kana">ら</p>
                <p v-show="isKatakana" class="kana">ラ</p>
                <p class="alphabet">RA</p>
              </td>
              <td>
                <p v-show="!isKatakana" class="kana">り</p>
                <p v-show="isKatakana" class="kana">リ</p>
                <p class="alphabet">RI</p>
              </td>
              <td>
                <p v-show="!isKatakana" class="kana">る</p>
                <p v-show="isKatakana" class="kana">ル</p>
                <p class="alphabet">RU</p>
              </td>
              <td>
                <p v-show="!isKatakana" class="kana">れ</p>
                <p v-show="isKatakana" class="kana">レ</p>
                <p class="alphabet">RE</p>
              </td>
              <td>
                <p v-show="!isKatakana" class="kana">ろ</p>
                <p v-show="isKatakana" class="kana">ロ</p>
                <p class="alphabet">RO</p>
              </td>
              <td class="separator"></td>
              <td>
                <p v-show="!isKatakana" class="kana">りゃ</p>
                <p v-show="isKatakana" class="kana">リャ</p>
                <p class="alphabet">RYA</p>
              </td>
              <td class="blank"></td>
              <td>
                <p v-show="!isKatakana" class="kana">りゅ</p>
                <p v-show="isKatakana" class="kana">リュ</p>
                <p class="alphabet">RYU</p>
              </td>
              <td class="blank"></td>
              <td>
                <p v-show="!isKatakana" class="kana">りょ</p>
                <p v-show="isKatakana" class="kana">リョ</p>
                <p class="alphabet">RYO</p>
              </td>
            </tr>
            <tr>
              <td>
                <p v-show="!isKatakana" class="kana">わ</p>
                <p v-show="isKatakana" class="kana">ワ</p>
                <p class="alphabet">WA</p>
              </td>
              <td class="blank"></td>
              <td class="blank"></td>
              <td class="blank"></td>
              <td>
                <p v-show="!isKatakana" class="kana">を</p>
                <p v-show="isKatakana" class="kana">ヲ</p>
                <p class="alphabet">WO</p>
              </td>
              <td class="separator"></td>
              <td>
                <p v-show="!isKatakana" class="kana">ゔぁ</p>
                <p v-show="isKatakana" class="kana">ヴァ</p>
                <p class="alphabet">VA</p>
              </td>
              <td>
                <p v-show="!isKatakana" class="kana">ゔぃ</p>
                <p v-show="isKatakana" class="kana">ヴィ</p>
                <p class="alphabet">VI</p>
              </td>
              <td>
                <p v-show="!isKatakana" class="kana">ゔ</p>
                <p v-show="isKatakana" class="kana">ヴ</p>
                <p class="alphabet">VU</p>
              </td>
              <td>
                <p v-show="!isKatakana" class="kana">ゔぇ</p>
                <p v-show="isKatakana" class="kana">ヴェ</p>
                <p class="alphabet">VE</p>
              </td>
              <td>
                <p v-show="!isKatakana" class="kana">ゔぉ</p>
                <p v-show="isKatakana" class="kana">ヴォ</p>
                <p class="alphabet">VO</p>
              </td>
            </tr>
            <tr>
              <td>
                <p v-show="!isKatakana" class="kana">ん</p>
                <p v-show="isKatakana" class="kana">ン</p>
                <p class="alphabet">NN</p>
                <p class="alphabet">XN</p>
              </td>
              <td class="blank"></td>
              <td class="blank"></td>
              <td class="blank"></td>
              <td class="blank"></td>
              <td class="separator"></td>
              <td colspan="2">
                <p v-show="!isKatakana" class="kana">っ</p>
                <p v-show="isKatakana" class="kana">ッ</p>
                <div class="d-flex">
                  <div class="col-span-two">
                    <p class="alphabet">LTU</p>
                    <p class="alphabet">XTU</p>
                  </div>
                  <div class="col-span-two">
                    <p class="alphabet">LTSU</p>
                    <p class="alphabet">XTSU</p>
                  </div>
                </div>
              </td>
              <td class="blank"></td>
              <td class="blank"></td>
              <td class="blank"></td>
            </tr>
          </tbody>
        </table>
      </div>
    </v-col>
  </v-row>
</template>

<script>
export default {
  name: "Table",
  data() {
    return {
      isKatakana: false
    };
  }
};
</script>

<style lang="scss" scoped>
.table-container {
  width: 626px;
  margin: 0 auto;
  .left-spacer {
    width: 110px;
  }
}
table {
  // width: 800px;
  border-collapse: collapse;
  tr {
    border: 1px solid #000000;
    td {
      width: 60px;
      padding: 5px 0;
      border: 1px solid #000000;
      &.blank {
        background-color: #ffffff;
      }
      &.separator {
        width: 25px;
        background-color: #000000;
      }
      p {
        &.kana {
          height: 18px;
          margin-bottom: 10px;
          font-size: 16px;
          color: #000000;
        }
        &.alphabet {
          height: 20px;
          margin-bottom: 5px;
          font-size: 18px;
          color: #000000;
          font-weight: bold;
        }
      }
      .d-flex {
        display: flex;
        .col-span-two {
          width: 50%;
        }
      }
    }
  }
}
</style>
