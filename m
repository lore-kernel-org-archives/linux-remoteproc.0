Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795104909;
	b=A/aGO6G0GGNvBB4KXRks5aalXp3Lllbs+OK7xWJ1cLWRS76rU8g6zOgYLHgruN86/AUz
	 bfmdyJduqWvbkFDkTMMtEuQ5GpubfjbmGL7ktVQco0mRnGsRXqNEjuciS+PV/aiCuv8RO
	 ssmhV2LvssOoMeBvaWA9mUiYwm/l4Ff3kh80UZpX1XrdAbqqvEjI7z0D4TXJdbkzBupsp
	 wgfiRA+fPma1rDqF2katCI2naR1RQY2GRJzMc0S5szePSZZawDz0Ao95sdvL5IJD8UFjw
	 mWs7Qn0cxPPjVrjDhU40vFzBSraGidTMictdURPX1mtir2hDRCuWZuV7gNcHUQeiS5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795104909;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=T4XXFlbULQ2nlQDKlkc6yvG+h6ov3GlTKxgkovItaYM=;
	b=iwXs2SrGILXQPrWGtlw8H1r78V6EtD2lwkVdTrO3ExP6Kp/tMyv6kUhYY/3fq+VqZfRp
	 +j0K/lAQrvICvEj9m7JQKxEG9Xedz3gy3uXxuSD31CtAncAl6E5tH1+e6riHadW4xIpMO
	 ZU7FftlJOdijlF+vzpYiFBx3w/XixYkb+t+NFCPq76QVa98jraUDdbfz17kc43LuEZAOW
	 lf20yYUTWFathcdShOMAodcvtmAAfxmcU1kKs1PLpOEogVN1rwRMJ7JZfun/jFMiC+DAI
	 2U4sUMR/ws/xragJr0j7yBL08i464FS0bJrXgFvDiUIEX9fayZ03ayA3pWGzntrBLCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=nF7KCEXV;
	arc=none smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B9F5606A331
	for <linux-remoteproc@vger.kernel.org>; Thu, 19 Nov 2026 16:15:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B9F5606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=nF7KCEXV
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c4d427836e9so335121666b.1
        for <linux-remoteproc@vger.kernel.org>; Thu, 19 Nov 2026 08:15:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795104907; x=1795709707; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=T4XXFlbULQ2nlQDKlkc6yvG+h6ov3GlTKxgkovItaYM=;
        b=nF7KCEXVOJWPVyLiyh9gH7j6TgFIshYrCfF9a0YLidBgWbQthopZ8X2XxlMIy8y/oh
         9+jAjo+uOTQbxl82APPj/R/l/JgRavu7yB80ikV6WLGXUkO27NLpZT5H4KvwdrWjt67l
         HUrS3WJWRDgnZyG9KpvACEv13gKwz+ei6ER/NSpbtsLskMyMUfQnE28bjGigM0I2udwV
         9P4R4DsKCnsb5aZ3ap4ZGUxyY4+05QCyB6d24j0haA+9Oe2HRNFd8+9hg9qmsqBFX3md
         le7PeMLrelKN+cLHMOWq++P81fcQgGCR3SwpuRA6gAhF7Y62xOg6PfzZW20Hlx1IdSIY
         CvSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795104907; x=1795709707;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T4XXFlbULQ2nlQDKlkc6yvG+h6ov3GlTKxgkovItaYM=;
        b=aOEqXr0EfkGFNBOXiosRN4xa4cgEjVMmFjZ9xjflY3GBSyu9ewp+jn7hCAIFQJzXPu
         ahChJwoAItbPWx8Zyx73LBA317h7fJ4wxL4Q3PhRmxWbFJtbkDLxoBHWWebC0GwSY/bT
         RXh7Pp8PoSdB77yk8ZsQxNOs+6szUntPYyvDgcCW8Iw6LaPePiIoCutpaxQZZkhhvlQD
         fObXaviWSntBKeRI0C/0QO1YUugO6yWfIxjox+Go18R67LTxS+7ykTP+381nzYjhxUqB
         kRmnudEyCKMi29lpv2FapPXBIbA2sGA71qL9F3x4x2Y7z4DWBLAFgJKuyQ+pYjs4WzWw
         +SaA==
X-Forwarded-Encrypted: i=1; AL+hErGGXzQXEWXUcmULqB/xZQvIJSW4SjD6njcK9+lRDJ/gVylA4UOi1lE86RmZK2zswBLg0BF44vPnwQyyeZvoj2nA@vger.kernel.org
X-Gm-Message-State: APuU4Z/xs8eFpY0f3Eo7NVJOUlwyHmuz5APkUF2Zt0kQU5hxU7UdbuKy
	pDlaymLRtpW3sKVELdUNYtqdtvfegeRZPURY+hKMyiLUFWKJ3vzZ7idpM216sb/poms=
