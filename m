Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190726092332.25202-3-govinds@codeaurora.org>
References: <20190726092332.25202-1-govinds@codeaurora.org> <20190726092332.25202-3-govinds@codeaurora.org>
Subject: Re: [PATCH v5 2/7] dt-bindings: clock: qcom: Add QCOM Q6SSTOP clock controller bindings
From: Stephen Boyd <sboyd@kernel.org>
Date: Fri, 26 Jul 2019 12:43:01 -0700
Message-Id: <20190726194302.5BBD721852@mail.kernel.org>
To: Govind Singh <govinds@codeaurora.org>, bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-remoteproc@vger.kernel.org
Cc: andy.gross@linaro.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Quoting Govind Singh (2019-07-26 02:23:27)
> Add devicetree binding for the Q6SSTOP clock controller found in QCS404.
>=20
> Signed-off-by: Govind Singh <govinds@codeaurora.org>

If this patch goes again, please convert to YAML.

> ---
>  .../bindings/clock/qcom,q6sstopcc.txt         | 26 +++++++++++++++++++
>  1 file changed, 26 insertions(+)
>  create mode 100755 Documentation/devicetree/bindings/clock/qcom,q6sstopc=
c.txt
>=20
> diff --git a/Documentation/devicetree/bindings/clock/qcom,q6sstopcc.txt b=
/Documentation/devicetree/bindings/clock/qcom,q6sstopcc.txt
> new file mode 100755
> index 000000000000..157bb52f9dc4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,q6sstopcc.txt
> @@ -0,0 +1,26 @@
> +Qualcomm Q6SSTOP Clock Controller Binding
> +-----------------------------------------------
> +
> +Required properties :
> +- compatible           : shall contain "qcom,qcs404-q6sstopcc"
> +- #clock-cells         : from common clock binding, shall contain 1
> +- reg                  : shall contain base register address and size,
> +                         in the order
> +                       Index 0 maps to Q6SSTOP clocks register region
> +                       Index 1 maps to Q6SSTOP_TCSR register region
> +
> +Optional properties :
> +- reg-names    : register names of WCSS domain
> +                "q6sstop_cc", "q6sstop_tcsr".
> +
> +Example:
> +The below node has to be defined in the cases where the WCSS peripheral =
loader
> +would bring the subsystem out of reset.
> +
> +       q6sstopcc: clock-controller@7500000 {
> +               compatible =3D "qcom,qcs404-q6sstopcc";
> +               reg =3D <0x7500000 0x4e000>, <0x7550000 0x10000>;
> +               reg-names =3D "q6sstop_cc", "q6sstop_tcsr";
> +               clocks =3D <&gcc GCC_WCSS_Q6_AHB_CLK>;

This isn't described in the binding. Are there clocks that go here?
Please add them to the binding.
