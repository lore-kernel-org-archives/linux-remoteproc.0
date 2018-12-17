Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20181215103557.2748-5-govinds@codeaurora.org>
Subject: Re: [PATCH v3 4/7] clk: qcom: Add WCSS gcc clock control for QCS404
References: <20181215103557.2748-1-govinds@codeaurora.org> <20181215103557.2748-5-govinds@codeaurora.org>
Message-ID: <154507278563.19322.18324820054996663733@swboyd.mtv.corp.google.com>
From: Stephen Boyd <sboyd@kernel.org>
Date: Mon, 17 Dec 2018 10:53:05 -0800
To: Govind Singh <govinds@codeaurora.org>, bjorn.andersson@linaro.org, linux-remoteproc@vger.kernel.org
Cc: linux-clk@vger.kernel.org, sricharan@codeaurora.org, sibis@codeaurora.org, linux-arm-msm@vger.kernel.org, andy.gross@linaro.org, david.brown@linaro.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Quoting Govind Singh (2018-12-15 02:35:54)
> @@ -2726,6 +2770,11 @@ static int gcc_qcs404_probe(struct platform_device=
 *pdev)
>                         return ret;
>         }
> =20
> +#ifdef CONFIG_QCS_WCSSCC_404
> +               gcc_qcs404_clocks[GCC_WCSS_Q6_AHB_CBCR_CLK] =3D &gcc_wdsp=
_q6ss_ahbs_clk.clkr;
> +               gcc_qcs404_clocks[GCC_WCSS_Q6_AXIM_CBCR_CLK] =3D &gcc_wds=
p_q6ss_axim_clk.clkr;

What is going on with the tabs here? Why is it under an ifdef?

> +#endif
> +
>         return qcom_cc_really_probe(pdev, &gcc_qcs404_desc, regmap);
>  }
> =20
> --=20
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
>=20
