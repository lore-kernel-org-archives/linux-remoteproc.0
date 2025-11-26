Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D758419006B;
	Wed, 26 Nov 2025 20:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764188169; cv=none; b=Fb3h2LZuXNhGvcQbWMYR+F7o6b8QcUSi6Vltj6cLiamR/BeRQMTpA1TXDmWxHTqZGM8Wp7y5dKkJvT41WgUvLPGO41/tn70zEac6M+0bxmNBTN4CYk6UAya62635pOt0mj+VjesQVEWPjtTgBBsO1hSostawdxc4VkVG0oeGNF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764188169; c=relaxed/simple;
	bh=ca2sjCvnRDuW1i5GbDUrILqH8PBini0FSqqmDzg9C1g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IeYCzK5uQpmJzNaxQarpCzYhu0V4odO8Z1nrv7xdm51bFaMcqP0IwJW/LFvZkWH+bA5s8PAwuTfNVZUTjRfeoO7xjo52Zu+/4S4k6UuBdebPbJZnbmO/L9Ff3oH6CZd/5eHp4jXr6JArqviLwyFhw2XhOeIhIG7jCG1uht+Yw4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H4BiiXZP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H4BiiXZP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5917EC4CEF7;
	Wed, 26 Nov 2025 20:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764188168;
	bh=ca2sjCvnRDuW1i5GbDUrILqH8PBini0FSqqmDzg9C1g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H4BiiXZP20Qv9l5vEF/0G8HSdiQ/zOnCclpNc2G7EBpm8FCRcWKhS8jN/RZIOFHpD
	 APAGL+S+Z70XsaCsWWv1wkEQ++Mrhw0iuHNSKM7xy/0YQ/3Xhe0A5zQwTyVGzZueur
	 t5VdMjp5Jw7X5HZE26z47XWRAhvjOycRACDD27aIhcwDbrCPUhe4hDuJVhboOpKO0/
	 QqZbDmpOowikFMffVgqgcVlx+/f/dXISZoevmKh+pgaNy2YVolByud3MOokWMUdZIB
	 6Hmkazb4IZnF0ywpQfMLW2t6r9obrpzzPe/7hIkxUZbO/LQy7WeVsoYoDZo+obqWR7
	 1Tjt7qZrFatUA==
Date: Wed, 26 Nov 2025 14:21:39 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: "Iuliana Prodan (OSS)" <iuliana.prodan@oss.nxp.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	"S.J. Wang" <shengjiu.wang@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Daniel Baluta <daniel.baluta@nxp.com>, Iuliana Prodan <iuliana.prodan@nxp.com>, imx@lists.linux.dev, 
	linux-remoteproc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH 2/2] remoteproc: imx_dsp_rproc: Wait for suspend ACK only
 if WAIT_FW_READY is set
Message-ID: <l5udmggplyatnozipk7tjugkkzwtglckjejq67aa7q4mlywxw4@4vhjkbhjthnn>
References: <20251125124903.962295-1-iuliana.prodan@oss.nxp.com>
 <20251125124903.962295-2-iuliana.prodan@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251125124903.962295-2-iuliana.prodan@oss.nxp.com>

On Tue, Nov 25, 2025 at 02:49:03PM +0200, Iuliana Prodan (OSS) wrote:
> From: Iuliana Prodan <iuliana.prodan@nxp.com>
> 
> The DSP suspend path currently waits unconditionally
> for a suspend ack from the firmware.
> This breaks firmwares that do not implement the
> mailbox-based READY handshake, as the DSP never
> responds and system suspend fails with -EBUSY.
> 

But if the firmware doesn't implement "mailbox-based READY handshake",
do you still want to send the RP_MBOX_SUSPEND_SYSTEM message?

If so, can you clarify here in the commit message that the firmware
expects the mailbox-based message, and only the "handshake" part should
be omitted.

If that part isn't implemented either, then I think you should fix the
code to not poke the mailbox in the first place.


Also, wrap your commit message at 75 characters, please.

> The driver already uses the WAIT_FW_READY flag to
> indicate that the firmware supports the READY
> handshake at boot. Apply the same logic during
> suspend: only wait for the suspend ack when the
> firmware is expected to support it.
> 
> Signed-off-by: Iuliana Prodan <iuliana.prodan@nxp.com>
> ---
>  drivers/remoteproc/imx_dsp_rproc.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
> index fc0470aa72c1..e25dbe32ef79 100644
> --- a/drivers/remoteproc/imx_dsp_rproc.c
> +++ b/drivers/remoteproc/imx_dsp_rproc.c
> @@ -1327,10 +1327,11 @@ static int imx_dsp_suspend(struct device *dev)
>  	}
>  
>  	/*
> -	 * DSP need to save the context at suspend.
> -	 * Here waiting the response for DSP, then power can be disabled.
> +	 * The DSP must save its context during suspend.

Please double check that this comment reflect above conclusion.

Regards,
Bjorn

> +	 * Wait for a response from the DSP if required before disabling power.
>  	 */
> -	if (!wait_for_completion_timeout(&priv->pm_comp, msecs_to_jiffies(100)))
> +	if (priv->flags & WAIT_FW_READY &&
> +	    !wait_for_completion_timeout(&priv->pm_comp, msecs_to_jiffies(100)))
>  		return -EBUSY;
>  
>  out:
> -- 
> 2.34.1
> 
