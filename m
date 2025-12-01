Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B7522080C8
	for <linux-remoteproc@vger.kernel.org>; Mon,  1 Dec 2025 21:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764623087; cv=none; b=nfq86P20eXTVYEbD0Pocg35QF6kiOPutaoKdwpczZMXh8XmyuDxummFx/FXUlKGas1xtj9oJEIJT6iPUwPdAblf0Rx9sQOqU62af3jgtC8VMxyxmAsc5Hxbzqm3TB6aJy1SsDE+VltCvsk1ueqIPxeEPXfEg49ZVM9Pw5OOlmlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764623087; c=relaxed/simple;
	bh=RCsVhoMziLTlsWEXutjwzN/H9l/9RoDXtZVKvXMTT8Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N7G3ceiHPabBllptOilGl6dX2Naff8NjopOTRNwY+a8l3G9m71WrtjnDV0vRwmywlr+UvC2O18MK/BupLmedTKrTU46Ihozgz+9FIrPpVzWgZ2q2XpNaBxhlsQs0D3N2iRPh/jpBis6/5T3IGl4BWt+9ahEplYQebRqaxy3Vpjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OBOLxtsq; arc=none smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OBOLxtsq"
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-7c52fa75cd3so3568759a34.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 01 Dec 2025 13:04:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764623084; x=1765227884; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QwOlm/EYAEjlVOmwG4107usguWk7Wsz8CJGeHU7XeLA=;
        b=OBOLxtsqJVPSKW+aHIpA8zwjV8HyHRBAh1BGfHFRU1JV+Sgc2GA66rRqiRzgA5Qh3i
         Yb2voglyzTCb5ScMJBo2TZA0Rny586Os2wbxSABYSJFO819mJTFeYGz2ktc5hU6K4gOr
         jBqzCav7Y9P5Sp1jrLE6/8GYzEGwJaKM66ws1uy3LKUkjY6oXRQmiF7Pu/6Fc1RLglWR
         L+AlvRj8ioZXTqHVDw437sB0seRPXc1meRz23GQbKL2QmxS4xkDPNyAOgzqNpeBublYB
         WeXpxZP3BO6hKGPC7kW6oSsaHQ2/hQd144T9S2hG87B1nxu+HwkJV/Ob09w5scnEwvR5
         RO7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764623084; x=1765227884;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QwOlm/EYAEjlVOmwG4107usguWk7Wsz8CJGeHU7XeLA=;
        b=GONJ1XcKeUoZRDT1r6W+fAvS+IAP886RQ7JYbGhqcxCC+s7pIH1fq1Jh1Mb+Qj+qx3
         0BFsSgf+uCOlshdRegUyT9yetUVXkmADFQm334iXCZrt8tiLaPhXVZDAaGCCwbDj3FLy
         9BI/MvB02A32oLKvmF/2Gb5unswv0ookHyYGTHb5Gtep8V28EIFSEeYEsWMh/R+hqWx2
         98ghrhzRbF+2tptJMx3Q5zsGr6TJxi9XLJ7TAlGIptP9wYAnPIMYSOQg9VrzKk0WSKOH
         Zplwy2qPt8HeBPpb4AiO+wXqq2wN0hpJm0mgPIT+szwpiwf42GHzEojtZ+D5PErrByhn
         QstQ==
X-Forwarded-Encrypted: i=1; AJvYcCXXWtkXXaeUIhu9KEYqwhsZt86zNcLeHbLZ/x4IzOKTyxN5hEprpPtJPFGRxfZOmUY0NA3+8SjFZ5svgYhOIwa2@vger.kernel.org
X-Gm-Message-State: AOJu0YzsGyBkj5x9GtZmIEAyrH0yZnFrV4rZG12NiDN+CZ4JqF5QLRFT
	h+JGBku/jJ8PirCe5bpZoki2Bc1Wq+DKEhPV9e2/UQASgKw1cEttN1++
