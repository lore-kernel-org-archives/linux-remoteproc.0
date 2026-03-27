Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71E3B37EFFC
	for <linux-remoteproc@vger.kernel.org>; Fri, 27 Mar 2026 19:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774641524; cv=none; b=VL+XUXBtf0O0MqmhCy/lxqROhytap5CPFUMDW76aUN6qDDT8yxyBgv2ovxYDBFa7qF8qnyOx/SsnGW7TPGGchT7+1/Ttm3wWwByFqRT6QyqsuOpGlaIM0SshZm4bEV+slUw5YrBp8uj7b0S3lxcyD9yHkCU+fFeq8n4fX5ftEpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774641524; c=relaxed/simple;
	bh=0evNptiIp2i5VFaMPmgvkXbxXGx4HuiZJh41Ylbun7k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r+jLyUObQGz4XInLSBSIyD59U8IWebjtLZ3m5u8NvcBExZjIwUVNwjnAHhTrFF/+bWxdqvAwn7sohfcI8PzxwNDH+4WhOqaycEGY7mFT7w9tAnMztOXpTea8pB9ej4EniVwRqpgBi9bMVigeV/90tu+6pf9qBuub79kdoDoMgjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SHnxVr6D; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SHnxVr6D"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2b0abdde280so24782635ad.1
        for <linux-remoteproc@vger.kernel.org>; Fri, 27 Mar 2026 12:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774641522; x=1775246322; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=riqFgloemKeGp2Z33+taeOI5x5WX9rolIEiX3Srhmn8=;
        b=SHnxVr6Dw+kXmVpQOpEcyv5M7q4Gy78VtRHCtIJa+kJDths0ToU0FXWkjK23MA3FPH
         /iWUW8M7xoU34ZPyzCsyT0O4AYJBLr/ZeYdvEBcJvNH8TizwnvlSWBcMfcebNjVJHCEb
         7KJODkSsW+kPRY6qb9Hlx8WqY65I98R6x3aiT2aH15j39u292f8+TuPgFst2ejecMnEV
         FEsUYENA6szSAEigKBPzBK+Nc2pZ3a/sZ2Je89BfEP61VMHN2IWAWSyUEJZxrb2jpKj+
         e2qXXzoGb5Wycc5rAgnUO1/Yha4KAkaYt+2SMkWU5t//E9hmlBQLFwZwN/Pgjr6vXQHJ
         YOEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774641522; x=1775246322;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=riqFgloemKeGp2Z33+taeOI5x5WX9rolIEiX3Srhmn8=;
        b=S0Ewlzo5USRHxFaj6qBhaQBr4p9ApJxydzdiym+qVAb0q75XmQDaTPQ83M8RnxUAfk
         Vo3gpjUiU7C2lHspjIQUy7Dl2mZ4fKQLg2EJ80L9p77gfebCHVlsza1XgkvwPJ1rnA7m
         9CSn1aB2QU837dNpTbCXNdg1hBFCrRvB36yWo9U1yhhX/JbFXUgpuJas6dUD8aWaq1eP
         5kmrdncm0oYtj4tJSOBEM+ZC6baHcySh0Es+UWXknYNlX54xrfU5Kh78ZVuYsPpQmW2n
         M4N1rFCaHNHqPDPK8oKCDXe6lRE6n7NJ5emWImR8YFJxFugS7wY/obAp+Ok6stUb3CFI
         Yxjg==
X-Forwarded-Encrypted: i=1; AJvYcCUNjF4tj4C+XNjhIIJYvyscUlsANnbADXVaMgYwF+Fq5OamLdZAS8O/GBgHd7WA0EYhPzU2D+Q0mDx8XtkzjN4s@vger.kernel.org
X-Gm-Message-State: AOJu0YwhqY5jsgcTropj8mNy0FV6n3yDZPn49Zs0MNN9ZuJh3ZDTKhl1
	0KrVnjRE6zJgeGKtfKIT27Id53xM/VD7LbKhXKZACfBt61r12LLwjGICcdVfCTmxivI=
X-Gm-Gg: ATEYQzzOxRHQgsfAyQVIeH4q50+hBkymq66PM/G8ygF1sDQC4Yv92BHpD+rRkov747D
	qIzNvn5jw6sQNoVvXc7TxIqadTLL6Uj1hD5D3eClpVrZbSUIdKMRuMTkrlgFFbOmitG96/QpVwU
	t+o+9sADXztC+HG5aJgRlYDpxYzPZCgeutpBVYwg75gwT8QGHC3QkC44jDe2hX9PfJ3IBdSyMHo
	A69T9CtgiQzSFvYg3/qBNh4pGJGC30j4T7272DGgRu26lyxMNin12Mk6JNeG4TE4FmwC6KAauw1
	tjp2/JaDgL/U79xUtoUZFQNf7tQ0hV2gVj3zJw7sMB+zBZl2aN7xR7zJBde1tIFd6iaUwqioUZ1
	erbSxQNrglncFikmt+MYhCYRPSXVXLOxTrqEJH8tA5afGtuC8W85TJAOHz22MPN4JJVjCTad0Px
	Ig/fsd5Ux3OTFEFWGQhIzLktnWEm4=
