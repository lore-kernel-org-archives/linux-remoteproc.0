Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793640270;
	b=3zIHOYR6eYkvraRWgwEKuMqMZwYiIbloVZqN3glOsS7FuEz2PbWUKbvoCu5NjfIM1llu
	 sUBJojXo1L2CBnyBbORrvC/4VwDaMIJ5OQqvi4rohbAub9G4c6rNdO98Im1+tH161RI7l
	 m1X3OkJomv91kFj0joSHBXLmGMUwqP2ykTvV16sgy39Wx+m41uaDkCaBWtcMgt/1Y2863
	 WKzf/ivdFCr5/5CBn2SZfJRK9FhpLOMhzZu2XKv59PQ36irCAsdmgZWiizQ8Go6diAArB
	 0mG3iW/bzn6MgtVn45KSWtfoxp3LRKYHktcHm5hKnNNdxYhcj0ccwXfOPz4KXwonHAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793640270;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=xdytGrPlpGFTk5awPgk2czScwft8V8W3JYygW4Hh5Uk=;
	b=DRd0jM5tC6RPwHfrvbVrPng8H9Vt1lUeLHDH9WG/Wncges9YCGnFuELWBXkgvXvXSif+
	 qKarM6ojiH7fcSt0B4AOo6AL+ynr4/CY9eVbpuvgCb36YGISjFrUfB3BQvjZUXX+2u+YN
	 PUGVfKQiGQie1sqye3QW5SXtLynV6JKMkta8dhTZDJ5j0uo5ERBhywXdqykF8WKzfWsUY
	 6/WSdyUiTKo4VoFrIU4kmQyfYp4/ywjDtBBh3SZTnBf9SpXMZBdih2XGpGELG+ruUxMAs
	 k3Sb4JJXrXrMVhlfDaPrn4jmovutxbBwtWRaZsSHAVd0KYwuJVBl0B5OLU6IK2FU4sw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=RvmqQ8aj;
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 965E5606B922
	for <linux-remoteproc@vger.kernel.org>; Mon,  2 Nov 2026 17:24:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 965E5606B922
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=RvmqQ8aj
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3ad2b3b1c02so1760776a91.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 02 Nov 2026 09:24:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793640269; x=1794245069; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xdytGrPlpGFTk5awPgk2czScwft8V8W3JYygW4Hh5Uk=;
        b=RvmqQ8ajJTvbDcCWikQ9/sotN3YSnx3eae5cVDBd7qlSfsuc/MQfgTlPwKg/KtsOQu
         ZwJ7C5MiuDI6rUwDhFNPrG0MNdCXoKWeSDMyMT3tM7eKcu51iy5gSe91QVcYQ2Cfa5Q3
         QVGrLnVmxxU7rt2GX0l5WfihR9qCzQI32z2AePFOWGmTBcsIDJRJNh7ubCc98WfdUI2z
         rSLzn4FaeNxp1Hq7+VZQVNvr8yv2hpNvMo4UgHRe4nsexYyK/kZSOA03aJ8ItZhZNXFJ
         OIhLg9zlan02EF5HkrKpFtpAlYMdnXH8crApsOvVAX48XdF+UcDqka/aUUpzO98vp3GS
         iDQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793640269; x=1794245069;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xdytGrPlpGFTk5awPgk2czScwft8V8W3JYygW4Hh5Uk=;
        b=uj7R6Z3bRJ0blt8vORQPHnr2FIL9NS8HL9byecYITVrHOV4oPepAlT6/sduv1tQ39s
         mdt7fbbTCuFgWHVNsFP/CnW4/S0d4V3p78aATJEhLJjdhmWEKT72XaCBP7mDfYQWoko8
         v9GI5FGkekDUmbHV8SuXoPY7A4SIw0EjtZs2uOgI39l2WD61uw6s6Lk8w3v2UBE7tWKR
         s7Topw54z/vC7bmVtk+dav4aLHKfxDtoV9xTHt0cNG7R2+44Mj+AdpkbvuuvsAO/Dylt
         tgBhTsUaGV+C5WitM5tnMBgvO6aRAoxn1bwAeVdL0i0sJL3NApeuA//ugvA7Km3jp0KI
         w9eA==
