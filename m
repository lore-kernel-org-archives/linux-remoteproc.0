Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A09C0342538
	for <linux-remoteproc@vger.kernel.org>; Tue, 25 Aug 2026 16:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787676843; cv=none; b=uLQmNM9HRrvhJjnD0oyo38f0ccoq5Rn+TpAWnt5vSXzE1DG0Fj+WsXDWP7LylIk1ho84RmHQemz+FE3bdFgX8UVpMlW78neF3qTom3A70vmoTv6NVwJgYZFS4hleriw2hLg8W4e88V5wGKCt50rQx43sKRTDvw2PDms7W/Slnmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787676843; c=relaxed/simple;
	bh=Ca37yuRHz/MjCH4jQokbkUInXVw9LqDJxavtQ0LvVQs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EkQf6+bZ+N+OEdsPttY4uglN170HbU+9+WMI3GH0WmRICSWiarmiyIzCjGg7H9p23o9PereKI6jXOpN1AJdgPAsEyxS0IZa1MCBj9XEohIRd2/KMEfmf8A8ZnCph50r5ljD6EzoDeQPtP4k1sSvLuVUlmi1DiHZnYWdIBTt+v2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nhdn4QCf; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nhdn4QCf"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-848761b5897so44981b3a.3
        for <linux-remoteproc@vger.kernel.org>; Tue, 25 Aug 2026 09:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1787676841; x=1788281641; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=b0HNwMNcfxr0yy/VrvRBV5In/7S/p3PA0JfIjamu/jU=;
        b=nhdn4QCfpRQMP64206vMrIz7tD546apcrKMB6Vqyq6bAi8AhrPFzk1QvIGeAiRz/XG
         X7j18koufGd/hvQFacu1IUrz505Z0P4eu4UfA1DNWsOzQHOedz9xJDrsq7fg5jA+bNnu
         f9Ww4G0f+EIVD37M5zwaz5AiWqvlq+9DiDf0KZek92MPKhNzUn2QG9GzZPkYpWYyhlka
         5L2zQ5AKCpAqd3AV9E75X3xNVVK/djlHtFcOWGR+B8UDXLNpN74rh9D5H5191/NcrV5Y
         BPioohd9dnm+G5ikuVSZozpl69dkDJjnRTRprlMasMHIPkq3dMhU9YflIJ443Ea9+xkw
         JptQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787676841; x=1788281641;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b0HNwMNcfxr0yy/VrvRBV5In/7S/p3PA0JfIjamu/jU=;
        b=BLsWgK+r6a2CvqCFqmWFtOOEZ2SuYNlt6j7gwIWcCIBH1oogIgJDCYg3C7CUa3FAn1
         8EYt8AKw8cJzeX1LTy6SZ0MwkVcjKop7t8qUs8/EbWqCbkI+zrouHZRR5GGUd6XaTnNc
         4ez8cC6TcR//fPFHRt1FaHv0ugXrDla3qRC/V6/jtA1Ew2//AdHIIa9PdV4nJgOGO+B5
         QyKv1Qqm6PLTNqL0sKYCOpwpmkYJChxE+e1BPPww83B4hWicOiwthxb87J/1ijIIs8rl
         4M/bP2xRnwYkD5TWembBz3RL9XJOrdKrKx/XJ1RGUZG9lFlJPMK2sw3+CLYV6kPJiyP+
         1yyw==
X-Forwarded-Encrypted: i=1; AHgh+RoFBuxXiOYm0+I3EEOUBUdRUjCoachsDA1ali2asg5hrl6FRMAZsiiVt3u4PNbOqL57h7dvg07C9GMVoyVbgEQK@vger.kernel.org
X-Gm-Message-State: AFuF++lSkJfE8DY+uqd/WnKUoU6ewQGUbZJuICqmsREt9TmABQDtgZqY
	jttlBAK+vZAaGTGAlJbVDN2jZy+Z/55kec6G7hhSMWSHq7BWbZra6xKaew2Psc26gfo=
X-Gm-Gg: AR+sD13qw4uwOgUJ0fI2wOEaJz1U8SGGY0P2qYjrySX0NYLBtfXw3/LtzPy6810wH2F
	iqIYAmr+vX8kjRG71GdXTdkdCGnlpyejuq5zsy29CMJhhNvZW6h3lgzitPYNe+yu1zgDk/BIcfh
	3IkMAwgC6nl7E+9moze/yaza/EalmbDHfrEOEeqD/5mmUkb3OUN9HQWjhDTJ8LSPJamSKEmOMFq
	SwYKCfWtIkugsHSN81+QKbLCSMifHQ12lnkTHKWx0QWJp1BqEiK+IDuE9BJVJPCr29E+FGzFhpA
	WcGFFUk/EP0kiPH3pOJvPXiry/X0579vcpy2vg1E9LBeSeuzPMT63RT6ILiAQUdPk96lNLrkrSL
	r3LqzPf2TnkGgPPgkwFTia0AiLU6jc9oap8C6mUFqOvsut1vh7dBWhtgjEj26BZCfymK5/2t4Sn
	VOuabNYORt2/uQGxfaf86eUk43lQSlHT/UUb1qdGNDiL3tXAi8lzkVFQFgnUmxBmFM
