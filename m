Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1014733DEE5
	for <linux-remoteproc@vger.kernel.org>; Tue, 31 Mar 2026 17:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774979623; cv=none; b=OSRruCTDHKDN5XfVYNh9r3/9slOAVUO910CVQiXL+6wbK0kFWRWoyZCyUzpK/Rg2JMsKHiY+VH3umoCBHJCCQfHvCNbjLgDqVyCGBa+4gRyfU5jojS9aqK7JtRoCpAoP6otGGWhViQEAqSvdG+6yUghYubtJj3k9uRYX0Phcwyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774979623; c=relaxed/simple;
	bh=AonQcWVCahwpK63+vA6GslXN3Tu8ZmhheyG/S/oET3U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q/sbrssJ9bLvDmfQU5EDHoyOq+JeZUMn3VTkfyo0CQUBbdqYuUUhW9lUzJuoDcxL3iixoJy1Dbj2Rta+rugHN3iF++mQW4JK94C5Uz7POlMaQxf2uVrE9mT4NkWTR8hD9BhkzglZ+IH9qfbglAMb0ogf86ZaUoHQT6p3lDDVmuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CaXO+gXa; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CaXO+gXa"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-35d9923eec5so2195421a91.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 31 Mar 2026 10:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774979619; x=1775584419; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sTb11ZYG8OIlhG9U+zSnPnoYW+og/px8CaI7SL4RhY4=;
        b=CaXO+gXa+lAlYpSJVzENQf6fHuW8v1f8KN8yRftVLPkZ8pscywwKwNCktFvkut6FTu
         4X2n+m+F8kTFecvzbUvDTlxzgF3yL/TCO/7ax65r4TG+8fLUq7fa/iQPwFwyx1WJayDu
         AlxPFAeek9fMuicrUYC5USinohHOKR7AizWnhNqCXnFqCrBACLA5t+7YU1DQTJlGX/5X
         gVCSdpkDobiIZ3md5Og0JX1dhZaIYobLbm1dJBVUI9YnakwphinXkDHzARXYn2+Zg6o9
         d23kwd50TMiLRGsujqpc7B97rhTzQq62aJmF+7ps413zff16Rl8+/xTTsRvFAcwO3aSg
         hCvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774979619; x=1775584419;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sTb11ZYG8OIlhG9U+zSnPnoYW+og/px8CaI7SL4RhY4=;
        b=nVxGjQa2wu0k341SsUF5+J7q8p/cJ0Quh/85T8Cmg0hUsgJ5zKjPET/gza4tIsbB/m
         ZAayacdZOp0YN/7/FTHO2BcWfFv/c2XibPwWUvc65hy4X9BFKdg9HYH371LIOti2438D
         F4N4cpVaDpdvu7mrjV5WlM155FYiTQqmI3rQ5wb4olFId4+5oJTK4M9mggTp6hNCo0rk
         l5nkr24cy4NGeYq5xhGY2v99hXx4ornBZGO3hbXm39JLguooeTw65Hwo/lx9GnAual5s
         1mS7+Rd2uSFjHvXaCnajASCp81jZ0tzSl6Opq9XUdw3JZur5g4FEw86JqNlwZfHl6pd0
         0AbQ==
X-Forwarded-Encrypted: i=1; AJvYcCUF8KbD9tM0jj+02gh/K0rV4vu3MFuIGoNNtqIwL8eocK+5WihYS4sY9GJMN5MkqMiUVTYsBkz88RNs4xkZOxnW@vger.kernel.org
X-Gm-Message-State: AOJu0YztQGB1nc8VKvplbvFfyPmZdYjpOjQFItt5+rHzpmAqKtZbgDfW
	b4+U8uZWMfJZyUcXqJ7A/qckd5rM7e+NZNNTQjikbJVEFzUnB/eMxvDqAATlkeTRWJ8=
