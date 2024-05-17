Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F32F3BBE1
	for <linux-remoteproc@vger.kernel.org>; Fri, 17 May 2024 08:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715933275; cv=none; b=VOIrKm2TUvvqP25lLVr/I0Vlz5S9JJ5cgbZqrjdg1NBnCUGlMM3FDmvCjGMXf0/jXZTLD7oGwsypJaiS+b41EAHBVjK5O449gG9j2REhzneqkoDDM93lQSQi/Uorqqch3AL5GeFpHxW4laAZ/5/076DSUCLaJhR9E9iBYhZ3Yk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715933275; c=relaxed/simple;
	bh=67kJhvVJgfr3fdLhnw6mtmsME4ghMjbF6tKsfeoLtJE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SgybyacbvKFxL5UFj0mk3v91KQfBBWbPYQb32d+e1uCsVASk9ZxnxU7NU6YT0fP3G1k3FwJ5VrqdPzyToe8DIvoulIrxmYpTnLCGg/takiB5ePB7SpowWB+pcsp1d5HG3SOuYTTCMUZ6xhWQR/5/sFFjU+mTJJX2CIAyF5nNNH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WQWyUfhp; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WQWyUfhp"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5727dc6d3edso4515572a12.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 17 May 2024 01:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715933272; x=1716538072; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ADMoLBL5cnEifhHVW0n3dyo7J3ncObAka0zVx8KrFmM=;
        b=WQWyUfhp+XHzzN1zHf+gqxgRF7xECOlJuPrB+F4QcszkKIYJl98OFMfwwrRmN7myXh
         1wvYO4Jd/k0YgxOu1vX2mu60VTD9TdYtKYYvolds9YoVpA5lpesrSAwmF7txEhV2zxuO
         OezUTQMm5HD+xiGUicgv3muZPUICGCxr552pQXAdDE2cqOKd408WYV7NHTF3egMkOK1n
         5nkRcD3zzhpspbHhF92q4zhRaQgpftQ6DAip5/SidGckTtmvfupQPqL+s5PoulFGwEKP
         7hx2IJGav6244guVZjisu+34Ho+t177lg5664BNCxqNKyqFQTplb6N1dL2HkxS9SkzrZ
         y7hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715933272; x=1716538072;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ADMoLBL5cnEifhHVW0n3dyo7J3ncObAka0zVx8KrFmM=;
        b=cBlPt060NfnVW/fB/aBywm1lr4g1H98VC3jyLr7llgD4IW2NMDX0w0s5oUU7hvqd1C
         wEuCW4IeXTxln8pmpVDCPiaJy4frClP3873MDaMolyu5udUNNwkyCy0hOxv0hoikArRb
         tG2kh24IPCygupmA/dqnvqaG4+IG8lwq833IcvRUzOfx984XRX8VLupvWJMmFwwDx7Re
         cWcjrPQiHLGkWuTXD0iLhFIK0Xnkptl4xXAI/6dRjB0lKjWp0fRlgPiI+MMihOoOJr2G
         83fhq8AyLEtr3EbqynumS2qQSwku8t7ZWn1aVsil3dfLR8T8yv45B4L7S3ATk3abxNmb
         Iolw==
X-Gm-Message-State: AOJu0YxJ8Lht9veMdKX3iTzCzQI7tuwuqmvQzyjjKfuK2cTd1rPlMTDp
	2yIvtrlXjcMOggMV041Tv4Fz49WCgUO6ogcGMQMRSN/i6r9vRvs2bZbaEKcNNAs=
X-Google-Smtp-Source: AGHT+IE2fmU8pDp6UlRMGDlXg5CeGrnSfA6SEVVbOUx4aG63KRG891PKcbwDpqb4LC/Ug/MAPPvzjQ==
X-Received: by 2002:a50:d654:0:b0:572:6cd5:f8d with SMTP id 4fb4d7f45d1cf-5734d5ce1b1mr15053517a12.22.1715933272636;
        Fri, 17 May 2024 01:07:52 -0700 (PDT)
Received: from [10.91.2.68] ([149.14.240.163])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-574eba4bc3dsm4452608a12.94.2024.05.17.01.07.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 May 2024 01:07:52 -0700 (PDT)
Message-ID: <77b01a97-de2d-4e10-91f6-915ec414eede@linaro.org>
Date: Fri, 17 May 2024 10:07:50 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] hwspinlock: Introduce hwspin_lock_bust()
Content-Language: en-US
To: Chris Lew <quic_clew@quicinc.com>, Bjorn Andersson
 <andersson@kernel.org>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>,
 Boqun Feng <boqun.feng@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, Richard Maina <quic_rmaina@quicinc.com>
References: <20240516-hwspinlock-bust-v1-0-47a90a859238@quicinc.com>
 <20240516-hwspinlock-bust-v1-3-47a90a859238@quicinc.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240516-hwspinlock-bust-v1-3-47a90a859238@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17/05/2024 00:58, Chris Lew wrote:
> From: Richard Maina <quic_rmaina@quicinc.com>
> 
> When a remoteproc crashes or goes down unexpectedly this can result in
> a state where locks held by the remoteproc will remain locked possibly
> resulting in deadlock. This new API hwspin_lock_bust() allows
> hwspinlock implementers to define a bust operation for freeing previously
> acquired hwspinlocks after verifying ownership of the acquired lock.
> 
> Signed-off-by: Richard Maina <quic_rmaina@quicinc.com>
> Signed-off-by: Chris Lew <quic_clew@quicinc.com>
> ---
>   Documentation/locking/hwspinlock.rst     | 11 +++++++++++
>   drivers/hwspinlock/hwspinlock_core.c     | 30 +++++++++++++++++++++++++++++-

Shouldn't this be added to drivers/hwspinlock/qcom_hwspinlock.c ?

>   drivers/hwspinlock/hwspinlock_internal.h |  3 +++
>   include/linux/hwspinlock.h               |  6 ++++++
>   4 files changed, 49 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/locking/hwspinlock.rst b/Documentation/locking/hwspinlock.rst
> index c1c2c827b575..6ee94cc6d3b7 100644
> --- a/Documentation/locking/hwspinlock.rst
> +++ b/Documentation/locking/hwspinlock.rst
> @@ -85,6 +85,17 @@ is already free).
>   
>   Should be called from a process context (might sleep).
>   
> +::
> +
> +  int hwspin_lock_bust(struct hwspinlock *hwlock, unsigned int id);

I don't think this is a geat name "bust" looks alot like "burst" and I 
don't think aligns well with the established namespace.

Why not simply qcom_hwspinlock_unlock_force() - which is what you are 
doing - forcing the hw spinlock to unlock.

---
bod