X-Gm-Gg: AYBFou0UJV0xK326vl0VLJnWOK0pj/HF1isTUfE14sHOo2/WmHGIl+dmZ65Hq3Woc8a
	rzmcLYHlcgiFgfOzF6209QrlGlr9m9/mIcjyE9UPKyhRw1xDE03020cQhV7HuctUnwYdDSYwtgi
	8tajGxuN7xEhk0863WttyT+3Rsy2l2xCyDOhlCcisD1Je9t1xQmmiD2OnLZSHSD+T9tmT83xraq
	yNtKkLbQ7O2Qp2ggAsTfOLYxD4Da3SKXgYhWCVZwRBXyeVDxCq7mpOl3fohfxP5BemAKVoRlhEW
	3z8S9nSPFotv77U+ZABDw+k92g0HKeJbkOgwK3fMLdWrNMFuU7enpyyQ8P2ZDfCQMfFbX8gTCn9
	OHPaeohUSWDowgAHUI45UMGmEhLWycXKCHlhvDNe7lCW9zzsfFFeZWkgodJOwJddAPPXVhWjlsi
	buWUiOFiVgBpi29UKaba+xRVwRtb8kEzafd8KyWY+Dt0C+vPrDckcw2Xbgb+RgyGOLH9DR3HD7R
	01WdthzLHOIK52e1DnDC9ZGiTkLJX+hnUVogBogLZfOrt0bfmlO/AeG2qSQh8EA0x6DQcE0Fszq
	hVpBIABoRzHJlh/T7b+T+Vp2PvGohy+f
X-Received: by 2002:a17:907:2d13:b0:c41:21ef:26ef with SMTP id a640c23a62f3a-c513aac43a9mr40174166b.20.1795104906817;
        Thu, 19 Nov 2026 08:15:06 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:9bd7:226d:1022:f6ef])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513acff65bsm16082866b.4.2026.11.19.08.15.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 08:15:06 -0800 (PST)
Date: Thu, 19 Nov 2026 10:14:59 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Ben Levinsky <ben.levinsky@amd.com>
Cc: jassisinghbrar@gmail.com, andersson@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, michal.simek@amd.com,
	tanmay.shah@amd.com, linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/6] remoteproc: amd_mbv_bram: Bound device name
 formatting
Message-ID: <av8gg6d7eKwpfcTQ@p14s>
References: <20261105051902.1646651-1-ben.levinsky@amd.com>
 <20261105051902.1646651-2-ben.levinsky@amd.com>
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
In-Reply-To: <20261105051902.1646651-2-ben.levinsky@amd.com>

On Wed, Nov 04, 2026 at 09:18:57PM -0800, Ben Levinsky wrote:
> rproc_mem_entry_init() interprets its name argument as a printf format
> string. Passing the device name directly allows percent conversions in a
> DT-derived platform device name to consume nonexistent variadic arguments.
>

I read the last sentence of the above paragraph 6 times and I still don't
understand the problem you are describing.  I'm guessing it was generated
by an AI.  Please refactor.

 
> Pass the device name through a constant format so it is always handled as
> data. Limit the formatted name to 31 characters to match the space
> available in rproc_mem_entry::name while leaving room for its terminating
> null byte.

What to you mean by "handled as data"?  Moreover, the size of
rproc_mem_entry::name is handled properly in rproc_mem_entry_init().  What am I
missing?  I also suspect this was AI generated.

> 
> Fixes: f87b4998994e ("remoteproc: Add AMD MicroBlaze/V BRAM-based remote processor driver")
> Reviewed-by: Tanmay Shah <tanmay.shah@amd.com>
> Signed-off-by: Ben Levinsky <ben.levinsky@amd.com>
> ---
>  drivers/remoteproc/amd_mbv_bram_rproc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/amd_mbv_bram_rproc.c b/drivers/remoteproc/amd_mbv_bram_rproc.c
> index e4a103cf8455..6cf33c7b7e64 100644
> --- a/drivers/remoteproc/amd_mbv_bram_rproc.c
> +++ b/drivers/remoteproc/amd_mbv_bram_rproc.c
> @@ -72,7 +72,7 @@ static int amd_bram_rproc_prepare(struct rproc *rproc)
>  				   resource_size(&res), da,
>  				   rproc_mem_entry_ioremap_wc,
>  				   rproc_mem_entry_iounmap,
> -				   dev_name(priv->dev));
> +				   "%.31s", dev_name(priv->dev));
>  	if (!mem)
>  		return -ENOMEM;
>  
> -- 
> 2.34.1
> 
