Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE9CA1DF270
	for <linux-remoteproc@vger.kernel.org>; Mon, 31 Mar 2025 15:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743435646; cv=none; b=anjU2gia/Fq2ZwmF4WroJw1lBw3e6qInR9dkDhNNUPETwxEc6FVb71W67AtLpSghtUOfAKud9j9VrBYnModYwBMS+Y/AHTS+BxKrd/Ii4Rl73qFeB/G/nYWEFf37V7dPPk+0PjWNcl7sF5Fe3lEXd1QgZK3JSYovqymYpKq/lgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743435646; c=relaxed/simple;
	bh=gcaLmCoph5fNDd4ERCk8NwDc0KIXUHqPWGTIAB7O1l4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UjefhsksHHaKCP3lRQBnCdflq/w0HA/IRLeN1t9rXA+74v90oGnjyd4eq+UcbT7gem/NWftOC6BQ4hv1Uu52pMYVfF9Nj0xBoYiVg22BFCXFXDdP5p/iThiVNcsr7JwUbyP1UOQxRiWCab6wtcb642iGwVNbWHsyJDfaCs1bVoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cq/+Pm59; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cq/+Pm59"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2240b4de12bso61996025ad.2
        for <linux-remoteproc@vger.kernel.org>; Mon, 31 Mar 2025 08:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743435644; x=1744040444; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KCQcUgrmhQypNr25rX5rIUjxZFT4/Yd73jBxxMkByss=;
        b=cq/+Pm59JI+3m1JmjPaEayzLg6V1kAKkWNstf3jLBK8hGZXJeOnkh83a0TaY5d0xpo
         He+aE8jBLzaph46hRwJq344KC40Gm3Y7SZGaHT8EOArrz2w+200nOpTkxnFhrr3PY2iN
         KclAro9HsMSslcsDs0xyMxMwAi6t5+1uWCkaHX38cKE+HvvrK1JWX36R9oZM4f9tRKQM
         8P+upT6ZckjTLnXPvk1yAnUapS2zvAjX0Sy+L9Br0iCHxr0xuChKA/RYpw96AjXG/m4V
         h+CBhYmglqo4+iZBzvVfyvr3KSHZw85BZVYT0hPI3hF3TKo9dfGkwBcfAe86ZPpvQOR9
         gJBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743435644; x=1744040444;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KCQcUgrmhQypNr25rX5rIUjxZFT4/Yd73jBxxMkByss=;
        b=mSR1rBIuyqXF+deyE8V1gk7KQmzJzpop0jGaMspRG/rnPFyMCh1uPuaUFTrKut8E1R
         GfCWuizTVPOV8KZ6TJ+mzFEEggqeMBD6846fpsNYrcYkbXVG84/OZnpFPX4xEGCIW6Kh
         +Bz/3JnyN4/MKGSYwVSq0JVaIAo2ksn/omo7fU2jxll0z50ErNk3aTpfcyKHkvkStP6V
         +OU3JqJ2epUvC+fWCOIkpraY/E/0U1/1ohQsCPwM15YjwXZujWtnpUlVwFV0z3z1u5zc
         8IZoXB+pSjtYLWfi87kYGi6Czdd5NwZmjWNWHyAOEWL8kduzNZi0uSSo+Au4SRzl0wQf
         oEmw==
X-Forwarded-Encrypted: i=1; AJvYcCU5rvIHH1O4kJ1EJ7tRLQsQGuKHuL6lhq1NrfUAPVaT3kCjcFf92bXcOapNGzHXjcy0pvbDobcnPRKRFKOVwvrd@vger.kernel.org
X-Gm-Message-State: AOJu0YwmqHoVl//jx6lho5QcwzD2Y4CJEQA2QsOUUph3DPi9fS6AidYK
	M+yr7eZq4fl6Zg9Pn7bwaQiQfRCSRB4T9KUTITIhyMj6FXjeUCE0kGsZof7aLjQ=
X-Gm-Gg: ASbGncvbGSvvFKbibThsTu8APWQ9qjED7B/0cIpKxBQWDgJd+4MAecktVKqd74LAyPL
	Q1bHtVc86uwKT8HQTaGhSMs+Xq2o9pGuLV0dTr38rjSUjE54J2985AjBJLAfbxtXmrrwI0+l5lQ
	su7BJ+6S6sdwGwOB0OBQDXOmPeWpCzrvc7+cTWh7fU/T34AsWqjm5jvIlSSnNxqXkQ7F70kX9ZU
	ybSas0tN+TWyZToEv9YyLxj1o5WK0AsBzEeoYnDcJlF7ejA6yxzHjmCzaTpnV/jFEcVZTG+dv7b
	i2IqeEz6ETxK66J8Y7HW5OhB70YqbB7NsrFDfBla+AkA3yfpqXxCXBSFIUU=
