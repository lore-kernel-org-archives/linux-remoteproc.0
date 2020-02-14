Return-Path: <linux-arm-msm-owner@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200211005059.1377279-9-bjorn.andersson@linaro.org>
References: <20200211005059.1377279-1-bjorn.andersson@linaro.org> <20200211005059.1377279-9-bjorn.andersson@linaro.org>
Subject: Re: [PATCH v3 8/8] remoteproc: qcom: Introduce panic handler for PAS and ADSP
From: Stephen Boyd <swboyd@chromium.org>
Date: Thu, 13 Feb 2020 18:43:04 -0800
Message-ID: <158164818421.184098.5580195556346218701@swboyd.mtv.corp.google.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>
Cc: Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Sibi Sankar <sibis@codeaurora.org>, Rishabh Bhatnagar <rishabhb@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Quoting Bjorn Andersson (2020-02-10 16:50:59)
> diff --git a/drivers/remoteproc/qcom_q6v5_adsp.c b/drivers/remoteproc/qco=
m_q6v5_adsp.c
> index 19f784adf91c..822881534d37 100644
> --- a/drivers/remoteproc/qcom_q6v5_adsp.c
> +++ b/drivers/remoteproc/qcom_q6v5_adsp.c
> @@ -291,12 +291,20 @@ static void *adsp_da_to_va(struct rproc *rproc, u64=
 da, int len)
>         return adsp->mem_region + offset;
>  }
> =20
> +static unsigned int adsp_panic(struct rproc *rproc)
> +{
> +       struct qcom_adsp *adsp =3D (struct qcom_adsp *)rproc->priv;

We don't need to cast from void. Please drop the cast.

> +
> +       return qcom_q6v5_panic(&adsp->q6v5);
> +}
> +
>  static const struct rproc_ops adsp_ops =3D {
>         .start =3D adsp_start,
>         .stop =3D adsp_stop,
>         .da_to_va =3D adsp_da_to_va,
>         .parse_fw =3D qcom_register_dump_segments,
>         .load =3D adsp_load,
> +       .panic =3D adsp_panic,
>  };
> =20
>  static int adsp_init_clock(struct qcom_adsp *adsp, const char **clk_ids)
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom=
_q6v5_pas.c
> index d20ce3c62256..ac38624fb14d 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -242,12 +242,20 @@ static void *adsp_da_to_va(struct rproc *rproc, u64=
 da, int len)
>         return adsp->mem_region + offset;
>  }
> =20
> +static unsigned int adsp_panic(struct rproc *rproc)
> +{
> +       struct qcom_adsp *adsp =3D (struct qcom_adsp *)rproc->priv;

Same.

> +
> +       return qcom_q6v5_panic(&adsp->q6v5);
> +}
