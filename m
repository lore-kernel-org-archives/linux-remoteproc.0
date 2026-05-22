Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E682282F34
	for <linux-remoteproc@vger.kernel.org>; Fri, 22 May 2026 15:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779464772; cv=none; b=qMV0AfctXpPncb/S+BESNuiToeFwbFWGjXKia0tM2REVFoe+58Ak5gqCI1XD4nl8QeHyMuNDnDDgJ63fGDCKyvt2WCAp1+I2aa0q63YOCkGNWqCn8TXHqGQqmT7M7Vc3IpR8AKvTKQFR//+HD8/r6Xwqlb8yWiiqeJCZG1ufLro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779464772; c=relaxed/simple;
	bh=CJNwYBiF+JlbYs3vxZ9tkF5JCH8uyRQX8Xx+IVx063o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WVWboAD1BEtPtDnE62il+mlInFLItDBDEHv6W+r2Xn2pj8saOomtzhiHZVGkZUPVKBXqMN2kvDA455zzpgsJcrSMY1+AS7rSBbN+B9PfSml7aMJxICvfh2YKKnKfHCPj045H/m0JFeESegfo64M8TwiFn1Axt71m7asLUqyvMxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Cedj7BdG; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Cedj7BdG"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-83945063f70so4067782b3a.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 22 May 2026 08:46:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779464770; x=1780069570; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=x+geE85oo38R4XUU2Qb3gWckawRQ9IEhNVLya137svg=;
        b=Cedj7BdG1/hIyu9KrtDPHIKs3Do+wV/XoAAoUjW26aBOVf8k2Nr7LHMDUxtMiWVIvt
         7N7uwzYNe3m57aZOhlJ8+QoEZ9f+qspd6HmzM4qJtnZAEnGFW4ItZQM+IRkKQLx0ckkW
         +PzopU3mbQKuTyR7a1j+McEpSJDIhCDx6lXmCM2yOhg2a640ntgqnrWdnNoEFSqYJeCz
         ubt0+7VkN8xMF3whPZcYJywOh/dLsaQKMJyWtiVHZJB9vnkDxqnTCZlTKJ7V+hOnepue
         IwFVnDHBtUVXxxJc5jkZpb3G6fW8tPxRPtQ38ywCKuXpVLBilCxiXm1p/OXIPOm+bqgi
         PwJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779464770; x=1780069570;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x+geE85oo38R4XUU2Qb3gWckawRQ9IEhNVLya137svg=;
        b=cExU0JWWsEQOaVTQpJSvxTXBNwRVece8Nn0mCdHUZb54WXs4DViNFLm40FpTxcqDuo
         XXjF8fX3hoMmNi1jPw9x9j/bjAs5l/TtV+MO18a0fwLPSJxz9gpmWHiKYdNkaOlabRmg
         cmegYEHTti9RSMAUEhB5RFTM9WeBV5d3PE0RhLIJ4DEX7kzxjLZQyqTI8ytzOVstpjYp
         pCwq9MuUYpZOWwFzUPeqH16/KOk9kpQPUnJRWK87ko7kmjy4EwIO57fN7LdNNHl+mkWV
         D6YOiv3s4gXR/d9seFESznJCUthKW/fodvHYVOfBaAP+xA8uV9htWvHHsyL5cJaWaXqu
         jWbg==
X-Forwarded-Encrypted: i=1; AFNElJ8N9/77VWCJQxszeMKzoSI63Yi/AqBOb5/C1TReWak++o8c+mECHmfcCGUGEcFN2bTMnqmVPzei5my5lJLsDQhR@vger.kernel.org
X-Gm-Message-State: AOJu0YxoWw3YIcNMLImnidwD3tRsKlTlYvCYvdQx8e5tzAnbjb2mkF2M
	9T1MNY7+wB7XWi7TqlMFXJyFE31pm1xgRSSEaujnXvgnA588Rr2FynU0JGUJcCaAeXc=
