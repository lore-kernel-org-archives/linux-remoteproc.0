Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 484AF54BC9
	for <linux-remoteproc@vger.kernel.org>; Mon, 18 Mar 2024 16:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710780759; cv=none; b=SGFIDqjIbSTKztvFtoiIgFvUSw4qsUqAa3x0QUtm0waA94Lchs+zBFtvRSjsa59OhsJOY4F72WPGS+bRB7WpUy1748FZzM8rq27aCj91Hu3kSbF+gdcJ6POSzmdeT5c0z5MKxNG04io5Zx1pmoDc9Zh/q0sAXXkbx3HA43Z6t78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710780759; c=relaxed/simple;
	bh=hwVWckIS6m7V2/dHy7sYMSsPpseVCzcmAXXtgHyDN+U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iKbI4Y3ZN1wmH6tD4ak7y/Ar92FvSvMDXz+kDoHW2Cx3tNYQ8n0iPpdCoKW/apl7SMe/06gfv+f0v8zSI4hXmT3ESTuzQTqLXOCvKbHRH1N9iWcGazdqnRe4SbfWIBLczmxkJMz/rxDdpbVoBGFGpexxNap+1VFbHuOnEArwzY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RpyUBQ6R; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RpyUBQ6R"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-6e6ee9e3cffso2744639b3a.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 18 Mar 2024 09:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710780756; x=1711385556; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aQJIbs2yBMoH3QIXds9BMUYNdFllgWIuuxULBV69aqY=;
        b=RpyUBQ6RqrShqGtNrGb+GAxbVIVwBISbnsgxha8jfPR1YGlmlaQwSi2YP8AQC7Ijsw
         8vrEJ3U0j5JZkUfeRoqL/hxYVYnp5TClAf3Pr6s2Vokwh65zpXAw0FWGBEblUsnWa1AQ
         skARKoENSUJPpExbmJpO1jwQ21ou583/V02x4AqWDlllD/ALvQ7ZDRRNoyBe7wedHcM6
         yxDMAX8c6WCCci8vNIOJDhgTTxBmluBaDWEnMhwIhyKblF3Ge2OaQ7OZUlwY0w8Ee5sD
         QunC0IcuugeM+eV3nRJKaB4l7P/WkstDbRwjZ6cY9uDdJyZ70uo9y/RocLUZDyrYTHV0
         01CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710780756; x=1711385556;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aQJIbs2yBMoH3QIXds9BMUYNdFllgWIuuxULBV69aqY=;
        b=uujzofPVBxZPUqOHPj7ibuXdqGeZORtZ30VtzvxEaDvMXr2LJIfjTxNZCsseN2iONN
         jqxwDr1Yvbz4NnYtaZCu8/KX5c2ZSQm5mZl1hn/xpiQ0QHg/RiqGSfGDTvSrxKVt3PvJ
         kWG7awOO23kawUhoAV4aFA2Hd5oZhgOa28jVZXjulCO98PMEYiLVxjm8CcShCNqHkBzE
         3SH955GVk7DkGMR36Wz6aGsDVqJ0XyjT9rMr9kgBWtZKSBb+/mp1Xide6ljT/dK+pPUw
         KH/oK8lxAlZqc1fIHj61uzBZOrbsQzC5124qO1jclDf6usOHXsWTc3WOK5u9qmDusG9H
         FZxw==
X-Forwarded-Encrypted: i=1; AJvYcCUG9y55VPJO2ssqDhuc+uS4fMtw9N9c8brb0tFZ5VYpXMzXG544+xRS3Km4Rkl6AcEK+baQS5/Z1BwA1GLJchRhuT0rE39INaDPH1zLJY/dZg==
X-Gm-Message-State: AOJu0YwY4XrhsQbDadgOxQNh0RqsInfMOnDAJ6TJU05oIFmxQRqus8tK
	wTpTxKX+VVeQ/tmXrI+WnPdo2UIx7IB7NZJGLRtRGjb4WoR29kp6fgcJyVhXiT8=
X-Google-Smtp-Source: AGHT+IGjp5w2/ZLXnC0IvBs/4igjALHcUODPSqrhOANIDm8m8pvVkBzYwKXyhX88zm8DZZjBP0tGVg==
X-Received: by 2002:a05:6a00:2389:b0:6e6:30ef:b7e9 with SMTP id f9-20020a056a00238900b006e630efb7e9mr234979pfc.16.1710780756429;
        Mon, 18 Mar 2024 09:52:36 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:1e7:74d5:bebc:a28d])
        by smtp.gmail.com with ESMTPSA id w2-20020aa79a02000000b006e68b422850sm4112652pfj.81.2024.03.18.09.52.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Mar 2024 09:52:35 -0700 (PDT)
