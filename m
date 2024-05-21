Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F0C67F48D
	for <linux-remoteproc@vger.kernel.org>; Tue, 21 May 2024 17:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716313093; cv=none; b=qaN/Qw0WH9vDKSh2s65kZ7ASe456rZdyuPwtANljGoLlSN3HTrz/d+mfDrAbLHtwIBNVFqDHCMS5OMTHnzhlDET595TnAbhcaEro3dX5ncEYswwnSppBxNm58oXlLFFBVbXaVb2s1qUWi3xMipY2reGX83XL4qEz/jm+OtmLjWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716313093; c=relaxed/simple;
	bh=mQI6QAGDMhHenGg0tvxZ00M8QWDT5W8SxuOFRTDIr2A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SlHXeMrvA9g4FW+p1k3mdjkpU708wAeUgQQoOFdrYj6X1wITad77r+m1vsw19Oahk9v1uSE8I5c0+xe0hA4Ya/oKVxS5BTWAGrU990iJiVNOtdQ8EZr0adAQLBerENh/8NYDIDjIQdG1/XX4lAtPSA0z8GgRBypnTgWfCEXHMR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rr82LKHG; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rr82LKHG"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-51f0f6b613dso7335928e87.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 21 May 2024 10:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716313089; x=1716917889; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Vk03L09ST8X5oc6oML5rlGR6NukdraIE6t022SELXL8=;
        b=rr82LKHGpwQaE+Y/d496hKnGOw4o1GbtuXPvePtdNS85rNiob4E1ff63eKw2zQrcJD
         GlM2Ql8oi4yK4U0kKVAxrz1+f3Pw2OEANLUoy3fqnxyafn9Ywt2XiPUgLSf9z4TEwUKG
         xEQhr5GgDsvjpWD+XpK9/duHvaiBYAZkkW2zCiKC5wEpt/dV5dT6BJEWSC1xx7yl91XE
         ycs1bZkLnUEaAvzURFN0gLjl2tQRxocI3FI86dbiBvs+lzWFJ4hBRidRNUfW0dELDo4q
         4WWotjEDAffryL8Yt/5UHzwAYbi16jQMruDqYuHr574Zi7udW4VEdaLq05WG6nZ0BGj0
         YHFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716313089; x=1716917889;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vk03L09ST8X5oc6oML5rlGR6NukdraIE6t022SELXL8=;
        b=kzJt+Vb68zvrosC3NOBVcxe7S7JExFv1TnNep7uDLcReq8YT7ahEWgJRVm79ZAn6bH
         ljr6paxk92Fpz62gtBra26TMCiTtyzoYprnE0GvjOLhaLZF+w/AcD5FypAsRrd8GUxiF
         XdV7zHgP3pHcbo6iqpjb7JaCRYzxhR+wXfxqJ7v5L2/unLrDA4vTmficzLmkn+njsZAK
         T6phlQnKkLK7h2dvQkUles4lYFLBhyb7gMNEB48pOvYQFN3zse4y+PG/QB7BtiqjEW9n
         RutsPJuDvtepxIwQhp4l62Usatm1smm1p1gAG8nfphfvtmlTAWpULw/Phf8C28qEx4yJ
         jrMg==
X-Gm-Message-State: AOJu0YwoTIx1PIau1Z/eGEfVfbbp+JN6TvRak/03fe2fobM+yt3OL7BC
	Xk1no31vf1TizgWqJWnCYRJPiLZG/1RHg6u/vvoJ6d4FWWTWP5Kw3hEbP8BDhpU=
X-Google-Smtp-Source: AGHT+IF6usi7V5p1Go3yhHxfMq2ocSHi/cK+nJXYCsseMwxIWVLrQxXKX4i5zBhsCcnPxAJrplHP3w==
X-Received: by 2002:ac2:55a4:0:b0:521:533d:6367 with SMTP id 2adb3069b0e04-5221027bad5mr16859057e87.63.1716313089344;
        Tue, 21 May 2024 10:38:09 -0700 (PDT)
Received: from [172.30.205.5] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-521f38d32dbsm4765005e87.141.2024.05.21.10.38.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 May 2024 10:38:08 -0700 (PDT)
Message-ID: <722c57dc-98cf-4ec8-93c5-aef55e6084c7@linaro.org>
Date: Tue, 21 May 2024 19:38:03 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] remoteproc: qcom_q6v5_pas: Add hwspinlock bust on
 stop
To: Chris Lew <quic_clew@quicinc.com>, Bjorn Andersson
 <andersson@kernel.org>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>,
 Boqun Feng <boqun.feng@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, Richard Maina <quic_rmaina@quicinc.com>
References: <20240516-hwspinlock-bust-v1-0-47a90a859238@quicinc.com>
 <20240516-hwspinlock-bust-v1-6-47a90a859238@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240516-hwspinlock-bust-v1-6-47a90a859238@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 5/17/24 00:58, Chris Lew wrote:
> From: Richard Maina <quic_rmaina@quicinc.com>
> 
> When remoteproc goes down unexpectedly this results in a state where any
> acquired hwspinlocks will remain locked possibly resulting in deadlock.
> In order to ensure all locks are freed we include a call to
> hwspin_lock_bust() during remoteproc shutdown.
> 
> For qcom_q6v5_pas remoteprocs, each remoteproc has an assigned id that
> is used to take the hwspinlock. Remoteproc should use this id to try and
> bust the lock on remoteproc stop.
> 
> This edge case only occurs with q6v5_pas watchdog crashes. The error
> fatal case has handling to clear the hwspinlock before the error fatal
> interrupt is triggered.
> 
> Signed-off-by: Richard Maina <quic_rmaina@quicinc.com>
> Signed-off-by: Chris Lew <quic_clew@quicinc.com>
> ---


>   drivers/remoteproc/qcom_q6v5_pas.c | 28 ++++++++++++++++++++++++++++
>   1 file changed, 28 insertions(+)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index 54d8005d40a3..57178fcb9aa3 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -10,6 +10,7 @@
>   #include <linux/clk.h>
>   #include <linux/delay.h>
>   #include <linux/firmware.h>
> +#include <linux/hwspinlock.h>
>   #include <linux/interrupt.h>
>   #include <linux/kernel.h>
>   #include <linux/module.h>
> @@ -52,6 +53,7 @@ struct adsp_data {
>   	const char *ssr_name;
>   	const char *sysmon_name;
>   	int ssctl_id;
> +	int hwlock_id;
>   
>   	int region_assign_idx;
>   	int region_assign_count;
> @@ -84,6 +86,9 @@ struct qcom_adsp {
>   	bool decrypt_shutdown;
>   	const char *info_name;
>   
> +	struct hwspinlock *hwlock;
> +	int hwlock_id;

IIRC, this is the same one that is passed in the DT.

Can we get it dynamically from there?

Konrad
