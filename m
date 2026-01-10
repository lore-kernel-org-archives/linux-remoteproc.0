Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D07B81487F6
	for <linux-remoteproc@vger.kernel.org>; Sat, 10 Jan 2026 19:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768072225; cv=none; b=qQkUZtdKdbn9RJ//RH5WT7b8M9fSsqby8cZvL0UkJ8whdHWaysZN+1Rt6yVN64ti3sQ1gQfaXUcDxFa5oi6YkfxmbqZn4RkwyDmf6LDxax6q4Hl+wKd93uuL84KbFFC+XjLUHwWjIfh5ohLA2RiBk5sLKCUbjWLVV9JI3chSNKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768072225; c=relaxed/simple;
	bh=OdadOUtAM3OBl/jYBH1aDVpB8Tb5MJjbAFxQCOIccSA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d3ibKKbpju49ExDqhc80SVRR6Fa4w7b8kaSf0kVVXpOxBH3qft2YxgX/HnDJj4H52bbEdo2+6Msn3MjkMAoewYcEGj0V3ZFWOBLp6rqB6yo2xT7UkofqS0Mbhu0YJTl/Of7ddAywf+s0sfUoSUO32FnHp+NA8SaUNbVy5Pf3TZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W1Ymdzcy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W1Ymdzcy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E762FC4CEF1;
	Sat, 10 Jan 2026 19:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768072225;
	bh=OdadOUtAM3OBl/jYBH1aDVpB8Tb5MJjbAFxQCOIccSA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W1YmdzcyQ24YFmCngB2d4F8YnD7lgd3GeqNzZmyWEdTIc8mR15LzBmI6SKzlLUKZw
	 V3g30cIvOl7oNsMwjWk6emvx0a4h0P1XuQAvKIQY6dwZ3UI4x+H5dXCY9swVmBIjYb
	 XEEqawlkuO177pW2weZGBWDch7OdtT8E63as1lZHUharkcCq9UIidTKdvZsHsUBJU5
	 mK9XOicO0FD2jKIZZnrB8WIspE392qWBH3CBhv7KjgXqIzTn2z0u51vAtvhk2qW69w
	 2gewxCGgUNe2I9+GmB/Xm4GFBr52evHluDYdSzU06LCK9VS6OVUDCVlppYrRJ+Ph0B
	 y2O2ShYfFE1mw==
Date: Sat, 10 Jan 2026 13:10:22 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-remoteproc@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] remoteproc: mediatek: Break lock dependency to
 `prepare_lock`
Message-ID: <kkwqx4h3oqmfimejyy73hreq5pcjwbijwy2chnve5bjmcq4fli@ty4n5adbo5oy>
References: <20251229043146.4102967-1-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251229043146.4102967-1-tzungbi@kernel.org>

On Mon, Dec 29, 2025 at 04:31:46AM +0000, Tzung-Bi Shih wrote:
> `scp_ipi_send` acquires `prepare_lock` via `clk_prepare_enable` while

Please suffix functions with (), instead of treating it just like any
other `symbol`, this makes it easier to see what is a function and what
is an object/variable.

> the caller often holds `ec_dev->lock` (e.g., `cros_ec_cmd_xfer`).  The
> reverse dependency exists where `clk_prepare` can trigger operations
> that eventually take `ec_dev->lock` (e.g., via sysfs/regulator/genpd).

Can you please expand this explanation slightly. You're hinting that
there's an ABBA issue, but you're leaving it to the reader to know/guess
what that issue is.

I believe you have some concrete case where this is a probelm, please
include this, if nothing else as an example.

> 
> Move clock prepare / unprepare operations to remoteproc prepare() /
> unprepare() callbacks to break the lock dependency from `ec_dev->lock`
> to `prepare_lock`.

Please expand this with an argumentation that the prolonged "prepared
time" will not have any negative impact.

> 
> This breaks the dependency chain in the lockdep report:
> > WARNING: possible circular locking dependency detected
> > ...
> > the existing dependency chain (in reverse order) is:
> > ...
> > -> #0 (prepare_lock){+.+.}-{3:3}:
> >        __lock_acquire
> >        lock_acquire
> >        __mutex_lock_common
> >        mutex_lock_nested
> >        clk_prepare
> >        scp_ipi_send [mtk_scp_ipi]
> >        scp_send_ipi [mtk_scp]
> >        mtk_rpmsg_send [mtk_rpmsg]
> >        rpmsg_send [rpmsg_core]
> >        cros_ec_pkt_xfer_rpmsg [cros_ec_rpmsg]

If this is the AB case, can you please include a stack for the BA case
as well in the commit message?


With these things clarified, I expect that your patch is the correct way
to solve the problem.

Regards,
Bjorn

