Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795715521;
	b=hTxKUCxQ+ePG90bkQJYmLqOYRIVXudsMNIdeoDaJsTS8/FHfDApz1557zRLkEh2yAhq1
	 Ntf4J/VQtGmv1sRQg8mC3GIDSPaGlsFIQb6sFcApcMeazS8gHZxBbejnDEmj8gqrpZci2
	 HSK05fL6/jskPMqmzTya7msg1iDvO8LX/3bRpktH2TjqjoWg8l1ZCe8kfq21TaAkRcdTG
	 JhiPfc6sPv72BsnzoyRAvrrRUz56jGN5A7s0EOX2RfMgvCM8lktrRIR8mw7cxMZCIdepU
	 exY/MbKmE4RLfZfqtwV9g8zJM/UsMewZeUWFA+EYqpxTrKKWk9TZ8zMsxo4Hr1lHKdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795715521;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Tjddtb507Sshia+Su5bjA6TfEyt6b7tZhzQxG1nljgc=;
	b=wU0lbS1uftDBUOed6LlCTMONSiwI7kL4J/WIvSkfoXZSyMIuP4Q8HtJ9gz7J98MdXmV6
	 ki977t3ctCcGlNm5g7fBttY6+gdscMqymfNeYcLUureFGdKARMshqGKkDbogu8shV/x2Z
	 Xe7rzjubXKImThgidJuqEjkWi4nzkquCQJZXtYYWQekM/qDRJs2l+wlQyIzs0NJ0ioC+S
	 paGvfrt/SbxlnuJ7yiWt4yO3AiHlE6/WmzPpsC0HmmM+hv5Kcglzov7UPA0qiX0E8RLaV
	 p0fnZEqSPPeGCYJcYzCO+WCKMtXh0u1IvoInKmtMQHXpdO98dV58anPnS7knTOk4IFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=QKXbSnHP;
	arc=none smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C13B606A321
	for <linux-remoteproc@vger.kernel.org>; Thu, 26 Nov 2026 17:52:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C13B606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=QKXbSnHP
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2f037bc348dso58026775ad.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 26 Nov 2026 09:52:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795715520; x=1796320320; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Tjddtb507Sshia+Su5bjA6TfEyt6b7tZhzQxG1nljgc=;
        b=QKXbSnHP3bdiAbAldj63evXjFjZAhK5b2iAAF1yzbqlGxpFk0pr7gdElglvGDBP8cb
         awdIL8Z9Fjo2ZKPFKkTLMoHBckUeEa9Mb76sRl+zrsjEZaDyidQcXxEkBC67nP8jbL6t
         HtE5Lb+Yzg7oExuhykx4AWBlpSVh4FUkQPji24H46KMJelK+x2/87Nmj/CRJBaqBSJqe
         vYQP5F46lOb0sCA1TKfA7jVP70WMIwW0fyqnUAEZ5SKiqHVwYIwsyYLKeXblL6snS0B+
         POmzm7rfKNjYU+i0cOWKouooJWQPgWikfQAnXfDG8xAOqrud7dgzrks0wKYmQb1tLdOk
         TNcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795715520; x=1796320320;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Tjddtb507Sshia+Su5bjA6TfEyt6b7tZhzQxG1nljgc=;
        b=QDOJTLXFOQogmhNtX3Dn96ojBe6GF+LC62shjIScT4SV+6etyTOxeEZFWOh5y3BYKY
         X+9L4LDbtt5FNUFRr9192aWj1A6VwOHWgyvOoo/LjbdSeo4AeLJhcs/oNN2KLhyuI5Nf
         Fb2G+kZ9y/TC4OOClr+HxcuRkU7oAxY8uzS/13iN52f0KV8K9lxi0sPOThKfUlfze7yx
         m7ZDrgcYmDDkGdBckJeEHK7lMPyH2mYVk37gYcyGeGP+rS8YRnBbwHKosYkfDteKiXwS
         1VWaCsnJ5GOMex4amg5Qxey7WD+n8j9QixCSsDoc3Xbb1yHdSW/OEY+GfhQ2LKtVzSAS
         mM9g==
X-Forwarded-Encrypted: i=1; AL+hErHGN2whtQGPQ1IpQbT/dvAoHAY8gJWhaWFoLMQn9fL6zPxCzizHW+NGX4J+LxE3/i4/0tJBx3+Pt/GBDIESkR7+@vger.kernel.org
X-Gm-Message-State: APuU4Z/2BUpvho/CP1CDf4+7ebxb1ltEhEvH0uRYztXRUyGxXJdj04bq
	2OldU9cELv3eJd0Bxtmd1i4OPTYG0//cb09u163u9TKapV5DKoWjxcPYLUdD87rI56I=
