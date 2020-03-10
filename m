Date: Tue, 10 Mar 2020 12:20:30 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v4 3/5] remoteproc: qcom: Update PIL relocation info on
 load
Message-ID: <20200310192027.GJ264362@yoga>
References: <20200310063338.3344582-1-bjorn.andersson@linaro.org>
 <20200310063338.3344582-4-bjorn.andersson@linaro.org>
 <158386385637.149997.10680456822295964075@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <158386385637.149997.10680456822295964075@swboyd.mtv.corp.google.com>
To: Stephen Boyd <swboyd@chromium.org>
Cc: Andy Gross <agross@kernel.org>, Ohad Ben-Cohen <ohad@wizery.com>, Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Mathieu Poirier <mathieu.poirier@linaro.org>
List-ID: <linux-remoteproc@vger.kernel.org>

On Tue 10 Mar 11:10 PDT 2020, Stephen Boyd wrote:

> Quoting Bjorn Andersson (2020-03-09 23:33:36)
> > diff --git a/drivers/remoteproc/qcom_q6v5_adsp.c b/drivers/remoteproc/qcom_q6v5_adsp.c
> > index e953886b2eb7..d5cdff942535 100644
> > --- a/drivers/remoteproc/qcom_q6v5_adsp.c
> > +++ b/drivers/remoteproc/qcom_q6v5_adsp.c
> > @@ -164,10 +166,18 @@ static int qcom_adsp_shutdown(struct qcom_adsp *adsp)
> >  static int adsp_load(struct rproc *rproc, const struct firmware *fw)
> >  {
> >         struct qcom_adsp *adsp = (struct qcom_adsp *)rproc->priv;
> > +       int ret;
> > +
> > +       ret = qcom_mdt_load_no_init(adsp->dev, fw, rproc->firmware, 0,
> > +                                   adsp->mem_region, adsp->mem_phys,
> > +                                   adsp->mem_size, &adsp->mem_reloc);
> > +       if (ret)
> > +               return ret;
> >  
> > -       return qcom_mdt_load_no_init(adsp->dev, fw, rproc->firmware, 0,
> > -                            adsp->mem_region, adsp->mem_phys, adsp->mem_size,
> > -                            &adsp->mem_reloc);
> > +       /* Failures only affect post mortem debugging, so ignore return value */
> > +       qcom_pil_info_store(adsp->info_name, adsp->mem_reloc, adsp->mem_size);
> 
> If the return value was void then the comment wouldn't be necessary and
> it would be self documenting as such. Can we do that?

I started off with this in v1, but agreed with Mathieu to ignore the
failures in the place where we actually don't care, rather than inside
qcom_pil_info_store()...

Regards,
Bjorn
