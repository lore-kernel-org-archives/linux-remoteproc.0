Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1568375771-22933-13-git-send-email-gokulsri@codeaurora.org>
References: <1568375771-22933-1-git-send-email-gokulsri@codeaurora.org> <1568375771-22933-13-git-send-email-gokulsri@codeaurora.org>
From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH V2 12/12] arm64: dts: qcom: Enable Q6v5 WCSS for ipq8074 SoC
Date: Tue, 17 Sep 2019 09:15:56 -0700
Message-Id: <20190917161557.164C320665@mail.kernel.org>
To: agross@kernel.org, bjorn.andersson@linaro.org, david.brown@linaro.org, devicetree@vger.kernel.org, gokulsri@codeaurora.org, jassisinghbrar@gmail.com, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org, mark.rutland@arm.com, mturquette@baylibre.com, nprakash@codeaurora.org, ohad@wizery.com, robh+dt@kernel.org, sricharan@codeaurora.org
List-ID: <linux-remoteproc@vger.kernel.org>

Quoting Gokul Sriram Palanisamy (2019-09-13 04:56:11)
> diff --git a/arch/arm64/boot/dts/qcom/ipq8074.dtsi b/arch/arm64/boot/dts/=
qcom/ipq8074.dtsi
> index 6a61a63..0ea026e 100644
> --- a/arch/arm64/boot/dts/qcom/ipq8074.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
> @@ -431,6 +485,78 @@
>                                       "axi_m_sticky";
>                         status =3D "disabled";
>                 };
> +
> +               apcs: syscon@b111000 {
> +                       compatible =3D "syscon";
> +                       reg =3D <0x0b111000 0x1000>;
> +               };
> +
> +               tcsr_q6: syscon@1945000 {
> +                       compatible =3D "syscon";
> +                       reg =3D <0x01945000 0xe000>;
> +               };
> +
> +               tcsr_mutex_regs: syscon@193d000 {
> +                       compatible =3D "syscon";
> +                       reg =3D <0x01905000 0x8000>;
> +               };
> +
> +               apcs_glb: mailbox@b111000 {

This is the same as the syscon above. What's going on?

> +                       compatible =3D "qcom,ipq8074-apcs-apps-global";
> +                       reg =3D <0x0b111000 0x1000>;
> +
> +                       #mbox-cells =3D <1>;
> +               };