X-Gm-Gg: Acq92OEH2xM4KBR2C6gnS5Xt+cY8TSK+3p7lBqZ8q9SWnaCmgT7ieCJYe8bE3Idpp0f
	52GsVhPz9duxXOWeK4Up0rWxdRTWtIi05sSncfeuuRF4XNt++quQ6B/zcxRbxcV/kAU31a8y9Ai
	DyJd+hVuY8TmleJSiNkxHncDHdE0SIoOW+qbbJ4hS6eisiqGeyHuL/mMfbb++eh6R/nfl+aiF4y
	nhE3nYm/Sze6LYV6vn6eCYv1bs8yxL7UyBkaVkhXulaZ09RFlTgNEL3kcsngGGYduAsOl8WlZby
	Qc2XRxQwMmeHmTHsl78kRtGTgse0+iQj+ohjt43aZWxbSWUB6CeZ8JoHblKxXxIPK++5PMFA9sS
	eRKZGZ1u7h9LnIKxS1IMI8uElwp7fcmAETZAE7IsB6SzkMyNjV4VuAmwn+Vj1pOiGkniib4utb2
	CrynnVFmtfsTUTr3fanboscmnGjA==
X-Received: by 2002:a05:6a20:7485:b0:39b:8571:3051 with SMTP id adf61e73a8af0-3b307f420e2mr7844589637.28.1779464769598;
        Fri, 22 May 2026 08:46:09 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:dc1e:387:6364:2ccc])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85202a789dsm1828934a12.9.2026.05.22.08.46.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 08:46:09 -0700 (PDT)
Date: Fri, 22 May 2026 09:46:06 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: tanmay.shah@amd.com
Cc: andersson@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, michal.simek@amd.com, ben.levinsky@amd.com,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] remoteproc: xlnx: enable auto boot feature
Message-ID: <ahB6Pvquw6wuEHgl@p14s>
References: <20260501143707.1591110-1-tanmay.shah@amd.com>
 <20260501143707.1591110-3-tanmay.shah@amd.com>
 <ag9FcXeIIiJWdld7@p14s>
 <cbd418a3-1585-4592-8e86-b0750e19ec0f@amd.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cbd418a3-1585-4592-8e86-b0750e19ec0f@amd.com>

On Thu, May 21, 2026 at 01:38:57PM -0500, Shah, Tanmay wrote:
> Hello,
> 
> Thank you for the reviews, please find my comments below:
> 
> On 5/21/2026 12:48 PM, Mathieu Poirier wrote:
> > Good morning,
> > 
> > I don't recal reviewing the first revision of this set.  Can you provide a link
> > to it so that I can read the comments that were provided?
> > 
> 
> Here it is:
> https://lore.kernel.org/linux-remoteproc/20260422202558.2362971-1-tanmay.shah@amd.com/
> 
> The device-tree bindings needed rework in v1, so I sent v2, before we
> ever reviewed the driver part.
> 
> 
> > On Fri, May 01, 2026 at 07:37:07AM -0700, Tanmay Shah wrote:
> >> remoteproc framework has capability to start (or attach to) the remote
> > 
> > The remoteproc framework...
> > 
> 
> Ack.
> 
> >> processor automatically if auto boot flag is set by the driver during
> >> probe. If remote core is not started before the Linux boot, and linux is
> >> expected to start the remote core then it uses "firmware-name" property
> >> to load default firmware during auto boot.
> >>
> >> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
> >> ---
> >>  drivers/remoteproc/xlnx_r5_remoteproc.c | 48 +++++++++++++++++--------
> >>  1 file changed, 34 insertions(+), 14 deletions(-)
> >>
> >> diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
> >> index 45a62cb98072..652030f9cea2 100644
> >> --- a/drivers/remoteproc/xlnx_r5_remoteproc.c
> >> +++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
> >> @@ -899,17 +899,18 @@ static const struct rproc_ops zynqmp_r5_rproc_ops = {
> >>  };
> >>  
> >>  /**
> >> - * zynqmp_r5_add_rproc_core() - Add core data to framework.
> >> - * Allocate and add struct rproc object for each r5f core
> >> + * zynqmp_r5_alloc_rproc_core() - alloc rproc core data structure
> >> + * Allocate struct rproc object for each r5f core
> >>   * This is called for each individual r5f core
> >>   *
> >>   * @cdev: Device node of each r5 core
> >>   *
> >>   * Return: zynqmp_r5_core object for success else error code pointer
> >>   */
> >> -static struct zynqmp_r5_core *zynqmp_r5_add_rproc_core(struct device *cdev)
> >> +static struct zynqmp_r5_core *zynqmp_r5_alloc_rproc_core(struct device *cdev)
> > 
> > Why is there a need to change the function's name?
> > 
> 
> Before, the function was actually adding the rproc core by calling
> rproc_add() function, but now it only allocates the memory by calling
> rproc_alloc(). For auto boot to work it's important to add rproc core
> after all the other hw is initialized (such as mbox, tcm, sram,
> power-domains etc). More details below [1].
> 

