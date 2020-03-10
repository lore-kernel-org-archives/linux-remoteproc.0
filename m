Return-Path: <swboyd@chromium.org>
Return-Path: <swboyd@chromium.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200310063338.3344582-4-bjorn.andersson@linaro.org>
References: <20200310063338.3344582-1-bjorn.andersson@linaro.org> <20200310063338.3344582-4-bjorn.andersson@linaro.org>
Subject: Re: [PATCH v4 3/5] remoteproc: qcom: Update PIL relocation info on load
From: Stephen Boyd <swboyd@chromium.org>
Date: Tue, 10 Mar 2020 11:10:56 -0700
Message-ID: <158386385637.149997.10680456822295964075@swboyd.mtv.corp.google.com>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>, Rob Herring <robh+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Mathieu Poirier <mathieu.poirier@linaro.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Quoting Bjorn Andersson (2020-03-09 23:33:36)
> diff --git a/drivers/remoteproc/qcom_q6v5_adsp.c b/drivers/remoteproc/qco=
m_q6v5_adsp.c
> index e953886b2eb7..d5cdff942535 100644
> --- a/drivers/remoteproc/qcom_q6v5_adsp.c
> +++ b/drivers/remoteproc/qcom_q6v5_adsp.c
> @@ -164,10 +166,18 @@ static int qcom_adsp_shutdown(struct qcom_adsp *ads=
p)
>  static int adsp_load(struct rproc *rproc, const struct firmware *fw)
>  {
>         struct qcom_adsp *adsp =3D (struct qcom_adsp *)rproc->priv;
> +       int ret;
> +
> +       ret =3D qcom_mdt_load_no_init(adsp->dev, fw, rproc->firmware, 0,
> +                                   adsp->mem_region, adsp->mem_phys,
> +                                   adsp->mem_size, &adsp->mem_reloc);
> +       if (ret)
> +               return ret;
> =20
> -       return qcom_mdt_load_no_init(adsp->dev, fw, rproc->firmware, 0,
> -                            adsp->mem_region, adsp->mem_phys, adsp->mem_=
size,
> -                            &adsp->mem_reloc);
> +       /* Failures only affect post mortem debugging, so ignore return v=
alue */
> +       qcom_pil_info_store(adsp->info_name, adsp->mem_reloc, adsp->mem_s=
ize);

If the return value was void then the comment wouldn't be necessary and
it would be self documenting as such. Can we do that?
