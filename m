Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D17CE19D080
	for <linux-remoteproc@vger.kernel.org>; Thu,  5 Jun 2025 15:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749139112; cv=none; b=e3boCDY/XtxhVyF5bU/6xAO5wEsNaK0rYFOykx0yXoRjprl2Ag2gGRjxeRl4FeHU97Ykt9Wj50LGAciBAzyggJTS3LjnuKyeZZq5KBmZqiu2sxpNYHU4vzUdoKxxYLqZV3hzqWMkC/miBjOJSUEshPqmtI/KdQiaR0Q0WAItyig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749139112; c=relaxed/simple;
	bh=5oy6KHOvTzdcuYytmPkKZgPrpl7idOQtfQSObqeQCVc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HdHiYwn3LWiToa9kYOovAM70NpP1+qL3NUdHhHSflbVdgfqV/lo8i6JxxY7V81bZN58o7E16i+8KYS0/KOEIZjERTRJGG/e/UaW5tmBBVXQUv9W3RR4O5A89yMeoo2x0SHHoiy/DI++Eqvw+gQqJYvXNQ+gOMNvAcgY1QzgKLXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=foundries.io; spf=pass smtp.mailfrom=foundries.io; dkim=pass (2048-bit key) header.d=foundries.io header.i=@foundries.io header.b=gW0btmgC; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=foundries.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foundries.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foundries.io header.i=@foundries.io header.b="gW0btmgC"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5533c562608so1129272e87.3
        for <linux-remoteproc@vger.kernel.org>; Thu, 05 Jun 2025 08:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=foundries.io; s=google; t=1749139109; x=1749743909; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jY+fBvo1omxGhJb81xJVOAzLMDMZ0VpHsAY7o7wB4qM=;
        b=gW0btmgCzehWxNok2ZvOcAU/uE8xx9vZXUoy5HO61a6CGpYTesRV3mVq0K3ft1B8tM
         rUfO7oSyn2QAdn+0prfGkxgjfeEe3rV2DcU94NZ5hkktHJtR8uQOq0igXIM4zdanNGW0
         SkZiD3t+Q7ak90C7SZYqumWqSu5SipEt00OBWDGLmFzc2b8lunolrsGLGh6zfEM3qSTH
         AcLJdOOYwT3kYTAa6oOZpbvzHUmD7dU4yqImBpZ7WdTcH4pWANga0XVeYm39bPaflEh9
         jcP9zS08Fr24XRrrs0yfmPJ0UHj2DxyBKi2dOSpD+SlaBqnBKJBUETa+LAbIjNBITq6u
         kXLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749139109; x=1749743909;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jY+fBvo1omxGhJb81xJVOAzLMDMZ0VpHsAY7o7wB4qM=;
        b=foXCJzWNWdSVJF4ZCSLQeEcVm4kbwREs6Hs+8dP/mSxpdR/cfUKk8fkBG1QRU/JQLs
         5NPnSqyBgKM1FWmNSQAyKTQENNGS7PuPvJTIwNkqh7VJJpVNVh22GU9aSLSYpNQ+h+sV
         AJpUHqjnEzXEtutePUhPzQZBWeag6/99BO4G4ih4SBKzJqKD6rZEVNwflZxKTK1A1wwP
         x7WLdD0J3G184JqkzGCdIkVIYHUJ0JAl78yJhGkR2UAhfqhcyJOfTHaXRDQmDiNdSJqK
         baI2VLtGVhIcR+w+sUkiuQ9UqOtw8k0RBoe+fpcgsxaHuxTUfOo1HNUxvgzFX+2PaHLH
         OMBA==
X-Forwarded-Encrypted: i=1; AJvYcCVnQ+PdMFzRmysYZT+REY6tdlPmBINm0Rz0reVYhIruGKx/qW8Y2ixcxNSBxRaFGuJh/J/i3S39vmyGu2XjApp8@vger.kernel.org
X-Gm-Message-State: AOJu0YwGLG0uL1cTYDOPM7C8psesjVfg03v7sdsSRlzDFFVsEsGxaKx4
	y8322Cgo4KNcMO4bfcJrjyBGD/0tcCxmRvFml2zxeiBWjWJBhX9jN4N/3nMXe7RM28o=
X-Gm-Gg: ASbGncsim1ZZdjqRWostaF8V+geURuOn04FtPBGLAxESQ0UhLM1Gq7jWCzDpfd/jxnQ
	RQVEGuELs/KVX8Y1h3mI+I1xt8qKIgsaxb+F7oujzIsshByiCuhqk984GZvRLVrNCs9nUv5QPip
	+wQviFbaKCRwlqtaouMpzPvm4ZMFOnz9RUGfDiwOOYi7WoIjtwFoyCFsxxX0r8fxVQd7EaYF6Ap
	bPhhzSZLdCtQL3hJIhlm0AiHtyfYMdJYDU3lIVriC14s+xmcjpT7E3FYF7ulJAZo107KODj0VFf
	DEBDwY807BELH66YO7lagEOiRFYM7R/6KJuQKwgK0k+uEvoaTOy9KmlcsiE8JMJK2lBGwAj69qe
	XSXnCzUcU+F1BtH0L0L1HIICCNzeSFxqTB3sR59HDg5fS
X-Google-Smtp-Source: AGHT+IE5g0NpZiGKWdQAhxqzPgU+EDalkwHq2x5qhV+iGVnnLfBvqqZ/6tin9VLqkHuvfZ3nNw2+aQ==
X-Received: by 2002:a05:6512:3a8e:b0:553:2a2f:22eb with SMTP id 2adb3069b0e04-55356df996cmr2190335e87.36.1749139108888;
        Thu, 05 Jun 2025 08:58:28 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32a85b5664asm25008971fa.60.2025.06.05.08.58.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 08:58:28 -0700 (PDT)
Date: Thu, 5 Jun 2025 18:58:27 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@foundries.io>
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, 
	Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH 3/3] soc: qcom: mdt_loader: Actually use the e_phoff
Message-ID: <p2nl6wmzo5tn7ve3ufhuwiw7sixg2bmmml3txwahq72h76asok@y24ixmekdxfr>
References: <20250605-mdt-loader-validation-and-fixes-v1-0-29e22e7a82f4@oss.qualcomm.com>
 <20250605-mdt-loader-validation-and-fixes-v1-3-29e22e7a82f4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250605-mdt-loader-validation-and-fixes-v1-3-29e22e7a82f4@oss.qualcomm.com>

On Thu, Jun 05, 2025 at 08:43:02AM -0500, Bjorn Andersson wrote:
> Rather than relying/assuming that the tools generating the firmware
> places the program headers immediately following the ELF header, use
> e_phoff as intended to find the program headers.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/mdt_loader.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
