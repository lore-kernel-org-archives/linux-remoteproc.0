Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0874F2FDC3C
	for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 15:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773156549; cv=none; b=PycbyFVDcAsccOlg6JQis7fa5WkTEVozKuV1I6Fxob2DU+Z2xmtxdCMn9mY4Mt+o/8wNd5goixqvbCyqmHhR5KFczY8N67qPQzyYsb1m24H5D76Yhu7qs1TSoR3qnE3arpBwV0HdjNdiI4qjLj+4fYjfIpokaUmsWM1TTqxAIyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773156549; c=relaxed/simple;
	bh=rf3hcz0zyHP/2TUCjNrpY6ExWLdLFX2F6RrnjqWVTuk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WdsT2V4GG+/Hi19hiWUc11s/MakcmGUKgBpc1E//YeKMdj9Ia81KghYmvvftlfgNDsFEkQvMFEgaq2qstkKV3LEc3e0KOXv+z3+zlcowb2enkEa8CieZOQ/0WD8Drg1KOKlWscJxECwL0qSWjgrKYpnM7V5WNIZjESkAyXHRthk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xR+pUq5B; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xR+pUq5B"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2a7a9b8ed69so142407645ad.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 08:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773156547; x=1773761347; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qnND9YbWZOw1WwcBqNuAddXY8W6Zv3QRkMXH11i4sxo=;
        b=xR+pUq5BWui5OooAuiY9Mn+reT+IHL3SIMDOl0z+4hNV2FTZ3L5RWnwywtBCJUgUFP
         +3cwYbuVry936iMBo5Un5ocizppJuwgaGSPPUk1F2lxXzFKscjwFz15cnAUKmCTCQ4qL
         g7aiZuIYRqK/0dXwoDiyfR+Z3mVZqFHc4/OISdzwDD5VVDzAYFXhW3vorGQlNDLBEYAp
         14V//e0zOC5td6d237BcJQ1ohy7DcXqs3PMQFQ+IFWJXfjHsAyZeCVjV9YUCV3xcDMMc
         jTa4i+h3mpxkbm4R4H2frHpGrtygv4q13cNSom95n2+VO4xx4+1E0R7XZPrmEZVXXY03
         dVKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773156547; x=1773761347;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qnND9YbWZOw1WwcBqNuAddXY8W6Zv3QRkMXH11i4sxo=;
        b=ME2dpkldv/oXvqqYrgsbwBTv9RWZ2iH2hxmC6g3rht1HAMZmFCFtDdytC52vtLPFHT
         CHvW8EkM74Fns/edOVTFtm4hN8DBUnSqvFMG4Ql99ULPuokYWLI8XmiK837Psi0kAU6C
         Z1yO+BNaEIuSaIywCUlFWCgeo4LNR5YWrlXiWZpk1N+vicaUCNuZGgMIXmOkab2VyKSw
         cUWs4ypRvZpuTwkQ/svEEAnSebBuEhNgdew43LShK9QQJ3voxsVKlGv5fmH9hmLAVFAa
         J9ELAiA3neYErq1ZtEVcnvFQdaXtlxbdgw4nk1SLWDWqFHXaQUV9jN7zCYbYuEAjNg55
         fuRw==
X-Forwarded-Encrypted: i=1; AJvYcCXluFcnfNcEmyxBkDIELu2tnfHH54oK6aMJm83GA5WowiGYQ18A+f663rjgL7VNWorxEvTxokRWpc9B+ie/fHfO@vger.kernel.org
X-Gm-Message-State: AOJu0Ywzy6NTSMgNsrCX+xVQjh34SoasxMjN/oOvgfND4m4x7AYCRFM9
	tGoW9x7nY7JcLEWSu9uZaZO6Sir4Q26NbImBBMNZIrfBmdKV6JDD4Y8PwUDoCEpmSeTl/fl1ZZv
	CaqlFm2Y=
X-Gm-Gg: ATEYQzwgGVMwnicDcwyx9w6vzSKe9NFhnWiyqjiqDv9+SBmVd0ahOozJTqg9uWWOeRF
	5HTpf1E8euOa9qN+u/tN703Ea47ovmekhEFwBpwCo20hJxUUydX7pPXZ0NYSvGEEyzsrQGO1cKK
	j/dKHEgGiYGDV/+o2dkBJdxM8oqUuo+u+b0A+S4O3kDc6n33TsexuAmmqWI2YpcwMGUsE8ofJ1f
	aFcQGpvp98QmKiMXq291y3v7rvBgBENeSfV56HjivlVAxnWmwvV3yPmE7zGqLmlsslLC7e5rWJP
	B4sc13TEncRXA/QNLgrD7E6IdQbVQTwIBgUxwpK6eZX/SGAG9yinvhIJkLcp1sx5dX10olk5sCp
	MPk8NvtFT9ojOIjREsnKHpE3tongxyFy1wS0XQlQlxAXAnsQ2d48qcJQojFGsPhfTDmxtE+CLXs
	8SWqFuu0tMTyYkbcfL8NPq5QhDmFU=
X-Received: by 2002:a17:902:db0f:b0:2ae:59d3:27f8 with SMTP id d9443c01a7336-2ae8238bc3dmr171245055ad.19.1773156547323;
        Tue, 10 Mar 2026 08:29:07 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:32f8:1c46:c8b1:3879])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83f759fdsm208023075ad.57.2026.03.10.08.29.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 08:29:06 -0700 (PDT)
Date: Tue, 10 Mar 2026 09:29:04 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Tanmay Shah <tanmay.shah@amd.com>
Cc: andersson@kernel.org, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] remoteproc: zynqmp: release mailbox channels on
 shutdown
Message-ID: <abA4wGI7DvQLhTzY@p14s>
References: <20260303235127.2317955-1-tanmay.shah@amd.com>
 <20260303235127.2317955-4-tanmay.shah@amd.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260303235127.2317955-4-tanmay.shah@amd.com>

On Tue, Mar 03, 2026 at 03:51:28PM -0800, Tanmay Shah wrote:
> mailbox driver can't introduce shutdown callback, as it might endup
> closing mbox channels prematurely. By allowing the client driver to
> manage the shutdown process, it's ensured that mailbox channels are
> closed only when they are no longer needed.
> 
> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
> ---
>  drivers/remoteproc/xlnx_r5_remoteproc.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
> index 5e92dc51f1c0..50a9974f3202 100644
> --- a/drivers/remoteproc/xlnx_r5_remoteproc.c
> +++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
> @@ -1490,6 +1490,8 @@ static void zynqmp_r5_remoteproc_shutdown(struct platform_device *pdev)
>  			dev_err(cluster->dev, "failed to %s rproc %d\n",
>  				rproc_state_str, rproc->index);
>  		}
> +
> +		zynqmp_r5_free_mbox(r5_core->ipi);

This is already called in zynqmp_r5_cluster_exit(), why doing it here again?

I have applied the other two patches in this series.

Thanks,
Mathieu

>  	}
>  }
>  
> -- 
> 2.34.1
> 
