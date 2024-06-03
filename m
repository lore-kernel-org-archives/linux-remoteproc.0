Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B50984DEA
	for <linux-remoteproc@vger.kernel.org>; Mon,  3 Jun 2024 09:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717407483; cv=none; b=mRRQcTDq4VIckm45Zf9Qvv8BEPwzVaVUJKRma6Jw7v7N+2im4qwx7lEfM5Cb941CebrRYYmH4DWRMj61QYpcilfLZhB/bcnzh9a2N2BEzfBWjSs0Qk/RkFx2oDyeD3gDwkdRT6k4rVtsep86c+Jqvrovk9wODx0O+S837Oyiq0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717407483; c=relaxed/simple;
	bh=h7pvcv2wUIwxg5FjjMtUOu3oVIVM6kON7vpUPbXH9iw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R4fc5N2VA41E3FVf77NtnfyOP+5E0LMN/uEedkBhWWV6cBcanggYaAPmipyl+1dw0xLt6eqrbgfch2blXbOFJmAsNCd9S3ta+HnHQxf/tUsgJvAm8lBrNuYrri4u+SepBMIZuQHl8EL6VMv3W9WDHJMqD7KPpixyg5jg/Y235y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B+wObRyz; arc=none smtp.client-ip=209.85.218.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B+wObRyz"
Received: by mail-ej1-f65.google.com with SMTP id a640c23a62f3a-a6266ffdba8so350113766b.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 03 Jun 2024 02:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717407479; x=1718012279; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g9d+5H25Ten2eOIeRZkbLmX7bV0HE+CLqvNWqi7UnNQ=;
        b=B+wObRyz2sfwjbGrXQ+BiofClza+p1fh9A3FQglgo8AhSJiylrX8RZh+I4AF/SxuOy
         AQ3Vyk2aeNkiHQ3xg4SWpjg+XKpXw3r3HzmUwVOjpoCdlNJta1oZfnerOwMlbUsDsJtt
         4467p6LHJ+ShWwVm0x8McsO9VfLp7cW78G8wRE68TMR91azeX0cJXhUmb8X1St+sT6vy
         IC7WHCLJ/utGfbtL7uZ5cbJvf9SgSNLEPMrFmJ9wCltw5565fXf1o2jM6MnWdcvWN6g2
         r5tGIe6tJxyEgULLtepYvr1r31H+iHuLJkRpxBonwcOhK5Ag8ELRpq3jyRCdAcVZ3co5
         JMUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717407479; x=1718012279;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g9d+5H25Ten2eOIeRZkbLmX7bV0HE+CLqvNWqi7UnNQ=;
        b=ZmIwgogf2WttozKBYhIfnMmuX+XGuwNzsiyQuzEjl+b3asi3bcOFemwJVqSd3Opd37
         w+IfGVzYExzH4aOyg8U0cM9VkACdMILotPjxol/ek8PdhBx3wRCwINyyQXCP8nfxY+eQ
         3+nZE8AhyWP8wFqntT++N8jrzKKWq8gxS56pQuhEb3MNYi5YuSOpvtHEYYM1BPvIiBw9
         gq16S+G/uA6sxY9DuPk5yvqSXiFqQNqZaCob3gl1QvWZrCZsEiaJQqzd7OC76cvLcpKW
         vVigi0izWXqH8aE+0358jDl/mu6laQUfGI7kmfQhi65AUptXlB8XQLVkp5VM0HdH3M+k
         o7Qw==
X-Forwarded-Encrypted: i=1; AJvYcCUpbgRIX2pFoo4HHl/F7PHG0oD3pLLSb80F9o/Mg6rWlabwYf8VKId4I3nqW5NJamUVdx1v7GAnuaOxtQPZPzfKTzo3VqOE2Hs+hTdt5qRiXw==
X-Gm-Message-State: AOJu0YzD7lvPHbsdyhggKKV9M4sSv0CGjXyvE2ALHMps/nAkBcOG730K
	l5MxabywhYOgVVN/X8Wt0XiVq7Yd6AYicMbCs3Fmg8iY6I+nLn9pxJh3V92komg=
X-Google-Smtp-Source: AGHT+IGauRclnKJ4NqP6GHjMYnneZuZd6cbrluXWMBwQLcLi9qepV4La1NifMc6ZOsWL//kjewVVxA==
X-Received: by 2002:a17:907:cc90:b0:a68:baaa:b290 with SMTP id a640c23a62f3a-a68baaab464mr271957866b.37.1717407478931;
        Mon, 03 Jun 2024 02:37:58 -0700 (PDT)
