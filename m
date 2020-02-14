Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200211005059.1377279-5-bjorn.andersson@linaro.org>
References: <20200211005059.1377279-1-bjorn.andersson@linaro.org> <20200211005059.1377279-5-bjorn.andersson@linaro.org>
Subject: Re: [PATCH v3 4/8] arm64: dts: qcom: qcs404: Add IMEM and PIL info region
From: Stephen Boyd <sboyd@chromium.org>
Date: Thu, 13 Feb 2020 18:37:04 -0800
Message-ID: <158164782444.184098.15673002519472990390@swboyd.mtv.corp.google.com>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Sibi Sankar <sibis@codeaurora.org>, Rishabh Bhatnagar <rishabhb@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Quoting Bjorn Andersson (2020-02-10 16:50:55)
> diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/q=
com/qcs404.dtsi
> index 4ee1e3d5f123..f539293b875c 100644
> --- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
> @@ -997,6 +997,19 @@ blsp2_spi0: spi@7af5000 {
>                         status =3D "disabled";
>                 };
> =20
> +               imem@8600000 {
> +                       compatible =3D "syscon", "simple-mfd";
> +                       reg =3D <0x08600000 0x1000>;
> +
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <1>;
> +
> +                       pil-reloc@94c {
> +                               compatible =3D"qcom,pil-reloc-info";
> +                               reg =3D <0x94c 200>;

Is it 200 in decimal? It looks weird that this is basically the only
thing that isn't in hexadecimal.

> +                       };
> +               };
> +
