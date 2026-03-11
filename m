Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DCEA3451AF
	for <linux-remoteproc@vger.kernel.org>; Wed, 11 Mar 2026 17:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773249162; cv=none; b=R9D/MTBGDYaSOsiBImyuohjnoXtPfingJr9OlWMi7RAqRsrKr0WU/5N3GFoAeK6Xj6LDjhMtihURobTPZfOrDO/aJ+O4EAZ9AVZKVMQsT654EGKc3naB+DeiwDTPUC0t1IQNzQwC1xgaOftR7OvcfbFZehdB9EUlqlx1pUVNM7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773249162; c=relaxed/simple;
	bh=TwYAqn7tSeMoxQeKMEOsbGp27pspTMSZsxZoAI+B5HY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qwmJ6WPgAfxUcOgVy5kqIkpKn7kigoTkr6HQdLzLlZXgGPf3FXI9kwRrDUxUN42oUIOXceTHeJMmBnyvrdd+GVs2SFsIDsMX3nWOGVj90hLPMw/DlthbX00vojwK2xL55iUOrUgHITjGKSLFkChFhM/Cfzn5KdL4Q1L/GqxhRQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=q8Npi+Jh; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="q8Npi+Jh"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2a7a9b8ed69so2284135ad.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 11 Mar 2026 10:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773249160; x=1773853960; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=teRdmlK/inOEWa1f4E7ksWg4b499EYTa8xm2tdYI8Tk=;
        b=q8Npi+Jhit8XkwgOjNQusj6jkqZGGLyitzPVWlxeyfB7vJTx5zeXGnGje1eGEmpy3F
         apTnYP+eY0EWgPZAera3d2TuBL8AbWGPiwyLz+FTlwEAYzXfgEqxogEEt5EOAFzSf+hD
         IvFz4zXS/haohdSr8a8WOg+G58adPJab8s696LPOt5fGAwG4yiN8ou8XL2vKeZbsrSmG
         MCwsb5o/LBzgomY1ohnTpfn8snCoHN2H7LGQ41n6Jfs0crcSbEX9LRSpOEajKvNlj1eM
         mCD7+ZsurMfJf+ZOSftMHpXQO42+F6nqOY0BhSgWBXTJ12UEjftA1WibiEMrbHQnPHIS
         b46A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773249160; x=1773853960;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=teRdmlK/inOEWa1f4E7ksWg4b499EYTa8xm2tdYI8Tk=;
        b=VkRTvI7ejO2F6Q+vG1VYUV2qCwkBwbvr50+jA9HzHocmFMRjRNmMqMY7mU8o9WXY/0
         37mKUYUbxK2qNu2OzINw5e8X06CUHLuxqLhpxsIprVTTJ+D4xCcUtV32/j1zywE4sMaH
         hnIAQM0bUMoUE4sTdVzQBizCrg5ewSJxLT8khphuncwS05MZupu5WlJmKDCPewCdXL2H
         9YRy0P1YdDLY8m0BK4olNwwzJDDxn3gNr6ZVThRawYtNo7KzjpOKfvF7MAFZbCm8T6dR
         Nb7Yul6sgmlnNp2h3E0XqCNPiHTnYiie+PYN7dJ4a8qnoooDHsP/lWlhOV2QLWK3PqOe
         J3Ug==
X-Forwarded-Encrypted: i=1; AJvYcCVxyrdceAhgv2tgHaFz7WnNAJMkMRSUK6EAMor17eLPRVeJxKKvlTQ8OuV5Wfkbl0KUuBK2T8VhEzx3ddHvy1B6@vger.kernel.org
X-Gm-Message-State: AOJu0YyYQ9+lIjr2P0MPTxDh9iwARU5N+h5y3uUdf9D48wdxR3axNHMu
	ilNSEYmeFbZlakTtakkCjDSbNnFBpSjkoMv3RfMtjYj1wf7RWGSpiJ8W1l04mZWlZTE=
