Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85D2536B900
	for <linux-remoteproc@vger.kernel.org>; Wed, 22 Jul 2026 15:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784734576; cv=none; b=ew/qpUJwYtaxSHGxTgFRDLV03/iU+PS+2yqWBpmMggLpZZ8QscZuoX4AcjvPTfUY/hGI8bllseKpADCQoeAjupJ+g28Cgd4eyrNbC55QheSfCVWpxbBcdihbeVSFpii0LtxRz+1WKXzu/Z7TrNdCEel13h6pZYvxoga2xWfdILk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784734576; c=relaxed/simple;
	bh=aixT6e4db7PFURmCXSr+Nr0QuahkL90pYvROuX1hYjM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BD9O3IMGQSMi9qQrlHj+PlNj8qN9O16fOu0HGV9LV7waveeUi3pHoKMLuCdiLQ+SOkdz+ueYreaD7zwrZarPvx5haXcYq2O0T19ooyI8svd2YdPleF2mx1auf0RRVzcsRwSFn13IlBMNumuQDwrCRHB+8bBwHFDqeHV6S8wD+Ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pnKryT/P; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pnKryT/P"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8486672f03cso12622734b3a.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 22 Jul 2026 08:36:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784734574; x=1785339374; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uRg2Z8Kw6p+3MulH8WZIYoqYCDCeXnKLTtBlLjZy4F8=;
        b=pnKryT/P38NhePAgrCEe2/8msu63idSzZB/7OnbZ9s4Kmcls/V6g/qEhCEsHVTiANJ
         czHciiD/Z16eVR9vIlmjr5KaMvJKdezig0O1rFUBitsPYYrsj2Uak7PdU0IV8b8Gk4jo
         m+xGCPMU+s1bShGzWcSngnMpsgnzFXqZX0AksRqCxSY7fT0Iu/qW/vSI6f6H/r8wHvqy
         QwflUWNPUzyQCCRc+oGK47iaG7/soL8ksjbQK3nanNklpHP0kEMgYLXo71un9hVFQ4Bw
         MNsyM/onJ0XwLJSMltgLP0CSPMTicyUWXLizHqJ4diCqxbdJ88Bg/L3Yer6WfI7wevBB
         3O1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784734574; x=1785339374;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uRg2Z8Kw6p+3MulH8WZIYoqYCDCeXnKLTtBlLjZy4F8=;
        b=D/2QsGJUbRx310MmN2a8ykVXqz6oOh7cT94p39tJ8DCVDYCKHbVwJtvKJREgCiqmJz
         154ON9K8oOz3Q9Hx3Q+5B0eyj6uR2+2WB2+58h/qd3XGpjG7AIWWKZCKHkkp+aNeDUB6
         eoep2YsiSpoYlVK3hla8y5yYPhC+oTpyIdmR352CC7FYBfhXpeorhx06+JSjE5cpeAs5
         p74fkVbHSEDOUpfOcHZFCKz+RAvLQRofjV28eUErjY8T/rzQO7e5GI965pdmwjLaVqxY
         u73WhhC6HQTdNdTVDYJWdvd1VDazAkc2e9UIFYRv7/7NU5JkN7a/uhLs3tDRST2E2Hb4
         T4hg==
X-Forwarded-Encrypted: i=1; AHgh+RrLTV7Hv520wTc4cikIVRGSDFG0GC21VEUYD2ZJzYmoZUdYsoHgM8LJ10kXDpGO3momLA2W8Yn+p6CvvTT1rwxB@vger.kernel.org
X-Gm-Message-State: AOJu0YyxRB/EviTDv3OBerFHTGVnuIB4LfnquVgAyoiWxJ1j/sSj0Bsk
	KLe9vcUDpmGLcuvhqhRhtbvYXrlyHyuJhq8GGmC/rnF1pV3eP1PK4rHaefkd4IjTNc0=
