Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC4FB433B1
	for <linux-remoteproc@vger.kernel.org>; Thu, 27 Mar 2025 17:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743097599; cv=none; b=kU0G3nuwysneV7NDd6oxWsiAB/QYUZIsOHzet20mxxMQhZXQJ7Dzs6kM4h5XAZcMCJ737ssnZXoEBHErpmq1oqxSuy4zwwyWCcmFIRu0Ur6eEq//sO93pL4nc6MTvXNL6t8kZWZ8xznJLfmROE1aRm4Cdf23ODXPMWLT7WiiWD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743097599; c=relaxed/simple;
	bh=K/H3MMq54rB5pQbGnnWn4DE7Lk3mFS006sPSA+42NaA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pwacAa713RoxWRX1WqoX+hE+k1rC9iZBi1TLwev9NmZC8DQhvrNkVahd9VtT4tctG56cBp9gSyMQ1e0R39cLTfREJ0C6n63hcUaGlcsbAtVJUr2E+iRpl5gnEW0VjzVpGsR83d5e7z7DLiDhLeMFuQZT9qoScg9gfQqwrdNG0kQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SvIGVoXg; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SvIGVoXg"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-224019ad9edso35605245ad.1
        for <linux-remoteproc@vger.kernel.org>; Thu, 27 Mar 2025 10:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743097597; x=1743702397; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VP36Jxj7G1BlweoA/d2yJUmiG72ezjHbFm0xpNIeG9M=;
        b=SvIGVoXgcFpHAvik6hlseuzgU6A9aaFYNUZaZufMlk1cfv5PajsJzgYhp3I1rFrgg/
         KRIXkboqPJrjWSBl9GvmkPjDcAdDcgM1F8vkAmFcCvj78TEIfDe/AZ7uF5xK4BH2diPV
         4tjBgLH/4nx0AXlPfvPyS5QCv6SmCcXdSFElPXIR0pRcTl+671PGPasKDjqUXSiu4B1I
         OZXJgVq4YvNzD1EbVXhDJHg1Q1JH687njXR3HXCVdQg6VI/uLBrPi7dpUMTbVhW+yg2b
         JuA4PKrhDABvSIhpKHvVsG1lRM8/8QPgWAJ3ONMGB/4i2Y3eBCprfK+Bsqr2Nw6D5hoX
         BblQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743097597; x=1743702397;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VP36Jxj7G1BlweoA/d2yJUmiG72ezjHbFm0xpNIeG9M=;
        b=IYt2TPDUUUluIq7Cu7XGBvRcaIUpqbpBENUuRO7SEzq1VS4r5ozfNL4oMlcRYZEI/V
         0oOSYVbIH34kOv3gjTqH750vzGAuZLBqMApWCZSkyWdD9Y7zF2qdJf83SAbaAxV+E8FQ
         RyZN2dKdka5+AOXVkoRhGfsAOovwz82mYUJXLNIInymnjIwldcRz2XqhQhaUJsbTMZjz
         oFkflQYS+Svgs9fFgheZoPmLQxodyPXniFzcFDh58tJO2icBxNb105uh/xX+xbU5mAYM
         9qrNhoD8LSHSrKO92VsL7UrQXD8syHVGuKUsEwGtqTYzytAx1it69a+Cdi3dvxJGThmM
         GCfg==
X-Forwarded-Encrypted: i=1; AJvYcCVbsYx3v1RtG9d/tHdRfKx1Pgun5u8NQtDUJybrhkluQ81WQo1Y4UKO7giwYuhRTYBnH2eAAlRSS0NCp+6Mt5r+@vger.kernel.org
X-Gm-Message-State: AOJu0YxB4xWeotrziG5nEIjcFj8hQxTOQ+VkWf//nJVtYcWWVGtLERKY
	ZW2e+Ar6oUIVUC2BeAFD4nwjK+BskLwaDvfZ9Shtc74C50k4BqyYZDQDA1jFGMU=
X-Gm-Gg: ASbGnctc4GPC4KuH1KGPbNcxcB9yi4orizZbDl86bcs4WCPkTxeiobem74OdvDkFJTS
	2LsZ2yCxaHoOZyNIOdb+pAb8uV91JVQXdHcZktkKFNWaivDn5YfE6zNSh05AKM8YqtBQVgfsDP3
	qmj0Zuew5BRtf9nZB0IeMkoZ4e41fWOdeIVn+SDJIgF1O3jYwG8XlOQvsT/OICpy4hdoplqRSR1
	/E37tps+z9yGxcmSZW+aMETaDALBmo+CK/Ufn2uYx0uC22v6yIIe7abksPvcY8km36Pwvsrfvsu
	z1ZkAodOBqUD4WMiUUci+0pzw4d85cIRqvMVjsXeJMbXesC5
X-Google-Smtp-Source: AGHT+IFSXmevSgu0c4k+tbh9HtWwPHxZfRmTVMfNtRWlKK16L55hJPlan5Ye/YLGFvsKxYn6qWag3g==
X-Received: by 2002:a05:6a00:a27:b0:736:eb7e:df39 with SMTP id d2e1a72fcca58-739610cea8amr6694677b3a.24.1743097596726;
        Thu, 27 Mar 2025 10:46:36 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:5135:a466:ae77:3d38])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739710cd08dsm84941b3a.160.2025.03.27.10.46.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 10:46:36 -0700 (PDT)
