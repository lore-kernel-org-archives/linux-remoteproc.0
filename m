Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1EF930E823
	for <linux-remoteproc@vger.kernel.org>; Tue, 14 Oct 2025 11:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760441513; cv=none; b=O1w8QY80CBH3tC0KsT33up5yNfasr9xwOfDboJ12XcZ5aXHQy+Z02eQl4+USmvuOVxdyZ+MX6/LvtlA3CnKKp6C+m4bboALjDKR43fE47MjlMkodLTaS+swxlx9YX3fR+xfEjYiHBzMD76g8YgWcSdGyO4ex82M8tr5WfD5g3/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760441513; c=relaxed/simple;
	bh=3w4nQi9hgenkrHPxz75XSwpRlBt74vHGiJuFZQ2tndI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o67FiuIsOj01hIumw/o4ipHGC4+nJLinyhTu9jvbgQxMyYwk21tgKWaaugdxBapcdKUoDlgkxbM3ifJuaWZ7cSvmyB6THjOCcFHrVQFrjJ4yLXLyNCZ1ns2ap76o5ZRJ+/kqGiPxNdAEfQGrmqxx4G8zmzMY+IlsfDkGTSNPGuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BufL00nZ; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BufL00nZ"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4257aafab98so4417271f8f.3
        for <linux-remoteproc@vger.kernel.org>; Tue, 14 Oct 2025 04:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760441509; x=1761046309; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ofkJNulQu/wtU9ucbaTHhfLlEv5BRzrjhZDncPD/y2M=;
        b=BufL00nZh9qhuBc5qgR5Gi7wrEyoyBJ2aCnu38k6xzJqx5c4e7Ofc2nWW7Ckquh4hU
         TffDOrnCd0DEUCpmC/7BZMK89drnwfWoi8CAsatcHK3dkzbLvzHZ0dtRa3KICIqnxJPP
         DE2+mYd4h2gqbI10/7LJwE6YYmeJEOoPq/6M5Gi7W+wqP1WOJjmnYhtgIw4EjEjR6aTP
         f0pxTpmOMWezUCQ4DWxmuFqrEG5MD1Wlb8KTc41UJWNlVHaSY5JXpC0VU6YivRWfvlyM
         PqSsf9u8hBO+wPzxbNtuiwBEReUeNO8ftTLCMFWK/xoA6rjrcAUoZyIGAVtJyLDSF+8x
         n4zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760441509; x=1761046309;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ofkJNulQu/wtU9ucbaTHhfLlEv5BRzrjhZDncPD/y2M=;
        b=ak2ioxElqwN/AHR7XSXo7xgWeBzjGHLa+sQzGUk1fN9kp9miJg6qgNp/JVrOk3Vzvk
         JcNpZ0SLp72rdpKMzUN+DIugkZRC1Y0bBaTQdVICSr44M2eIEeLNIPEZRbuN6VNmdlJA
         XaB7KbvfVNHI4iHRpNsGKFGwfndzX0gvNzWTiBAuEpcJAfsaCKEBh/ZPDZpfxsWdBc+z
         2pq5bzYxgQPkdhKFsYbBP4R52rYTzY2tUT70Kmh8/0zEW36oBAzngRHz47CnctyDbtgS
         rcDY2vvi0XM0TJhs9HeK/IN4k+1aQttV/H8Rb8vbrXoTAoo3u2Vywl1dtv9fUy7E2xL+
         qqPQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2B3juQ20nsKKot/I+yClvLoCXJ4k+Un7jT6QVXztILBE8iLS3t+4HHYWML1HQBcMj5KWWLkd6sssLxFv6byCn@vger.kernel.org
X-Gm-Message-State: AOJu0Yzx6a81uwh973AGgG5WPE7tzEdNT8RK/7EelU9yWS66LylsO/ZJ
	0Q4yF8Vdc3hDPcaE3C9JlqFqnJUaTFRv3SToOXi9lbG9MixlojZmYgx1b4Ta12vlFc8=
