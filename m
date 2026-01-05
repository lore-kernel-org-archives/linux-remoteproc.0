Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D820026D4C3
	for <linux-remoteproc@vger.kernel.org>; Mon,  5 Jan 2026 21:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767648121; cv=none; b=kze2pNK6tRYQz/yMWBSIA10clUo3YxuVi1Dv0myvIPHXGt2JhfVr8xQfJv8p+igsy6HNXwmX/QvUnfpf32eWHfCkii9yIz7hwi8YQMHD0cSj/wRhSnQeEqfogCDPYDFr7rX/ie9A1zLeFuF8JHxb9t6JYrNIlFk7Y+3e4jIdFOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767648121; c=relaxed/simple;
	bh=cowYHX6VgY2sQJ6GJvqY/VZEh7SHHG93Pk4pC4H2qkg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IzvxpILiAnl9KfZdVUVDdxIszWkIHMsbX7rBNlPANAtfY4LY06G8DNq3WnxSwBxL11EHSy3H67lxJf3KnDLc8GV7BYQYnLAo7ok/+df8Tm5He5OWvgC4zoO3vzTy93kNADEkf33VxwXfQeQnWu6E4WrqJfvnKacZ0eKwJ1tljhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BLhzuwPj; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BLhzuwPj"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-34b75f7a134so358678a91.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 05 Jan 2026 13:21:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767648119; x=1768252919; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IHl6KsCXWNnvBFhjw1BS903IWG5F64nsaXFE4JrVbjI=;
        b=BLhzuwPjDPqQrUSfJ6p4jdemTGBJxIVwxOJwMditOiGQ3V1s6qV7UFEjhiCeayhVh2
         jQp7FBvyOeAnKvJmLjTscKT1cGV0jxT3htcCq77AExuNw3/ti1aHZYI80BDUjT7flZla
         e5wo+j+QP7LvIk5cAZZPzvqAGbWhn+OjoJcyaGMvcBpkIuSojhS2B2ycE/smkLJZyBau
         GoTVyFpcfN3FA8AY3nOv2pC1oF2y32gb3NYgRIoId4FJhhnc3x1R3CgrVjQtV6dH0bnV
         pcvla1bSyKjw7f2rR2G8rcSXc5gxq+a0C/lfQxcdk0qx/NAyYdm0u84kp7IltgCjXnNw
         zhRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767648119; x=1768252919;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IHl6KsCXWNnvBFhjw1BS903IWG5F64nsaXFE4JrVbjI=;
        b=pK1Sd8l1rS5R+o+MSF77BPcTp0hFZ1mJESJbguMCxdhb7Y4N7mmVLccfh8kEnnp+GS
         bzr3aDnC8hBcowO8paTNs/DxkFk+LIjm35fnyz0pMJI/eQByL5x5PE5qA9MmuCmZZQXq
         nk7C7nGKTMdRJsSu/YFd2JGlvhiJPeWPnFgQKnpP/9niVOVHcefd3B0idKwX++N9oAec
         yWONRyZUkDix/dN4kuX9mWCeVkoMwTQ/ZKCVtWix1AR3Ugk8R19G5NH7SV0gXwNPbBoM
         pzZGCvm/EpXfrMHVZ5zVb/3TyULhtSw/yXldf7l45SKEn8BBPwq+8L35o34lKYNx5Q9G
         Pbhw==
X-Forwarded-Encrypted: i=1; AJvYcCU5wf11BqyEKvlrDYVNT4utgY2lipvvRQ3WUfRnrYpxJeSNkrwCCkWFc4D4hCA1MvzJ3AZImhnAidHEkl8Q8A18@vger.kernel.org
X-Gm-Message-State: AOJu0YwB1A15i7nmT1HD7qvD/Mu5xOyvadBPCcxz2hyp5mzmbGE5I+C4
	ByeMMvkyyP4fX5/OAk35Y3AKMLCOmnkJT4ojozXxs63PyTf3TAZLw8oxyTWi8VLSjPU=
X-Gm-Gg: AY/fxX5JR9u/e32G7iZXYTT2rBjREefeZBSe7+Pv4HIkYiLzGVTcO3Sdh8kY4UtRGde
	KnTohzT2z7ayOH9oby36+3uYgUfmsKsDYQODdltWNk2yox7twqXeUmRZUlecbBagf1BSIeK8+Tu
	kqNyNCKzNdEynkd4zRQ3GCN9gJwVyDNSQOgfGX3MOqjxgCt6cU91Koy7tUwrDqOy4nVJu+sB+Dl
	cCNoOFuNAD14BlheBDn20MmcYPQpIxyfPKsRpghfKal/zWhdYV9V2+K23QqYl9xrLbQRf/kKaWD
	l1bhg5p6GLJzqNXYwYCEIgryYtN8I0xmFLmBR45Xo/qEUDhkzk2Fpju39PbA+JCkWK4ltdEKrJk
	qmHpJB+i82hpOfqEwAC72X6BvV8b39RBFEnk14PYIc+eXcAGQWWc37SvMCgi5VGV6L1/u5p+kmT
	g7e0e4fdeKRvWcYg==
X-Google-Smtp-Source: AGHT+IGd4sVKQ0O01R6fgipDmJAPqJh6j4MuVL4yYoNRQBHoibLH/wAamHcAaAdd1V93u2HchD6BLw==
X-Received: by 2002:a17:90b:3e83:b0:341:315:f4ed with SMTP id 98e67ed59e1d1-34f5f280f61mr438841a91.10.1767648119023;
        Mon, 05 Jan 2026 13:21:59 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:3f6b:5551:220f:8f13])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34f5fb7442asm272953a91.15.2026.01.05.13.21.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 13:21:58 -0800 (PST)
