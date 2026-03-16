Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3111431AA99
	for <linux-remoteproc@vger.kernel.org>; Mon, 16 Mar 2026 15:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773675532; cv=none; b=i1SUy0wnAbih60xsH/Qu0gwCImlzCZ/Nr2648a3py0IhUUR8G+lZMLoXtltsW50mmbpDlBcKh+MEE+VWtFFi8xxW2VN7AGzOw4VHSfByQEzFshL6U9fyWH8yGQzt/nsBaQULDjgEm4qoyeRltCSrTqkUhJtRjKTB0cejLTVyPfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773675532; c=relaxed/simple;
	bh=SuxSyS+PpsRM7oOsD/WRLgROVRgLuw4xMKMLzmaxo3A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kuZ/2DsqCDDZCKosv4qfBlXic+qWHN60X/KMW6MdvPUhLU9tgYsMGFICYYvrEac+IyHQZP40yVZX3Nio3p3+kYFU7nC7O1m7viMxm0NZDUCT/HmgrR56dse2MKmcdi5wWeCwbvW8bZ0mDw7kKdQXb2nAXR513xuO4zTDVxqgt80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pG5ZPmB3; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pG5ZPmB3"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2b042533de1so12444615ad.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 16 Mar 2026 08:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773675530; x=1774280330; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=U9aCgOjWIIxNoZyTqWIPp/K8d98rcBE2FRaCGCiBcKo=;
        b=pG5ZPmB3KvaR0CESkDNRaQnK3oBH4fsr4gVgy2jKNAiAHDmg58HilYvqaXR74eYtFZ
         uBbykEAIxZ1JJpYEqQxXXXx2QDHzCE3R5xdk0mnmX0+uG9Z8OtR3quIfi8QXnaqQquXO
         OuNyJoxoVDXvBaX9945seJV3rHhbWiBVg+HmMbUK9VGWyppTYlT9frVs5qh/qnK4a3yM
         MvEqHmt/gMX01Ll4WgKFM+mqxeXcxmm2ZgNHIYuQ/6bjUkKHeTzq9ZgjeJ71vLS3TeNp
         Bhtq5+TeMhSQytHxVIhSjvT0xJeC7zHKFmgRhFd2u6hg7bvQ2k2PMYE35HeQHL5SEBW2
         k2OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773675530; x=1774280330;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U9aCgOjWIIxNoZyTqWIPp/K8d98rcBE2FRaCGCiBcKo=;
        b=jeNyU4ou5PUS6DbxZmSgGTI2UPOfj7APItzRgLLI4oFDJ24zd/CAIfJwCA3kVu3qF+
         Uq1yYJ811GJJ/FH+7+/6InVTYRkAF21mOgWlYPZTFq7kVJooVTB9ExWgDXobe9cEuvAl
         Az9LuMASGf1nk/LF+4cMxIlxys/WPBA8bzP1G0wasa2t2cyCL/uZS8PwzTrrKJNEYXjj
         lYJlwqKaY1p6g2gJtqr6mPohjYbwdXxfb7QqUKZu/djz0zynhmnBU3nEaZjoiqlAmfvA
         SuLfHgRo0bfJau4EJcMoxqjiy6PO402GTeAboJxSU5NJgO9TxMXgA3niJdqME0dUIW0C
         MxLQ==
X-Forwarded-Encrypted: i=1; AJvYcCXm8WXCOBQvs1h2xfhKP53shNZxa1XFfEqgqHVSywSarpQ57ATbPWq5DrDuzxf9ak/gGH+JOAukk/R3Fh+NlbKZ@vger.kernel.org
X-Gm-Message-State: AOJu0YwcyJsq0lgmKCbtbxtEfT8v5cp+hr5CbRLj3zzVGPgpH6hpzcoN
	+brnlIvQTzKk9HGIpl7XuYG+OVOYSx71wvjCnpsIjadXK4pabEl1r88ri0f77TP7rcs=
X-Gm-Gg: ATEYQzytG8Yx3BlxawnsKHO1cieXTwigW7WKcy5BKejsOTAEZsL4qumgKtGu/iTTBtJ
	aBgnqYW+0KOuXDwagerhdvV/rnVtueOtpfhqNL8T1mcBh+Vf1sjfFwMWF+OH/3OllfWbHTdPS4T
	8wznwEn0cLn8Tioh6iG7D8KsoSXRJEzUPPC8nUyXJ4zRd1uU7/4S7KBVrGxeecCziKk3nfyevbb
	s5t/T1Hb6qGICJO6th9qH7QMsZaaB+TYD8PjLd24wwaE59Y12j/p48tTqEXAbWHBcZG8j5hYZKP
	Rk+Jdn6sFStXmZMHVXnJh2taczmEUU+0Q8kWuMBhB51rCmkSfANw8UHrW02Lw9auQL2Y8G4aGFq
	kQ7KeJI2E31/dh2gE3TOpr0WYcBlIa9Pyx5Hhye/BphY9dA5Il/UcvohupSalM7GxYIRptirkN1
	Zfq4Ux2XXbX30L1yyitfWlWsGEQBKL0DajsEdQGQ==
X-Received: by 2002:a17:903:3b8e:b0:2ae:3afc:eb42 with SMTP id d9443c01a7336-2aecab04a1dmr126215285ad.38.1773675530440;
        Mon, 16 Mar 2026 08:38:50 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:ca75:c28f:fb21:b50f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aece7ed753sm142542475ad.45.2026.03.16.08.38.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 08:38:50 -0700 (PDT)
Date: Mon, 16 Mar 2026 09:38:47 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: tanmay.shah@amd.com
Cc: andersson@kernel.org, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] remoteproc: zynqmp: release mailbox channels on
 shutdown
Message-ID: <abgkB_9fMPGtq3Jn@p14s>
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

Then call zynqmp_r5_free_mbox() from zynqmp_r5_remoteproc_shutdown() rather than
zynqmp_r5_cluster_exit().

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
