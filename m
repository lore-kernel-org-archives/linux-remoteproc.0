Return-Path: <bjorn.andersson@linaro.org>
Date: Fri, 5 Oct 2018 12:22:57 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH V3 1/4] rpmsg: core: Add signal API support
Message-ID: <20181005192257.GB12063@builder>
References: <1538722776-13648-1-git-send-email-aneela@codeaurora.org>
 <1538722776-13648-2-git-send-email-aneela@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1538722776-13648-2-git-send-email-aneela@codeaurora.org>
To: Arun Kumar Neelakantam <aneela@codeaurora.org>
Cc: ohad@wizery.com, clew@codeaurora.org, sricharan@codeaurora.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Thu 04 Oct 23:59 PDT 2018, Arun Kumar Neelakantam wrote:
> diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
[..]
> +/**
> + * rpmsg_get_signals() - get the signals for this endpoint
> + * @ept:	the rpmsg endpoint
> + *
> + * Returns 0 on success and an appropriate error value on failure.

I like the fact that you're using the return value to pass the bits, but
the comment doesn't reflect this - and you don't handle this properly in
the TIOCMGET case in patch 3.

> + */
> +int rpmsg_get_signals(struct rpmsg_endpoint *ept)
> +{
> +	if (WARN_ON(!ept))
> +		return -EINVAL;
> +	if (!ept->ops->get_signals)
> +		return -EOPNOTSUPP;
> +
> +	return ept->ops->get_signals(ept);
> +}
> +EXPORT_SYMBOL(rpmsg_get_signals);

Apart from that the series looks good.

Regards,
Bjorn
