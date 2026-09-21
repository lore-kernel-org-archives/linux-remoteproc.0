Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FACC225A38
	for <linux-remoteproc@vger.kernel.org>; Mon, 21 Sep 2026 03:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789961485; cv=pass; b=WyDvz9J9E57cZj+Ic8PuhsC/uuLEco3WOw2ggCaQl1z0aCz3U5FuifpyVs3bA+rrDAiP3+i+iz6oCwqjsNAv36C1KsNunehfP5hX1L3kIQz5BVnXcsnwaHqjlRP08DUfuy4K2NAQU+VoU1UqGDkzW/lCxsIItPp8Yazg1yISXEw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789961485; c=relaxed/simple;
	bh=1JgJndpiQjTJjF4DQFibfiYrBkEpUhcO1uo3E1MTk/w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bquGRLZNOUBLYcH3Sddk9O1yMcUo+q3tN56Hld4bFP+Bz6jxbyC65R61QF6/xxU3i56kzI56lxYilv/TTnwzr4avVRbzL4E2rDA8/1Fr/gf2rv6SN1yIUh5+ThKBTFshCNQcTzZBqBo0lRLd2I9GFUsaW3SYtiswjxlKUAGWziA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=liXP9qyf; arc=pass smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="liXP9qyf"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a98dfb8002so3469117a12.2
        for <linux-remoteproc@vger.kernel.org>; Sun, 20 Sep 2026 20:31:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789961482; cv=none;
        d=google.com; s=arc-20260327;
        b=RPl4n4BlCKpq3k0aOV0c+1QqOWMU16xNmwODD68RbztN7BBI0zCUd+aH+bHopxNphE
         CoauwxA/cKEYPnFMtmu7HF8WRPdSt4SB0dS3SmycyrNNz741a/LBAS9Y6zY9w44io1/A
         +K8WSaykdFg0jvIcSoGG1o3hVjgH5RoFxFM/dSvHIdUhS62hbxc5eILtbj2ol3T/Dm9f
         WJQLfSAP3jq+GcCClC3i8TlOOWuy9sJvkNRSqbBysWcKo/u46gULqtItTZ44fJy6JjO2
         vrCgepZoLVsQCoJlFKrv2xNJLAthDcLd14szxbMLs7xpNHpY5tKZgPHaE1CXmA3s3iUF
         PG/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=1JgJndpiQjTJjF4DQFibfiYrBkEpUhcO1uo3E1MTk/w=;
        fh=xczcrAC6xPwlpT2PxD/yqbNKQBOYm21tmyZvEu3Vdqs=;
        b=DBTplUN30kxu514lJz6/8zgTCYeyvnBSk8uOWWkv8wecg+x7LkQ9YeWkQs3ZL3N1UC
         spothw3HbN7St9gvnmFEYSGsu//pOZF3LEjzvMZ/gER6AFcNvZ3A4klnIlC/irvb2X6C
         b0QBrww+QxmGtQrwW5eQW5dvl5Gl4zOAhXzwrxCWywZvD/K9s64q/TNUPBsPRVyR0MPU
         BPubBbzQIrnd7XzAxDGSP6dsELW8/7REFQa4DCqFEE6qrvZnbID31Kg73ZP9V4h1cj10
         /lMe2pTbIsbrKGqkMP9TvedPxYMa983LjaHI2gvdUTS33d43NWz3FdL4bfm+Hc1kHy59
         lklw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789961482; x=1790566282; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1JgJndpiQjTJjF4DQFibfiYrBkEpUhcO1uo3E1MTk/w=;
        b=liXP9qyfSnnSa3IRVhVi7pFCMNtVFLBrgnKj6XVTbqcAlJihMkFxmbSrobSMQ1vDqf
         35b2ZzjbfGmdXyi3aulCp6ou7+lnG9JtQfGgNKn29Laj9U+kV+ghhyzM2Rad2+SsXGc2
         1gUmvPXb7Up5Mdo+lCNjdx5KuCEh4cYIPXlA9DSnzFO9LwbcJnR7ZWOCVnmoDxOKTxh9
         NyjVV0dHSMkZ0btnShfjyO7bDetBtLSp5vvYnJoU3VkBaacg7ecibNjpmqQJCcowb4f3
         Ibn/XFbWwr7u6w02ZKcHm603UWwbjCFwtrRpMvOZjNM3DAQ0viJQUrhr+esbh2B+QuwB
         w7Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789961482; x=1790566282;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1JgJndpiQjTJjF4DQFibfiYrBkEpUhcO1uo3E1MTk/w=;
        b=N3NJlwgvG+i5uxcLulp0Z7uvYCqLV7RGW6WNqqEpetoTAeWAUa4bjU86wLquE6m3Z4
         /H6kyHln+z9fiCwwqXtYgFPZBy4p8pHCtXABGyHc1n2AkIYYQbwfidvdfwaVcwRz0g1C
         /Tw1VsL9q9CdFgfBzfK8P9TBX4eK0n6kIz+6HMlCZs0Qkp0dXjNshkBnfYqyWQthOhRz
         unZrx6Vtgso8NNVyxucAc5YBNO8nsX3AazwpHaF248lys0yTZxmFzPk2ng7SY4JE50HJ
         E/zboWVTvmh3AvCX5Mtxpmd+J9ucs21+FwuurMznIIxfu252SIguu0tjKEjvIbR/jPyD
         TjXw==
