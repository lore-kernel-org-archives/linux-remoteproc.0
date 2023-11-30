Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EVWaNUzL"
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3584AD48
	for <linux-remoteproc@vger.kernel.org>; Thu, 30 Nov 2023 08:36:50 -0800 (PST)
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1d00689f5c8so10806775ad.3
        for <linux-remoteproc@vger.kernel.org>; Thu, 30 Nov 2023 08:36:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701362209; x=1701967009; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fnyF5s/7+drQWwxdeIUAluC4dhrGXRXgQlKvd/uPpYs=;
        b=EVWaNUzLzaGaLo/xFYk7uTtTHCM7TMQ9S1DbeqCTTHZzR5ugqBqqQ2VE2s9gmzKm5B
         TlYcgxWS61qIOtw8E5R1x3qwLJ2+lNSlVA1gYvp5IzGNXF8lrul0fRedgIWcp8SX8MW7
         RhdmkotJjPCBbUMEwXvanX5nMfYll4PkuI5HBvFTRkgu2hhNkwqiuj//AKRL2ITnPQip
         Gl1S5ELHhsxuPQ3OGZqyn3US0VQiSJRRLYTdAEOelNI2nQ7xZ1ugVfolttyMaDKRi0LI
         BHqIeNN/o1hpJRS34H1oTgDglqnPtTQyQgRfJeUx15fIGJ9rPn+oegNCRL6F7NXLF8/g
         Ho/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701362209; x=1701967009;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fnyF5s/7+drQWwxdeIUAluC4dhrGXRXgQlKvd/uPpYs=;
        b=LYCvxlV0RMjTAm84brWiB17aOJ+P07rB0/Bp9DRgYH4AzGm1lsB3vkg1nwicuZQyuH
         o11xAUNKejPGKmVvvHMjr5YKCeR6FaQjlUZs7F/kIxOOlJeqJuIhiAlke5M12ytHtrSm
         iv7DzZ4N9LuRJeNlI3rzmle4xforFNrYyD9lyiHfJF22GLnJGBKe/4luyfIjt5pT1SjO
         JK7BvhMPpsh6Xw52xQXx67sHlcuwUvab5chCfABa6RmbHqWaVm2zLMXl9n60caF9NA+v
         fD1woXX0px26tDVJAnVeSNkQYNjFIZiByygU7wmtZXVoIOoBFKzgb3Q4IPloJE2xjgJl
         yAPQ==
X-Gm-Message-State: AOJu0YwQkD0Vi5SWNd+t1trryCUSkQGNTNdWkOAars/GZMbZcg9J/H2R
	lf0RVURI9W7rzn0tds9bOPrgdA==
X-Google-Smtp-Source: AGHT+IE7WU4tvjdpZVdCAI99OemqPjmcgaqZxPzupeehLI0eMxLQLYMwvvcCjQPY7WRyKCX2r1UWfQ==
X-Received: by 2002:a17:902:9898:b0:1cf:cf43:303a with SMTP id s24-20020a170902989800b001cfcf43303amr13788192plp.64.1701362209661;
        Thu, 30 Nov 2023 08:36:49 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:f9f8:b7ea:d4e2:1523])
        by smtp.gmail.com with ESMTPSA id 19-20020a170902c11300b001c88f77a156sm987919pli.153.2023.11.30.08.36.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 08:36:49 -0800 (PST)
Date: Thu, 30 Nov 2023 09:36:47 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Bjorn Andersson <andersson@kernel.org>,
	linux-remoteproc@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH 1/3] remoteproc: k3-dsp: Suppress duplicate error message
 in .remove()
Message-ID: <ZWi6HxFGOHXUE3db@p14s>
References: <20231123211657.518181-5-u.kleine-koenig@pengutronix.de>
 <20231123211657.518181-6-u.kleine-koenig@pengutronix.de>
 <ZWd2ZLahjfFs7+Ut@p14s>
 <20231129225010.ul2xcjjm7jcymmoq@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231129225010.ul2xcjjm7jcymmoq@pengutronix.de>

On Wed, Nov 29, 2023 at 11:50:10PM +0100, Uwe Kleine-König wrote:
> Helo Mathieu,
> 
> On Wed, Nov 29, 2023 at 10:35:32AM -0700, Mathieu Poirier wrote:
> > On Thu, Nov 23, 2023 at 10:16:59PM +0100, Uwe Kleine-König wrote:
> > > diff --git a/drivers/remoteproc/ti_k3_dsp_remoteproc.c b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
> > > index ef8415a7cd54..40a5fd8763fa 100644
> > > --- a/drivers/remoteproc/ti_k3_dsp_remoteproc.c
> > > +++ b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
> > > @@ -835,8 +835,9 @@ static int k3_dsp_rproc_remove(struct platform_device *pdev)
> > >  	if (rproc->state == RPROC_ATTACHED) {
> > >  		ret = rproc_detach(rproc);
> > >  		if (ret) {
> > > +			/* Note this error path leaks resources */
> > 
> > I'm not sure why this comment has been added...
> 
> The comment was added because there is a real problem and I didn't try
> to fix it as doing that without the hardware is hard.
>
 
I've looked at this again and as it turns out, you are correct on both front.  I
will apply your patches as-is and ask people at TI to look at this code again.

Thanks,
Mathieu

> > >  			dev_err(dev, "failed to detach proc, ret = %d\n", ret);
> > 
> > And why this isn't refactored in the next patch.
> 
> the next patch has:
> 
> -                       dev_err(dev, "failed to detach proc, ret = %d\n", ret);
> +                       dev_err(dev, "failed to detach proc (%pe)\n", ERR_PTR(ret));
> 
> so this is refactored?!
> 
> > > -			return ret;
> > > +			return 0;
> > 
> > Appart from the above I'm good with this patchset.
> 
> Best regards
> Uwe
> 
> -- 
> Pengutronix e.K.                           | Uwe Kleine-König            |
> Industrial Linux Solutions                 | https://www.pengutronix.de/ |