X-Gm-Gg: AR+sD10qz2586PHhNGrPtXEvAlN+hkEuWga08YnL/BC09v6ygBMeH1pFjttvs8CgzQl
	P5an2NdMhQarLxHlGf+cmQy66lhROsjGt4KNisPQRNjwbwZu9BKri2hP4MCC0yE/Cl/u2tR+IyM
	8q/WUZOEfs/OD/eDXbxbihOfUAQVqnVtoUZlurnFWdjMT0JZ1kBZLoeJddaLjO3rpLCzJQD38mr
	ECm1ntKGoS5BRZQ9zhUNv3x3czRa5MAubwDXmwcAArb0SUTmeu60QlwUxioPc34lmbpINsPw3o3
	Y8jFrV2cwo6BnRcwqItusTimSAWY5lw1p5PLhJNg4FSTO90DBB4XNWijn9O5uvUycSfyobgJldp
	RBdkpNk+TbE0Kn7lAt8Dk3wyYRDNbIctS7ExfLblyh/MdH+ggfAbWbfG5UAcRzH/4mevZBqdIUk
	VjTuSgwg==
X-Received: by 2002:a05:6a00:4f82:b0:847:759e:f617 with SMTP id d2e1a72fcca58-84c2948b110mr23354649b3a.44.1784734573743;
        Wed, 22 Jul 2026 08:36:13 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:ffc8:5f3a:2bec:f5de])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e175ea5c7sm1553997b3a.53.2026.07.22.08.36.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 08:36:12 -0700 (PDT)
Date: Wed, 22 Jul 2026 09:36:10 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Runyu Xiao <runyu.xiao@seu.edu.cn>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Tanmay Shah <tanmay.shah@amd.com>,
	Jianhao Xu <jianhao.xu@seu.edu.cn>,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v2] remoteproc: xlnx: initialize mailbox work before
 requesting channels
Message-ID: <amDjauVYktDLpAuJ@p14s>
References: <20260619074835.2069212-1-runyu.xiao@seu.edu.cn>
 <20260717023108.4191518-1-runyu.xiao@seu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260717023108.4191518-1-runyu.xiao@seu.edu.cn>

On Fri, Jul 17, 2026 at 10:31:08AM +0800, Runyu Xiao wrote:
> zynqmp_r5_setup_mbox() installs zynqmp_r5_mb_rx_cb() as the mailbox RX
> callback before requesting the mailbox channels, but initializes
> ipi->mbox_work only after both channels have been requested. Once the RX
> channel is active, a notification delivered before the late INIT_WORK()
> would make the callback queue an uninitialized work item.
> 
> Initialize the work item before requesting channels. Also drain the work
> before freeing the mailbox state, after the channels have been released so
> no new callbacks can queue it.
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
> Changes in v2:
> - Follow Tanmay's suggestion and keep zynqmp_r5_setup_mbox() taking the
>   child device pointer. Do not move the r5_core assignment in this patch.
> - Only move INIT_WORK() before channel requests and drain the work in
>   zynqmp_r5_free_mbox().
> 
>  drivers/remoteproc/xlnx_r5_remoteproc.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
> index 3349d1877751..e36918b8d234 100644
> --- a/drivers/remoteproc/xlnx_r5_remoteproc.c
> +++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
> @@ -279,6 +279,8 @@ static struct mbox_info *zynqmp_r5_setup_mbox(struct device *cdev)
>  	if (!ipi)
>  		return NULL;
>  
> +	INIT_WORK(&ipi->mbox_work, handle_event_notified);
> +

This is the right thing to do but the error path for ipi->tx_chan and
ipi->rx_chan needs to be supplemented with a call to cancel_work_sync() to avoid
freeing 'ipi' without draining ipi->mbox_work.

Thanks,
Mathieu

>  	mbox_cl = &ipi->mbox_cl;
>  	mbox_cl->rx_callback = zynqmp_r5_mb_rx_cb;
>  	mbox_cl->tx_block = false;
> @@ -305,8 +307,6 @@ static struct mbox_info *zynqmp_r5_setup_mbox(struct device *cdev)
>  		return NULL;
>  	}
>  
> -	INIT_WORK(&ipi->mbox_work, handle_event_notified);
> -
>  	return ipi;
>  }
>  
> @@ -325,6 +325,8 @@ static void zynqmp_r5_free_mbox(struct mbox_info *ipi)
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
