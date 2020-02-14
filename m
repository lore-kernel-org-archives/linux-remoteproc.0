Date: Thu, 13 Feb 2020 20:57:28 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v3 2/8] remoteproc: qcom: Introduce driver to store pil
 info in IMEM
Message-ID: <20200214045725.GT3948@builder>
References: <20200211005059.1377279-1-bjorn.andersson@linaro.org>
 <20200211005059.1377279-3-bjorn.andersson@linaro.org>
 <158164774404.184098.8855626264878132058@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <158164774404.184098.8855626264878132058@swboyd.mtv.corp.google.com>
To: Stephen Boyd <swboyd@chromium.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Sibi Sankar <sibis@codeaurora.org>, Rishabh Bhatnagar <rishabhb@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

On Thu 13 Feb 18:35 PST 2020, Stephen Boyd wrote:
> Quoting Bjorn Andersson (2020-02-10 16:50:53)
> > diff --git a/drivers/remoteproc/qcom_pil_info.c b/drivers/remoteproc/qcom_pil_info.c
[..]
> > +       mutex_lock(&reloc_mutex);
> > +       _reloc = reloc;
> > +       mutex_unlock(&reloc_mutex);
> 
> Ah ok, I see that mutex is protecting the pointer used for everything.
> Ignore the comment above. But also, why not have every remoteproc device
> point at some imem and then search through the imem for the name? Then
> we don't need this driver or a lock that synchronizes these things.
> Ideally we could dedicate a place in imem for each remoteproc and not
> even have to search it for the string to update. Is that possible? Then
> it becomes even simpler because the DT binding can point directly at the
> address to write. It's not like the various images are changing that
> much to the point where this location in imem is actually changing,
> right?
> 

I will check to see if these entries needs to be packed in the beginning
of the array, otherwise this sounds like a good idea to simplify things.

Regards,
Bjorn
