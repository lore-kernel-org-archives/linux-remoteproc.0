Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 225781096F
	for <linux-remoteproc@vger.kernel.org>; Tue, 28 Jan 2025 07:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738049438; cv=none; b=Oy29tkkhSKnpyXKvrlA5Azu8fsD2l484fNZyEy59987TrLT4Om6sweCnpD8ANWH2MDeslS1iJbE6F7cg6ceEA8GaSs14Lzx765ZO4+SWrztPatK8K28DvD+/UyzLzLX2ENpjKW53Fj6snj20DBI57D2vjNi3tWVpQc4UHX6/nHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738049438; c=relaxed/simple;
	bh=8AKcijbYWQfAAZvNgIAm2WLaaqPCczhmV4b8KjMffPw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YjmNTIPWr85XPxFADhaFLjPWYiZy+bCpI/l+N7Ds8SmhXCv6nvfBKDj0RWVIad7CEi2WjQ/FilQ7NDkVZ8huGHcy26cpKnNSEcLLIcGHPX/I3x4ofU55NT3zs3zUx2gE0G6aT31wgRKr4WYpEUGwKbn+krbKCku+bRgNQ1+30vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WbaOQTc3; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WbaOQTc3"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43622267b2eso54361405e9.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 27 Jan 2025 23:30:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738049433; x=1738654233; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Z9+ukmJahcHR86IFYA/UP+Fly7kNN5siXPsoSHx5lJE=;
        b=WbaOQTc3FpGjRn29Q0SLZYLSa5F5FigqeSrmhrAUTkVpl1Fg6attCpS8CPCDpYmHLs
         99eoFwS7cudumj6BtoZc+MXzNjluj/mpGSHt5hVSJjgmiAK5OqwYm5G/4e8/GTsLDF3r
         Qsng/RpyFEjuq5It8lFwVXmN5W+5Cx93/pebrHKoRDlYhq/1oHPRgzEkbMZXRYsOhLlC
         7wCXB/YONS4nOS/ccODWSIwRc5LV4ksgYi9cKKSIQdnvEXT0mLWJMBi5ydUQCTc9snLj
         GZbj7emED0NTUjl2khMv9P7uof1bwZHbEQdiaW8KYdkR6sNwv8265EsqHoIkb5j3TF7W
         KK4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738049433; x=1738654233;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z9+ukmJahcHR86IFYA/UP+Fly7kNN5siXPsoSHx5lJE=;
        b=f2u19dogsMurW4K6FXuH35URgmtiZ7Clcp2tuYKeYrN3AV5xjXk1MK+Ldqd7kzwV7o
         fGiqe8ErCE+Hl0wnqmnWaeP4OA+RDZ/KbuO9RJtO3HXSgEoBFyCLKYctoUdS3/GsudQG
         Yu5Uc1CwkRS+rmZvYFF3dnKljX/u371KB3eLkOv7kXPQP2aeBE2YLyX9kuORuk+EKzlR
         VR101DsLR/uaGicGwHP6WmX3CukixOMl+Els0Fe7AZloBjO/gxM6lTMxVixiavqZsPrY
         SQEF822R2I/TJMjHsvawq63Fd+4Lwcqipj2GpSOCEM+i+6HQDYY0alNbaMhevXv8XGPJ
         DqvQ==
X-Forwarded-Encrypted: i=1; AJvYcCUITAfbcKl7UiN3+uJ21PhaJZ6hq4HxXhccqqWCJ1n5BJB9EwSe1WMgyGFv9RZXenpRs2qqnN9oDfOMEVjBtwxG@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2bTc/LAh7rDVDVxvNr2aKmeMWCTQtEHaBOU5SuIfKc53RyXZ5
	DrDf/5/lOmn4fxMZNSZH79OQMTsg+bZxRDli9sr60vqWE38eAcJoCJCf4IgjNwo=
X-Gm-Gg: ASbGncudOlBQdEw/cugd5zFvYFTGr7HI1epSXGkridiwm16Z/gYxAdyVZR0I6jHPwoR
	ls0v1aJHF/0BuYUYW7znffY0jgXAM7ocdEvac9elReT+p/YkhE1PHERhpE9nOrrq16mu/wRD41b
	Jj6G9sqkaZZzw6l6b2O3J4/JtvFR1rKlZxOw3gQedf+bVEEnBPgHdbVcL9v/0Z8clBSpBfeH2rg
	DEn26McdoMG5NcSwPDs0nOQDnSBkes89hUxc5pSfWtz4PqvbZKpnpK03w8TnZiJIPhY5Kg+3vjX
	LsqqXfLylah9RHXNArljZS2vEMs=
X-Google-Smtp-Source: AGHT+IEH99EXz26pESp/XUF6j7Cpk014F6X5VqfJ1dUpvxsNKvpSsxwDmGleZM78Zd5Sp5fw/nEqKA==
X-Received: by 2002:a05:600c:4e89:b0:436:30e4:459b with SMTP id 5b1f17b1804b1-438913f1649mr417882305e9.18.1738049433182;
        Mon, 27 Jan 2025 23:30:33 -0800 (PST)
Received: from linaro.org ([2a02:2454:ff21:ef30:3210:3bfd:4b47:59da])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd47f269sm161399265e9.8.2025.01.27.23.30.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 23:30:32 -0800 (PST)
Date: Tue, 28 Jan 2025 08:30:25 +0100
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Luca Weiss <luca@lucaweiss.eu>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephan Gerhold <stephan@gerhold.net>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Matti =?iso-8859-1?Q?Lehtim=E4ki?= <matti.lehtimaki@gmail.com>,
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/9] remoteproc: qcom_q6v5_mss: Handle platforms with
 one power domain
