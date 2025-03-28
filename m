Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1D121A314B
	for <linux-remoteproc@vger.kernel.org>; Fri, 28 Mar 2025 14:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743171287; cv=none; b=cBhKHHZjgNQ+J58e2xHnm5wI288ggUpsvyyDXP/xn/YrXZWauIIgb8o7AjmDQ7ev9pUMMONHRsUBEaLmGPksB6afAbW0BXebVQ72/bHpmRELUx/YjnM9Z/tVu1sVp2DSJThdJvxeBAid7X8OPb9lkXa54LFl4AdtpiigbiCwJx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743171287; c=relaxed/simple;
	bh=wK1ehaq6dNRFnlziHcAibzSUwhMDWmID5TaLHziYYos=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UHIoyMYxG1Z5wI3QLHCfwzEYKZzerda9TG924m4miyIrqw2fiWXNqU8LcdfgM32rNCfTKHs0yOOJXyj+gg2NqtprjQ8sE9JyJhu4k2emlcHopPFayeYvpabIfcvH1Qnf2wmaLtT7bSa3VBcv7rRGmHca5iA89QJvo0QlnMS5Q6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LBya6JHU; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LBya6JHU"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2260c915749so32461995ad.3
        for <linux-remoteproc@vger.kernel.org>; Fri, 28 Mar 2025 07:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743171285; x=1743776085; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=n1Dba98BGDtjOM6DFuWR/X88tWcqFq5izur1ZVd2H9o=;
        b=LBya6JHUMqQiG/uA7qZhsio08qt59TLjRGBuPf7N6qf0m2Z7Z0Fal1B9OVpFnMDDtO
         OrEBf1lWND7Wshxa/ytnK7gBUfW0SlOtm4670/W7MnqRRczX3XWo21AzN53ABH3+rJQW
         7+V3d3HIX5IqZKaFdH5dsFiOgW4br7wls+aH4PvA93pnhi5xgRxUhltaNl/Jpe639ce7
         r4sp+GSHbT+i+sRHf32N5gH4+8bynPkblVm8pn825+ynQ+xu0aXumC+YQ5OnqbOPEHxO
         dAtUllwX07+x0oMVgDC/DzMwTN4SJARvrm3LBGnbPxl7l9l5NtSKjBAJtzVRF1ABWuQF
         XFig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743171285; x=1743776085;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n1Dba98BGDtjOM6DFuWR/X88tWcqFq5izur1ZVd2H9o=;
        b=rd334DqDge/ANLGdoFBo7xdWH3O+bTE9uTPL1+rWJAIdAG5hsPKy99nhnEKQbRzDW0
         6efLcyeF/xrqQFEpgts0Oid8+LYV+GILmBQNkecnzEmJuOxKtdAzo5IqgZi78dqygKYC
         bqr+DuY5kJpTK7scPjmrAtslmP/l0XnVSosmeCrZo7RDrHJrQi30IXyuK4QfJJQARiqK
         9CfqSR9HKLxuEQTTEwuoTUhDdXuoJ7FJmlAJ+gJmET4wOCtau2cCAuvrEXdFlED163qW
         h6qJa9FLM/5ehSIdbUdAxQRbm27ysIcKvCqzbGm8K1IhY0bJyfzSXZy0/9Fsp4X4TfCU
         COQw==
X-Forwarded-Encrypted: i=1; AJvYcCVtrH7kqFOxwnqypxt9xlCbhGl2ZHjAOD46hb62DVFIQz/JJ/G1zL90MddmgDjAdctYzY7TrAEVTCEkrbt6huj1@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0TwJ5KDjpnzuLwsjwqYENSbL3+1E99R1iYhOuW+A8qkGl/MFh
	ajC/7lOJCy1hBF/MkU+ODobApH6F47hoOerwjDzSPtv5x6f+EKwKQP/cKFQvvAY=