X-Gm-Message-State: APuU4Z8ibJDcB0kjNNfwl0cOtvxOZWXy9O1rZWqIGI47ii8ekObj/ow7
	CcS1Z2jypTU4CcncUpXCTaTmngS+Q/aJs8STp1PV/qbyEyVp8YztBNNqDC1m7GN2sg0saJtIFEg
	3Yqy1
X-Gm-Gg: AYBFou02kpnYAqT7IPaHTJKCxV4A4ni92ksEe8GRn3+G+nIbgxKn66D6uaEjnuXYdAe
	C4X8XLy34jF5X4U8hQSvC3p2wReI5tmFQWNSz6Mqv9tDwNTFVJmxh0glRPh75pFqc+1VLJqGVKs
	yy0qExGL0PeqpqZT2OjQ7p3c+ynvbZn5+mNulPtNkdflpPqHd6qDrzK/eApLanBQqS/rUAItbEd
	Y/0QdRQsiwnag2cPllIShz8N/ifw2S5kvkpFHP4ywVAegkVe3Gn/+bGFBTEMMwGB+nv6YkA4aLQ
	AyqKdbHI5IG6JvFRrV6ENt1aLZZYehgXgSZT2uzViFbRDtOFpuBTgz380dyznJCwbWRFhl1G0yp
	drUlxaLqLoAI2q2kIarjyP+w3zMnhqtg8YatS7g5fRbIXQh/mMb5WHBH4x5CeF0bWa/D1qHkSuM
	fi3lrcOM/M2ujkiW9KNOmgi+EKSsUkUkOgf2N9Y6FqzaZqVyZJo3z2mj5BmQkG8GMPZLv+f7tbA
	JAfn64WpciqrSm3y3uSK4IPY7MHEgwTT6jtFIfmVDoTJT87o+ydfXk4wvrxMwI1PcKrUCrVk2mD
	TglRBwwCcr72pJx2blERL9SvggO/ujk=
X-Received: by 2002:a17:90b:580e:b0:3ac:9176:e837 with SMTP id 98e67ed59e1d1-3ae89835172mr8035454a91.50.1793640268751;
        Mon, 02 Nov 2026 09:24:28 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:810a:982d:b93e:e497])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae85cb91e5sm8643103a91.0.2026.11.02.09.24.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 09:24:28 -0800 (PST)
Date: Mon, 2 Nov 2026 11:24:26 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Atul Akella <atul.akella@gmail.com>
Cc: linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH 0/2] remoteproc: mtk_scp: Fix bounds checks in da_to_va
 callbacks
Message-ID: <aujHSnaooQ3QPTor@p14s>
References: <cover.1791198233.git.atul.akella@gmail.com>
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1791198233.git.atul.akella@gmail.com>

On Mon, Oct 05, 2026 at 11:25:16AM +0000, Atul Akella wrote:
> mt8183_scp_da_to_va() and mt8192_scp_da_to_va() validate the device
> address and length that the ELF loader passes in from the firmware's
> program headers. Both checks can be bypassed through integer truncation
> or wraparound. These two patches fix them with overflow-safe comparisons.
> 
> The fixes have different origin commits, so they are split for stable
> backporting.
> 
> Compile tested only (arm64 defconfig, W=1). Not tested on hardware.
> 
> Atul Akella (2):
>   remoteproc: mtk_scp: Fix bounds check in mt8183_scp_da_to_va()
>   remoteproc: mtk_scp: Fix bounds check in mt8192_scp_da_to_va()
> 
>  drivers/remoteproc/mtk_scp.c | 32 +++++++++++++++++---------------
>  1 file changed, 17 insertions(+), 15 deletions(-)
>

Applied.

Thanks,
Mathieu
 
> -- 
> 2.43.0
> 
> 
