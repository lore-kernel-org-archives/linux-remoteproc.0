Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20181215103557.2748-2-govinds@codeaurora.org>
Subject: Re: [PATCH v3 1/7] dt-bindings: clock: qcom: Introduce QCOM WCSS Q6DSP clock bindings
References: <20181215103557.2748-1-govinds@codeaurora.org> <20181215103557.2748-2-govinds@codeaurora.org>
Message-ID: <154507522782.19322.17858102871851741802@swboyd.mtv.corp.google.com>
From: Stephen Boyd <sboyd@kernel.org>
Date: Mon, 17 Dec 2018 11:33:47 -0800
To: Govind Singh <govinds@codeaurora.org>, bjorn.andersson@linaro.org, linux-remoteproc@vger.kernel.org
Cc: linux-clk@vger.kernel.org, sricharan@codeaurora.org, sibis@codeaurora.org, linux-arm-msm@vger.kernel.org, andy.gross@linaro.org, david.brown@linaro.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Quoting Govind Singh (2018-12-15 02:35:51)
> Add device tree bindings for WiFi QDSP subsystem clock controls
> found in OCS405 soc.
>=20
> Signed-off-by: Govind Singh <govinds@codeaurora.org>
> Reviewed-by: Rob Herring <robh@kernel.org>

It was?

> diff --git a/Documentation/devicetree/bindings/clock/qcom,wcsscc.txt b/Do=
cumentation/devicetree/bindings/clock/qcom,wcsscc.txt
> new file mode 100644
> index 000000000000..2b19ef0b5689
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,wcsscc.txt
> @@ -0,0 +1,26 @@
> +Qualcomm WCSS Clock Controller Binding
> +-----------------------------------------------
> +
> +Required properties :
> +- compatible           : shall contain "qcom,qcs404-wcsscc"
> +- #clock-cells         : from common clock binding, shall contain 1.

Drop the full-stop please.

> +- reg                  : shall contain base register address and size,
> +                         in the order
> +                       Index-0 maps to WCSS_Q6SSTOP clocks register regi=
on
> +                       Index-1 maps to WCSS_TCSR register region
> +                       Index-2 maps to WCSS_QDSP6SS register region
> +

Index 0, Index 1, Index 2? Not sure why there's a hyphen there.

> +Optional properties :
> +- reg-names    : register names of WCSS domain
> +                "wcss_q6sstop", "wcnss_tcsr", "wcss_qdsp6ss".
> +
> +Example:
> +The below node has to be defined in the cases where the WCSS peripheral =
loader
> +would bring the subsystem out of reset.
> +
> +       clock_wcsscc: qcom,wcsscc@7000000 {

clock-controller@7000000

> +               compatible =3D "qcom,qcs404-wcsscc";
> +               reg =3D <0x07500000 0x4e000>, <0x07550000 0x8012>, <0x074=
00000 0x104>;

And then that unit address doesn't match the first offset so that needs
fixing too.

> +               reg-names =3D "wcss_q6sstop", "wcnss_tcsr", "wcss_qdsp6ss=
";
> +               #clock-cells =3D <1>;
> +       };
