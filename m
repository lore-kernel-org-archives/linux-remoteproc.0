Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 2/8] clk: qcom: Add WCSS gcc clock control for QCS404
From: Stephen Boyd <sboyd@kernel.org>
Message-ID: <154940338896.169292.16683098609094394997@swboyd.mtv.corp.google.com>
References: <20190202152626.1006-1-govinds@codeaurora.org> <20190202152626.1006-3-govinds@codeaurora.org>
In-Reply-To: <20190202152626.1006-3-govinds@codeaurora.org>
Date: Tue, 05 Feb 2019 13:49:48 -0800
To: bjorn.andersson@linaro.org, linux-remoteproc@vger.kernel.org
Cc: linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org, andy.gross@linaro.org, david.brown@linaro.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, Govind Singh <govinds@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Quoting Govind Singh (2019-02-02 07:26:20)
> @@ -2726,6 +2756,11 @@ static int gcc_qcs404_probe(struct platform_device=
 *pdev)
>                         return ret;
>         }
> =20
> +       if (of_property_read_bool(pdev->dev.of_node, "qcom,wcss-unprotect=
ed")) {

This should use the protected-clocks property instead

> +               gcc_qcs404_clocks[GCC_WCSS_Q6_AHB_CLK] =3D &gcc_wdsp_q6ss=
_ahbs_clk.clkr;
> +               gcc_qcs404_clocks[GCC_WCSS_Q6_AXIM_CLK] =3D &gcc_wdsp_q6s=
s_axim_clk.clkr;
> +       }
> +