Ok

> >>  {
> >>  	struct zynqmp_r5_core *r5_core;
> >> +	const char *fw_name = NULL;
> >>  	struct rproc *r5_rproc;
> >>  	int ret;
> >>  
> >> @@ -918,10 +919,15 @@ static struct zynqmp_r5_core *zynqmp_r5_add_rproc_core(struct device *cdev)
> >>  	if (ret)
> >>  		return ERR_PTR(ret);
> >>  
> >> +	ret = rproc_of_parse_firmware(cdev, 0, &fw_name);
> >> +	if (ret < 0 && ret != -EINVAL)
> >> +		return ERR_PTR(dev_err_probe(cdev, ret,
> >> +					     "failed to parse firmware-name\n"));
> >> +
> >>  	/* Allocate remoteproc instance */
> >>  	r5_rproc = rproc_alloc(cdev, dev_name(cdev),
> >>  			       &zynqmp_r5_rproc_ops,
> >> -			       NULL, sizeof(struct zynqmp_r5_core));
> >> +			       fw_name, sizeof(struct zynqmp_r5_core));
> >>  	if (!r5_rproc) {
> >>  		dev_err(cdev, "failed to allocate memory for rproc instance\n");
> >>  		return ERR_PTR(-ENOMEM);
> >> @@ -932,6 +938,11 @@ static struct zynqmp_r5_core *zynqmp_r5_add_rproc_core(struct device *cdev)
> >>  	r5_rproc->recovery_disabled = true;
> >>  	r5_rproc->has_iommu = false;
> >>  	r5_rproc->auto_boot = false;
> >> +
> >> +	/* attempt to boot automatically if the firmware-name is provided */
> >> +	if (fw_name)
> >> +		r5_rproc->auto_boot = true;
> >> +
> > 
> > What happens when a firmware name needs to be provided in the DT but you don't
> > want to automatically boot the remote processor?
> > 
> 
> I think that use case is not needed. If the user/system-designer doesn't
> want auto-boot, then having firmware-name in the device-tree serves no
> purpose. User can always load the firmware via sysfs once kernel boots.
> 

Ok

> >>  	r5_core = r5_rproc->priv;
> >>  	r5_core->dev = cdev;
> >>  	r5_core->np = dev_of_node(cdev);
> >> @@ -941,13 +952,6 @@ static struct zynqmp_r5_core *zynqmp_r5_add_rproc_core(struct device *cdev)
> >>  		goto free_rproc;
> >>  	}
> >>  
> >> -	/* Add R5 remoteproc core */
> >> -	ret = rproc_add(r5_rproc);
> >> -	if (ret) {
> >> -		dev_err(cdev, "failed to add r5 remoteproc\n");
> >> -		goto free_rproc;
> >> -	}
> >> -
> > 
> > I'm not sure why there is a need to move this to zynqmp_r5_cluster_init()?  Is
> > it simply to make the error path easier to handle?  If so, please do that in a
> > separate patch.
> > 
> 
> [1] This was moved to make auto-boot work. The remote core can auto-boot
> only after other hardware is initialized. The zynqmp_r5_core_init()
> initializes sram, TCM and power-domains of the core. Also, mailbox is
> requested before zynqmp_r5_core_init() as well. We can't auto-boot core
> directly without all this. So, I had to move rproc_add() at the end of
> the cluster init, and rename above function from
> zynqmp_r5_add_rproc_core to zynqmp_r5_alloc_rproc_core.
> 
> If you prefer, I will add above explanation in the commit text, or as
> comment right before rproc_add().
> 

