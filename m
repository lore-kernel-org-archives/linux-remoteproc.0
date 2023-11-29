Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XW1UkUQ+"
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09C3DC1
	for <linux-remoteproc@vger.kernel.org>; Wed, 29 Nov 2023 09:35:35 -0800 (PST)
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-6cdd13c586fso306b3a.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 29 Nov 2023 09:35:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701279334; x=1701884134; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rnHfUEa0et8jIcEu+ys9H+uI+/w8rAqTZJXGwbZOMvw=;
        b=XW1UkUQ+/MgLy3xzdWxe7loSrd1zJ2lEJAOuH8Tv2cIAYTKsAA93FdfFebSngOMiJu
         j4zmEzRMvdmPR7su4j0+YczigIcUUd8N7GgitVi7lDh+6Qd7hLexnz0ehWi3HIOhRVD1
         H7JV6Vc5ABO/9d8Lga+7h4bNHdUk4frrmzDd7sLV5DN9J89tTz9jEyauBN5G5BuXwHtN
         kgH57JljGc2QqeK/xaWl+MBVctRBo4vQvFnCfMwSIAqu1+367nK82JrIP88pxDB9VX3i
         AZayNBF7xgd7Bnwtz/a9XMjkCCtaxmN1cfjZjixSwdqODGURJT1yBA8w6HZDG+DDvTd7
         Vuog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701279334; x=1701884134;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rnHfUEa0et8jIcEu+ys9H+uI+/w8rAqTZJXGwbZOMvw=;
        b=hVRsCVfyWZn4PlO+Nge8HImzol6mBfFprPOUqBYYfX6v97I3jLmGx8uPZjZPDO/KRF
         fEtXf6hxQzmYBji/vbraXO3bjCssQDYPAu4QevT+W/7Zsm+rR5NcWX/AVr249PCpaWy6
         DiGZktt8mloq7cUh7cyM2IgRvKWwNnrQALaXkRcMiYRHvnqIOXDgLqqrWSYqrRMwDq8o
         qvkXyxH72k6SM8lvfbR+De73bd7jgb0SsuSAoc/5ePbcU36ksJ+B9UKjwYUC3v4bBUD6
         RTGVqUAkWiNsh/PPb+/DJYoW8zdwneQoWNQWaVVvBOIs6YTe0XKUCPwqOlf2JjY60nHz
         yujw==
X-Gm-Message-State: AOJu0YzXm76G4PGYp1S0YD1S+5SCSwRDb41mO42XttBG7T4wQTV0Bqm9
	mNKZaRBEBVsGxmAAcz+VbM3eyn76bpFbGie4LDw=
X-Google-Smtp-Source: AGHT+IFtuWO59xL0vMuEd/h6OHa3ooqclnUCcrEdzWSu9ytdSjhvdI57DiUgOilp/unl+wEYIyhCeg==
X-Received: by 2002:a05:6a20:a11c:b0:18b:b170:9a4e with SMTP id q28-20020a056a20a11c00b0018bb1709a4emr20878451pzk.11.1701279334513;
        Wed, 29 Nov 2023 09:35:34 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:eab1:b670:2dee:fa42])
        by smtp.gmail.com with ESMTPSA id u26-20020a62ed1a000000b006cbcd08ed56sm10976306pfh.56.2023.11.29.09.35.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 09:35:34 -0800 (PST)
Date: Wed, 29 Nov 2023 10:35:32 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Bjorn Andersson <andersson@kernel.org>,
	linux-remoteproc@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH 1/3] remoteproc: k3-dsp: Suppress duplicate error message
 in .remove()
Message-ID: <ZWd2ZLahjfFs7+Ut@p14s>
References: <20231123211657.518181-5-u.kleine-koenig@pengutronix.de>
 <20231123211657.518181-6-u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231123211657.518181-6-u.kleine-koenig@pengutronix.de>

Hi Uwe,

On Thu, Nov 23, 2023 at 10:16:59PM +0100, Uwe Kleine-König wrote:
> When the remove callback returns non-zero, the driver core emits an
> error message about the error value being ignored. As the driver already
> emits an error message already, return zero. This has no effect apart
> from suppressing the core's message. The platform device gets unbound
> irrespective of the return value.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/remoteproc/ti_k3_dsp_remoteproc.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/ti_k3_dsp_remoteproc.c b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
> index ef8415a7cd54..40a5fd8763fa 100644
> --- a/drivers/remoteproc/ti_k3_dsp_remoteproc.c
> +++ b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
> @@ -835,8 +835,9 @@ static int k3_dsp_rproc_remove(struct platform_device *pdev)
>  	if (rproc->state == RPROC_ATTACHED) {
>  		ret = rproc_detach(rproc);
>  		if (ret) {
> +			/* Note this error path leaks resources */

I'm not sure why this comment has been added...

>  			dev_err(dev, "failed to detach proc, ret = %d\n", ret);

And why this isn't refactored in the next patch.

> -			return ret;
> +			return 0;

Appart from the above I'm good with this patchset.

Thanks,
Mathieu

>  		}
>  	}
>  
> -- 
> 2.42.0
> 