X-Gm-Gg: ATEYQzyxviLLC5r9286+ogo9IficELxf+S5v2TYFer66NLTVDBUFGHfxMigfgBhMMrP
	paaGIeGy+WB0nkhs94hu3K2TrZioLamMTYnRa4Bm9sFfg5UO4+NQ00EHKKxrPCOh5XJTuEhK15g
	DD9ycidF3BYvywTIMoOAItrLD6pHF7v4/Wf/wCiwmc5+KadhSO0RTQh/Ke+13K7XPBHRqBUx5+B
	GIaw6ZAjfzVCTzBPgHn7kEwMghrRB0Z3QsjLrnwScfI7nGz2XhkYIP8VrCd0mU11nVgbL8OpVTo
	ueJtXTLTr0OdwVQQu7iGVqdnxFIQlzzAxRdy7oIJGwiPVsN7eCX0PSNrq9qKvJVq0KQsjk/Vw/Q
	TvgdrMlNPlxR9JEeA4Wt3mJIPOeAWkbSJ3MTXf+Vs3piNnicvC3xmypb/DINq76KYwRd/ZyXj8P
	LmHFZ2HrHV2+qzzB84fcsd8a3UZw==
X-Received: by 2002:a17:90a:d410:b0:35b:e4d4:8a81 with SMTP id 98e67ed59e1d1-35dc6f749fbmr235030a91.31.1774979618762;
        Tue, 31 Mar 2026 10:53:38 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:3147:ec27:349:39db])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b24b3a82f8sm87086805ad.63.2026.03.31.10.53.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 10:53:38 -0700 (PDT)
Date: Tue, 31 Mar 2026 11:53:35 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: tanmay.shah@amd.com
Cc: andersson@kernel.org, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] remoteproc: xlnx: reset virtio status during attach
Message-ID: <acwKHzN84v_CipBh@p14s>
References: <20260317201251.3920841-1-tanmay.shah@amd.com>
 <acbhbnBgJCP7WETC@p14s>
 <3f557b06-ea34-4f96-b1ec-75bab7c0d828@amd.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3f557b06-ea34-4f96-b1ec-75bab7c0d828@amd.com>

On Mon, Mar 30, 2026 at 01:43:03PM -0500, Shah, Tanmay wrote:
> Hello,
> 
> Thanks for the reviews. Please find my comments below:
> 
> On 3/27/2026 2:58 PM, Mathieu Poirier wrote:
> > On Tue, Mar 17, 2026 at 01:12:51PM -0700, Tanmay Shah wrote:
> >> On AMD-Xilinx platforms cortex-A and cortex-R can be configured as
> >> separate subsystems. In this case, both cores can boot independent of
> >> each other. If Linux went through uncontrolled reboot during active
> >> rpmsg communication, then during next boot it can find rpmsg virtio
> >> status not in the reset state. In such case it is important to reset the
> >> virtio status during attach callback and wait for sometime for the
> >> remote to handle virtio driver reset.
> > 
> > I understand the user case, but won't that situation happen regardless of
> > whether cores operate sync or split mode?
> > 
> 
> I want to make it clear that this is not same as Cortex-R cluster
> configured as lockstep vs split mode.
> 
> This is different configuration between Cortex-A cores and Cortex-R
> cores. It is a firmware driver configuration of how it treats cortex-A
> and Cortex-R subsystems.
> 
> In the firmware driver, we can configure Cortex-A cluster as owner of
> Cortex-R cluster, and in that case, if Cortex-A reboots, the firmware
> will also reboot cortex-R cores. This policy makes Cortex-A as owner of
> Cortex-R cores. In this configuraton this patch is not needed, because
> if Cortex-A reboots then platform management firmware will also reboot
> Cortex-R cores as well and vdev status flag will be always 0.
> 
> In another configuration in the firmware driver, Cortex-R cores can be
> independent of Cortex-A cores. This means, Cortex-A is not the owner of
> the Cortex-R cores. Both are independent subsystem. Only in this
> configuration, this patch applies because it is possible that Cortex-A
> reboots while Cortex-R doesn't and Cortex-R still runs as it is.
> 
> So only in the second type of configuration, this patch is needed when
> COrtex-A running linux reboots and when driver probes and tries to
> attach it can find that vdev flag is not reset. In the first
> configuartion if linux reboots, then It's guranteed that vdev status
> flag will always be in the reset state.
> 
> If you prefer I can extend the commit message with all above details or
> put as comment in the attach() callback. Let me know which do you prefer.

Ok, that clarifies a lot of things.  Please add the above as a comment in
attach().

