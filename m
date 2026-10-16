Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF49738A72C
	for <linux-remoteproc@vger.kernel.org>; Fri, 16 Oct 2026 14:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792162365; cv=none; b=DMQi/rgxeMcHgmeIa/+eCbpMXjOnwXvM2Sipg1WqTcR2J/9ydwc8VYBu25MgywU3HcYeCVDBOfSk8heEYC1MDS57NdDATgMQphzgAX3R/BPKsql440njKPAYsArvfECQvDZdJFkMFC/1qiH9xpWqEuZnLenQ065jqCCcBbLM4nA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792162365; c=relaxed/simple;
	bh=wyiMk4hONwFxYLA7nMuP0zItich67IsNA/CfSKVmG0w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QmNDdujNKAOoILnnHPufwrb2JIe68h1iW7q+zX9+xc/IM0ndj0/PIII2p0ZFymiNBkL0hzOO+ghbvzn/LZBF/D610BQ5QNVnxKomb4zeigvfxlBuhsPlVY2UZo13WTLVAOTldYZzL4h5twl/R/EcauD9JLqaTAp66WhVYMHlqZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zjJ/fB9d; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zjJ/fB9d"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3ab4178ee33so59152a91.3
        for <linux-remoteproc@vger.kernel.org>; Fri, 16 Oct 2026 07:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792162362; x=1792767162; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TE/6RzGv7jJq9CwfLCuEzYgVfWFh4QPtLCq+jerO/7I=;
        b=zjJ/fB9dxeR/PAntykLId6rysjdfqDPYdt79k9Wk0f2mpGN7cqNJVoFewwjTMBx0K0
         qcUQBtatNhVRmhhB1Z/OY5jyDd3FO4FrRbImbvYq0A/GMhZVOPd2bL/NjdMhBCCFohAv
         ydNttxOYaElFTSHVPDdvXODCpDg4XlwUN1aEYXI6X40XAsQumeVtxyHPO9CcoWUV13gl
         hj50XGmo9Lw+ARYDxiBfdLDBuMFg1yy7n9pLCvHvfRaRa2UfUgrVlz2koEd4ep7DBqJ9
         1HjYHyzAESMZbReQpmbW4LJE5XBG2QO/tK2sRKYCb1B2b7sV7NvGfCTG92ZyW5cmfnP7
         N6wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792162362; x=1792767162;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TE/6RzGv7jJq9CwfLCuEzYgVfWFh4QPtLCq+jerO/7I=;
        b=rAO25HKt07i3hJ6K32eSTjJxjF01brokZF3exnE69ikIEsBH4XA6E/zbmBuMk+SE6P
         jCU+XenohZJMfiAcrUgk/oxLc/0Vu98cDA/KQhvz9qMV2mMQ+bffYegNdkp7YSZkwzq/
         Q14QrFNnyEMsRnbAbezRhght652ubo9QrXsL1k8vq7Gu3com/6G2N5t3w96nf5UUf31C
         2RlnMrLen5W6cIdAHIq8hhH5qmJt3qr09+gIG502WvXUucMqQwtOi1Kkv1JkAyVJws25
         p5YJM+0iSqu2JZg8CoATK9844dDK/1RZPXcjOW4CYx/woLpFWNQEggEothN2m56Pc244
         8fug==
X-Forwarded-Encrypted: i=1; AKwUvBx+UBbEWrWy5S8IqVwhB2EyHkLVkhWUjkZiVrEIPZbDjcPIHhkerPunIZoe1QZjDcYhPr0MDaMw1dF8r4DtXqaX@vger.kernel.org
X-Gm-Message-State: AFq9FYL7PWTBoc7a7sRKi0Sqs0IDyHvkYfY7gQZwb3p+CGZwiRojqvbX
	B0WoF9HqsRJ3eWLvcbaTEzA8P76dvxdyjUMnsge9oeNrKTbB3GEMET5p09556yqjprk=
X-Gm-Gg: AYBFou0Q+ZIZbQWcD5yTmRk1XmoUALzLQEXLjRexfo2zEIGXAWiLYf7Upc94zCDT8/P
	Fyd+AhL1DTvMT9jZWS7gnNkhCk8FswSD+NflctpOAFJRhmzIqdA+tFCvRWfmpywONJPhrOmBnCe
	XP38dNYSkgTRm3fCsg9eG6vc/cwrUn5bIX4oC1WNSYjL7RVwFBA/PGJ5671vGlqx29lbhJvDglN
	sEZATCVz0ktqwDwFabv6Rq6T+CoizpLCTpIfPqn71PnChhXY1DI/aHvlkzk+6uP5Pszdv1j+I2H
	FpGzAFVcKoh04GLzBYCyLt66V0Nw2fb1lV29CGm1vptvOcmlPum8e1a7H7PYZgO1rXRBXqB0xL9
	s//eLA3mq42tVVpnfjJLCjr2pvuMN494zgr4y72YUmk3lbFEItkfJGcrswd9VmQzbeieq5YIimn
	xpi1hhlF43qOvCEr411CuLRK0bAQMwxg1nUhU0yyr1Auq8jZq+Cjuc9qeJZuR0h7bkZQU7evsGS
	A==
X-Received: by 2002:a17:90b:2688:b0:3ac:a11a:7c7f with SMTP id 98e67ed59e1d1-3acef13e5a4mr57248a91.23.1792162361887;
        Fri, 16 Oct 2026 07:52:41 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:ff2f:8a9c:5623:f753])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac94794dd9sm9514599a91.12.2026.10.16.07.52.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 07:52:41 -0700 (PDT)
Date: Fri, 16 Oct 2026 08:52:39 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Atul Akella <atul.akella@gmail.com>
Cc: bjorn.andersson@linaro.org, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 0/2] remoteproc: mtk_scp: fix da_to_va() bounds checks
Message-ID: <atI6NxHI6zgTb3-s@p14s>
References: <cover.1791198233.git.atul.akella@gmail.com>
 <20261015151938.1331-1-atul.akella@gmail.com>
 <atI5VLH_CiIBu0tq@p14s>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <atI5VLH_CiIBu0tq@p14s>

On Fri, Oct 16, 2026 at 08:48:52AM -0600, Mathieu Poirier wrote:
> On Thu, Oct 15, 2026 at 08:49:38PM +0530, Atul Akella wrote:
> > Hi,
> > 
> > Just following up on this series. Both patches are compile-tested only (arm64 defconfig, W=1).
> > I haven't tested them on actual mt8183/mt8192 hardware, but I'd be happy to help with hardware testing if someone has access to a suitable board. I'm also open to addressing any review feedback.
> >
> 
> That patchset did not show up on my radar because it did not include the people
> listed by "get_maintainer.pl".  Please resend with the correct recipient list.

I just noticed that individual patches had the right recipients but not the
cover letter.  Next time, please use the same recipient list for the cover
letter.  I will add your work to my review queue.

>  
> > Thanks,
> > Atul
