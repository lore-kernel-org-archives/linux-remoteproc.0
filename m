Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A410F140E2B
	for <linux-remoteproc@vger.kernel.org>; Mon,  8 Apr 2024 16:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712595436; cv=none; b=IXItl72OnSCeQVFQc7Y2gb+nYwupNj8MulnF1yGkBiu1AmYZkD1BitcX/6neZlgn2CqRjhWgTzufg5lotsODjhv/z1sPD48nJqDOOsPhbg3NbdpBFHjCYc5qV60MBkXaDrWd8b1hENPKf59cCod+NOsF1smaodCIJXfWppofUDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712595436; c=relaxed/simple;
	bh=Uu4hBDpPZB8tECBjtsDHoWt6osM5hOZNAcH28WsvX4Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kwgPel4peNiJ4a8xkS5wCA62MZ5OkyOfJyw8TBpReafMZweycnSrBCdzANMLElupV+l88BXGhLOL1uaBpY6KJjWp7vupGm1ibDn+IyoFMsYqXgxaPOPjtA5piLUsfh8H9kteooOknetQWZg+LxB20q2s8K4136CqSa8ABwvUkZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LHErFKbF; arc=none smtp.client-ip=209.85.161.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LHErFKbF"
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-5aa1b7a37b3so1128304eaf.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 08 Apr 2024 09:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712595434; x=1713200234; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wgyyqy1B7p+bYO+oWI4e1nDbdwkGobHLTs4I40p9Z9Q=;
        b=LHErFKbFIy8t4DUYEPyhyBju5qCjdAknvNOyGfU8FUERCpqQQFD601dyb/sczcEg5A
         7NwstzUc08sTwEEJ+cayXXZTAYXv4+c5+82xtDfglklJNu3Q08uLCW6J9IdtyHdmneKy
         ABwyh2m6TfbTWNrSRwSGchXKiB4/5qdjfUOSF5hiXOQKleqlGL1FJyotzyQgpeTFX6Kj
         U8/rfJwKUGyNoZTMhxwes1Z0NiF6TJjGhQzW4HKi13D5EKW33H+MEl8WmoB0SSR/zkWw
         BJSuaPUMZo8l6TcVBM5Plyki6PjQ4EZIsurZuW+Ld4PNwY/RRwue9iYdHy7FVdodUZUS
         IJOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712595434; x=1713200234;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wgyyqy1B7p+bYO+oWI4e1nDbdwkGobHLTs4I40p9Z9Q=;
        b=nq1F9iy1j1MDRqWyHyFHUMKz+RQfEhCbtkyj609tKWCJ1BUhIrOUYN+B/+SV/me6Dz
         EtxeL4IN5EqauCSmYiw5pKLr8KEVlG630LruwP9nM9gmfJ6wpmeEZj1DG/dgiXCmeXZn
         rPCLSXZ52dM9XwDmQpRPS8aq4bpgdS5q1j72jdlms1AC94+Fu4w/GFcOB+f1LCYPQip9
         AXHslKnX/h1FD0gSbS4ghPTGO0sq1tl/KywDHNoOu8Bfas3gy25TWzDYIh8LriCS4SJG
         AWGTxGrMsLs++ugPv/efNoFzVUX5lAdlLmtVMCuqhlSHDJfwTsqNEvVkAICmprGhBWiR
         EVqg==
X-Forwarded-Encrypted: i=1; AJvYcCV2GtLzb6VA1GBmlszKz1cQqUKqEp3xBeVENaKCmXyzLVChvxOOp0sBR8M8YboyUS6OzrsPTenvr/t0IKspHWFUNSNu0N9xirJJTUH6ekklaw==
X-Gm-Message-State: AOJu0YyJyCgUlZwZ4aXchO1ZcK07yT+g7AVlbVkzZAoa5xC3nnreBs/f
	zP9vmXgk6fJNN1wQzhYM0LBvpqPz94dbuPlpeU9gbK/boaYpOsDLj7AUK4NL/pI=
X-Google-Smtp-Source: AGHT+IHB9dwlGwJFTZfptSMLMESDbHmgsDIGxwFs5CWxes2lp9o/0E4E2p+gTAsBFZiIGrtQroi7iw==
X-Received: by 2002:a05:6870:f693:b0:22f:7513:f20a with SMTP id el19-20020a056870f69300b0022f7513f20amr1695648oab.55.1712595433743;
        Mon, 08 Apr 2024 09:57:13 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:a8de:8525:97f8:62d2])
        by smtp.gmail.com with ESMTPSA id o32-20020a634e60000000b005dc36761ad1sm6766321pgl.33.2024.04.08.09.57.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Apr 2024 09:57:13 -0700 (PDT)
Date: Mon, 8 Apr 2024 10:57:10 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Tanmay Shah <tanmay.shah@amd.com>
Cc: Leonard Crestez <cdleonard@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Sarangdhar Joshi <spjoshi@codeaurora.org>,
	Siddharth Gupta <sidgup@codeaurora.org>,
	Rishabh Bhatnagar <rishabhb@codeaurora.org>,
	linux-remoteproc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] remoteproc: zynqmp: Add coredump support