X-Gm-Gg: AZFdTZd1nbXfkCtAPm2z3pI0vr+wPI9+n5lu8GAtVENLpU3cn9W0puL8zGj1j7cQVp4
	z9VDI1aJl3lzfQhr16A8yAwiWzvedlhAsSovd7aoJTdAl3ITZonvqsLZOOVxIJ2xYUccftsXnmd
	BKaUNrrZKrZ+HJDuXTaPMJNmV3i94bkhrKfOPKr3HZUxkLLTPgWjkK4gL01q+x1Xb56mrfcF+am
	SqvLS3kPunJMQvMYSbLY4Ph/gU5z16cK7JyJ0w+Y4OL9WIPTfja1nHQPW12LRCXGhJPkId6E1a9
	rSlwZ/NjKtHawTvlPsTjl6po1RsprsyMaGEH/3K+mhOUUayVS3FUvTVWav1yfRTl8AaCBqARIGs
	UKGQV0LU2zS/dYA3UeO+AvYik1k3CbZHOK0pPXhZTp9wXv4Hz1iD0Jh4PP2gTyNJwq33P57czgA
	cVUEPMN77PbZ2TNZnLNNwqAyOfwusUnMeKQHIVd6myrJ6bI5JZmbDRJ4r5DywWeKD2O5+AQXTtI
	WSNZMiQ+Okhc14vzFalx9CuA1nUPs9lapN7iAOUI/6cqP/tI+x9Y/7QVoSeB9HRXrCZMisDvzG/
	zU7Z+TZehWvORVz+nvf5xbgOrjcimMqd
X-Received: by 2002:a17:902:f603:b0:2e9:4f7b:affd with SMTP id d9443c01a7336-2f03efb00ddmr238487665ad.6.1795715520260;
        Thu, 26 Nov 2026 09:52:00 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:ce00:143c:88b9:bd58])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f08164dacbsm76723865ad.68.2026.11.26.09.51.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 09:51:59 -0800 (PST)
Date: Thu, 26 Nov 2026 11:51:57 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Ian Rogers <irogers@google.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, Elkin Cruz <elkin@google.com>
Subject: Re: [PATCH] remoteproc: core: Format firmware carveout rsc->name
 with %.*s
Message-ID: <awhxvZtW_VCOpdfV@p14s>
References: <20261119170505.1515029-1-irogers@google.com>
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
In-Reply-To: <20261119170505.1515029-1-irogers@google.com>

On Thu, Nov 19, 2026 at 09:05:05AM -0800, Ian Rogers wrote:
> In rproc_handle_carveout(), rsc->name is a 32-byte u8 array inside the
> firmware resource table. It is passed directly as the printf format string
> to both rproc_find_carveout_by_name() and rproc_mem_entry_init() (which
> call vsnprintf() with zero varargs), and printed via "%s" in dev_dbg()
> without verifying NUL termination within sizeof(rsc->name). A malformed or
> corrupt firmware resource table containing '%' specifiers or lacking a NUL
> byte in rsc->name can trigger out-of-bounds reads or invalid vararg stack
> accesses.
> 
> Pass "%.*s" bounded by (int)sizeof(rsc->name) at all three sites in
> rproc_handle_carveout().
> 
> Found via an x86_64 LLVM=1 (Clang 21.1.8) allyesconfig audit with
> -Wformat-security enabled; fix and changelog drafted with an AI coding
> assistant. Verified with an ASan/UBSan C test and build-tested under
> LLVM=1 W=1 and -Wformat-security; not runtime-tested with remoteproc
> firmware images.
> 
> Fixes: 72029c901a02 ("remoteproc: add helper function to allocate and init rproc_mem_entry struct")
> Fixes: ffa5f9c84810 ("remoteproc: modify rproc_handle_carveout to support pre-registered region")
> Signed-off-by: Ian Rogers <irogers@google.com>
> ---
>  drivers/remoteproc/remoteproc_core.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
>

Applied.

Thanks,
Mathieu
 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 23f8539a99bd..1b1743093edc 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -837,14 +837,17 @@ static int rproc_handle_carveout(struct rproc *rproc,
>  		return -EINVAL;
>  	}
>  
> -	dev_dbg(dev, "carveout rsc: name: %s, da 0x%x, pa 0x%x, len 0x%x, flags 0x%x\n",
> -		rsc->name, rsc->da, rsc->pa, rsc->len, rsc->flags);
> +	dev_dbg(dev, "carveout rsc: name: %.*s, da 0x%x, pa 0x%x, len 0x%x, flags 0x%x\n",
> +		(int)sizeof(rsc->name), rsc->name, rsc->da, rsc->pa, rsc->len,
> +		rsc->flags);
>  
>  	/*
>  	 * Check carveout rsc already part of a registered carveout,
>  	 * Search by name, then check the da and length
>  	 */
> -	carveout = rproc_find_carveout_by_name(rproc, rsc->name);
> +	carveout = rproc_find_carveout_by_name(rproc, "%.*s",
> +					       (int)sizeof(rsc->name),
> +					       rsc->name);
>  
>  	if (carveout) {
>  		if (carveout->rsc_offset != FW_RSC_ADDR_ANY) {
> @@ -866,7 +869,8 @@ static int rproc_handle_carveout(struct rproc *rproc,
>  	/* Register carveout in list */
>  	carveout = rproc_mem_entry_init(dev, NULL, 0, rsc->len, rsc->da,
>  					rproc_alloc_carveout,
> -					rproc_release_carveout, rsc->name);
> +					rproc_release_carveout, "%.*s",
> +					(int)sizeof(rsc->name), rsc->name);
>  	if (!carveout) {
>  		dev_err(dev, "Can't allocate memory entry structure\n");
>  		return -ENOMEM;
> -- 
> 2.56.1.708.g77570a6a1d-goog
> 
