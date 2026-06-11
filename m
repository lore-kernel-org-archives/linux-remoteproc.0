Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A34F3AB496
	for <linux-remoteproc@vger.kernel.org>; Thu, 11 Jun 2026 09:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781171693; cv=none; b=WbvlGA+YVB+yaKK35MM04r4NqoB/rwbGhNJgiXA+0suacHdLu3kx6CVTKWvglHKOF7GDqwbFNGuZDDKN8p47GXditubYGkGSWKmSyo+tg3tgJW+1Ij0XQF8e5768KUANvuY6uu3nOQM6r2mV3BfNR073Xn+17kJXtdzJQPEAZbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781171693; c=relaxed/simple;
	bh=1+3ass01TybJsEp30cS9q0b/F8f1AoaZFRv0UmsyJYg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J8+N17vkfNr1r1J7Pzn+TWSeENEtGIrmiYwAvI0KfeK9VkxkhqL0rjK+WipUIkQS3KZXSkEY8U636YL0l0OLOolzC/UD4/uj9OB+n4gfKfdoV2m9EI8zVRFkcq9P1Y3QdwksDILqVwFSQKCHMFQJW84w0H+iEEaT9Oq5wOnms08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=F0xJHPul; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="F0xJHPul"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-490be03d47bso69109995e9.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 11 Jun 2026 02:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781171691; x=1781776491; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/z2DCk4dynGP3EOhfGPH5RufQFwqe2sDUjasxzmGDhc=;
        b=F0xJHPul8KKbkFh1xHEQ8qciZ3tvo/vsQeaag74H0Tyxetj5fZz3OEvfmkKF1umcks
         LQn0Zyuym7E3AH6wb6ReNWKulQzjM6LUSr3nCoZv6Uo5m16vEF3b+UYFMv5sYMP6b3xV
         pS5hAUi+nfZUT9wCogzX7ivncczZrLKZTwW2t5UdvpWrF/z4jJvRgSk/k2uUJiIDYPIc
         QupBYL0O2kUma0+OSjzMO5A+xa9B9evhAFBolXkLE4mSAclBVdE+lX+Gp/tVGq6vH/PT
         thy/kXlAr8q4oWjY5SkOrioYt29iplAQbL5BDSJKBHOwgKc6ySu2foZnVp4iiybpH34o
         iEdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781171691; x=1781776491;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/z2DCk4dynGP3EOhfGPH5RufQFwqe2sDUjasxzmGDhc=;
        b=k6agte+xEXofCvOOA4cK/Tr1nhKlBO389nXK1IfPoIeQ5bBpFA20wnuOMNHT5tUB2u
         fN9PxzApRrr/eIt/HwQ+CTs2qLdWw6nAKivybELyr34M3LHEMITgjUAo1sE17Qt/xlV2
         0ZbTgyX308ADDIVjpeByGuwwiVnFN0aYZFEAI1zlZzEux+22A7pJJmMWdLXA3zhzjLaE
         a4JDd5fhK3eURG8NwS8xSHg9omeTPCL43Qj3WXwPxS/XgKfG561gufsVIgKCFMA3WU0g
         5oNz9ZuGpxFuSB2y+KMj2xGr22lBnH3cUA58spg4TKFvzAZ17eQJwdYpkszvo3Xd5Fvw
         gBOA==
X-Forwarded-Encrypted: i=1; AFNElJ+cKD1yaCz3bSdHIhV/Wd3P0sDe10y+qIF4sF28p2F+T9o9bj3su+qdCdRIXkZQxcWALjRO24zI1o36zVmdYXrd@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5R2tDFO9hipALHXsae4ateamNHznW9arKP8/Fz7TVFnDCtIwp
	21UpvI2ZfsDVdJLklfl3Gu2QE4YLhYd8DISxcGQzx6wxsZTkUW1FPrB30mbaccCIOMc=
X-Gm-Gg: Acq92OE5MsP0sjxoiMHuzc8vsRRbgLhcDi/oV66RF2lWg6dfbbqoBgCweMujOkHTH1H
	HO45YFqVN8VrA1+ZPBfu/z1Abi1YzAdCrA9puKGGhPfDYfhzDtC6HW6xExQxLjXQWFKuOUOjW8+
	XWJE/Sacn/8y+S9DtTSWaOqSyABm47tJwLrXYLZg+6C9ArIiWBDtooJEmRXZA8RMD5qzzkyTjQU
	4oe0Nxtsmk70r66W8JMLURNCsaajs7niOKk2qAS/2wQKwz6n0t+DJcmTooTs8kMDltnTRru+maT
	2GPZgqqB1cz3BRlu+Dy9du1JRQf7T2b5p3ekr+k7AGiL6RhAnYN/yHNRY6asGfnQHIRZsTNz0CN
	qipVCpzafbMwXDE2Y5YtvE8KwYujcleJfAgrvh2V5QL1YUkDUdw/3ocLuFK1ns+KIjAGbvh4bwU
	uQ3MPradiN8PbKu8oyL254nz9XUZ6EQeC3fTl1umlKscTmIw==
X-Received: by 2002:a05:600c:c0d5:b0:490:44eb:c1e5 with SMTP id 5b1f17b1804b1-490e5624838mr23357035e9.31.1781171690745;
        Thu, 11 Jun 2026 02:54:50 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff23:4410:7bb1:6476:9114:cf39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490e52ac9aasm36942655e9.4.2026.06.11.02.54.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 02:54:50 -0700 (PDT)
Date: Thu, 11 Jun 2026 11:54:46 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 2/3] remoteproc: abort subdev stop sequence on first
 failure
Message-ID: <aiqF5mh1PvWpH3L5@linaro.org>
References: <20260611094851.dkg63rqztsv2pre7@hu-mojha-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260611094851.dkg63rqztsv2pre7@hu-mojha-hyd.qualcomm.com>

On Thu, Jun 11, 2026 at 03:18:51PM +0530, Mukesh Ojha wrote:
> On Tue, Jun 09, 2026 at 01:43:17PM +0200, Stephan Gerhold wrote:
> > On Tue, Jun 09, 2026 at 03:52:52PM +0530, Mukesh Ojha wrote:
> > > If a subdevice fails to stop, it indicates broken communication with the
> > > DSP. Continuing to stop further subdevices against an unresponsive
> > > remote processor could close rpmsg devices that could remove the memory
> > > mapping from HLOS and in case if remote processor touches those memory
> > > can result in SMMU fault.
> > > 
> > > Change rproc_stop_subdevices() to return int and abort on the first
> > > failing subdev. Propagate the error through rproc_stop() and
> > > __rproc_detach() so callers are aware the teardown did not complete
> > > cleanly.
> > > 
> > > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > 
> > But what would callers do about this? If you abort the teardown sequence
> > half-way through you now have an inconsistent half-stopped state that
> > neither a new call to stop() nor a new call to start() could recover
> > from. That doesn't sound much better than the SMMU fault. Or am I
> > missing something here?
> 
> SMMU fault result in device crash while other is non-functional remote
> processor. From Linux side, we do not know the state of remote processor
> when the timeout happens..cleaning the subdevices can result in the
> debug data being lost for hung remote processor.
> 

Ok, but how do we go from here? Do we expect that the system would have
some userspace monitoring daemon that would collect the debug data and
then reboot the device to make the remoteproc work again?

With these changes, I don't see how you would start the remoteproc again
without fully rebooting the board. Calling start()/stop() on the
subdevices again would lead to crashes because some of them are in
started state and some of them are in stopped state and we don't even
know which one is in which state.

Thanks,
Stephan