X-Google-Smtp-Source: AGHT+IET53UZiltoN6lpIWaB1vCRJrWkRrOxp13cKxf/qgWVvPXsI8gaXNEqsIfv5mapAcQJ0v4+Vg==
X-Received: by 2002:a05:6a00:b49:b0:737:e73:f64b with SMTP id d2e1a72fcca58-73980339eb8mr11753635b3a.1.1743435644116;
        Mon, 31 Mar 2025 08:40:44 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:d1e3:754e:6d64:9c09])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739710dd0f8sm7321700b3a.178.2025.03.31.08.40.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 08:40:43 -0700 (PDT)
Date: Mon, 31 Mar 2025 09:40:41 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Arnaud Pouliquen <arnaud.pouliquen@st.com>,
	"open list:REMOTE PROCESSOR (REMOTEPROC) SUBSYSTEM" <linux-remoteproc@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH V2] remoteproc: core: Clear table_sz when rproc_shutdown
Message-ID: <Z-q3ebPSjkSPVlgP@p14s>
References: <20250326020215.3689624-1-peng.fan@oss.nxp.com>
 <Z-WO-fhDJKyG7hn2@p14s>
 <20250328045012.GA16723@nxa18884-linux>
 <Z-au0USkvoDYTF7A@p14s>
 <20250329125629.GA11929@nxa18884-linux>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250329125629.GA11929@nxa18884-linux>

On Sat, Mar 29, 2025 at 08:56:29PM +0800, Peng Fan wrote:
> On Fri, Mar 28, 2025 at 08:14:41AM -0600, Mathieu Poirier wrote:
> >On Fri, Mar 28, 2025 at 12:50:12PM +0800, Peng Fan wrote:
> >> On Thu, Mar 27, 2025 at 11:46:33AM -0600, Mathieu Poirier wrote:
> >> >Hi,
> >> >
> >> >On Wed, Mar 26, 2025 at 10:02:14AM +0800, Peng Fan (OSS) wrote:
> >> >> From: Peng Fan <peng.fan@nxp.com>
> >> >> 
> >> >> There is case as below could trigger kernel dump:
> >> >> Use U-Boot to start remote processor(rproc) with resource table
> >> >> published to a fixed address by rproc. After Kernel boots up,
> >> >> stop the rproc, load a new firmware which doesn't have resource table
> >> >> ,and start rproc.
> >> >>
> >> >
> >> >If a firwmare image doesn't have a resouce table, rproc_elf_load_rsc_table()
> >> >will return an error [1], rproc_fw_boot() will exit prematurely [2] and the
> >> >remote processor won't be started.  What am I missing?
> >> 
> >> STM32 and i.MX use their own parse_fw implementation which allows no resource
> >> table:
> >> https://elixir.bootlin.com/linux/v6.13.7/source/drivers/remoteproc/stm32_rproc.c#L272
> >> https://elixir.bootlin.com/linux/v6.13.7/source/drivers/remoteproc/imx_rproc.c#L598
> >
> >Ok, that settles rproc_fw_boot() but there is also rproc_find_loaded_rsc_table()
> >that will return NULL if a resource table is not found and preventing the
> >memcpy() in rproc_start() from happening:
> >
> >https://elixir.bootlin.com/linux/v6.14-rc6/source/drivers/remoteproc/remoteproc_core.c#L1288
> 
> 
> Sorry, I forgot to mention below code:
> loaded_table is a valid pointer for i.MX, see
> https://elixir.bootlin.com/linux/v6.14-rc6/source/drivers/remoteproc/imx_rproc.c#L666,

(SIGH)

The changelong for this patch says "... load a new firmware which doesn't have a
resource table..." and now you are telling me that @load_table is valid.  As
such I have to _guess_ that @priv->rsc_table is not null.  So which is it -
valid or not valid?  

If my assumption above is valid than fix that instead of hacking the remoteproc
core.  If my assumption is not valid the changelog and your justification for
this patch are wrong.  Either way I have spent way too much time on this patch
already and dropping it.  The same goes for your other patch [1] - resent it
when you will have properly address the work herein.   

[1]. [PATCH] remoteproc: imx_rproc: Add mutex protection for workqueue