Date: Mon, 5 Jan 2026 14:21:56 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Tanmay Shah <tanmay.shah@amd.com>
Cc: jassisinghbrar@gmail.com, andersson@kernel.org,
	linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v3 2/2] remoteproc: xlnx: do not kick if mbox queue is
 full
Message-ID: <aVwrdGiZZ9E-5Nkq@p14s>
References: <20251217212728.1540043-1-tanmay.shah@amd.com>
 <20251217212728.1540043-3-tanmay.shah@amd.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251217212728.1540043-3-tanmay.shah@amd.com>

Good day,

On Wed, Dec 17, 2025 at 01:27:28PM -0800, Tanmay Shah wrote:
> If MBOX_TX_QUEUE_LEN number of kicks are pending, then no need to keep
> doing more kicks because it will fail anyway. Preventing further kicks
> is needed because it avoids printing false positive warning messages
> from mailbox framework. Functionally nothing changes from RPMsg or
> remoteproc point of view.
> 
> Also, allocate different mbox client data structure for tx channel, as
> it's a requirement from the mailbox framework.
> 

The semantic of these two changes is different enough to mandate two separate
patches.  I'm fine with the changes themselves.

Thanks,
Mathieu 

> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
> ---
>  drivers/remoteproc/xlnx_r5_remoteproc.c | 24 +++++++++++++++++++-----
>  1 file changed, 19 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
> index a7b75235f53e..2db158c189be 100644
> --- a/drivers/remoteproc/xlnx_r5_remoteproc.c
> +++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
> @@ -9,6 +9,7 @@
>  #include <linux/firmware/xlnx-zynqmp.h>
>  #include <linux/kernel.h>
>  #include <linux/mailbox_client.h>
> +#include <linux/mailbox_controller.h>
>  #include <linux/mailbox/zynqmp-ipi-message.h>
>  #include <linux/module.h>
>  #include <linux/of_address.h>
> @@ -74,7 +75,8 @@ struct zynqmp_sram_bank {
>   * @tx_mc_buf: to copy data to mailbox tx channel
>   * @r5_core: this mailbox's corresponding r5_core pointer
>   * @mbox_work: schedule work after receiving data from mailbox
> - * @mbox_cl: mailbox client
> + * @mbox_tx_cl: tx channel mailbox client
> + * @mbox_rx_cl: rx channel mailbox client
>   * @tx_chan: mailbox tx channel
>   * @rx_chan: mailbox rx channel
>   */
> @@ -83,7 +85,8 @@ struct mbox_info {
>  	unsigned char tx_mc_buf[MBOX_CLIENT_BUF_MAX];
>  	struct zynqmp_r5_core *r5_core;
>  	struct work_struct mbox_work;
> -	struct mbox_client mbox_cl;
> +	struct mbox_client mbox_tx_cl;
> +	struct mbox_client mbox_rx_cl;
>  	struct mbox_chan *tx_chan;
>  	struct mbox_chan *rx_chan;
>  };
> @@ -230,7 +233,7 @@ static void zynqmp_r5_mb_rx_cb(struct mbox_client *cl, void *msg)
>  	struct mbox_info *ipi;
>  	size_t len;
>  
> -	ipi = container_of(cl, struct mbox_info, mbox_cl);
> +	ipi = container_of(cl, struct mbox_info, mbox_rx_cl);
>  
>  	/* copy data from ipi buffer to r5_core */
>  	ipi_msg = (struct zynqmp_ipi_message *)msg;
> @@ -269,8 +272,8 @@ static struct mbox_info *zynqmp_r5_setup_mbox(struct device *cdev)
>  	if (!ipi)
>  		return NULL;
>  
> -	mbox_cl = &ipi->mbox_cl;
> -	mbox_cl->rx_callback = zynqmp_r5_mb_rx_cb;
> +	mbox_cl = &ipi->mbox_tx_cl;
> +	mbox_cl->rx_callback = NULL;
>  	mbox_cl->tx_block = false;
>  	mbox_cl->knows_txdone = false;
>  	mbox_cl->tx_done = NULL;
> @@ -285,6 +288,13 @@ static struct mbox_info *zynqmp_r5_setup_mbox(struct device *cdev)
>  		return NULL;
>  	}
>  
> +	mbox_cl = &ipi->mbox_rx_cl;
> +	mbox_cl->rx_callback = zynqmp_r5_mb_rx_cb;
> +	mbox_cl->tx_block = false;
> +	mbox_cl->knows_txdone = false;
> +	mbox_cl->tx_done = NULL;
> +	mbox_cl->dev = cdev;
> +
>  	ipi->rx_chan = mbox_request_channel_byname(mbox_cl, "rx");
>  	if (IS_ERR(ipi->rx_chan)) {
>  		mbox_free_channel(ipi->tx_chan);
> @@ -335,6 +345,10 @@ static void zynqmp_r5_rproc_kick(struct rproc *rproc, int vqid)
>  	if (!ipi)
>  		return;
>  
> +	/* Do not need new kick as already many kicks are pending. */
> +	if (ipi->tx_chan->cl->msg_slot_ro == 0)
> +		return;
> +
>  	mb_msg = (struct zynqmp_ipi_message *)ipi->tx_mc_buf;
>  	memcpy(mb_msg->data, &vqid, sizeof(vqid));
>  	mb_msg->len = sizeof(vqid);
> -- 
> 2.34.1
> 