X-Received: by 2002:a05:6a00:6c87:b0:845:bda6:574b with SMTP id d2e1a72fcca58-853736ab6abmr158400b3a.5.1787676840868;
        Tue, 25 Aug 2026 09:54:00 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:a37a:292f:1363:c0af])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8535ceee96fsm97869b3a.41.2026.08.25.09.53.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 09:54:00 -0700 (PDT)
Date: Tue, 25 Aug 2026 10:53:57 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Runyu Xiao <runyu.xiao@seu.edu.cn>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Tanmay Shah <tanmay.shah@amd.com>,
	Jianhao Xu <jianhao.xu@seu.edu.cn>,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v3] remoteproc: xlnx: initialize mailbox work before
 requesting channels
Message-ID: <ao3IpdsQDjDXXawj@p14s>
References: <20260619074835.2069212-1-runyu.xiao@seu.edu.cn>
 <20260818101201.1603947-1-runyu.xiao@seu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260818101201.1603947-1-runyu.xiao@seu.edu.cn>

On Tue, Aug 18, 2026 at 06:12:01PM +0800, Runyu Xiao wrote:
> zynqmp_r5_setup_mbox() installs zynqmp_r5_mb_rx_cb() as the mailbox RX
> callback before requesting the mailbox channels, but initializes
> ipi->mbox_work only after both channels have been requested. Once the RX
> channel is active, a notification delivered before the late INIT_WORK()
> would make the callback queue an uninitialized work item.
> 
> Initialize the work item before requesting channels. Also drain the work
> before freeing the mailbox state, after the channels have been released so
> no new callbacks can queue it. Use the same drain before freeing ipi from
> the channel request error paths, since the callback is already published
> there as well.
> 
> This issue was found by our static analysis tool and then confirmed by
> manual review of the mailbox setup sequence. The callback is published
> before the channel requests complete, so the work item should be ready
> before the mailbox provider can invoke it.
> 
> A QEMU PoC modeled a mailbox notification delivered after the RX callback
> became reachable but before the delayed INIT_WORK(). DEBUG_OBJECTS reported
> queueing an uninitialized work item from the zynqmp_r5_setup_mbox() path.
> 
> This is sent as an RFC because the practical trigger depends on the ZynqMP
> IPI mailbox provider and firmware delivery timing. If the provider cannot
> invoke the RX callback until after setup returns, this is a defensive
> lifecycle cleanup rather than a reachable race on current systems.
> 
> Fixes: 5dfb28c257b7 ("remoteproc: xilinx: Add mailbox channels for rpmsg")
> Signed-off-by: Runyu Xiao <runyu.xiao@seu.edu.cn>
> ---
> Changes in v3:
> - Follow Mathieu's feedback and call cancel_work_sync() before freeing ipi
>   from the tx/rx channel request error paths.
> 
> Changes in v2:
> - Follow Tanmay's suggestion and keep zynqmp_r5_setup_mbox() taking the
>   child device pointer. Do not move the r5_core assignment in this patch.
> - Only move INIT_WORK() before channel requests and drain the work in
>   zynqmp_r5_free_mbox().
> 
>  drivers/remoteproc/xlnx_r5_remoteproc.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>

I will pick this up when RC1 comes out next week.

Thanks,
Mathieu
 
> diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
> index c685bb5fa62c..d47fbf143acd 100644
> --- a/drivers/remoteproc/xlnx_r5_remoteproc.c
> +++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
> @@ -318,6 +318,8 @@ static struct mbox_info *zynqmp_r5_setup_mbox(struct device *cdev)
>  	if (!ipi)
>  		return NULL;
>  
> +	INIT_WORK(&ipi->mbox_work, handle_event_notified);
> +
>  	mbox_cl = &ipi->mbox_cl;
>  	mbox_cl->rx_callback = zynqmp_r5_mb_rx_cb;
>  	mbox_cl->tx_block = false;
> @@ -329,6 +331,7 @@ static struct mbox_info *zynqmp_r5_setup_mbox(struct device *cdev)
>  	ipi->tx_chan = mbox_request_channel_byname(mbox_cl, "tx");
>  	if (IS_ERR(ipi->tx_chan)) {
>  		ipi->tx_chan = NULL;
> +		cancel_work_sync(&ipi->mbox_work);
>  		kfree(ipi);
>  		dev_warn(cdev, "mbox tx channel request failed\n");
>  		return NULL;
> @@ -339,13 +342,12 @@ static struct mbox_info *zynqmp_r5_setup_mbox(struct device *cdev)
>  		mbox_free_channel(ipi->tx_chan);
>  		ipi->rx_chan = NULL;
>  		ipi->tx_chan = NULL;
> +		cancel_work_sync(&ipi->mbox_work);
>  		kfree(ipi);
>  		dev_warn(cdev, "mbox rx channel request failed\n");
>  		return NULL;
>  	}
>  
> -	INIT_WORK(&ipi->mbox_work, handle_event_notified);
> -
>  	return ipi;
>  }
>  
> @@ -364,6 +366,8 @@ static void zynqmp_r5_free_mbox(struct mbox_info *ipi)
>  		ipi->rx_chan = NULL;
>  	}
>  
> +	cancel_work_sync(&ipi->mbox_work);
> +
>  	kfree(ipi);
>  }
>  
> -- 
> 2.34.1
> 