Message-ID: <Z5iHkeXebKd7HEAO@linaro.org>
References: <20250126-msm8226-modem-v2-0-e88d76d6daff@lucaweiss.eu>
 <20250126-msm8226-modem-v2-3-e88d76d6daff@lucaweiss.eu>
 <Z5dKxZ-fri8RaTPo@linaro.org>
 <2764902.mvXUDI8C0e@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2764902.mvXUDI8C0e@lucaweiss.eu>

On Mon, Jan 27, 2025 at 11:21:04PM +0100, Luca Weiss wrote:
> On maandag 27 januari 2025 09:58:45 Midden-Europese standaardtijd Stephan Gerhold wrote:
> > On Sun, Jan 26, 2025 at 09:57:22PM +0100, Luca Weiss wrote:
> > > For example MSM8974 has mx voltage rail exposed as regulator and only cx
> > > voltage rail is exposed as power domain. This power domain (cx) is
> > > attached internally in power domain and cannot be attached in this driver.
> > > 
> > > Fixes: 8750cf392394 ("remoteproc: qcom_q6v5_mss: Allow replacing regulators with power domains")
> > > Co-developed-by: Matti Lehtimäki <matti.lehtimaki@gmail.com>
> > > Signed-off-by: Matti Lehtimäki <matti.lehtimaki@gmail.com>
> > > Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> > > ---
> > > Changes in v2:
> > >   - Move MSM8974 mx-supply from "fallback_proxy_supply" to
> > >     "proxy_supply" to match updated DT schema
> > >   - Add fixes tag
> > > ---
> > >  drivers/remoteproc/qcom_q6v5_mss.c | 20 +++++++++++++++++---
> > >  1 file changed, 17 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
> > > index e78bd986dc3f256effce4470222c0a5faeea86ec..e2523b01febf393abfe50740a68b85a04011293c 100644
> > > --- a/drivers/remoteproc/qcom_q6v5_mss.c
> > > +++ b/drivers/remoteproc/qcom_q6v5_mss.c
> > > @@ -1828,6 +1828,13 @@ static int q6v5_pds_attach(struct device *dev, struct device **devs,
> > >  	if (!pd_names)
> > >  		return 0;
> > >  
> > > +	/* Handle single power domain */
> > > +	if (dev->pm_domain) {
> > > +		devs[0] = dev;
> > > +		pm_runtime_enable(dev);
> > > +		return 1;
> > > +	}
> > > +
> > >  	while (pd_names[num_pds])
> > >  		num_pds++;
> > 
> > Hmm, I think you should put the above if condition below this loop and
> > verify that num_pds == 1. Otherwise this would hide the error condition
> > if the platform needs multple PDs, but someone only specifies one of
> > them in the DT. i.e.
> > 
> > 	if (num_pds == 1 && dev->pm_domain) {
> > 		// ...
> > 	}
> > 
> > >  
> > > @@ -1851,8 +1858,15 @@ static int q6v5_pds_attach(struct device *dev, struct device **devs,
> > >  static void q6v5_pds_detach(struct q6v5 *qproc, struct device **pds,
> > >  			    size_t pd_count)
> > >  {
> > > +	struct device *dev = qproc->dev;
> > >  	int i;
> > >  
> > > +	/* Handle single power domain */
> > > +	if (dev->pm_domain && pd_count) {
> > 
> > Maybe if (pd_count == 1 && dev->pm_domain) for consistency with the
> > above then.
> 
> Good suggestions, thanks!
> 
> > 
> > > +		pm_runtime_disable(dev);
> > 
> > I'm guessing it does, but just to make sure: Have you verified that the
> > power domain is indeed voted for off after this call to
> > pm_runtime_disable()? Start the remoteproc and when it's booted inspect
> > /sys/kernel/debug/pm_genpd/pm_genpd_summary to see if the PD/remoteproc
> > dev is suspended.
> 
> Looks sane I think (modem: remoteproc@fc880000)
> 

The modem does look sane yeah...

> htc-memul:~$ sudo cat /sys/kernel/debug/pm_genpd/pm_genpd_summary
> domain                          status          children        performance
>     /device                         runtime status                  managed by
> ------------------------------------------------------------------------------
> oxili_cx                        off-0                           0
>     fdb00000.gpu                    suspended                   0           SW
> camss_vfe                       off-0                           0
> camss_jpeg                      off-0                           0
> mdss                            on                              0
>     fd900000.display-subsystem      active                      0           SW
> venus0                          off-0                           0
> cx_vfc                          off-0                           0
> cx_ao                           off-0                           0
> cx                              on                              0
>     fc880000.remoteproc             suspended                   0           SW
>     fe200000.remoteproc             unsupported                 0           SW
>     fb204000.remoteproc             suspended                   0           SW

... but "unsupported" for ADSP and the end result for cx ("on") does
look suspicious. Looking at qcom_q6v5_pas.c, it uses almost the same
code for single power domain support as here...

What state is the ADSP in here at this point? Did it boot sucessfully?

If I'm reading the code correctly, the pm_runtime_enable() in
adsp_pds_attach() should get rid of the "unsupported" at probe time,
so I'm a bit confused how this can happen..

[5 minutes of staring later...]

Um, qcom,msm8226-adsp-pil uses &adsp_resource_init, which doesn't have
any "proxy_pd_names". It should use &msm8996_adsp_resource so that it
actually manages the CX power domain. Same for MSM8974, but that was
never converted to use power domains... 🙈

Can you submit a patch that changes at least msm8226 to use
&msm8996_adsp_resource? Would be also good to make the same changes
I suggested here (check num_pds == 1 / pd_count == 1).

Thanks,
Stephan