X-Forwarded-Encrypted: i=1; AKwUvBzjJWxaqexbgXX8OPAxRgFBCQAwg63d+806o+EV2bwup8fyuSZ5Xg554/fgot0zmHHZextxIEkBH1n5Bwlcd8bu@vger.kernel.org
X-Gm-Message-State: AFuF++mt+HilwB40MPYyYLb0PysHT7vvUT0bhQF5ZYIcy6L1iQwDsloe
	+aiZ0z1E8Vv3CeJx6HHRKEkfLbYEpgdIwaBxNp5oeO70W+dqPASaDQOB7oiioC14wnVr6ihGmp6
	kRID7mFrfTmr41Rb6CS4f55cjvS42JWfnjSRBdWYqVQ==
X-Gm-Gg: AYBFou1tAeIyJfJA+oT1PNUglPR3Kgornr/g5Rp1ZtHnmvrApBQLbAzA4mIs9UbzHRh
	b+x3l7mdJfqD2j8Ug5NVworLVSA0zMVnCFQJzo1pCJh2tGDV3lCV/GqpPkaTLb3TU4yPDWrAOte
	1G+Mr3Y4sLrJqf9vNm4YLTe9MyOvPz34EgTq7Ar4FsQV/vJgA8q8W4bGLdw2dIKbEonB/FAl3Nt
	FgnUfBbKYXQL4hZ4WVxdeNyHnmvh+MEF2ApuMNCGBcQlcgq+/entoEKyZnbhXfCIUNJXgXigkbp
	ft1xU3CQ8y97FdGf09648/sRkpKuABCz+SS9Ih3K25yeP7+XPTeMWnqJxnr7804OjZ0KQIRTxFU
	iSpPfR9d+RFH9cw==
X-Received: by 2002:a05:6402:4394:b0:6a9:ab7f:c8f with SMTP id
 4fb4d7f45d1cf-6aa54611e57mr5885453a12.17.1789961481999; Sun, 20 Sep 2026
 20:31:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916-remoteproc_virtio_map-v1-0-dac8c5eb4aa9@valla.it>
 <aq1sooGCYUiWbhMH@p14s> <aq453yukMHiNb1jp@bywater>
In-Reply-To: <aq453yukMHiNb1jp@bywater>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Sun, 20 Sep 2026 21:31:11 -0600
X-Gm-Features: AcwNN1W3qE53RFtHuPGOztjJSdwljZIvy9Wk3z8AN3NJ17iDKQARaTMy5b-3hH0
Message-ID: <CANLsYkySF+eF-FURnnT6UJv7P5Sg2HdfMSBZnZy_BLyCMvuofw@mail.gmail.com>
Subject: Re: [PATCH RFC 00/12] remoteproc: add support for any virtio device
To: Francesco Valla <francesco@valla.it>
Cc: Bjorn Andersson <andersson@kernel.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Robin Murphy <robin.murphy@arm.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Peng Fan <peng.fan@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, virtualization@lists.linux.dev, 
	imx@lists.linux.dev, iommu@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 19 Sept 2026 at 01:33, Francesco Valla <francesco@valla.it> wrote:
>
> Hi Mathieu,
>
> On Fri, Sep 18, 2026 at 10:53:54AM -0600, Mathieu Poirier wrote:
> > Hi Francesco,
> >
> > I have started reviewing this set but given the size and implications, it will
> > take me a few days to get through.
>
> I'm going through the review done by sashiko - would you prefer me
> sending a v2 with the trivial errors already ironed out before doing
> a complete review?
>

We can wait if the errors are trivial.

> >
> > Thanks,
> > Mathieu
> >
>
> Thank you!
>
> Regards,
> Francesco
>
