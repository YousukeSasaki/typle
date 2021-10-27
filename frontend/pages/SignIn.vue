<template>
  <div :class="$style.container">
    <v-form ref="form" v-model="valid" lazy-validation>
      <v-text-field
        v-model="email"
        :rules="emailRules"
        label="E-mail"
        required
      ></v-text-field>

      <v-text-field
        v-model="password"
        :append-icon="show ? 'mdi-eye' : 'mdi-eye-off'"
        :rules="[passwordRules.required, passwordRules.min]"
        :type="show ? 'text' : 'password'"
        name="Password"
        label="Password"
        hint="8文字以上で入力してください"
        counter
        @click:append="show = !show"
      ></v-text-field>

      <v-btn color="success" class="mr-4" @click="submitRequest">
        ログイン
      </v-btn>
    </v-form>
  </div>
</template>

<script>
export default {
  name: "SignIn",
  data: () => ({
    valid: true,
    email: "",
    emailRules: [
      v => !!v || "E-mail is required",
      v => /.+@.+\..+/.test(v) || "E-mail must be valid"
    ],
    password: "",
    show: false,
    passwordRules: {
      required: value => !!value || "Required.",
      min: v => v.length >= 8 || "Min 8 characters",
      emailMatch: () => "The email and password you entered don't match"
    }
  }),

  methods: {
    validate() {
      this.$refs.form.validate();
    },
    reset() {
      this.$refs.form.reset();
    },
    resetValidation() {
      this.$refs.form.resetValidation();
    },
    submitRequest() {
      this.$emit("errorAlert");
    }
  }
};
</script>

<style lang="scss" module>
.container {
  width: 660px;
  height: 600px;
  margin: 0 auto;
  padding: 30px;
  // background-color: #000000;
  // color: #ffffff;
  text-align: center;
  font-size: 1.5rem;
}
</style>