X-Gm-Gg: ASbGncsk2RCND6L1Hxc+xc10Fp7aNIwYm/OEWtrZRrNuVIyH04Vn9QNybSJ8L6mzgtp
	ZcJm8MEGGaEI6jFIkg6XP9nBrqTaLBQK1MMDLFJlPH5LrtykjUybYQxLUcjcy1bdfy2WZA+OoRR
	gxr8mGkOhpTtKZ/c8Y0yjKl887oEW32ew+nrpK/E5i9ni/ynBip4EFl2Nx98M72WM1aR01vHJVy
	btkQ3haGMHmTAU+XVseNcMjF8ok5PzODk9MqzDCPI4RLEHCW4SCOjseX/s4y6Bg8Cxjta5Rc8FO
	ctc/9hA/glkcRo6qts9+CgzN62voHb3+RSCT0CHLHcJpxEnZ
X-Google-Smtp-Source: AGHT+IF17jm/aOy3NYW0QP5xv6XJ1PCIMLt8q2Ltl9RkvCkoD6TGYQloEUiZwe2IUvEbX4ZJHZIvIg==
X-Received: by 2002:a17:902:d2ce:b0:224:1005:7280 with SMTP id d9443c01a7336-228048edd4bmr130359545ad.38.1743171284780;
        Fri, 28 Mar 2025 07:14:44 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:5113:c488:efca:b73c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291eec52cbsm18344015ad.37.2025.03.28.07.14.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 07:14:44 -0700 (PDT)
Date: Fri, 28 Mar 2025 08:14:41 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Arnaud Pouliquen <arnaud.pouliquen@st.com>,
	"open list:REMOTE PROCESSOR (REMOTEPROC) SUBSYSTEM" <linux-remoteproc@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH V2] remoteproc: core: Clear table_sz when rproc_shutdown
Message-ID: <Z-au0USkvoDYTF7A@p14s>
References: <20250326020215.3689624-1-peng.fan@oss.nxp.com>
 <Z-WO-fhDJKyG7hn2@p14s>
 <20250328045012.GA16723@nxa18884-linux>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250328045012.GA16723@nxa18884-linux>

On Fri, Mar 28, 2025 at 12:50:12PM +0800, Peng Fan wrote:
> On Thu, Mar 27, 2025 at 11:46:33AM -0600, Mathieu Poirier wrote:
> >Hi,
> >
> >On Wed, Mar 26, 2025 at 10:02:14AM +0800, Peng Fan (OSS) wrote:
> >> From: Peng Fan <peng.fan@nxp.com>
> >> 
> >> There is case as below could trigger kernel dump:
> >> Use U-Boot to start remote processor(rproc) with resource table
> >> published to a fixed address by rproc. After Kernel boots up,
> >> stop the rproc, load a new firmware which doesn't have resource table
> >> ,and start rproc.
> >>
> >
> >If a firwmare image doesn't have a resouce table, rproc_elf_load_rsc_table()
> >will return an error [1], rproc_fw_boot() will exit prematurely [2] and the
> >remote processor won't be started.  What am I missing?
> 
> STM32 and i.MX use their own parse_fw implementation which allows no resource
> table:
> https://elixir.bootlin.com/linux/v6.13.7/source/drivers/remoteproc/stm32_rproc.c#L272
> https://elixir.bootlin.com/linux/v6.13.7/source/drivers/remoteproc/imx_rproc.c#L598

Ok, that settles rproc_fw_boot() but there is also rproc_find_loaded_rsc_table()
that will return NULL if a resource table is not found and preventing the
memcpy() in rproc_start() from happening:

https://elixir.bootlin.com/linux/v6.14-rc6/source/drivers/remoteproc/remoteproc_core.c#L1288

