Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20181215103557.2748-6-govinds@codeaurora.org>
Subject: Re: [PATCH v3 5/7] remoteproc: qcom: wcss: populate hardcoded param using driver data
References: <20181215103557.2748-1-govinds@codeaurora.org> <20181215103557.2748-6-govinds@codeaurora.org>
Message-ID: <154507292461.19322.16649255647859149880@swboyd.mtv.corp.google.com>
From: Stephen Boyd <sboyd@kernel.org>
Date: Mon, 17 Dec 2018 10:55:24 -0800
To: Govind Singh <govinds@codeaurora.org>, bjorn.andersson@linaro.org, linux-remoteproc@vger.kernel.org
Cc: linux-clk@vger.kernel.org, sricharan@codeaurora.org, sibis@codeaurora.org, linux-arm-msm@vger.kernel.org, andy.gross@linaro.org, david.brown@linaro.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Quoting Govind Singh (2018-12-15 02:35:55)
> diff --git a/drivers/remoteproc/qcom_q6v5_wcss.c b/drivers/remoteproc/qco=
m_q6v5_wcss.c
> index f93e1e4a1cc0..129f82404656 100644
> --- a/drivers/remoteproc/qcom_q6v5_wcss.c
> +++ b/drivers/remoteproc/qcom_q6v5_wcss.c
> @@ -16,7 +17,6 @@
>  #include "qcom_common.h"
>  #include "qcom_q6v5.h"
> =20
> -#define WCSS_CRASH_REASON              421
> =20
>  /* Q6SS Register Offsets */
>  #define Q6SS_RESET_REG         0x014
> @@ -70,6 +70,14 @@
>  #define TCSR_WCSS_CLK_MASK     0x1F
>  #define TCSR_WCSS_CLK_ENABLE   0x14
> =20
> +struct wcss_data {
> +       void (*pas_handover)(struct qcom_q6v5 *q6v5);
> +       const char *firmware_name;
> +       int crash_reason_smem;
> +       int version;

version can be negative?

> +       int pas_id;

And the pas_id can be negative too?

> +};
> +
>  struct q6v5_wcss {
>         struct device *dev;
> =20
> @@ -553,7 +573,8 @@ static int q6v5_wcss_probe(struct platform_device *pd=
ev)
>         if (ret)
>                 goto free_rproc;
> =20
> -       ret =3D qcom_q6v5_init(&wcss->q6v5, pdev, rproc, WCSS_CRASH_REASO=
N, NULL);
> +       ret =3D qcom_q6v5_init(&wcss->q6v5, pdev, rproc, desc->crash_reas=
on_smem,
> +                            desc->pas_handover);
>         if (ret)
>                 goto free_rproc;
> =20
> @@ -581,8 +602,15 @@ static int q6v5_wcss_remove(struct platform_device *=
pdev)
>         return 0;
>  }
> =20
> +static const struct wcss_data wcss_ipq8074_res_init =3D {
> +       .firmware_name =3D "IPQ8074/q6_fw.mdt",
> +       .crash_reason_smem =3D 421,

Why destroy the #define and inline it here? Keep the define around and
use it here instead?

> +       .pas_handover =3D NULL,

This surely isn't needed to be assigned to NULL.