> 
> So loaded_table is valid, it is memcpy trigger kernel panic because table_sz is
> not zero while cached_table is NULL.
> 	loaded_table = rproc_find_loaded_rsc_table(rproc, fw);
> 	if (loaded_table) {
> 		memcpy(loaded_table, rproc->cached_table, rproc->table_sz);
> 		rproc->table_ptr = loaded_table;
> 	}
> 
> Thanks,
> Peng
> 
> >
> >> 
> >> Thanks,
> >> Peng
> >> 
> >> >
> >> >[1]. https://elixir.bootlin.com/linux/v6.14-rc6/source/drivers/remoteproc/remoteproc_elf_loader.c#L338
> >> >[2]. https://elixir.bootlin.com/linux/v6.14-rc6/source/drivers/remoteproc/remoteproc_core.c#L1411 
> >> >
> >> >> When starting rproc with a firmware not have resource table,
> >> >> `memcpy(loaded_table, rproc->cached_table, rproc->table_sz)` will
> >> >> trigger dump, because rproc->cache_table is set to NULL during the last
> >> >> stop operation, but rproc->table_sz is still valid.
> >> >> 
> >> >> This issue is found on i.MX8MP and i.MX9.
> >> >> 
> >> >> Dump as below:
> >> >> Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
> >> >> Mem abort info:
> >> >>   ESR = 0x0000000096000004
> >> >>   EC = 0x25: DABT (current EL), IL = 32 bits
> >> >>   SET = 0, FnV = 0
> >> >>   EA = 0, S1PTW = 0
> >> >>   FSC = 0x04: level 0 translation fault
> >> >> Data abort info:
> >> >>   ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
> >> >>   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
> >> >>   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
> >> >> user pgtable: 4k pages, 48-bit VAs, pgdp=000000010af63000
> >> >> [0000000000000000] pgd=0000000000000000, p4d=0000000000000000
> >> >> Internal error: Oops: 0000000096000004 [#1] PREEMPT SMP
> >> >> Modules linked in:
> >> >> CPU: 2 UID: 0 PID: 1060 Comm: sh Not tainted 6.14.0-rc7-next-20250317-dirty #38
> >> >> Hardware name: NXP i.MX8MPlus EVK board (DT)
> >> >> pstate: a0000005 (NzCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> >> >> pc : __pi_memcpy_generic+0x110/0x22c
> >> >> lr : rproc_start+0x88/0x1e0
> >> >> Call trace:
> >> >>  __pi_memcpy_generic+0x110/0x22c (P)
> >> >>  rproc_boot+0x198/0x57c
> >> >>  state_store+0x40/0x104
> >> >>  dev_attr_store+0x18/0x2c
> >> >>  sysfs_kf_write+0x7c/0x94
> >> >>  kernfs_fop_write_iter+0x120/0x1cc
> >> >>  vfs_write+0x240/0x378
> >> >>  ksys_write+0x70/0x108
> >> >>  __arm64_sys_write+0x1c/0x28
> >> >>  invoke_syscall+0x48/0x10c
> >> >>  el0_svc_common.constprop.0+0xc0/0xe0
> >> >>  do_el0_svc+0x1c/0x28
> >> >>  el0_svc+0x30/0xcc
> >> >>  el0t_64_sync_handler+0x10c/0x138
> >> >>  el0t_64_sync+0x198/0x19c
> >> >> 
> >> >> Clear rproc->table_sz to address the issue.
> >> >> 
> >> >> While at here, also clear rproc->table_sz when rproc_fw_boot and
> >> >> rproc_detach.
> >> >> 
> >> >> Fixes: 9dc9507f1880 ("remoteproc: Properly deal with the resource table when detaching")
> >> >> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> >> >> ---
> >> >> 
> >> >> V2:
> >> >>  Clear table_sz when rproc_fw_boot and rproc_detach per Arnaud
> >> >> 
> >> >>  drivers/remoteproc/remoteproc_core.c | 3 +++
> >> >>  1 file changed, 3 insertions(+)
> >> >> 
> >> >> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> >> >> index c2cf0d277729..1efa53d4e0c3 100644
> >> >> --- a/drivers/remoteproc/remoteproc_core.c
> >> >> +++ b/drivers/remoteproc/remoteproc_core.c
> >> >> @@ -1442,6 +1442,7 @@ static int rproc_fw_boot(struct rproc *rproc, const struct firmware *fw)
> >> >>  	kfree(rproc->cached_table);
> >> >>  	rproc->cached_table = NULL;
> >> >>  	rproc->table_ptr = NULL;
> >> >> +	rproc->table_sz = 0;
> >> >>  unprepare_rproc:
> >> >>  	/* release HW resources if needed */
> >> >>  	rproc_unprepare_device(rproc);
> >> >> @@ -2025,6 +2026,7 @@ int rproc_shutdown(struct rproc *rproc)
> >> >>  	kfree(rproc->cached_table);
> >> >>  	rproc->cached_table = NULL;
> >> >>  	rproc->table_ptr = NULL;
> >> >> +	rproc->table_sz = 0;
> >> >>  out:
> >> >>  	mutex_unlock(&rproc->lock);
> >> >>  	return ret;
> >> >> @@ -2091,6 +2093,7 @@ int rproc_detach(struct rproc *rproc)
> >> >>  	kfree(rproc->cached_table);
> >> >>  	rproc->cached_table = NULL;
> >> >>  	rproc->table_ptr = NULL;
> >> >> +	rproc->table_sz = 0;
> >> >>  out:
> >> >>  	mutex_unlock(&rproc->lock);
> >> >>  	return ret;
> >> >> -- 
> >> >> 2.37.1
> >> >> 
> >> >
> >