Received: from ?IPV6:2a02:8109:aa0d:be00::8090? ([2a02:8109:aa0d:be00::8090])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a67eab85ea3sm467597766b.174.2024.06.03.02.37.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Jun 2024 02:37:58 -0700 (PDT)
Message-ID: <8d10fbbb-471e-4960-a52a-1658df9fbc0c@linaro.org>
Date: Mon, 3 Jun 2024 11:37:57 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1] rpmsg: glink: Make glink smem interrupt wakeup capable
To: Deepak Kumar Singh <quic_deesin@quicinc.com>, quic_bjorande@quicinc.com,
 andersson@kernel.org, quic_clew@quicinc.com, mathieu.poirier@linaro.org
Cc: linux-kernel@vger.kernel.org, quic_sarannya@quicinc.com,
 linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org
References: <20240603073648.3475123-1-quic_deesin@quicinc.com>
Content-Language: en-US
From: Caleb Connolly <caleb.connolly@linaro.org>
In-Reply-To: <20240603073648.3475123-1-quic_deesin@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Deepak,

On 03/06/2024 09:36, Deepak Kumar Singh wrote:
> There are certain usecases which require glink interrupt to be
> wakeup capable. For example if handset is in sleep state and
> usb charger is plugged in, dsp wakes up and sends glink interrupt
> to host for glink pmic channel communication. Glink is suppose to
> wakeup host processor completely for further glink data handling.
> IRQF_NO_SUSPEND does not gurantee complete wakeup, system may again
> enter sleep after interrupt handling and glink data may not be
> handled by pmic client driver.
> 
> To ensure data handling by client configure glink smem device as
> wakeup source and attach glink interrupt as wakeup irq. Remove
> IRQF_NO_SUSPEND flag as it is no longer required.

I'm not sure I agree with this approach, glink is used for lots of 
things -- like QRTR, where the sensor DSP and modem may also need to 
wake the system up (e.g. for "wake on pickup" on mobile, or for incoming 
calls/sms).

Configuring this to always wake up the system fully will result in a lot 
of spurious wakeups for arbitrary modem notifications (e.g. signal 
strength changes) if userspace hasn't properly configured these 
(something ModemManager currently lacks support for).

IRQF_NO_SUSPEND is presumably necessary to keep the DSPs happy? iirc 
downstream Qualcomm kernels have historically taken this approach to 
avoid spurious wakeups.

I proposed an alternative approach some time back that would allow the 
wakeup to be configured on a per-channel basis.

https://lore.kernel.org/linux-arm-msm/20230117142414.983946-1-caleb.connolly@linaro.org/

Back then Bjorn proposed using some socket specific mechanism to handle 
this for QRTR, but given this is now a common issue for multiple glink 
channels, maybe it's something we could revisit.

Requiring the wakeup be enabled by userspace clearly doesn't make sense 
for your proposed usecase, perhaps there's a way to configure this on a 
per-channel basis in-kernel (maybe as the rpmsg API?).

Thanks and regards,
> 
> Signed-off-by: Deepak Kumar Singh <quic_deesin@quicinc.com>
> ---
>   drivers/rpmsg/qcom_glink_smem.c | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/rpmsg/qcom_glink_smem.c b/drivers/rpmsg/qcom_glink_smem.c
> index 7a982c60a8dd..f1b553efab13 100644
> --- a/drivers/rpmsg/qcom_glink_smem.c
> +++ b/drivers/rpmsg/qcom_glink_smem.c
> @@ -22,6 +22,7 @@
>   #include <linux/regmap.h>
>   #include <linux/workqueue.h>
>   #include <linux/list.h>
> +#include <linux/pm_wakeirq.h>
>   
>   #include <linux/rpmsg/qcom_glink.h>
>   
> @@ -306,8 +307,7 @@ struct qcom_glink_smem *qcom_glink_smem_register(struct device *parent,
>   
>   	smem->irq = of_irq_get(smem->dev.of_node, 0);
>   	ret = devm_request_irq(&smem->dev, smem->irq, qcom_glink_smem_intr,
> -			       IRQF_NO_SUSPEND | IRQF_NO_AUTOEN,
> -			       "glink-smem", smem);
> +			       IRQF_NO_AUTOEN, "glink-smem", smem);
>   	if (ret) {
>   		dev_err(&smem->dev, "failed to request IRQ\n");
>   		goto err_put_dev;
> @@ -346,6 +346,8 @@ struct qcom_glink_smem *qcom_glink_smem_register(struct device *parent,
>   
>   	smem->glink = glink;
>   
> +	device_init_wakeup(dev, true);
> +	dev_pm_set_wake_irq(dev, smem->irq);
>   	enable_irq(smem->irq);
>   
>   	return smem;
> @@ -365,6 +367,8 @@ void qcom_glink_smem_unregister(struct qcom_glink_smem *smem)
>   	struct qcom_glink *glink = smem->glink;
>   
>   	disable_irq(smem->irq);
> +	dev_pm_clear_wake_irq(&smem->dev);
> +	device_init_wakeup(&smem->dev, false);
>   
>   	qcom_glink_native_remove(glink);
>   

-- 
// Caleb (they/them)
