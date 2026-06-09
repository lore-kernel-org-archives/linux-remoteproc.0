Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3058A3FAE09
	for <linux-remoteproc@vger.kernel.org>; Tue,  9 Jun 2026 11:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781005407; cv=none; b=XNFDHPg8DzOz7UYRreMvTapFfLp5AKhvx6YIMWWhRNaP6ZDHog11q8AnsgKToaaESQLv0kkziiT4mkU/pL+cnChW98aXjBzXqGjJ8T3MI5UrR7KuQKDSrvHdkd2uYt4GccaI2evV/FWPpy5QxlSsz0VwJ8dOvmbvmfq8Bgkbkjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781005407; c=relaxed/simple;
	bh=etwaOqfrv80LIP7Sx6oI0au3Ah0IMLiJ6WXRs3bOmiA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j+OTfi4PDO1qISG7yLljTwb4vGuRDT1ZUlricdMY6DzUTHiHCyCiiXGnv/ookqyVT7wRdtdY4U+hkEISVIgxoSLAvB4YKoqxtP1rMoEyESnZz0v2zaVIIL5AWVRxCxKZ9nXNi12fT6Dx6VfRzaDsgv6FAPK1ov9QN2jUwL9HoXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=emJEdqc2; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="emJEdqc2"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-460166910e6so2772187f8f.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 09 Jun 2026 04:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781005404; x=1781610204; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LpMpBpNcZIgzsuu0bBQY/Gbp97K5pRk23WWL6Y8u5xg=;
        b=emJEdqc2FLqXlTxg+bu034XpgQ7GH0KbZX+MFVHqoQX7wkTvz+F4tmDHnqBfQGxP6x
         jBZ9R7AaCb5UKkwuRGynuVPW28WNrOCwW9YcbMWQV5bFigsitriWMADllsG8Ffsi4HUH
         vlYDcQhva7FOE7JgsbykrOIVWPeuemLIDJ/SU7OdTgIw9k0AdQFPjFYaItNEtCYd1hr8
         5e1HG0nIbsipIq67DQ3NRMwVleznVpbDlvao2jKwsU3TwgcQP6sljZMX11ZSRNV7KZ/B
         w6eC+KAd8l3cnnKkr654Z2r9RzBrHw6j0967nQ2Ej/uk4TDRYEqEsigznA+uqB57kbUd
         /NeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781005404; x=1781610204;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LpMpBpNcZIgzsuu0bBQY/Gbp97K5pRk23WWL6Y8u5xg=;
        b=G5Nd9jDmoD8b1U31LoRLuLU2QqyBUXt4JZ51hf5f84f2qLOm+1h6PSbWcM4so2D6bZ
         Dx3ATKl9M5amqGHKfBjcXUPpEmQm4KA/LiqLfYlF7TFIsGNkKl3ESPCcES+ldLTnlLO0
         GPUZkDnzUXTGV58wn8M29QLH3lg69j5vEn76v32dAxLjk53xbdivUXXd34b0SXjJoE0b
         +ucANSiXmAqYc1iBSeysAe03EHqK49AuiMGnBW2dhhyZy1UvfDN7xpliZV4NamwLKNGN
         YB5M5i2CAxxBxKYZgEgnXi1EfI9eZ/P3Dbc+MfhR67jy11rIB0ZxuZnbhcR4iVVwwBMV
         Ceyg==
X-Forwarded-Encrypted: i=1; AFNElJ+wwAnUsz/Fdmx4adaWgoeSQAdu7TJShGOWqEysjS7g1oK7Ci/K8JlrfkKyVYCubWn33lHkjhtxskDSkwZulMsf@vger.kernel.org
X-Gm-Message-State: AOJu0Yzu0Td0qL1PF0VscaU13lEWMiilVp3F3Rr7LvvRabXfSuDox3Ja
	dSbh2WAZO+5aJT5+SijZwPoLfg4VDmg9pNhYGchYTCu+sgIbVoIDCEwSvNad2Rq0QYY=
X-Gm-Gg: Acq92OG6hqWGhDj+JOoz4PsCClgGdBqgarAYyktwSDisSez8IOv/RwTFDraXJ1gOIMa
	qJMhN9g/8HQ1+HuyfShIhYh+3/8dKw4SqDQ9rqocqHapUOhrYA8GKcoHLWv6O1sVXvuoZEM7gGv
	dphbvg5aDjTls0NavYh+TzBUBYz3O/M02Stjj+mYY4ONvb+QUduFf9flpfQYvZ41+5qKWpmardF
	QVPYRcVz2gAItJtEqEked6wtqqC0xeKSWlIimxfH/NyqjfhFQbrRi9BS2A0XzxawkX39uwQDNH2
	4F2hlInSenlx04MARvy+R2mTxaXIjeolOb+2FlWwrib8Itu1DUOV6WUwOmYAoKXwvl7CC+UL11T
	gkfqBy46XAQgXdKhqXES+FDY3Fm1+IyRtmMbRw1WFvxmr3TbAWUB3AzXSwHRA9LiSB2ag6DjfXz
	aKVjrtDG/ZncvzU68w530HmcjY27QVwRpKFOhT8yF2lpGgQA==
X-Received: by 2002:a05:6000:2994:10b0:460:3233:f991 with SMTP id ffacd0b85a97d-4603233f9e2mr21994861f8f.40.1781005404400;
        Tue, 09 Jun 2026 04:43:24 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff23:4410:59bf:7aa6:43c0:c58b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dcbe3sm57355924f8f.8.2026.06.09.04.43.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 04:43:23 -0700 (PDT)
Date: Tue, 9 Jun 2026 13:43:17 +0200
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
Message-ID: <aif8VS0pLYurFEho@linaro.org>
References: <20260609102254.2671238-1-mukesh.ojha@oss.qualcomm.com>
 <20260609102254.2671238-3-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260609102254.2671238-3-mukesh.ojha@oss.qualcomm.com>

On Tue, Jun 09, 2026 at 03:52:52PM +0530, Mukesh Ojha wrote:
> If a subdevice fails to stop, it indicates broken communication with the
> DSP. Continuing to stop further subdevices against an unresponsive
> remote processor could close rpmsg devices that could remove the memory
> mapping from HLOS and in case if remote processor touches those memory
> can result in SMMU fault.
> 
> Change rproc_stop_subdevices() to return int and abort on the first
> failing subdev. Propagate the error through rproc_stop() and
> __rproc_detach() so callers are aware the teardown did not complete
> cleanly.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

But what would callers do about this? If you abort the teardown sequence
half-way through you now have an inconsistent half-stopped state that
neither a new call to stop() nor a new call to start() could recover
from. That doesn't sound much better than the SMMU fault. Or am I
missing something here?

I would expect that we should either be able to tolerate the SMMU faults
with the resets involved in the remoteproc stop/start sequence, or that
DMA gets cancelled by the remoteproc stop sequence, before the buffers
are unmapped. Perhaps the order of our stop sequence is just wrong? Can
we unmap the buffers in the subdev unprepare() callback?

Thanks,
Stephan