X-Gm-Gg: ATEYQzxebh2pyMBSnWJ7qILD/HORPEWKC92RS9ocfPyugz8rp2hYTMhP/imn0e9m1Y5
	xB6lwn6MQvIzHj79L1YaPpPvyKPmk8ibNsnQqjz+8sWDl1WtbP+jroDVwfJXMc1S6QB3GX7hDho
	NTuzSxNR61cBXHJiVUhBz/GmoACHc2jRcEEnY2dKA6M4sb8OvghaxP11KTuWVPMk5otvtMmD48A
	rUSWNKdUvyQ5JN98J3jpmav34VtutpxWnXdmiEwt8g1xCawZsoR38m2gL8HLVjyFExtw/NQU23R
	sGdMLurbyxCkWreoCd9jl7c+3fGOwZdgj7xpHUICJf5WnMCVcoALZRN2+BweIoNA1qF9jEZmfdv
	47PKpLANz1ao4RbTMLU8QSrJtlTHg3Qoucruil2Ax9EnKKoC+z1YPUtgNRoJaG0Xd270h6X8q2w
	OudFwogoRW/z3KqKsrMcmGFmSmJcY=
X-Received: by 2002:a17:903:234a:b0:2ae:5063:b3e2 with SMTP id d9443c01a7336-2aeae763f71mr34727305ad.9.1773249160138;
        Wed, 11 Mar 2026 10:12:40 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:80ec:cdb0:5d0e:6048])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aeae378930sm28805445ad.85.2026.03.11.10.12.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 10:12:39 -0700 (PDT)
Date: Wed, 11 Mar 2026 11:12:37 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: tanmay.shah@amd.com
Cc: andersson@kernel.org, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] remoteproc: zynqmp: release mailbox channels on
 shutdown
Message-ID: <abGihYilz6yC0TCh@p14s>
References: <20260303235127.2317955-1-tanmay.shah@amd.com>
 <20260303235127.2317955-4-tanmay.shah@amd.com>
 <abA4wGI7DvQLhTzY@p14s>
 <91a3bf88-cd64-4f3d-adb6-5e21558e8ff8@amd.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <91a3bf88-cd64-4f3d-adb6-5e21558e8ff8@amd.com>

On Tue, Mar 10, 2026 at 11:04:54AM -0500, Shah, Tanmay wrote:
> 
> 
> On 3/10/2026 10:29 AM, Mathieu Poirier wrote:
> > On Tue, Mar 03, 2026 at 03:51:28PM -0800, Tanmay Shah wrote:
> >> mailbox driver can't introduce shutdown callback, as it might endup
> >> closing mbox channels prematurely. By allowing the client driver to
> >> manage the shutdown process, it's ensured that mailbox channels are
> >> closed only when they are no longer needed.
> >>
> >> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
> >> ---
> >>  drivers/remoteproc/xlnx_r5_remoteproc.c | 2 ++
> >>  1 file changed, 2 insertions(+)
> >>
> >> diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
> >> index 5e92dc51f1c0..50a9974f3202 100644
> >> --- a/drivers/remoteproc/xlnx_r5_remoteproc.c
> >> +++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
> >> @@ -1490,6 +1490,8 @@ static void zynqmp_r5_remoteproc_shutdown(struct platform_device *pdev)
> >>  			dev_err(cluster->dev, "failed to %s rproc %d\n",
> >>  				rproc_state_str, rproc->index);
> >>  		}
> >> +
> >> +		zynqmp_r5_free_mbox(r5_core->ipi);
> > 
> > This is already called in zynqmp_r5_cluster_exit(), why doing it here again?
> > 
> 
> Hi,
> 
> Thanks for reviews.
> I think cluster_exit() call is called only during driver unload. Where
> as shutdown callback is called during power-off commands of linux like
> reboot or shutdown.
> 
> That is why I am calling it separately during shutdown() callback.

The problem here is that zynqmp_r5_free_mbox() is called twice.  At shutdown
time all drivers go throuth the normal driver shutdown process where
platform_driver.shutdown() is called and subsequently device management
callbacks such as zynqmp_r5_cluster_exit().  The same applies to loading and
unloading of drivers.  Unless there is a corner case I can't see, calling
zynqmp_r5_free_mbox() twice is not needed.

> 
> Thanks,
> Tanmay
> 
> > I have applied the other two patches in this series.
> > 
> > Thanks,
> > Mathieu
> > 
> >>  	}
> >>  }
> >>  
> >> -- 
> >> 2.34.1
> >>
> 
