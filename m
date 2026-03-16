Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4252F31A549
	for <linux-remoteproc@vger.kernel.org>; Mon, 16 Mar 2026 15:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773674304; cv=none; b=UARPcfz4sQHPw378JhX3FvCyJLnE/84sTAh2E6ZgYrxqPa4Cxjle19FyVveBjvcEv/KTOLjytz/YGBayz9guGel0H+XdBaoP1fi69qE7MmyiQROxPmR9YT5CzAihnNTzrpbmPt4B915mWAiiJ08vNZ/7Fid4l8h3tth+VmpDYjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773674304; c=relaxed/simple;
	bh=AUXNQnavfxXMccUUnLjvH4/Lj+Q07siLDoBFezaDSH8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mF02dhVPyf3aQD9f5JdU3YXsKXLUJR9ynR5jWCfP7aho6dyK+gKLUuYZd6ZBjJawgkvWLU58Z+fGfxyIdtRTj3cdrELtGLfent9/WQ8SpmInoKrGBYrf+cNANWP2AiZQ84t86vrTGZXCiv8QA/7u9rPRRwP0tPsKpDIW8rp2Gh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Z6gHUXxr; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Z6gHUXxr"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-82a13374cf6so4172355b3a.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 16 Mar 2026 08:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773674302; x=1774279102; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=b1GvdCwkRsJTG3Vc/JK61sCTdqezEQDm65yqVtSqI+g=;
        b=Z6gHUXxr3tqkvVJ2ZrnociTpWf32/TcJnoOzfGgcq+7C7YOEgP0vsxPrt+pyBeRB7/
         Z4dlUG8qLrRxjE5surfFBlZ9dtv2nD2swkYLR8lQs0kLtbVAi9oiNXicqFEsUVzTr9Gz
         Rmjf/fgVIZCSmmwZljdSDcurGCY4HNY2kgRtcElsF/Kfo84Gs4BMyAjhwvv3WgqDiVMn
         cSl4WavT3553+QLB3QYnMW5j6lT5NWB7VHoISS6Dit+uEUVv//o9KMmmJnTFs/gXZYrd
         g1WqD15n04z/OINk0STjXo+eF1u0aMKD8fWzkWbq7aTBHwDAUiJjPgNN5TOWfgt1vBDG
         q+Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773674302; x=1774279102;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b1GvdCwkRsJTG3Vc/JK61sCTdqezEQDm65yqVtSqI+g=;
        b=JmvYbrV+ITzsQrC4Tn4lCa9kod+mwGCL+nxI4LxcE+Wf2OjConUz5UwtDAeb+EriJj
         05xP8KV0xiuBs6KuyWHH2duNJ/t0WmlOMK3ouPitcHP1eFxthv8sMKtA+VEJ4LMRnJ1Z
         Lmwdbph6LCxPDbAWjTLdQehFcwDC1ErlaJ+BiMKA0F1JxXNua7NPRlkQDtK6Co5N7rGz
         muap0dFm8ICksRjLOwoc8UFNCS7qE7NNuweNe84UXn6/XhQ8uF+7mFf7BhTov7TnwWW8
         Ssy7womtw0FXlU2pA73RQk+ZDVBSX5mEABvdB4ImUdCjghzjNiLH+G6dfVNRe92lh5jB
         bSFw==
X-Forwarded-Encrypted: i=1; AJvYcCXzPewykeahuIsg0QRipUrPUkFFfEmqzVDKK5byVp/11uAi3SUKpNmTSYJ1PbzLjtUdspAr8ogKr/WC2Z3dd9dX@vger.kernel.org
X-Gm-Message-State: AOJu0YzglxFtkQRTLPOl5cOdoAliWovWQx/7AMee404nYeHsdshvC9qd
	MtT6igeR+oIwnHVybUtXF3KCqYAyLCUqfHi5WhJlhPOZdBZFTtX7dGlL1rVIrx0UgKU=
X-Gm-Gg: ATEYQzwlM67PiIt49SzwrFv8Hptz8oRi6gMrryMGqyr2ODTcNGSa3hvGNYft8Zzh+2Q
	jvY8mqXI3XY+HC98tERckB61VTucdeqDFbuCIpbbq+51MdXPwzADq/8KjBdCJdpIbwX2vcCFWv2
	93hz+nWHC+8B4SPrnbgRCPQHOZc+J0frsumyQGlhRQ20RnC50Z8ZtfN0c4Yk2Qed8xbWq8baXkr
	qZbitLZy6vy6LqDSNYam3js1doojWV7M9hhyGO++j7pn+rXhnJUP2+p6iTpcefSbJaZxwOq7qeU
	23SrKSd5SUqKnuXTigPHk9dGJlgilb6Ccjsym3509zixvayuCIKlV6IThTpFA7f/ii8RgmyaW5e
	Js3rsy3mdxJFvdKpqYTmFZJRCH4XKxcm0O2lPOGm/UIxrYL937l+HYfUHpIwA+9keVKG0XxBGWE
	PjQkeEypvaTi7NVlRfjlzlDr6kiwY=
X-Received: by 2002:a05:6a00:14d3:b0:829:883c:1d53 with SMTP id d2e1a72fcca58-82a198ef9f9mr12176466b3a.31.1773674302450;
        Mon, 16 Mar 2026 08:18:22 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:ca75:c28f:fb21:b50f])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a07340091sm14040592b3a.35.2026.03.16.08.18.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 08:18:21 -0700 (PDT)
Date: Mon, 16 Mar 2026 09:18:19 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Tanmay Shah <tanmay.shah@amd.com>
Cc: andersson@kernel.org, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] remoteproc: xlnx: do not send new mailbox notification
Message-ID: <abgfO32Dc9QbgQau@p14s>
References: <20260219224329.3475032-1-tanmay.shah@amd.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260219224329.3475032-1-tanmay.shah@amd.com>

On Thu, Feb 19, 2026 at 02:43:30PM -0800, Tanmay Shah wrote:
> Only write a new message to the tx mbox queue if slot is available in
> the tx queue. If queue is full, then do not send new mbox notification.
> 
> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
> ---
> 
> Depends on: https://lore.kernel.org/linux-remoteproc/20260209234430.512492-1-jassisinghbrar@gmail.com/T/#u
> 
>  drivers/remoteproc/xlnx_r5_remoteproc.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
> index bd619a6c42aa..622de733c929 100644
> --- a/drivers/remoteproc/xlnx_r5_remoteproc.c
> +++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
> @@ -332,7 +332,10 @@ static void zynqmp_r5_rproc_kick(struct rproc *rproc, int vqid)
>  	int ret;
>  
>  	ipi = r5_core->ipi;
> -	if (!ipi)
> +	if (!ipi || !ipi->tx_chan)
> +		return;
> +
> +	if (mbox_chan_tx_slots_available(ipi->tx_chan) == 0)
>  		return;
>

Is see 3 options to handle this situation:

(1) I can provide an RB for this patch and Jassi picks it up in his tree.  The
downside is that if a subsequent submission conflicts with this change, we have
to wait for the next cycle.  In that case:

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

(2) Jassi provides me with a pull request to bring the patch in the
rproc-next tree.

(3) I pick it up in the rproc-next tree in 5 weeks when v7.1-rc1 comes out.
  
>  	mb_msg = (struct zynqmp_ipi_message *)ipi->tx_mc_buf;
> 
> base-commit: 462799c088e71b2b8a511c2a9649420fcb569ab7
> -- 
> 2.34.1
> 