> 
> >>
> >> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
> >> ---
> >>  drivers/remoteproc/xlnx_r5_remoteproc.c | 46 +++++++++++++++++++++++++
> >>  1 file changed, 46 insertions(+)
> >>
> >> diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
> >> index 50a9974f3202..f08806f13800 100644
> >> --- a/drivers/remoteproc/xlnx_r5_remoteproc.c
> >> +++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
> >> @@ -5,6 +5,7 @@
> >>   */
> >>  
> >>  #include <dt-bindings/power/xlnx-zynqmp-power.h>
> >> +#include <linux/delay.h>
> >>  #include <linux/dma-mapping.h>
> >>  #include <linux/firmware/xlnx-zynqmp.h>
> >>  #include <linux/kernel.h>
> >> @@ -29,6 +30,8 @@
> >>  #define RSC_TBL_XLNX_MAGIC	((uint32_t)'x' << 24 | (uint32_t)'a' << 16 | \
> >>  				 (uint32_t)'m' << 8 | (uint32_t)'p')
> >>  
> >> +#define RPROC_ATTACH_TIMEOUT_US (100 * 1000)
> >> +
> > 
> > There are some time constant already defined, please use them.
> 
> Ack.
> 
> > 
> >>  /*
> >>   * settings for RPU cluster mode which
> >>   * reflects possible values of xlnx,cluster-mode dt-property
> >> @@ -865,6 +868,49 @@ static int zynqmp_r5_get_rsc_table_va(struct zynqmp_r5_core *r5_core)
> >>  
> >>  static int zynqmp_r5_attach(struct rproc *rproc)
> >>  {
> >> +	struct device *dev = &rproc->dev;
> >> +	bool wait_for_remote = false;
> >> +	struct fw_rsc_vdev *rsc;
> >> +	struct fw_rsc_hdr *hdr;
> >> +	int i, offset, avail;
> >> +
> >> +	if (!rproc->table_ptr)
> >> +		goto attach_success;
> >> +
> >> +	for (i = 0; i < rproc->table_ptr->num; i++) {
> >> +		offset = rproc->table_ptr->offset[i];
> >> +		hdr = (void *)rproc->table_ptr + offset;
> >> +		avail = rproc->table_sz - offset - sizeof(*hdr);
> >> +		rsc = (void *)hdr + sizeof(*hdr);
> >> +
> >> +		/* make sure table isn't truncated */
> >> +		if (avail < 0) {
> >> +			dev_err(dev, "rsc table is truncated\n");
> >> +			return -EINVAL;
> >> +		}
> >> +
> >> +		if (hdr->type != RSC_VDEV)
> >> +			continue;
> >> +
> >> +		/*
> >> +		 * reset vdev status, in case previous run didn't leave it in
> >> +		 * a clean state.
> >> +		 */
> >> +		if (rsc->status) {
> >> +			rsc->status = 0;
> >> +			wait_for_remote = true;
> >> +			break;
> >> +		}
> >> +	}
> >> +
> >> +	/* kick remote to notify about attach */
> >> +	rproc->ops->kick(rproc, 0);
> >> +
> >> +	/* wait for sometime until remote is ready */
> >> +	if (wait_for_remote)
> >> +		usleep_range(100, RPROC_ATTACH_TIMEOUT_US);
> > 
> > Instead of waiting, would it be possible to return -EPROBE_DEFER and let the
> > driver core retry mechanic do it's work?
> > 
> 
> It is not possible to do -EPROBE_DEFER, because attach() callback is not
> called only during driver probe.
> 
> It is also called during following command sequence:
> 
> attach() -> detach() -> attach()
> 
> During second attach() callback, we can't do -EPROBE_DEFER, as it's not
> driver probe anymore. So I think will have to keep the usleep_range().

Right, but in this case the Cortex-A did not go through an uncontrolled reboot,
we know the state of the machine is sound.  Do you see a scenario where it would
not be the case?  

> 
> > Thanks,
> > Mathieu
> > 
> >> +
> >> +attach_success:
> >>  	dev_dbg(&rproc->dev, "rproc %d attached\n", rproc->index);
> >>  
> >>  	return 0;
> >>
> >> base-commit: d4ef36fbd57e610d4c334123ce706a2a71187cae
> >> -- 
> >> 2.34.1
> >>
> 
