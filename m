Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A1D13EC2EB
	for <linux-remoteproc@vger.kernel.org>; Tue, 17 Mar 2026 15:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773762040; cv=none; b=c5UPtaFRs8nUzwneF1HXgiSAjPMS8Xr7f3QZ2yXYbsW29n155Yhcb7o9woYPd8wxTeKZuQKA/HCEn/fPoyvZj9ahgjzWlWpGiewHxw9jc793WSlLOnPLbtIrG6fIydNvXt2dsSrMgqU5PcLuxcZk+XIBHKbFYDdvLmZCD+SfdKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773762040; c=relaxed/simple;
	bh=+28TyEqbgg+eO18RfYm/y8EenXN+3buC5i+dg4Bi5ho=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W+oLSfttIFKAAm6bWM7Y5BZYV1l5mY9g/mlwosQFfahCmKrpDK9V+mv46gV+oac6tdtiGWV7aWOjuPeEU5sUa8Rn6Qo0Yn+ZKlXYn0CWeIbyRxW48l8FtMvLBA21oNLkSIqkj6TqDYD4hCgJfGd07lu5B2ct6hP9wjB+ilqRuEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FZYvqUx7; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FZYvqUx7"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-35bb9070644so95285a91.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 17 Mar 2026 08:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773762037; x=1774366837; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jMbpigMk9kBN96FxVGa+Cb1r1OnBt+q3Ymeru06O2aA=;
        b=FZYvqUx7Lwf7RY8WTpCCC0WRC//e3UKkWCyk0EswgyXWhvNy3jTbKY2XR6jKR2o0OD
         bnXCSbnHgOqJIy/VIxbP1As1oM4YzIstD6Jg9S/sHXLGQS2i75+oIQ5U7Zp5fvoPOu3I
         ofp7MRP9H9LK5x8++UTiFPeMeaxoTcbULLH4VCwsijNFtZkFCCif80EiMzpH/lVqJNIQ
         8oadJfI25UIb2kYrAHVW2lbfghXV9OJdsEJDaYX7gjZ7tHIZYk1UN6BuTr79GSci85gG
         q3C3lqhjaHI10x495YcRHOA9KXhTkGuegQ+/qcUSMugN41VcKUoXzDo20l+wuktpzyyw
         IuiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773762037; x=1774366837;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jMbpigMk9kBN96FxVGa+Cb1r1OnBt+q3Ymeru06O2aA=;
        b=gdk52TvQWJPcJ8dETP1I0fd4R6TyY+pkm30ym7+7vQLFBOh/NmFJfGDj4s5A/at48Z
         7M+ZmnuTZDDGSSF35cJqtYWEnuN32xsrIqILEZFPA330otFiTOLvCbMoRH916SecXnhl
         McwIV/+JQrpT0mPAcuC7wzWX1n7mpOmlclsyMYiyZCtsDKx06Wba0fIKRGNjHMmtWCZh
         NAuabhFDvb8eAAvgI9GdGF58XT1S/MujwOMPF8+Yf8wv1TiLvugqkPx4q8dspZ0lUjpV
         sn51dxP5IzA0bi8urI6A1uelAB7R8HlyfYTm2SGc21JePtgiW4T0QYvJyqj46+Zq+GaH
         m/vQ==
X-Forwarded-Encrypted: i=1; AJvYcCXOfbhJIuXAIWISihtsLYgmyeg3RixyVAkqZyDORcCiNWKDcjt0jcwu1uLoWhqWrie1DCgLSDLwHILnu/fNFlbr@vger.kernel.org
X-Gm-Message-State: AOJu0YyacBx89rhWkSeOMv1+PCTmnlWRQW2iCHYXALhOhMocJgTvcYZ5
	pgHF491dSVE60T4raVRw8qZlOZAFUTg/+LfOdi33QhkXzjQxLiCACkZ3iGF1/sHYDhY=
X-Gm-Gg: ATEYQzwBON+kbwxM9+Hmut1p85P38GT70ChPmzVCTsEDsGJxPzw1RmglhlBVFzDqHCn
	T/3IEei8dTQUGdtxXqgTGdA8Zr3a5TlZKRXXM8uIiKoiXkS6Ze+rEkFxOUArzTCO71ExyaNfNf3
	PDK08UolyvDwMlbRZI2nBM5/iIbsypg7r1ZSfw2oBeHSwlB7NPf9TWWsBOTHDtRJF6pmCWgBGih
	2jMYjgCuKg50GGG5LyP5StW2vDXZJiZIvGxlnSt2ptts05SLaZT4L1X4VdXbO8DYWdoROu/CadU
	HKdLNZ66YgDOXsv47TeBV5+cTzoj8f1FLoVPBIGyGZo2UeSKX/RlVWOkQkZz5OHK+v3eLu4OvqN
	NyvWn3BOCBIGU69OCGEPhJo3V8RntH1NEe044wUnfXyk2n3mdDHMBNTvMY45AEnEqAXl7GVBHd7
	KC3IuWtwVSTZSfobNTkjNOpQEGpQPqE/aJCtxysw==
