Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70D764CDEC
	for <linux-remoteproc@vger.kernel.org>; Tue, 28 May 2024 19:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716925093; cv=none; b=ryH5ohUZFYezASv3upoWSlcGWrPFSTzapF0KBC4KpBhZCo3hwkAIcJhpyGHBR1vYDpW1XC1ovOR5pcc1kTG2FZU/2UeAuQkCKuDz67CmrxaXYJylywqs3IH+6sahSuGn2/3vyBXu1WWRA0uho5a1VRYEiHvqGMASDolh4YzV8Vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716925093; c=relaxed/simple;
	bh=C+E+TFaQOMPAjrjGZuvwR94cq5624yFiJBlvO7VitAI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tMiRXZJqreW8teXyzkq2Zpa+MKsiHn9P69vlmJomnwvO1VnZ6ENvPUR/sHh2Yu/7Wry31gDnKTalfU2mejfGFlOqiCfMwfuKiymw1yHtvQ8Sdz9MdwvBjOO8mmS2H6bt4YLB4bYcfgAWVcxM0sbdzz2nB2Op8fL09JXy5Vt25HA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ugVKToeA; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ugVKToeA"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-656d8b346d2so873678a12.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 28 May 2024 12:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716925092; x=1717529892; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VVddBXQV2grY6+Zbi//5IkKUEc11Yvlxas92w+1BWrY=;
        b=ugVKToeAEzEKQLtDNRtPB9QLKLNrVx4xu/54PuP8nlYJUQi+UDTDk9P0erPCG43/RA
         vmVipNbWBFniVBtUA0D7URPq3Sk3G5rzYYHLcJBB/8GXlL6rpNZSReT9F3kXiofwz6mQ
         jjXJ8qRPVxRO2PIF5pmeBDeyoq9L1Q+4cjvkOJhFFiC/eYz7YwSnzuGutFSIAoTnUU3r
         HL7cFzpE8pfvamRurRj0rGgTd4AT8Ul92XaG+OwvEvPOcolTT8aslJeyx3Uc2QpS+4Sf
         uPYtYlJVBWhnzZ+0GKbLMoSmQZir1scINLQk4vkj5nkZpM62ut0uN8zB9R/v+zWaJ06x
         aRVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716925092; x=1717529892;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VVddBXQV2grY6+Zbi//5IkKUEc11Yvlxas92w+1BWrY=;
        b=wJ/f4G/5cx8d+BwEfw3NF4Ei5Wjyr+ngeloQdZIqEVjH8C0Cb5EG4P6KpJSAzivklS
         gBCkmbNSCsHa1SJTktA3n+4vxPrH497X6UKPLkdPVuxMsEyAX01j6xmeBqGbTy+wmEdu
         lW8frbcB/LGd0VeUrJiiy/yTAz6lSslxsEDrQwIHLL5B/PNgVdMu4VTDgXNM7Q80LztC
         Ctf0QxYU2rxlKR44j2ZsEiETkQjfIZu78+QBAkPTdEWc1tf8WZ3nP1UHC1hzA+kBGgkx
         mWvQop5b5HeMw4vxWPuxx9j3hJs508+YbUpjo7vA1Zk1d5rHlOMApQ0kvJxySRM2eHcO
         Gjow==
X-Forwarded-Encrypted: i=1; AJvYcCV4H/MX5tnEDe9tdbWQK8ivyuq69vcTIHe/jRydC3I6tVtQz1pqdmNrEqnwotT+v3RrH1tkxBGKLjKewRUy/jaigSpYBKmuVzHu9TvW0RMGvQ==
X-Gm-Message-State: AOJu0YyvESYcz4pNIU2/1/OT12UBWjtygYIbBqjt9eafgBJAssenyUpU
	af3l+jlM80XsT8Cd+P+/NPXunhw2nmfXywhQUBG0M2b0oT9a6Stp+c0XOpfgkrY=
X-Google-Smtp-Source: AGHT+IEr6rxeqSRwySiQWxujQNR2NB+err9HDuAKFDWjAoR3nXctqIoryjD4z/+vQ37/3/hSHtZ01g==
X-Received: by 2002:a05:6a20:7f9f:b0:1a8:2cc0:290a with SMTP id adf61e73a8af0-1b212d3be66mr14145846637.30.1716925091781;
        Tue, 28 May 2024 12:38:11 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:4c7:2691:aa4a:e6b7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f8fc373c92sm6948650b3a.96.2024.05.28.12.38.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 May 2024 12:38:11 -0700 (PDT)
Date: Tue, 28 May 2024 13:38:09 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Gwenael Treuveur <gwenael.treuveur@foss.st.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Subject: Re: [PATCH] remoteproc: stm32_rproc: Fix mailbox interrupts queuing
Message-ID: <ZlYyoZzOlXylkQqC@p14s>
References: <20240521162316.156259-1-gwenael.treuveur@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240521162316.156259-1-gwenael.treuveur@foss.st.com>

On Tue, May 21, 2024 at 06:23:16PM +0200, Gwenael Treuveur wrote:
> Manage interrupt coming from coprocessor also when state is
> ATTACHED.
> 
> Fixes: 35bdafda40cc ("remoteproc: stm32_rproc: Add mutex protection for workqueue")
> Signed-off-by: Gwenael Treuveur <gwenael.treuveur@foss.st.com>
> Acked-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>

I will pickup this patch but this time only - next time all reviews and tagging
need to happend on the mailing list.

Mathieu

> ---
>  drivers/remoteproc/stm32_rproc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
> index 88623df7d0c3..8c7f7950b80e 100644
> --- a/drivers/remoteproc/stm32_rproc.c
> +++ b/drivers/remoteproc/stm32_rproc.c
> @@ -294,7 +294,7 @@ static void stm32_rproc_mb_vq_work(struct work_struct *work)
>  
>  	mutex_lock(&rproc->lock);
>  
> -	if (rproc->state != RPROC_RUNNING)
> +	if (rproc->state != RPROC_RUNNING && rproc->state != RPROC_ATTACHED)
>  		goto unlock_mutex;
>  
>  	if (rproc_vq_interrupt(rproc, mb->vq_id) == IRQ_NONE)
> 
> base-commit: 4d5ba6ead1dc9fa298d727e92db40cd98564d1ac
> -- 
> 2.25.1
> 
