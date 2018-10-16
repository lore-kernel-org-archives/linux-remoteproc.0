Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <1539337244-9505-3-git-send-email-govinds@codeaurora.org>
References: <1539337244-9505-1-git-send-email-govinds@codeaurora.org>
 <1539337244-9505-3-git-send-email-govinds@codeaurora.org>
Message-ID: <153965169170.5275.12866721145155274552@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH v2 2/6] clk: qcom: Add WCSS gcc clock control for QCS404
Date: Mon, 15 Oct 2018 18:01:31 -0700
To: Govind Singh <govinds@codeaurora.org>, andy.gross@linaro.org, bjorn.andersson@linaro.org, david.brown@linaro.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-soc@vger.kernel.org, sibis@codeaurora.org, sricharan@codeaurora.org
List-ID: <linux-remoteproc@vger.kernel.org>

Quoting Govind Singh (2018-10-12 02:40:40)
>  static const struct regmap_config gcc_qcs404_regmap_config =3D {
> @@ -2669,7 +2699,7 @@ enum {
>         .fast_io        =3D true,
>  };
>  =

> -static const struct qcom_cc_desc gcc_qcs404_desc =3D {
> +static struct qcom_cc_desc gcc_qcs404_desc =3D {
>         .config =3D &gcc_qcs404_regmap_config,
>         .clks =3D gcc_qcs404_clocks,
>         .num_clks =3D ARRAY_SIZE(gcc_qcs404_clocks),
> @@ -2702,6 +2732,11 @@ static int gcc_qcs404_probe(struct platform_device=
 *pdev)
>         clk_prepare_enable(apss_ahb_clk_src.clkr.hw.clk);
>         clk_prepare_enable(gpll0_ao_out_main.clkr.hw.clk);
>  =

> +       if (of_property_read_bool(pdev->dev.of_node, "qcom,wcss-protected=
")) {

Is this documented? And shouldn't it be inverted? If it isn't protected
then we do this?

> +               gcc_qcs404_clocks[GCC_WCSS_Q6_AHB_CBCR_CLK] =3D &gcc_wdsp=
_q6ss_ahbs_clk.clkr;
> +               gcc_qcs404_clocks[GCC_WCSS_Q6_AXIM_CBCR_CLK] =3D &gcc_wds=
p_q6ss_axim_clk.clkr;
> +       }
> +
>         return qcom_cc_really_probe(pdev, &gcc_qcs404_desc, regmap);
>  }
> =20