X-Gm-Gg: ASbGncv/f2ud+olstWK5t5ocGDccBni4AlDuaECS+zgv3w/UnfUNsYY+o6VHrSYdJzD
	7gtDvbrNY+MxDB8fdRMZwDDp29BLb1ZRwLGNzk1zJHW+rfRdemCOCj2hkOxqbtcu8TdzGjOaaaP
	gRLNNj5uoZl/O42I3hG2d4YIKhQcKXfp3MUdxyvudQsCW493pWQsfm7TuunJ/Tzz99sdrebuhDT
	VEBA+zxyVAQ76PZxpdm7siVtA3x/GYYdP3b8qz9cdBkqfqpgtRxhWfGsOdmLjuEEoAa6dkKH71o
	9bTewNNNuOxgJ/SPnlWG4TcUE0vhN9RmOiHiJfaIeIrahghXpQiANA8o6LFaK5Dqsoncj2gOq5M
	NJul+heDcGcyoCNYUMzipSvGeEpIpFAi6jkCqZYXowP5hWDgZS3U=
X-Google-Smtp-Source: AGHT+IE7JRJVgX/0XRZqqgOQ0IMTJn2bfv2E4RS1BB14d24blTgxq9Or2UqVDIrAHI/wbElOafShvQ==
X-Received: by 2002:a05:6000:43c7:20b0:426:f355:7c9a with SMTP id ffacd0b85a97d-426f3557ce6mr628338f8f.25.1760441509084;
        Tue, 14 Oct 2025 04:31:49 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-46fb49c4027sm234419565e9.17.2025.10.14.04.31.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 04:31:48 -0700 (PDT)
Date: Tue, 14 Oct 2025 14:31:45 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: oe-kbuild@lists.linux.dev, Peng Fan <peng.fan@nxp.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Andrew Davis <afd@ti.com>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>, lkp@intel.com,
	oe-kbuild-all@lists.linux.dev, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 4/7] remoteproc: core: Use cleanup.h macros to
 simplify lock handling
Message-ID: <aO40oQkj9sT78bMV@stanley.mountain>
References: <20251010-remoteproc-cleanup-v2-4-7cecf1bfd81c@nxp.com>
 <202510121908.7aduLIkw-lkp@intel.com>
 <20251014104511.GA14479@nxa18884-linux.ap.freescale.net>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251014104511.GA14479@nxa18884-linux.ap.freescale.net>

On Tue, Oct 14, 2025 at 06:45:11PM +0800, Peng Fan wrote:
> Hi Dan,
> 
> I am not sure, Is this false alarm?
> 
> On Tue, Oct 14, 2025 at 11:39:41AM +0300, Dan Carpenter wrote:
> >Hi Peng,
> >
> >
> >vim +/ret +1841 drivers/remoteproc/remoteproc_core.c
> >
> >70b85ef83ce3523 Fernando Guzman Lugo 2012-08-30  1829  int rproc_trigger_recovery(struct rproc *rproc)
> >70b85ef83ce3523 Fernando Guzman Lugo 2012-08-30  1830  {
> >7e83cab824a8670 Sarangdhar Joshi     2017-05-26  1831  	struct device *dev = &rproc->dev;
> >7e83cab824a8670 Sarangdhar Joshi     2017-05-26  1832  	int ret;
> >7e83cab824a8670 Sarangdhar Joshi     2017-05-26  1833  
> >c42baf6f84c7694 Peng Fan             2025-10-10  1834  	ACQUIRE(mutex_intr, lock)(&rproc->lock);
> >c42baf6f84c7694 Peng Fan             2025-10-10  1835  	ret = ACQUIRE_ERR(mutex_intr, &lock);
> >7e83cab824a8670 Sarangdhar Joshi     2017-05-26  1836  	if (ret)
> >7e83cab824a8670 Sarangdhar Joshi     2017-05-26  1837  		return ret;
> >7e83cab824a8670 Sarangdhar Joshi     2017-05-26  1838  
> >0b145574b6cd2b3 Alex Elder           2020-02-28  1839  	/* State could have changed before we got the mutex */
> >0b145574b6cd2b3 Alex Elder           2020-02-28  1840  	if (rproc->state != RPROC_CRASHED)
> >c42baf6f84c7694 Peng Fan             2025-10-10 @1841  		return ret;
> >
> >Please change this to either "return 0;" or "return -ERRORCODE;"
> 
> ACQUIRE_ERR should already returns 0. This change does not change the
> assignment to ret as my understanding. Please help to see if this is false
> alarm or I miss something?
> 

I guess if this was already merged then it's fine.  But "return ret" looks
like an error path where "return 0;" is obvious.  This code will always
trigger a Smatch warning, and I always tell people that old code has been
reviewed so all the warnings are false positives, still someone will
eventually change this to "return -EINVAL;" because it looks so much like
a mistake.

regards,
dan carpenter