X-Gm-Gg: ASbGncuyP9F9IYXO9EljPKSYYO8+GgXLLwz9FNt2BfTWtcuL/zRnZEY2mYjMwm7cvhi
	ceDshcO4X4G3bytRVwTCUgJwI5fOaTkyX4A6WPoYpTfa/FWN5AzsLvrFgMhaK33x04Vj7oRb4M6
	9asIQ6m4a1fOlOhzZsaaCGF6BrOyLDP7v/8xGauN7UW+VOls6y7PtoBzd60bBDVQ3AcPlPBMZGu
	7pfBkSG+QWdDZTrEVespaEWAWHN0vwUfjmwh46oNNfNuM0qKzbCM+W0nlR5PJaf9rZkYJ5nKRmX
	BvLXNaEw6zH0v8O8EIEo5EhYk6z9QSDlpawnEJtCCJP4LDgKw2KdGddJJFdiCxHwwAKCWTLMYMn
	KUYKZDOyMT6AhKdeMx56DtYwQbSzxy29aUsi8YtLwxn7I7gDuVubuKv5T5ZCqcZ5FGZX6CVLR5L
	vUmA6hgmYblWdFMiXgnSM+Z9WWclx2gsLTABoBAaNFT0AoTMU8LwDlQhFjIU+++Y6U5DDASzBS9
	I1fm+cTzrkabhC1DrvolN1rp70/iOe7pg==
X-Google-Smtp-Source: AGHT+IFiFedp/ndsw4dL4kyumPRb+RsFpIkJnX2Tsf9N0bw5HOBbzoF37M3d37e7AG8acuTRmJi7/w==
X-Received: by 2002:a9d:6143:0:b0:7bc:f443:fa3c with SMTP id 46e09a7af769-7c798de468amr17127045a34.25.1764623084473;
        Mon, 01 Dec 2025 13:04:44 -0800 (PST)
Received: from [192.168.7.203] (c-98-57-15-22.hsd1.tx.comcast.net. [98.57.15.22])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7c90fe15847sm5167781a34.25.2025.12.01.13.04.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Dec 2025 13:04:43 -0800 (PST)
Message-ID: <47f6bed6-4d21-4e11-ade5-b3314d026502@gmail.com>
Date: Mon, 1 Dec 2025 15:04:42 -0600
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] remoteproc: qcom_q6v5_wcss: use optional reset for
 wcss_q6_bcr_reset
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, andersson@kernel.org,
 mathieu.poirier@linaro.org, linux-arm-msm@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-kernel@vger.kernel.org
References: <20251129013207.3981517-1-mr.nuke.me@gmail.com>
 <20251129013207.3981517-2-mr.nuke.me@gmail.com>
 <1ba66817-42e2-4c63-8a94-d2e5c9cb8c34@oss.qualcomm.com>
Content-Language: en-US
From: mr.nuke.me@gmail.com
In-Reply-To: <1ba66817-42e2-4c63-8a94-d2e5c9cb8c34@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/1/25 5:21 AM, Konrad Dybcio wrote:
> On 11/29/25 2:32 AM, Alexandru Gagniuc wrote:
>> The "wcss_q6_bcr_reset" is not used on IPQ8074, and IPQ6018. Use
>> devm_reset_control_get_optional_exclusive() for this reset so that
>> probe() does not fail on platforms where it is not used.
>>
>> Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
>> ---
> 
> This reset is not even used (or documented anywhere).. the closest
> I can find is "wcss_q6_reset" in qcom,q6v5.txt, initially documented
> in:
> 
> Fixes: 3a3d4163e0bf ("remoteproc: qcom: Introduce Hexagon V5 based WCSS driver")
> 
> which claims it was made for.. IPQ8074
> 
> Peeking at the GCC driver, this reset is most likely present as
> GCC_WCSS_Q6_BCR

The downstream kernel uses GCC_WCSS_Q6_BCR for ipq8074 [1] and ipq6018 [2].
They only use of ->wcss_q6_bcr_reset in the QCN404 path, which does not use
->wcss_q6_reset. So maybe we can get away with calling it "wcss_q6_reset",
store the pointer in ->wcss_q6_reset, and drop '.wcss_q6_reset_required'

Which path do you think is the most appropriate?

Alex

[1] https://git.codelinaro.org/clo/qsdk/oss/kernel/linux-ipq-5.4/-/blob/NHSS.QSDK.12.5.r5/arch/arm64/boot/dts/qcom/ipq8074.dtsi?ref_type=heads#L1060
[2] https://git.codelinaro.org/clo/qsdk/oss/kernel/linux-ipq-5.4/-/blob/NHSS.QSDK.12.5.r5/arch/arm64/boot/dts/qcom/ipq6018.dtsi?ref_type=heads#L1440
[3] https://git.codelinaro.org/clo/qsdk/oss/kernel/linux-ipq-5.4/-/blob/NHSS.QSDK.12.5.r5/drivers/remoteproc/qcom_q6v5_wcss.c#L967
