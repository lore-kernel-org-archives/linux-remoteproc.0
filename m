Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF3A917AE11
	for <linux-remoteproc@vger.kernel.org>; Fri,  6 Feb 2026 03:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770349230; cv=none; b=TGPj4KAYOA28xH9pSiSnjairyBU7yF2/Bu6nIgDlHz2UTu5V08ZU2h+EzvYszq67xTan9mY3ZW+K+biDhaq4Z2QJJrkqI4pwFJLO5kO8ZrtcGff4ssJyfRSJyVeL4A+Yrqu+YHjXbiPBXoF+NgQTywE+yloOr2VlJsEEZjtw36E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770349230; c=relaxed/simple;
	bh=FODg6UNvIBu/ZybFA9evOhDRmMXlzJppqNIxz1lUES4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B+Thmkg4wyEixYLtP9yai8Bl6An6yLQQl9kQgqyPsHJAjhEcQIZthwzkYoVifUnb7WxtYnUzIHAjz0g4n9lbhJ3vRqkLC1ye6OuBHocg2L3BKMEWkRN6o0e4VAHhuYDMRDJLZSCzpR4TWedixa9rAWHsWVSOZCXQldPEmSXXWBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UGbDFSHK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UGbDFSHK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17BB9C4CEF7;
	Fri,  6 Feb 2026 03:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770349230;
	bh=FODg6UNvIBu/ZybFA9evOhDRmMXlzJppqNIxz1lUES4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UGbDFSHKu32A0MBDQvShwysZrEWY04LY9wi7FxWw1eNXl4fs4yLgZ3folOAtj2qnQ
	 MC/+pMH6f20yRAk2eQ4n5Lv5Ah9x6wEUuDw+vxxTYIvvtUyVXiVCHGzq5W5yY2Btz+
	 +/ZtjL2hE7A/mYfBmM13E22ur+lvAR9pmWQJ7jIm2aRF2IeN4InP8SadGHLI6reRX9
	 u9g/4ht7FSdkMsixdozPU0Nok+0bN64uuZvlIxDdJcw18/+wJOEjWCemyqh22JlfwX
	 0+KTUjHlS1NfWnJ1bK38dd2Z7fvNA0Vf6EbKzaNBywLtR6+gCdV4Cx1SfcbnKcpJOk
	 0ZL5E4OLQUKng==
Date: Fri, 6 Feb 2026 03:40:26 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>, linux-remoteproc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2] remoteproc: mediatek: Unprepare SCP clock during
 system suspend
Message-ID: <aYViqgirwN2Xgp61@google.com>
References: <20260206033034.3031781-1-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260206033034.3031781-1-tzungbi@kernel.org>

On Fri, Feb 06, 2026 at 03:30:33AM +0000, Tzung-Bi Shih wrote:
> Prior to commit d935187cfb27 ("remoteproc: mediatek: Break lock
> dependency to prepare_lock"), `scp->clk` was prepared and enabled only
> when it needs to communicate with the SCP.  The commit d935187cfb27
> moved the prepare operation to remoteproc's prepare(), keeping the clock
> prepared as long as the SCP is running.
> 
> The power consumption due to the prolonged clock preparation can be
> negligible when the system is running, as SCP is designed to be a very
> power efficient processor.
> 
> However, the clock remains prepared even when the system enters system
> suspend.  This prevents the underlying clock controller (and potentially
> the parent PLLs) from shutting down, which increases power consumption
> and may block the system from entering deep sleep states.
> 
> Add suspend and resume callbacks.  Unprepare the clock in suspend() if
> it was active and re-prepare it in resume() to ensure the clock is
> properly disabled during system suspend, while maintaining the "always
> prepared" semantics while the system is active.  The driver doesn't
> implement .attach() callback, hence it only checks for RPROC_RUNNING.
> 
> Fixes: d935187cfb27 ("remoteproc: mediatek: Break lock dependency to prepare_lock")
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
> ---

Pardon me for forgetting to attach changelog before sending the patch.  Here
is the changelog:

v2:
- Add note and code comment for RPROC_ATTACHED.
- Use __maybe_unused instead of '#ifdef CONFIG_PM_SLEEP'.
- Add R-b tag.

v1: https://lore.kernel.org/all/20260204085442.1822123-1-tzungbi@kernel.org

>  drivers/remoteproc/mtk_scp.c | 39 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
> 
> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> index 4651311aeb07..bb6f6a16d895 100644
> --- a/drivers/remoteproc/mtk_scp.c
> +++ b/drivers/remoteproc/mtk_scp.c
> @@ -1592,12 +1592,51 @@ static const struct of_device_id mtk_scp_of_match[] = {
>  };
>  MODULE_DEVICE_TABLE(of, mtk_scp_of_match);
>  
> +static int __maybe_unused scp_suspend(struct device *dev)
> +{
> +	struct mtk_scp *scp = dev_get_drvdata(dev);
> +	struct rproc *rproc = scp->rproc;
> +
> +	/*
> +	 * Only unprepare if the SCP is running and holding the clock.
> +	 *
> +	 * Note: `scp_ops` doesn't implement .attach() callback, hence
> +	 * `rproc->state` can never be RPROC_ATTACHED.  Otherwise, it
> +	 * should also be checked here.
> +	 */
> +	if (rproc->state == RPROC_RUNNING)
> +		clk_unprepare(scp->clk);
> +	return 0;
> +}
> +
> +static int __maybe_unused scp_resume(struct device *dev)
> +{
> +	struct mtk_scp *scp = dev_get_drvdata(dev);
> +	struct rproc *rproc = scp->rproc;
> +
> +	/*
> +	 * Only prepare if the SCP was running and holding the clock.
> +	 *
> +	 * Note: `scp_ops` doesn't implement .attach() callback, hence
> +	 * `rproc->state` can never be RPROC_ATTACHED.  Otherwise, it
> +	 * should also be checked here.
> +	 */
> +	if (rproc->state == RPROC_RUNNING)
> +		return clk_prepare(scp->clk);
> +	return 0;
> +}
> +
> +static const struct dev_pm_ops scp_pm_ops = {
> +	SET_SYSTEM_SLEEP_PM_OPS(scp_suspend, scp_resume)
> +};
> +
>  static struct platform_driver mtk_scp_driver = {
>  	.probe = scp_probe,
>  	.remove = scp_remove,
>  	.driver = {
>  		.name = "mtk-scp",
>  		.of_match_table = mtk_scp_of_match,
> +		.pm = &scp_pm_ops,
>  	},
>  };
>  
> -- 
> 2.53.0.rc2.204.g2597b5adb4-goog
> 
