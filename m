Return-Path: <benjamin.gaignard@linaro.org>
MIME-Version: 1.0
References: <20181114090027.7580-1-benjamin.gaignard@linaro.org> <20181114090027.7580-4-benjamin.gaignard@linaro.org>
In-Reply-To: <20181114090027.7580-4-benjamin.gaignard@linaro.org>
From: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Date: Thu, 6 Dec 2018 10:59:25 +0100
Message-ID: <CA+M3ks6Qk9rjnBHUkPRT8KNnBaG-wBAMOQek0Du39OhYYoDUfg@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] ARM: dts: stm32: Add hwspinlock node for
 stm32mp157 SoC
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
To: Ohad Ben Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Alexandre Torgue <alexandre.torgue@st.com>
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, Linux ARM <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-stm32@st-md-mailman.stormreply.com, Benjamin GAIGNARD <benjamin.gaignard@st.com>
List-ID: <linux-remoteproc@vger.kernel.org>

Le mer. 14 nov. 2018 =C3=A0 10:00, Benjamin Gaignard
<benjamin.gaignard@linaro.org> a =C3=A9crit :
>
> From: Benjamin Gaignard <benjamin.gaignard@st.com>
>
> Declare hwspinlock device for stm32mp157 SoC

I abandon this patch and I will send a one that fixes the issues.

>
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@linaro.org>
> ---
>  arch/arm/boot/dts/stm32mp157c.dtsi | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/arch/arm/boot/dts/stm32mp157c.dtsi b/arch/arm/boot/dts/stm32=
mp157c.dtsi
> index 185541a5b69f..98f824d8b0f0 100644
> --- a/arch/arm/boot/dts/stm32mp157c.dtsi
> +++ b/arch/arm/boot/dts/stm32mp157c.dtsi
> @@ -803,6 +803,15 @@
>                         status =3D "disabled";
>                 };
>
> +               hsem: hwspinlock@4c000000 {
> +                       compatible =3D "st,stm32-hwspinlock";
> +                       #hwlock-cells =3D <1>;
> +                       reg =3D <0x4c000000 0x400>;
> +                       clocks =3D <&rcc HSEM>;
> +                       clock-names =3D "hwsem";
> +                       status =3D "disabled";
> +               };
> +
>                 rcc: rcc@50000000 {
>                         compatible =3D "st,stm32mp1-rcc", "syscon";
>                         reg =3D <0x50000000 0x1000>;
> --
> 2.15.0
>


--=20
Benjamin Gaignard

Graphic Study Group

Linaro.org =E2=94=82 Open source software for ARM SoCs

Follow Linaro: Facebook | Twitter | Blog
