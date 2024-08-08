Received: from out30-113.freemail.mail.aliyun.com (out30-113.freemail.mail.aliyun.com [115.124.30.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EECD1C32
	for <linux-remoteproc@vger.kernel.org>; Thu,  8 Aug 2024 01:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.113
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723081033; cv=none; b=c7IXU3RfVhibGWIPsqsET1V8D0RCtljlRW9yepsRKdjrdRciEmk1Ahf5fCX1tLdTudIY/UUOY3N6sn48OmYTl+Yna+NiZ5hw/SYhdtXqqpq/uCYrAahrreE7bQSpPBhgzaLjFWMQvkgUjlakp9ODcP+pS0wIS+m18G8QW+RPgMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723081033; c=relaxed/simple;
	bh=gRLyKoMg0DWhgl0zVaiQaUVB7AEetEMezdLkDa7GMjk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CJkmVSZpwAgaI2hKrPOonVMiBKvqMgDt4MFYQLiai3+H0SMFbvAiPYmB35D/GQ7LAb2VRgK0FTv7ZXEECuNSuTqyX+yG3X/AJ9iGgQQgw/uBUwMepWwpuDZFXycP27TPhSxJUS7/yilW4oi/fIC7W9Ihd6u1HnK7Ddzns0qaWjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=rpPPw2gl; arc=none smtp.client-ip=115.124.30.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="rpPPw2gl"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1723081022; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=mH8254NBLvcuf4h8WC2ZfPzI9DxBk0rkYDY1AhyBiGQ=;
	b=rpPPw2glLUAvPFY5y2AOONkMotRIUfCZLGLRBXezbo4nyMOPdWpgyu+NrgmM2vD06vvuHGiZ/FZsYsyDZ/Mv+oyHDWZkdJ1emxyhXVu5qggwuOnzIbmwNK/ik1o8Rw7GEN3cfVWJQYoFw8LZHEdCoGsHbNaUUTYGsTPmnzMlliA=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R171e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037067109;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0WCKS0YA_1723081020;
Received: from 30.97.56.61(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0WCKS0YA_1723081020)
          by smtp.aliyun-inc.com;
          Thu, 08 Aug 2024 09:37:01 +0800
Message-ID: <3b38eee4-1dc3-45b3-85d7-d4923f5e571e@linux.alibaba.com>
Date: Thu, 8 Aug 2024 09:37:00 +0800
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -next] hwspinlock: stm32: Add missing
 clk_disable_unprepare in stm32_hwspinlock_probe
To: Gaosheng Cui <cuigaosheng1@huawei.com>, andersson@kernel.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com
Cc: linux-remoteproc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
References: <20240803061443.287117-1-cuigaosheng1@huawei.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20240803061443.287117-1-cuigaosheng1@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2024/8/3 14:14, Gaosheng Cui wrote:
> Add the missing clk_disable_unprepare() before return in
> stm32_hwspinlock_probe().
> 
> Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
> ---
>   drivers/hwspinlock/stm32_hwspinlock.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwspinlock/stm32_hwspinlock.c b/drivers/hwspinlock/stm32_hwspinlock.c
> index bb5c7e5f7a80..a4e3b9a9e29d 100644
> --- a/drivers/hwspinlock/stm32_hwspinlock.c
> +++ b/drivers/hwspinlock/stm32_hwspinlock.c
> @@ -103,6 +103,7 @@ static int stm32_hwspinlock_probe(struct platform_device *pdev)
>   	ret = devm_add_action_or_reset(dev, stm32_hwspinlock_disable_clk, pdev);
>   	if (ret) {
>   		dev_err(dev, "Failed to register action\n");
> +		clk_disable_unprepare(hw->clk);
>   		return ret;
>   	}
>   
> @@ -112,8 +113,10 @@ static int stm32_hwspinlock_probe(struct platform_device *pdev)
>   	ret = devm_hwspin_lock_register(dev, &hw->bank, &stm32_hwspinlock_ops,
>   					0, STM32_MUTEX_NUM_LOCKS);
>   
> -	if (ret)
> +	if (ret) {
>   		dev_err(dev, "Failed to register hwspinlock\n");
> +		clk_disable_unprepare(hw->clk);
> +	}

I don't think this is needed, because if the device initialization 
fails, stm32_hwspinlock_disable_clk() will be called to disable the 
clock automatically when the device releases its resources. Please check 
how devm_add_action_or_reset() work.