X-Received: by 2002:a17:902:f681:b0:2b0:b2b4:1444 with SMTP id d9443c01a7336-2b0cdd13eaamr39512765ad.49.1774641521670;
        Fri, 27 Mar 2026 12:58:41 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:2f18:b190:e634:5792])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b24264256asm1248025ad.13.2026.03.27.12.58.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 12:58:41 -0700 (PDT)
Date: Fri, 27 Mar 2026 13:58:38 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Tanmay Shah <tanmay.shah@amd.com>
Cc: andersson@kernel.org, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] remoteproc: xlnx: reset virtio status during attach
Message-ID: <acbhbnBgJCP7WETC@p14s>
References: <20260317201251.3920841-1-tanmay.shah@amd.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260317201251.3920841-1-tanmay.shah@amd.com>

On Tue, Mar 17, 2026 at 01:12:51PM -0700, Tanmay Shah wrote:
> On AMD-Xilinx platforms cortex-A and cortex-R can be configured as
> separate subsystems. In this case, both cores can boot independent of
> each other. If Linux went through uncontrolled reboot during active
> rpmsg communication, then during next boot it can find rpmsg virtio
> status not in the reset state. In such case it is important to reset the
> virtio status during attach callback and wait for sometime for the
> remote to handle virtio driver reset.

I understand the user case, but won't that situation happen regardless of
whether cores operate sync or split mode?

> 
> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
> ---
>  drivers/remoteproc/xlnx_r5_remoteproc.c | 46 +++++++++++++++++++++++++
>  1 file changed, 46 insertions(+)
> 
> diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
> index 50a9974f3202..f08806f13800 100644
> --- a/drivers/remoteproc/xlnx_r5_remoteproc.c
> +++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
> @@ -5,6 +5,7 @@
>   */
>  
>  #include <dt-bindings/power/xlnx-zynqmp-power.h>
> +#include <linux/delay.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/firmware/xlnx-zynqmp.h>
>  #include <linux/kernel.h>
> @@ -29,6 +30,8 @@
>  #define RSC_TBL_XLNX_MAGIC	((uint32_t)'x' << 24 | (uint32_t)'a' << 16 | \
>  				 (uint32_t)'m' << 8 | (uint32_t)'p')
>  
> +#define RPROC_ATTACH_TIMEOUT_US (100 * 1000)
> +

There are some time constant already defined, please use them.

>  /*
>   * settings for RPU cluster mode which
>   * reflects possible values of xlnx,cluster-mode dt-property
> @@ -865,6 +868,49 @@ static int zynqmp_r5_get_rsc_table_va(struct zynqmp_r5_core *r5_core)
>  
>  static int zynqmp_r5_attach(struct rproc *rproc)
>  {
> +	struct device *dev = &rproc->dev;
> +	bool wait_for_remote = false;
> +	struct fw_rsc_vdev *rsc;
> +	struct fw_rsc_hdr *hdr;
> +	int i, offset, avail;
> +
> +	if (!rproc->table_ptr)
> +		goto attach_success;
> +
> +	for (i = 0; i < rproc->table_ptr->num; i++) {
> +		offset = rproc->table_ptr->offset[i];
> +		hdr = (void *)rproc->table_ptr + offset;
> +		avail = rproc->table_sz - offset - sizeof(*hdr);
> +		rsc = (void *)hdr + sizeof(*hdr);
> +
> +		/* make sure table isn't truncated */
> +		if (avail < 0) {
> +			dev_err(dev, "rsc table is truncated\n");
> +			return -EINVAL;
> +		}
> +
> +		if (hdr->type != RSC_VDEV)
> +			continue;
> +
> +		/*
> +		 * reset vdev status, in case previous run didn't leave it in
> +		 * a clean state.
> +		 */
> +		if (rsc->status) {
> +			rsc->status = 0;
> +			wait_for_remote = true;
> +			break;
> +		}
> +	}
> +
> +	/* kick remote to notify about attach */
> +	rproc->ops->kick(rproc, 0);
> +
> +	/* wait for sometime until remote is ready */
> +	if (wait_for_remote)
> +		usleep_range(100, RPROC_ATTACH_TIMEOUT_US);

Instead of waiting, would it be possible to return -EPROBE_DEFER and let the
driver core retry mechanic do it's work?

Thanks,
Mathieu

> +
> +attach_success:
>  	dev_dbg(&rproc->dev, "rproc %d attached\n", rproc->index);
>  
>  	return 0;
> 
> base-commit: d4ef36fbd57e610d4c334123ce706a2a71187cae
> -- 
> 2.34.1
> 