> 
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
> ---
>  drivers/remoteproc/mtk_scp.c     | 39 +++++++++++++++++++++++---------
>  drivers/remoteproc/mtk_scp_ipi.c |  4 ++--
>  2 files changed, 30 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> index db8fd045468d..98d00bd5200c 100644
> --- a/drivers/remoteproc/mtk_scp.c
> +++ b/drivers/remoteproc/mtk_scp.c
> @@ -283,7 +283,7 @@ static irqreturn_t scp_irq_handler(int irq, void *priv)
>  	struct mtk_scp *scp = priv;
>  	int ret;
>  
> -	ret = clk_prepare_enable(scp->clk);
> +	ret = clk_enable(scp->clk);
>  	if (ret) {
>  		dev_err(scp->dev, "failed to enable clocks\n");
>  		return IRQ_NONE;
> @@ -291,7 +291,7 @@ static irqreturn_t scp_irq_handler(int irq, void *priv)
>  
>  	scp->data->scp_irq_handler(scp);
>  
> -	clk_disable_unprepare(scp->clk);
> +	clk_disable(scp->clk);
>  
>  	return IRQ_HANDLED;
>  }
> @@ -665,7 +665,7 @@ static int scp_load(struct rproc *rproc, const struct firmware *fw)
>  	struct device *dev = scp->dev;
>  	int ret;
>  
> -	ret = clk_prepare_enable(scp->clk);
> +	ret = clk_enable(scp->clk);
>  	if (ret) {
>  		dev_err(dev, "failed to enable clocks\n");
>  		return ret;
> @@ -680,7 +680,7 @@ static int scp_load(struct rproc *rproc, const struct firmware *fw)
>  
>  	ret = scp_elf_load_segments(rproc, fw);
>  leave:
> -	clk_disable_unprepare(scp->clk);
> +	clk_disable(scp->clk);
>  
>  	return ret;
>  }
> @@ -691,14 +691,14 @@ static int scp_parse_fw(struct rproc *rproc, const struct firmware *fw)
>  	struct device *dev = scp->dev;
>  	int ret;
>  
> -	ret = clk_prepare_enable(scp->clk);
> +	ret = clk_enable(scp->clk);
>  	if (ret) {
>  		dev_err(dev, "failed to enable clocks\n");
>  		return ret;
>  	}
>  
>  	ret = scp_ipi_init(scp, fw);
> -	clk_disable_unprepare(scp->clk);
> +	clk_disable(scp->clk);
>  	return ret;
>  }
>  
> @@ -709,7 +709,7 @@ static int scp_start(struct rproc *rproc)
>  	struct scp_run *run = &scp->run;
>  	int ret;
>  
> -	ret = clk_prepare_enable(scp->clk);
> +	ret = clk_enable(scp->clk);
>  	if (ret) {
>  		dev_err(dev, "failed to enable clocks\n");
>  		return ret;
> @@ -734,14 +734,14 @@ static int scp_start(struct rproc *rproc)
>  		goto stop;
>  	}
>  
> -	clk_disable_unprepare(scp->clk);
> +	clk_disable(scp->clk);
>  	dev_info(dev, "SCP is ready. FW version %s\n", run->fw_ver);
>  
>  	return 0;
>  
>  stop:
>  	scp->data->scp_reset_assert(scp);
> -	clk_disable_unprepare(scp->clk);
> +	clk_disable(scp->clk);
>  	return ret;
>  }
>  
> @@ -909,7 +909,7 @@ static int scp_stop(struct rproc *rproc)
>  	struct mtk_scp *scp = rproc->priv;
>  	int ret;
>  
> -	ret = clk_prepare_enable(scp->clk);
> +	ret = clk_enable(scp->clk);
>  	if (ret) {
>  		dev_err(scp->dev, "failed to enable clocks\n");
>  		return ret;
> @@ -917,12 +917,29 @@ static int scp_stop(struct rproc *rproc)
>  
>  	scp->data->scp_reset_assert(scp);
>  	scp->data->scp_stop(scp);
> -	clk_disable_unprepare(scp->clk);
> +	clk_disable(scp->clk);
>  
>  	return 0;
>  }
>  
> +static int scp_prepare(struct rproc *rproc)
> +{
> +	struct mtk_scp *scp = rproc->priv;
> +
> +	return clk_prepare(scp->clk);
> +}
> +
> +static int scp_unprepare(struct rproc *rproc)
> +{
> +	struct mtk_scp *scp = rproc->priv;
> +
> +	clk_unprepare(scp->clk);
> +	return 0;
> +}
> +
>  static const struct rproc_ops scp_ops = {
> +	.prepare	= scp_prepare,
> +	.unprepare	= scp_unprepare,
>  	.start		= scp_start,
>  	.stop		= scp_stop,
>  	.load		= scp_load,
> diff --git a/drivers/remoteproc/mtk_scp_ipi.c b/drivers/remoteproc/mtk_scp_ipi.c
> index c068227e251e..7a37e273b3af 100644
> --- a/drivers/remoteproc/mtk_scp_ipi.c
> +++ b/drivers/remoteproc/mtk_scp_ipi.c
> @@ -171,7 +171,7 @@ int scp_ipi_send(struct mtk_scp *scp, u32 id, void *buf, unsigned int len,
>  	    WARN_ON(len > scp_sizes->ipi_share_buffer_size) || WARN_ON(!buf))
>  		return -EINVAL;
>  
> -	ret = clk_prepare_enable(scp->clk);
> +	ret = clk_enable(scp->clk);
>  	if (ret) {
>  		dev_err(scp->dev, "failed to enable clock\n");
>  		return ret;
> @@ -211,7 +211,7 @@ int scp_ipi_send(struct mtk_scp *scp, u32 id, void *buf, unsigned int len,
>  
>  unlock_mutex:
>  	mutex_unlock(&scp->send_lock);
> -	clk_disable_unprepare(scp->clk);
> +	clk_disable(scp->clk);
>  
>  	return ret;
>  }
> -- 
> 2.52.0.351.gbe84eed79e-goog
> 