X-Received: by 2002:a17:902:da8f:b0:2ae:504c:ae8a with SMTP id d9443c01a7336-2aeca936252mr185416155ad.16.1773762037073;
        Tue, 17 Mar 2026 08:40:37 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:d74d:3187:221b:ee9f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aece7ee4a1sm188860095ad.54.2026.03.17.08.40.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 08:40:36 -0700 (PDT)
Date: Tue, 17 Mar 2026 09:40:33 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: tanmay.shah@amd.com
Cc: andersson@kernel.org, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] remoteproc: zynqmp: release mailbox channels on
 shutdown
Message-ID: <abl18XFwhKJ9bVRE@p14s>
References: <20260303235127.2317955-1-tanmay.shah@amd.com>
 <20260303235127.2317955-4-tanmay.shah@amd.com>
 <abA4wGI7DvQLhTzY@p14s>
 <91a3bf88-cd64-4f3d-adb6-5e21558e8ff8@amd.com>
 <abgkB_9fMPGtq3Jn@p14s>
 <6e18177d-d2be-4d42-807f-2238436bd4a2@amd.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6e18177d-d2be-4d42-807f-2238436bd4a2@amd.com>

On Mon, Mar 16, 2026 at 11:37:05AM -0500, Shah, Tanmay wrote:
> 
> 
> On 3/16/2026 10:38 AM, Mathieu Poirier wrote:
> > On Tue, Mar 10, 2026 at 11:04:54AM -0500, Shah, Tanmay wrote:
> >>
> >>
> >> On 3/10/2026 10:29 AM, Mathieu Poirier wrote:
> >>> On Tue, Mar 03, 2026 at 03:51:28PM -0800, Tanmay Shah wrote:
> >>>> mailbox driver can't introduce shutdown callback, as it might endup
> >>>> closing mbox channels prematurely. By allowing the client driver to
> >>>> manage the shutdown process, it's ensured that mailbox channels are
> >>>> closed only when they are no longer needed.
> >>>>
> >>>> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
> >>>> ---
> >>>>  drivers/remoteproc/xlnx_r5_remoteproc.c | 2 ++
> >>>>  1 file changed, 2 insertions(+)
> >>>>
> >>>> diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
> >>>> index 5e92dc51f1c0..50a9974f3202 100644
> >>>> --- a/drivers/remoteproc/xlnx_r5_remoteproc.c
> >>>> +++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
> >>>> @@ -1490,6 +1490,8 @@ static void zynqmp_r5_remoteproc_shutdown(struct platform_device *pdev)
> >>>>  			dev_err(cluster->dev, "failed to %s rproc %d\n",
> >>>>  				rproc_state_str, rproc->index);
> >>>>  		}
> >>>> +
> >>>> +		zynqmp_r5_free_mbox(r5_core->ipi);
> >>>
> >>> This is already called in zynqmp_r5_cluster_exit(), why doing it here again?
> >>>
> >>
> >> Hi,
> >>
> >> Thanks for reviews.
> >> I think cluster_exit() call is called only during driver unload. Where
> >> as shutdown callback is called during power-off commands of linux like
> >> reboot or shutdown.
> >>
> >> That is why I am calling it separately during shutdown() callback.
> > 
> > Then call zynqmp_r5_free_mbox() from zynqmp_r5_remoteproc_shutdown() rather than
> > zynqmp_r5_cluster_exit().
> > 
> 
> I have to call zynqmp_r5_free_mbox() from both handlers i.e.
> platform_driver.remove() and platform_driver.shutdown(). I can't skip
> either of them.
> 
> Because during driver unload (rmmod), shutdown() handler won't be
> called. And during power-off commands (reboot, shutdown) remove()
> handler won't be called.

I was under the impression that during system shutdown, ->remove() and
->shutdown() were called sequentially.  I looked into the platform_driver
structure documentation and nothing of that nature is described, leading me to
beleive your assessment is correct.

I'll apply your patch.

> 
> Let me know if I am still missing something.
> 
> Thanks,
> Tanmay
> 
> >>
> >> Thanks,
> >> Tanmay
> >>
> >>> I have applied the other two patches in this series.
> >>>
> >>> Thanks,
> >>> Mathieu
> >>>
> >>>>  	}
> >>>>  }
> >>>>  
> >>>> -- 
> >>>> 2.34.1
> >>>>
> >>
> 