Message-ID: <ZhQh5mxgG4ei7dXE@p14s>
References: <d4556268-8274-4089-949f-3b97d67793c7@gmail.com>
 <6adf7a7c-c9ad-40ae-9e11-cc722c8049dd@amd.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6adf7a7c-c9ad-40ae-9e11-cc722c8049dd@amd.com>

On Thu, Apr 04, 2024 at 03:14:48PM -0500, Tanmay Shah wrote:
> Hello,
> 
> Thanks for your patch. Patch looks good to me.
> Please find some comments below.
> 
> On 3/16/24 1:16 PM, Leonard Crestez wrote:
> > Supporting remoteproc coredump requires the platform-specific driver to
> > register coredump segments to be dumped. Do this by calling
> > rproc_coredump_add_segment for every carveout.
> > 
> > Also call rproc_coredump_set_elf_info when then rproc is created. If the
> > ELFCLASS parameter is not provided then coredump fails with an error.
> > Other drivers seem to pass EM_NONE for the machine argument but for me
> > this shows a warning in gdb. Pass EM_ARM because this is an ARM R5.
> > 
> > Signed-off-by: Leonard Crestez <cdleonard@gmail.com>
> > ---
> > 
> > Tests were done by triggering an deliberate crash using remoteproc
> > debugfs: echo 2 > /sys/kernel/debug/remoteproc/remoteproc0/crash
> > 
> > This was tested using RPU apps which use RAM for everything so TCM dump
> > was not verified. The freertos-gdb script package showed credible data:
> > 
> > https://github.com/espressif/freertos-gdb
> 
> Thanks for this testing.
> 
> > 
> > The R5 cache is not flushed so RAM might be out of date which is
> > actually very bad because information most relevant to determining the
> > cause of a crash is lost. Possible workaround would be to flush caches
> > in some sort of R5 crash handler? I don't think Linux can do anything
> > about this limitation.
> > 
> 
> Correct Linux can't. One workaround is that R5 firmware can mark
> required memory regions as non-cachable in MPU setting. This way information
> loss can be avoided.
> 
> > The generated coredump doesn't contain registers, this seems to be a
> > limitation shared with other rproc coredumps. It's not clear how the apu
> > could access rpu registers on zynqmp, my only idea would be to use the
> > coresight dap but that sounds difficult.
> 
> Linux doesn't really have access to R5 control registers due to security.
> Instead EEMI calls to platform management controller are used to control R5.
> So R5 control register dump shouldn't needed.
> 
> Mathieu,
> I am okay to merge this patch.
>

Applied.

Thanks,
Mathieu

> > 
> > ---
> >  drivers/remoteproc/xlnx_r5_remoteproc.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
> > index 4395edea9a64..cfbd97b89c26 100644
> > --- a/drivers/remoteproc/xlnx_r5_remoteproc.c
> > +++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
> > @@ -484,10 +484,11 @@ static int add_mem_regions_carveout(struct rproc *rproc)
> >  			of_node_put(it.node);
> >  			return -ENOMEM;
> >  		}
> >  
> >  		rproc_add_carveout(rproc, rproc_mem);
> > +		rproc_coredump_add_segment(rproc, rmem->base, rmem->size);
> >  
> >  		dev_dbg(&rproc->dev, "reserved mem carveout %s addr=%llx, size=0x%llx",
> >  			it.node->name, rmem->base, rmem->size);
> >  		i++;
> >  	}
> > @@ -595,10 +596,11 @@ static int add_tcm_carveout_split_mode(struct rproc *rproc)
> >  			zynqmp_pm_release_node(pm_domain_id);
> >  			goto release_tcm_split;
> >  		}
> >  
> >  		rproc_add_carveout(rproc, rproc_mem);
> > +		rproc_coredump_add_segment(rproc, da, bank_size);
> >  	}
> >  
> >  	return 0;
> >  
> >  release_tcm_split:
> > @@ -674,10 +676,11 @@ static int add_tcm_carveout_lockstep_mode(struct rproc *rproc)
> >  			goto release_tcm_lockstep;
> >  		}
> >  
> >  		/* If registration is success, add carveouts */
> >  		rproc_add_carveout(rproc, rproc_mem);
> > +		rproc_coredump_add_segment(rproc, da, bank_size);
> >  
> >  		dev_dbg(dev, "TCM carveout lockstep mode %s addr=0x%llx, da=0x%x, size=0x%lx",
> >  			bank_name, bank_addr, da, bank_size);
> >  	}
> >  
> > @@ -851,10 +854,12 @@ static struct zynqmp_r5_core *zynqmp_r5_add_rproc_core(struct device *cdev)
> >  	if (!r5_rproc) {
> >  		dev_err(cdev, "failed to allocate memory for rproc instance\n");
> >  		return ERR_PTR(-ENOMEM);
> >  	}
> >  
> > +	rproc_coredump_set_elf_info(r5_rproc, ELFCLASS32, EM_ARM);
> > +
> >  	r5_rproc->auto_boot = false;
> >  	r5_core = r5_rproc->priv;
> >  	r5_core->dev = cdev;
> >  	r5_core->np = dev_of_node(cdev);
> >  	if (!r5_core->np) {
> 