> 
> Thanks,
> Peng
> 
> >
> >[1]. https://elixir.bootlin.com/linux/v6.14-rc6/source/drivers/remoteproc/remoteproc_elf_loader.c#L338
> >[2]. https://elixir.bootlin.com/linux/v6.14-rc6/source/drivers/remoteproc/remoteproc_core.c#L1411 
> >
> >> When starting rproc with a firmware not have resource table,
> >> `memcpy(loaded_table, rproc->cached_table, rproc->table_sz)` will
> >> trigger dump, because rproc->cache_table is set to NULL during the last
> >> stop operation, but rproc->table_sz is still valid.
> >> 
> >> This issue is found on i.MX8MP and i.MX9.
> >> 
> >> Dump as below:
> >> Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
> >> Mem abort info:
> >>   ESR = 0x0000000096000004
> >>   EC = 0x25: DABT (current EL), IL = 32 bits
> >>   SET = 0, FnV = 0
> >>   EA = 0, S1PTW = 0
> >>   FSC = 0x04: level 0 translation fault
> >> Data abort info:
> >>   ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
> >>   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
> >>   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
> >> user pgtable: 4k pages, 48-bit VAs, pgdp=000000010af63000
> >> [0000000000000000] pgd=0000000000000000, p4d=0000000000000000
> >> Internal error: Oops: 0000000096000004 [#1] PREEMPT SMP
> >> Modules linked in:
> >> CPU: 2 UID: 0 PID: 1060 Comm: sh Not tainted 6.14.0-rc7-next-20250317-dirty #38
> >> Hardware name: NXP i.MX8MPlus EVK board (DT)
> >> pstate: a0000005 (NzCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> >> pc : __pi_memcpy_generic+0x110/0x22c
> >> lr : rproc_start+0x88/0x1e0
> >> Call trace:
> >>  __pi_memcpy_generic+0x110/0x22c (P)
> >>  rproc_boot+0x198/0x57c
> >>  state_store+0x40/0x104
> >>  dev_attr_store+0x18/0x2c
> >>  sysfs_kf_write+0x7c/0x94
> >>  kernfs_fop_write_iter+0x120/0x1cc
> >>  vfs_write+0x240/0x378
> >>  ksys_write+0x70/0x108
> >>  __arm64_sys_write+0x1c/0x28
> >>  invoke_syscall+0x48/0x10c
> >>  el0_svc_common.constprop.0+0xc0/0xe0
> >>  do_el0_svc+0x1c/0x28
> >>  el0_svc+0x30/0xcc
> >>  el0t_64_sync_handler+0x10c/0x138
> >>  el0t_64_sync+0x198/0x19c
> >> 
> >> Clear rproc->table_sz to address the issue.
> >> 
> >> While at here, also clear rproc->table_sz when rproc_fw_boot and
> >> rproc_detach.
> >> 
> >> Fixes: 9dc9507f1880 ("remoteproc: Properly deal with the resource table when detaching")
> >> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> >> ---
> >> 
> >> V2:
> >>  Clear table_sz when rproc_fw_boot and rproc_detach per Arnaud
> >> 
> >>  drivers/remoteproc/remoteproc_core.c | 3 +++
> >>  1 file changed, 3 insertions(+)
> >> 
> >> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> >> index c2cf0d277729..1efa53d4e0c3 100644
> >> --- a/drivers/remoteproc/remoteproc_core.c
> >> +++ b/drivers/remoteproc/remoteproc_core.c
> >> @@ -1442,6 +1442,7 @@ static int rproc_fw_boot(struct rproc *rproc, const struct firmware *fw)
> >>  	kfree(rproc->cached_table);
> >>  	rproc->cached_table = NULL;
> >>  	rproc->table_ptr = NULL;
> >> +	rproc->table_sz = 0;
> >>  unprepare_rproc:
> >>  	/* release HW resources if needed */
> >>  	rproc_unprepare_device(rproc);
> >> @@ -2025,6 +2026,7 @@ int rproc_shutdown(struct rproc *rproc)
> >>  	kfree(rproc->cached_table);
> >>  	rproc->cached_table = NULL;
> >>  	rproc->table_ptr = NULL;
> >> +	rproc->table_sz = 0;
> >>  out:
> >>  	mutex_unlock(&rproc->lock);
> >>  	return ret;
> >> @@ -2091,6 +2093,7 @@ int rproc_detach(struct rproc *rproc)
> >>  	kfree(rproc->cached_table);
> >>  	rproc->cached_table = NULL;
> >>  	rproc->table_ptr = NULL;
> >> +	rproc->table_sz = 0;
> >>  out:
> >>  	mutex_unlock(&rproc->lock);
> >>  	return ret;
> >> -- 
> >> 2.37.1
> >> 
> >
