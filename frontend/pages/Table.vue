<template>
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
            <p class="kana">うぁ</p>
            <p class="alphabet"></p>
            <p class="alphabet">WHA</p>
          </td>
          <td>
            <p class="kana">うぃ</p>
            <p class="alphabet">WI</p>
            <p class="alphabet">WHI</p>
          </td>
          <td class="blank"></td>
          <td>
            <p class="kana">うぇ</p>
            <p class="alphabet">WE</p>
            <p class="alphabet">WHE</p>
          </td>
          <td>
            <p class="kana">うぉ</p>
            <p class="alphabet"></p>
            <p class="alphabet">WHO</p>
          </td>
        </tr>
        <tr>
          <td>
            <p class="kana">か</p>
            <p class="alphabet">KA</p>
            <p class="alphabet">CA</p>
          </td>
          <td>
            <p class="kana">き</p>
            <p class="alphabet">KI</p>
            <p class="alphabet"></p>
          </td>
          <td>
            <p class="kana">く</p>
            <p class="alphabet">KU</p>
            <p class="alphabet">CU</p>
          </td>
          <td>
            <p class="kana">け</p>
            <p class="alphabet">KE</p>
            <p class="alphabet"></p>
          </td>
          <td>
            <p class="kana">こ</p>
            <p class="alphabet">KO</p>
            <p class="alphabet">CO</p>
          </td>
          <td class="separator"></td>
          <td>
            <p class="kana">きゃ</p>
            <p class="alphabet">KYA</p>
            <p class="alphabet"></p>
          </td>
          <td>
            <p class="kana">きぃ</p>
            <p class="alphabet">KYI</p>
            <p class="alphabet"></p>
          </td>
          <td>
            <p class="kana">きゅ</p>
            <p class="alphabet">KYU</p>
            <p class="alphabet"></p>
          </td>
          <td>
            <p class="kana">きぇ</p>
            <p class="alphabet">KYE</p>
            <p class="alphabet"></p>
          </td>
          <td>
            <p class="kana">きょ</p>
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
            <p class="kana">くぉ</p>
            <p class="alphabet">QO</p>
            <p class="alphabet">KWO</p>
          </td>
        </tr>
        <tr>
          <td>
            <p class="kana">が</p>
            <p class="alphabet">GA</p>
          </td>
          <td>
            <p class="kana">ぎ</p>
            <p class="alphabet">GI</p>
          </td>
          <td>
            <p class="kana">ぐ</p>
            <p class="alphabet">GU</p>
          </td>
          <td>
            <p class="kana">げ</p>
            <p class="alphabet">GE</p>
          </td>
          <td>
            <p class="kana">ご</p>
            <p class="alphabet">GO</p>
          </td>
          <td class="separator"></td>
          <td>
            <p class="kana">ぎゃ</p>
            <p class="alphabet">GYA</p>
          </td>
          <td class="blank"></td>
          <td>
            <p class="kana">ぎゅ</p>
            <p class="alphabet">GYU</p>
          </td>
          <td class="blank"></td>
          <td>
            <p class="kana">ぎょ</p>
            <p class="alphabet">GYO</p>
          </td>
        </tr>
        <tr>
          <td>
            <p class="kana">さ</p>
            <p class="alphabet">SA</p>
            <p class="alphabet"></p>
          </td>
          <td>
            <p class="kana">し</p>
            <p class="alphabet">SI</p>
            <p class="alphabet">SHI</p>
          </td>
          <td>
            <p class="kana">す</p>
            <p class="alphabet">SU</p>
            <p class="alphabet"></p>
          </td>
          <td>
            <p class="kana">せ</p>
            <p class="alphabet">SE</p>
            <p class="alphabet"></p>
          </td>
          <td>
            <p class="kana">そ</p>
            <p class="alphabet">SO</p>
            <p class="alphabet"></p>
          </td>
          <td class="separator"></td>
          <td>
            <p class="kana">しゃ</p>
            <p class="alphabet">SYA</p>
            <p class="alphabet">SHA</p>
          </td>
          <td class="blank"></td>
          <td>
            <p class="kana">しゅ</p>
            <p class="alphabet">SYU</p>
            <p class="alphabet">SHU</p>
          </td>
          <td>
            <p class="kana">しぇ</p>
            <p class="alphabet">SYE</p>
            <p class="alphabet">SHE</p>
          </td>
          <td>
            <p class="kana">しょ</p>
            <p class="alphabet">SYO</p>
            <p class="alphabet">SHO</p>
          </td>
        </tr>
        <tr>
          <td>
            <p class="kana">ざ</p>
            <p class="alphabet">ZA</p>
            <p class="alphabet"></p>
            <p class="alphabet"></p>
          </td>
          <td>
            <p class="kana">じ</p>
            <p class="alphabet">ZI</p>
            <p class="alphabet">JI</p>
            <p class="alphabet"></p>
          </td>
          <td>
            <p class="kana">ず</p>
            <p class="alphabet">ZU</p>
            <p class="alphabet"></p>
            <p class="alphabet"></p>
          </td>
          <td>
            <p class="kana">ぜ</p>
            <p class="alphabet">ZE</p>
            <p class="alphabet"></p>
            <p class="alphabet"></p>
          </td>
          <td>
            <p class="kana">ぞ</p>
            <p class="alphabet">ZO</p>
            <p class="alphabet"></p>
            <p class="alphabet"></p>
          </td>
          <td class="separator"></td>
          <td>
            <p class="kana">じゃ</p>
            <p class="alphabet">ZYA</p>
            <p class="alphabet">JA</p>
            <p class="alphabet">JYA</p>
          </td>
          <td class="blank"></td>
          <td>
            <p class="kana">じゅ</p>
            <p class="alphabet">ZYU</p>
            <p class="alphabet">JU</p>
            <p class="alphabet">JYU</p>
          </td>
          <td>
            <p class="kana">じぇ</p>
            <p class="alphabet">ZYE</p>
            <p class="alphabet">JE</p>
            <p class="alphabet">JYE</p>
          </td>
          <td>
            <p class="kana">じょ</p>
            <p class="alphabet">ZYO</p>
            <p class="alphabet">JO</p>
            <p class="alphabet">JYO</p>
          </td>
        </tr>
        <tr>
          <td>
            <p class="kana">た</p>
            <p class="alphabet">TA</p>
            <p class="alphabet"></p>
            <p class="alphabet"></p>
          </td>
          <td>
            <p class="kana">ち</p>
            <p class="alphabet">TI</p>
            <p class="alphabet">CHI</p>
            <p class="alphabet"></p>
          </td>
          <td>
            <p class="kana">つ</p>
            <p class="alphabet">TU</p>
            <p class="alphabet">TSU</p>
            <p class="alphabet"></p>
          </td>
          <td>
            <p class="kana">て</p>
            <p class="alphabet">TE</p>
            <p class="alphabet"></p>
            <p class="alphabet"></p>
          </td>
          <td>
            <p class="kana">と</p>
            <p class="alphabet">TO</p>
            <p class="alphabet"></p>
            <p class="alphabet"></p>
          </td>
          <td class="separator"></td>
          <td>
            <p class="kana">ちゃ</p>
            <p class="alphabet">TYA</p>
            <p class="alphabet">CYA</p>
            <p class="alphabet">CHA</p>
          </td>
          <td class="blank"></td>
          <td>
            <p class="kana">ちゅ</p>
            <p class="alphabet">TYU</p>
            <p class="alphabet">CYU</p>
            <p class="alphabet">CHU</p>
          </td>
          <td>
            <p class="kana">ちぇ</p>
            <p class="alphabet">TYE</p>
            <p class="alphabet">CYE</p>
            <p class="alphabet">CHE</p>
          </td>
          <td>
            <p class="kana">ちょ</p>
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
            <p class="kana">てぃ</p>
            <p class="alphabet">THI</p>
          </td>
          <td>
            <p class="kana">てゅ</p>
            <p class="alphabet">THU</p>
          </td>
          <td class="blank"></td>
          <td>
            <p class="kana">とぅ</p>
            <p class="alphabet">TWU</p>
          </td>
        </tr>
        <tr>
          <td>
            <p class="kana">だ</p>
            <p class="alphabet">DA</p>
          </td>
          <td>
            <p class="kana">ぢ</p>
            <p class="alphabet">DI</p>
          </td>
          <td>
            <p class="kana">づ</p>
            <p class="alphabet">DU</p>
          </td>
          <td>
            <p class="kana">で</p>
            <p class="alphabet">DE</p>
          </td>
          <td>
            <p class="kana">ど</p>
            <p class="alphabet">DO</p>
          </td>
          <td class="separator"></td>
          <td class="blank"></td>
          <td>
            <p class="kana">でぃ</p>
            <p class="alphabet">DHI</p>
          </td>
          <td>
            <p class="kana">でゅ</p>
            <p class="alphabet">DHU</p>
          </td>
          <td class="blank"></td>
          <td class="blank"></td>
        </tr>
        <tr>
          <td>
            <p class="kana">な</p>
            <p class="alphabet">NA</p>
          </td>
          <td>
            <p class="kana">に</p>
            <p class="alphabet">NI</p>
          </td>
          <td>
            <p class="kana">ぬ</p>
            <p class="alphabet">NU</p>
          </td>
          <td>
            <p class="kana">ね</p>
            <p class="alphabet">NE</p>
          </td>
          <td>
            <p class="kana">の</p>
            <p class="alphabet">NO</p>
          </td>
          <td class="separator"></td>
          <td>
            <p class="kana">にゃ</p>
            <p class="alphabet">NYA</p>
          </td>
          <td class="blank"></td>
          <td>
            <p class="kana">にゅ</p>
            <p class="alphabet">NYU</p>
          </td>
          <td class="blank"></td>
          <td>
            <p class="kana">にょ</p>
            <p class="alphabet">NYO</p>
          </td>
        </tr>
        <tr>
          <td>
            <p class="kana">は</p>
            <p class="alphabet">HA</p>
            <p class="alphabet"></p>
          </td>
          <td>
            <p class="kana">ひ</p>
            <p class="alphabet">HI</p>
            <p class="alphabet"></p>
          </td>
          <td>
            <p class="kana">ふ</p>
            <p class="alphabet">HU</p>
            <p class="alphabet">FU</p>
          </td>
          <td>
            <p class="kana">へ</p>
            <p class="alphabet">HE</p>
            <p class="alphabet"></p>
          </td>
          <td>
            <p class="kana">ほ</p>
            <p class="alphabet">HO</p>
            <p class="alphabet"></p>
          </td>
          <td class="separator"></td>
          <td>
            <p class="kana">ひゃ</p>
            <p class="alphabet">HYA</p>
            <p class="alphabet"></p>
          </td>
          <td class="blank"></td>
          <td>
            <p class="kana">ひゅ</p>
            <p class="alphabet">HYU</p>
            <p class="alphabet"></p>
          </td>
          <td class="blank"></td>
          <td>
            <p class="kana">ひょ</p>
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
            <p class="kana">ふぁ</p>
            <p class="alphabet">FA</p>
          </td>
          <td>
            <p class="kana">ふぃ</p>
            <p class="alphabet">FI</p>
          </td>
          <td class="blank"></td>
          <td>
            <p class="kana">ふぇ</p>
            <p class="alphabet">FE</p>
          </td>
          <td>
            <p class="kana">ふぉ</p>
            <p class="alphabet">FO</p>
          </td>
        </tr>
        <tr>
          <td>
            <p class="kana">ば</p>
            <p class="alphabet">BA</p>
          </td>
          <td>
            <p class="kana">び</p>
            <p class="alphabet">BI</p>
          </td>
          <td>
            <p class="kana">ぶ</p>
            <p class="alphabet">BU</p>
          </td>
          <td>
            <p class="kana">べ</p>
            <p class="alphabet">BE</p>
          </td>
          <td>
            <p class="kana">ぼ</p>
            <p class="alphabet">BO</p>
          </td>
          <td class="separator"></td>
          <td>
            <p class="kana">びゃ</p>
            <p class="alphabet">BYA</p>
          </td>
          <td class="blank"></td>
          <td>
            <p class="kana">びゅ</p>
            <p class="alphabet">BYU</p>
          </td>
          <td class="blank"></td>
          <td>
            <p class="kana">びょ</p>
            <p class="alphabet">BYO</p>
          </td>
        </tr>
        <tr>
          <td>
            <p class="kana">ぱ</p>
            <p class="alphabet">PA</p>
          </td>
          <td>
            <p class="kana">ぴ</p>
            <p class="alphabet">PI</p>
          </td>
          <td>
            <p class="kana">ぷ</p>
            <p class="alphabet">PU</p>
          </td>
          <td>
            <p class="kana">ぺ</p>
            <p class="alphabet">PE</p>
          </td>
          <td>
            <p class="kana">ぽ</p>
            <p class="alphabet">PO</p>
          </td>
          <td class="separator"></td>
          <td>
            <p class="kana">ぴゃ</p>
            <p class="alphabet">PYA</p>
          </td>
          <td class="blank"></td>
          <td>
            <p class="kana">ぴゅ</p>
            <p class="alphabet">PYU</p>
          </td>
          <td class="blank"></td>
          <td>
            <p class="kana">ぴょ</p>
            <p class="alphabet">PYO</p>
          </td>
        </tr>
        <tr>
          <td>
            <p class="kana">ま</p>
            <p class="alphabet">MA</p>
          </td>
          <td>
            <p class="kana">み</p>
            <p class="alphabet">MI</p>
          </td>
          <td>
            <p class="kana">む</p>
            <p class="alphabet">MU</p>
          </td>
          <td>
            <p class="kana">め</p>
            <p class="alphabet">ME</p>
          </td>
          <td>
            <p class="kana">も</p>
            <p class="alphabet">MO</p>
          </td>
          <td class="separator"></td>
          <td>
            <p class="kana">みゃ</p>
            <p class="alphabet">MYA</p>
          </td>
          <td class="blank"></td>
          <td>
            <p class="kana">みゅ</p>
            <p class="alphabet">MYU</p>
          </td>
          <td class="blank"></td>
          <td>
            <p class="kana">みょ</p>
            <p class="alphabet">MYO</p>
          </td>
        </tr>
        <tr>
          <td>
            <p class="kana">や</p>
            <p class="alphabet">YA</p>
            <p class="alphabet"></p>
          </td>
          <td class="blank"></td>
          <td>
            <p class="kana">ゆ</p>
            <p class="alphabet">YU</p>
            <p class="alphabet"></p>
          </td>
          <td class="blank"></td>
          <td>
            <p class="kana">よ</p>
            <p class="alphabet">YO</p>
            <p class="alphabet"></p>
          </td>
          <td class="separator"></td>
          <td>
            <p class="kana">ゃ</p>
            <p class="alphabet">LYA</p>
            <p class="alphabet">XYA</p>
          </td>
          <td class="blank"></td>
          <td>
            <p class="kana">ゅ</p>
            <p class="alphabet">LYU</p>
            <p class="alphabet">XYU</p>
          </td>
          <td class="blank"></td>
          <td>
            <p class="kana">ょ</p>
            <p class="alphabet">LYO</p>
            <p class="alphabet">XYO</p>
          </td>
        </tr>
        <tr>
          <td>
            <p class="kana">ら</p>
            <p class="alphabet">RA</p>
          </td>
          <td>
            <p class="kana">り</p>
            <p class="alphabet">RI</p>
          </td>
          <td>
            <p class="kana">る</p>
            <p class="alphabet">RU</p>
          </td>
          <td>
            <p class="kana">れ</p>
            <p class="alphabet">RE</p>
          </td>
          <td>
            <p class="kana">ろ</p>
            <p class="alphabet">RO</p>
          </td>
          <td class="separator"></td>
          <td>
            <p class="kana">りゃ</p>
            <p class="alphabet">RYA</p>
          </td>
          <td class="blank"></td>
          <td>
            <p class="kana">りゅ</p>
            <p class="alphabet">RYU</p>
          </td>
          <td class="blank"></td>
          <td>
            <p class="kana">りょ</p>
            <p class="alphabet">RYO</p>
          </td>
        </tr>
        <tr>
          <td>
            <p class="kana">わ</p>
            <p class="alphabet">WA</p>
          </td>
          <td class="blank"></td>
          <td class="blank"></td>
          <td class="blank"></td>
          <td>
            <p class="kana">を</p>
            <p class="alphabet">WO</p>
          </td>
          <td class="separator"></td>
          <td>
            <p class="kana">ゔぁ</p>
            <p class="alphabet">VA</p>
          </td>
          <td>
            <p class="kana">ゔぃ</p>
            <p class="alphabet">VI</p>
          </td>
          <td>
            <p class="kana">ゔ</p>
            <p class="alphabet">VU</p>
          </td>
          <td>
            <p class="kana">ゔぇ</p>
            <p class="alphabet">VE</p>
          </td>
          <td>
            <p class="kana">ゔぉ</p>
            <p class="alphabet">VO</p>
          </td>
        </tr>
        <tr>
          <td>
            <p class="kana">ん</p>
            <p class="alphabet">NN</p>
            <p class="alphabet">XN</p>
          </td>
          <td class="blank"></td>
          <td class="blank"></td>
          <td class="blank"></td>
          <td class="blank"></td>
          <td class="separator"></td>
          <td colspan="2">
            <p class="kana">っ</p>
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