Date: Mon, 18 Mar 2024 10:52:32 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Leonard Crestez <cdleonard@gmail.com>
Cc: Tanmay Shah <tanmay.shah@amd.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Sarangdhar Joshi <spjoshi@codeaurora.org>,
	Siddharth Gupta <sidgup@codeaurora.org>,
	Rishabh Bhatnagar <rishabhb@codeaurora.org>,
	linux-remoteproc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] remoteproc: zynqmp: Add coredump support
Message-ID: <ZfhxUJjrcYfqt9Nd@p14s>
References: <d4556268-8274-4089-949f-3b97d67793c7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d4556268-8274-4089-949f-3b97d67793c7@gmail.com>

Hi Leonard,

I have queued patches for this driver that will break this patch.  Please
re-submit when v6.9-rc1 is out and rproc-next has been updated, which should be
around the middle of next week.

Thanks,
Mathieu

On Sat, Mar 16, 2024 at 08:16:42PM +0200, Leonard Crestez wrote:
> Supporting remoteproc coredump requires the platform-specific driver to
> register coredump segments to be dumped. Do this by calling
> rproc_coredump_add_segment for every carveout.
> 
> Also call rproc_coredump_set_elf_info when then rproc is created. If the
> ELFCLASS parameter is not provided then coredump fails with an error.
> Other drivers seem to pass EM_NONE for the machine argument but for me
> this shows a warning in gdb. Pass EM_ARM because this is an ARM R5.
> 
> Signed-off-by: Leonard Crestez <cdleonard@gmail.com>
> ---
> 
> Tests were done by triggering an deliberate crash using remoteproc
> debugfs: echo 2 > /sys/kernel/debug/remoteproc/remoteproc0/crash
> 
> This was tested using RPU apps which use RAM for everything so TCM dump
> was not verified. The freertos-gdb script package showed credible data:
> 
> https://github.com/espressif/freertos-gdb
> 
> The R5 cache is not flushed so RAM might be out of date which is
> actually very bad because information most relevant to determining the
> cause of a crash is lost. Possible workaround would be to flush caches
> in some sort of R5 crash handler? I don't think Linux can do anything
> about this limitation.
> 
> The generated coredump doesn't contain registers, this seems to be a
> limitation shared with other rproc coredumps. It's not clear how the apu
> could access rpu registers on zynqmp, my only idea would be to use the
> coresight dap but that sounds difficult.
> 
> ---
>  drivers/remoteproc/xlnx_r5_remoteproc.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
> index 4395edea9a64..cfbd97b89c26 100644
> --- a/drivers/remoteproc/xlnx_r5_remoteproc.c
> +++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
> @@ -484,10 +484,11 @@ static int add_mem_regions_carveout(struct rproc *rproc)
>  			of_node_put(it.node);
>  			return -ENOMEM;
>  		}
>  
>  		rproc_add_carveout(rproc, rproc_mem);
> +		rproc_coredump_add_segment(rproc, rmem->base, rmem->size);
>  
>  		dev_dbg(&rproc->dev, "reserved mem carveout %s addr=%llx, size=0x%llx",
>  			it.node->name, rmem->base, rmem->size);
>  		i++;
>  	}
> @@ -595,10 +596,11 @@ static int add_tcm_carveout_split_mode(struct rproc *rproc)
>  			zynqmp_pm_release_node(pm_domain_id);
>  			goto release_tcm_split;
>  		}
>  
>  		rproc_add_carveout(rproc, rproc_mem);
> +		rproc_coredump_add_segment(rproc, da, bank_size);
>  	}
>  
>  	return 0;
>  
>  release_tcm_split:
> @@ -674,10 +676,11 @@ static int add_tcm_carveout_lockstep_mode(struct rproc *rproc)
>  			goto release_tcm_lockstep;
>  		}
>  
>  		/* If registration is success, add carveouts */
>  		rproc_add_carveout(rproc, rproc_mem);
> +		rproc_coredump_add_segment(rproc, da, bank_size);
>  
>  		dev_dbg(dev, "TCM carveout lockstep mode %s addr=0x%llx, da=0x%x, size=0x%lx",
>  			bank_name, bank_addr, da, bank_size);
>  	}
>  
> @@ -851,10 +854,12 @@ static struct zynqmp_r5_core *zynqmp_r5_add_rproc_core(struct device *cdev)
>  	if (!r5_rproc) {
>  		dev_err(cdev, "failed to allocate memory for rproc instance\n");
>  		return ERR_PTR(-ENOMEM);
>  	}
>  
> +	rproc_coredump_set_elf_info(r5_rproc, ELFCLASS32, EM_ARM);
> +
>  	r5_rproc->auto_boot = false;
>  	r5_core = r5_rproc->priv;
>  	r5_core->dev = cdev;
>  	r5_core->np = dev_of_node(cdev);
>  	if (!r5_core->np) {
> -- 
> 2.34.1
