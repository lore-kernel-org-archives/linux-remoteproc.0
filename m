Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4672E33FE0D;
	Wed, 26 Nov 2025 20:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764187763; cv=none; b=KYajO8VcQMkyr/XNKTsQWf/oSP5RfyvChX4lwJcIgX56NhWNslCSqZWpV20wj3+APa+SHP0BlOz7/Be/53BB59bwsUBdyRBcpTVSQQ+s/6RhhyGLjIm4XHVUacaoMnVVRjLARRrgkuK4p7N9sry3gX6DFz/b5OH4P4G5yaxTc7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764187763; c=relaxed/simple;
	bh=17Gv13+1bUBiu5zt9XAZqjGO+TKpyge8B9fhPbk8Q+A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LtUZnEoO8HouLQC88guAPuJn+1GGePgcaAQcQeidMVFe/TukhcAakqhxt072Ef7o00rufReP4kMVKFqphoTRYmDcJiT1Kw4/9vvUD84TZZJ2g09BhKK9rVlC+YZqMEUC+c4EIthYcaA+WfKNUnAUieUg1MwIf97A5LwgQWUUHTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vIivdruM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vIivdruM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07E89C4CEF7;
	Wed, 26 Nov 2025 20:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764187762;
	bh=17Gv13+1bUBiu5zt9XAZqjGO+TKpyge8B9fhPbk8Q+A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vIivdruMDkOnKsuspoh6Us5Qnma/JLCzeTqG0sk5SyHjT7oKjDnup+SHQrfNsV1ac
	 6UJj3fusSV3OLlg2ZfIihQOrHS4PXgI8HjtuRXKZ1JmXrQS0DwsGYrqoIjieyo1/w9
	 1Y/MYe4AEtsTGdWm27Jg4A3rv0IyTioTpUONnivCCs24ut97QVo//9o1ZWp+52d1R5
	 yfRmnMKvZJittC/6+Y9Z9eGrBxgZXL2Ayj/EZtLY6J8udRMk07URLT95o8Ya8l6QpX
	 pJLO9sP9ewrBf2DkEI+mJ3wvR1OIPGzw3Bzr4FFSawijlyNvpQtZDYJdMWdxKwHAre
	 DvHYhjKkOkXFA==
Date: Wed, 26 Nov 2025 14:14:53 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: "Iuliana Prodan (OSS)" <iuliana.prodan@oss.nxp.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	"S.J. Wang" <shengjiu.wang@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Daniel Baluta <daniel.baluta@nxp.com>, Iuliana Prodan <iuliana.prodan@nxp.com>, imx@lists.linux.dev, 
	linux-remoteproc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH 1/2] remoteproc: imx_dsp_rproc: Skip
 RP_MBOX_SUSPEND_SYSTEM when mailbox TX channel is uninitialized
Message-ID: <mkgc3gpgzvdvotzw4752om5ascwxpscocaj2x5urzaa7ss4iys@rsqb3ebrexw7>
References: <20251125124903.962295-1-iuliana.prodan@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251125124903.962295-1-iuliana.prodan@oss.nxp.com>

On Tue, Nov 25, 2025 at 02:49:02PM +0200, Iuliana Prodan (OSS) wrote:
> From: Iuliana Prodan <iuliana.prodan@nxp.com>
> 
> Firmwares that do not use mailbox communication
> (e.g., the hello_world sample) leave priv->tx_ch
> as NULL. The current suspend logic unconditionally
> sends RP_MBOX_SUSPEND_SYSTEM, which is invalid without
> an initialized TX channel.
> 
> Detect the no_mailboxes case early and skip sending
> the suspend message. Instead, proceed directly to
> the runtime PM suspend path, which is the correct
> behavior for firmwares that cannot respond to mailbox
> requests.

Please use the allotted 75 characters of width for your commit message.

> 
> Signed-off-by: Iuliana Prodan <iuliana.prodan@nxp.com>
> ---
>  drivers/remoteproc/imx_dsp_rproc.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
> index f11662f9a12f..fc0470aa72c1 100644
> --- a/drivers/remoteproc/imx_dsp_rproc.c
> +++ b/drivers/remoteproc/imx_dsp_rproc.c
> @@ -1308,6 +1308,15 @@ static int imx_dsp_suspend(struct device *dev)
>  	if (rproc->state != RPROC_RUNNING)
>  		goto out;
>  
> +	/*
> +	 * No channel available for sending messages;
> +	 * indicates no mailboxes present, so trigger PM runtime suspend
> +	 */
> +	if (!priv->tx_ch) {
> +		dev_err(dev, "No initialized mbox tx channel\n");

Commit message and comment above says this is "normal" behavior,
dev_err() indicates that it's not. Should this be a dev_info()?

That said, it's still a message every time you suspend, so perhaps even
omitting the print (or a dev_dbg()) makes more sense?

Regards,
Bjorn

> +		goto out;
> +	}
> +
>  	reinit_completion(&priv->pm_comp);
>  
>  	/* Tell DSP that suspend is happening */
> -- 
> 2.34.1
> 