Date: Thu, 27 Mar 2025 11:46:33 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Arnaud Pouliquen <arnaud.pouliquen@st.com>,
	"open list:REMOTE PROCESSOR (REMOTEPROC) SUBSYSTEM" <linux-remoteproc@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH V2] remoteproc: core: Clear table_sz when rproc_shutdown
Message-ID: <Z-WO-fhDJKyG7hn2@p14s>
References: <20250326020215.3689624-1-peng.fan@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250326020215.3689624-1-peng.fan@oss.nxp.com>

Hi,

On Wed, Mar 26, 2025 at 10:02:14AM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> There is case as below could trigger kernel dump:
> Use U-Boot to start remote processor(rproc) with resource table
> published to a fixed address by rproc. After Kernel boots up,
> stop the rproc, load a new firmware which doesn't have resource table
> ,and start rproc.
>

If a firwmare image doesn't have a resouce table, rproc_elf_load_rsc_table()
will return an error [1], rproc_fw_boot() will exit prematurely [2] and the
remote processor won't be started.  What am I missing?

[1]. https://elixir.bootlin.com/linux/v6.14-rc6/source/drivers/remoteproc/remoteproc_elf_loader.c#L338
[2]. https://elixir.bootlin.com/linux/v6.14-rc6/source/drivers/remoteproc/remoteproc_core.c#L1411 

> When starting rproc with a firmware not have resource table,
> `memcpy(loaded_table, rproc->cached_table, rproc->table_sz)` will
> trigger dump, because rproc->cache_table is set to NULL during the last
> stop operation, but rproc->table_sz is still valid.
> 
> This issue is found on i.MX8MP and i.MX9.
> 
> Dump as below:
> Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
> Mem abort info:
>   ESR = 0x0000000096000004
>   EC = 0x25: DABT (current EL), IL = 32 bits
>   SET = 0, FnV = 0
>   EA = 0, S1PTW = 0
>   FSC = 0x04: level 0 translation fault
> Data abort info:
>   ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
>   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
>   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
> user pgtable: 4k pages, 48-bit VAs, pgdp=000000010af63000
> [0000000000000000] pgd=0000000000000000, p4d=0000000000000000
> Internal error: Oops: 0000000096000004 [#1] PREEMPT SMP
> Modules linked in:
> CPU: 2 UID: 0 PID: 1060 Comm: sh Not tainted 6.14.0-rc7-next-20250317-dirty #38
> Hardware name: NXP i.MX8MPlus EVK board (DT)
> pstate: a0000005 (NzCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> pc : __pi_memcpy_generic+0x110/0x22c
> lr : rproc_start+0x88/0x1e0
> Call trace:
>  __pi_memcpy_generic+0x110/0x22c (P)
>  rproc_boot+0x198/0x57c
>  state_store+0x40/0x104
>  dev_attr_store+0x18/0x2c
>  sysfs_kf_write+0x7c/0x94
>  kernfs_fop_write_iter+0x120/0x1cc
>  vfs_write+0x240/0x378
>  ksys_write+0x70/0x108
>  __arm64_sys_write+0x1c/0x28
>  invoke_syscall+0x48/0x10c
>  el0_svc_common.constprop.0+0xc0/0xe0
>  do_el0_svc+0x1c/0x28
>  el0_svc+0x30/0xcc
>  el0t_64_sync_handler+0x10c/0x138
>  el0t_64_sync+0x198/0x19c
> 
> Clear rproc->table_sz to address the issue.
> 
> While at here, also clear rproc->table_sz when rproc_fw_boot and
> rproc_detach.
> 
> Fixes: 9dc9507f1880 ("remoteproc: Properly deal with the resource table when detaching")
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
> 
> V2:
>  Clear table_sz when rproc_fw_boot and rproc_detach per Arnaud
> 
>  drivers/remoteproc/remoteproc_core.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index c2cf0d277729..1efa53d4e0c3 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1442,6 +1442,7 @@ static int rproc_fw_boot(struct rproc *rproc, const struct firmware *fw)
>  	kfree(rproc->cached_table);
>  	rproc->cached_table = NULL;
>  	rproc->table_ptr = NULL;
> +	rproc->table_sz = 0;
>  unprepare_rproc:
>  	/* release HW resources if needed */
>  	rproc_unprepare_device(rproc);
> @@ -2025,6 +2026,7 @@ int rproc_shutdown(struct rproc *rproc)
>  	kfree(rproc->cached_table);
>  	rproc->cached_table = NULL;
>  	rproc->table_ptr = NULL;
> +	rproc->table_sz = 0;
>  out:
>  	mutex_unlock(&rproc->lock);
>  	return ret;
> @@ -2091,6 +2093,7 @@ int rproc_detach(struct rproc *rproc)
>  	kfree(rproc->cached_table);
>  	rproc->cached_table = NULL;
>  	rproc->table_ptr = NULL;
> +	rproc->table_sz = 0;
>  out:
>  	mutex_unlock(&rproc->lock);
>  	return ret;
> -- 
> 2.37.1
> 