Yes, please add that to the commit log.

> 
> 
> >>  	r5_core->rproc = r5_rproc;
> >>  	return r5_core;
> >>  
> >> @@ -1280,6 +1284,7 @@ static int zynqmp_r5_core_init(struct zynqmp_r5_cluster *cluster,
> >>  			if (zynqmp_r5_get_rsc_table_va(r5_core))
> >>  				dev_dbg(r5_core->dev, "rsc tbl not found\n");
> >>  			r5_core->rproc->state = RPROC_DETACHED;
> >> +			r5_core->rproc->auto_boot = true;
> > 
> > I thought this was done in zynqmp_r5_add_rproc_core() - what am I missing?
> > 
> 
> That function is now zynqmp_r5_alloc_core() as mentioned above. Also,
> until now, auto_boot was set to 'false' only to show that it is
> disabled. It is actually used and enabled now.
> 

Ok

> > Thanks,
> > Mathieu
> > 
> >>  		}
> >>  	}
> >>  
> >> @@ -1304,7 +1309,7 @@ static int zynqmp_r5_cluster_init(struct zynqmp_r5_cluster *cluster)
> >>  	enum rpu_oper_mode fw_reg_val;
> >>  	struct device **child_devs;
> >>  	enum rpu_tcm_comb tcm_mode;
> >> -	int core_count, ret, i;
> >> +	int core_count, ret, i, j;
> >>  	struct mbox_info *ipi;
> >>  
> >>  	ret = of_property_read_u32(dev_node, "xlnx,cluster-mode", &cluster_mode);
> >> @@ -1390,7 +1395,7 @@ static int zynqmp_r5_cluster_init(struct zynqmp_r5_cluster *cluster)
> >>  		child_devs[i] = &child_pdev->dev;
> >>  
> >>  		/* create and add remoteproc instance of type struct rproc */
> >> -		r5_cores[i] = zynqmp_r5_add_rproc_core(&child_pdev->dev);
> >> +		r5_cores[i] = zynqmp_r5_alloc_rproc_core(&child_pdev->dev);
> >>  		if (IS_ERR(r5_cores[i])) {
> >>  			ret = PTR_ERR(r5_cores[i]);
> >>  			r5_cores[i] = NULL;
> >> @@ -1435,16 +1440,31 @@ static int zynqmp_r5_cluster_init(struct zynqmp_r5_cluster *cluster)
> >>  		goto release_r5_cores;
> >>  	}
> >>  
> >> +	for (j = 0; j < cluster->core_count; j++) {
> >> +		/* Add R5 remoteproc core */
> >> +		ret = rproc_add(r5_cores[j]->rproc);
> >> +		if (ret) {
> >> +			dev_err_probe(r5_cores[j]->dev, ret,
> >> +				      "failed to add remoteproc\n");
> >> +			goto delete_r5_cores;
> >> +		}
> >> +	}
> >> +
> >>  	kfree(child_devs);
> >>  	return 0;
> >>  
> >> +delete_r5_cores:
> >> +	i = core_count - 1;
> >> +	/* delete previous added rproc */
> >> +	while (--j >= 0)
> >> +		rproc_del(r5_cores[j]->rproc);
> >> +
> >>  release_r5_cores:
> >>  	while (i >= 0) {
> >>  		put_device(child_devs[i]);
> >>  		if (r5_cores[i]) {
> >>  			zynqmp_r5_free_mbox(r5_cores[i]->ipi);
> >>  			of_reserved_mem_device_release(r5_cores[i]->dev);
> >> -			rproc_del(r5_cores[i]->rproc);
> >>  			rproc_free(r5_cores[i]->rproc);
> >>  		}
> >>  		i--;
> >> -- 
> >> 2.34.1
> >>
> 
