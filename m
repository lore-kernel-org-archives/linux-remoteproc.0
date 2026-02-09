Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C6671F419A;
	Mon,  9 Feb 2026 15:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770651645; cv=none; b=gTMzQ5eEsWsS4RaCwDx55HwVbLvJvKMkPsLpOGtAtQ/UVBVpanX7yG5dZFXrhB5ovPzST4zgnRRBGPAmbcJFnlmNnhhUicv24e5BGY48dRnyPWHLkPb8HHGfqXxP6BNhHZ45CgW5XX91hs79Jfbuyc8XgalkgKlGPLWw2TbBatE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770651645; c=relaxed/simple;
	bh=5MSqFI0yYF88dHuoP10E8rn1wmmVor2/en8T7e99gw8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wuv7ulkOs2q1qVf89PV5qcay2kZcRr+ifYwJPYdm/rLlLsZQCV113WWPbBPU8rSjQ9FX4Y6sZmEfEevqsX9xoFQXNbYh1HgmRSa7o/WRPATp4vBUKwXucDtsaCGZea+xZp4sRX1B7TcQWWJDdrOgoX60X87DPRbCop+igT5X/xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kfrXyXlP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kfrXyXlP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52281C116C6;
	Mon,  9 Feb 2026 15:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770651644;
	bh=5MSqFI0yYF88dHuoP10E8rn1wmmVor2/en8T7e99gw8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kfrXyXlPfjvlhlknbXEtjPunDnJ6SbVESH2xs1VUWX4IEl/rhKscLWV+1Xt7j5yTC
	 4rz4KgLbrGbxmWafJOzdmbme4+48QU17x9ukC4lSqvq0kN8yJmJwLvx4vJ9FGnFzzZ
	 3tS1EXcp25MhGC9EiXYjMQRNu9MSl/Z7YhHS/hLJEVRq0VzfrDd1Wbea6mcfx4HJNx
	 2KhK5Bx7B0MdzfgGp9PwUswhKzOtsPwDfa+HIFpAsR+wPQy0aMYxoNgevFNoeJCjg6
	 q3EhJGth+Ef6NFkrjqrtN8jnzEvEq9VBNM7Av7Jdkh9XgiiDbCjLVK2pB9T/SAXwP0
	 o8PgSJ76L1KGg==
Date: Mon, 9 Feb 2026 09:40:42 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Douglas Anderson <dianders@chromium.org>
Cc: jassisinghbrar@gmail.com, linux-kernel@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, mathieu.poirier@linaro.org
Subject: Re: [PATCH v2 07/15] remoteproc: xlnx: Use mbox_ring_doorbell()
 instead of NULL message
Message-ID: <3s7angk25pwtyonscqey2lq6uwxysoypvnbifloydgjao4wh22@7dofvqyj7di2>
References: <20260208040240.1971442-1-dianders@chromium.org>
 <20260207200128.v2.7.I90e87b8f7d6ddccfa0372bb96d196d2d9d7685db@changeid>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260207200128.v2.7.I90e87b8f7d6ddccfa0372bb96d196d2d9d7685db@changeid>

On Sat, Feb 07, 2026 at 08:01:29PM -0800, Douglas Anderson wrote:
> As per the patch ("mailbox: Deprecate NULL mbox messages; Introduce
> mbox_ring_doorbell()"), we want to switch all users of NULL mailbox
> messages to use mbox_ring_doorbell().
> 
> This client only ever sent NULL message on the rx channel, so the
> transition is straightforward.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Acked-by: Bjorn Andersson <andersson@kernel.org>

Regards,
Bjorn

> ---
> 
> (no changes since v1)
> 
>  drivers/remoteproc/xlnx_r5_remoteproc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
> index a7b75235f53e..de807247e9c9 100644
> --- a/drivers/remoteproc/xlnx_r5_remoteproc.c
> +++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
> @@ -245,7 +245,7 @@ static void zynqmp_r5_mb_rx_cb(struct mbox_client *cl, void *msg)
>  	memcpy(buf_msg->data, ipi_msg->data, len);
>  
>  	/* received and processed interrupt ack */
> -	if (mbox_send_message(ipi->rx_chan, NULL) < 0)
> +	if (mbox_ring_doorbell(ipi->rx_chan) < 0)
>  		dev_err(cl->dev, "ack failed to mbox rx_chan\n");
>  
>  	schedule_work(&ipi->mbox_work);
> -- 
> 2.53.0.rc2.204.g2597b5adb4-goog
> 
