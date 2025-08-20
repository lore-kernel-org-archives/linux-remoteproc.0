Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 925E12DCF58
	for <linux-remoteproc@vger.kernel.org>; Wed, 20 Aug 2025 11:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755687802; cv=none; b=tJvh5XbsLf6baT2yBehdU5+HdAQ3dIQdKyZjiJnweJkyugexbqCRmdLeLKwTYxaUrWn4N0/OudznsSbJ5xNuXM/tKL7S+G6WT/s9oJ/dYsWwKmxvKZSRTczb/aU8xhauhDBTYEBQHqwQoMcFMpsMNjgnsVYUoH9Os0Y0pu5kWrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755687802; c=relaxed/simple;
	bh=u3stZJZozj1Ykm8shsxVmP+agbKEMYkuhg6zzlZscwc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O8o9VDkN52yGj8LH88rcKzGopFki4MINp8VKleVx7NNdBQSX41cs0YqmvfqwgrjhuVxeEd2KcmcT8PXuqlcfd4sQKwSH1eC4MkZKwQAQNQFh4PIMLGzLWPKaI642ATfsU4HCcsl678ba3WccJeAgu4iOJRSSVZqtVQ7jpsvzk3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kcoiVQ/J; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kcoiVQ/J"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-45a15fd04d9so5235655e9.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 20 Aug 2025 04:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755687798; x=1756292598; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jkwhUABhPBNZeZgOhl20sSl/xqev4urG4lq3t9jsKjE=;
        b=kcoiVQ/Jr6XEtOCKhNAre08GZOrIVtYDbNkBfak8MU0Ms2Lhbft7lBrZTjZielEdku
         qGO1IYQYNEC4IujhCN9+XxOOvStMx7D1NfVIjkPKVS/dz4H3MWpZZiPudMZgubGGdwzv
         8yljkqZ4FbTMvONAFg1QRuCDWxI3F+HPL52EvIH+HUr4fEv4gm45efKkwjc6U245xC1L
         T5w2rtRhfUkRu5qktPiLXzu/PRt/FNndjbRYY7zip9Jd3zoGxU7Q9mGo6voyFha1jGW9
         Fitb2siNiGUABwf+gGz0++2JyIAviX36u7LiT08J8eetwegYwJ9/N+btP2GEQKFjdJXB
         62vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755687798; x=1756292598;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jkwhUABhPBNZeZgOhl20sSl/xqev4urG4lq3t9jsKjE=;
        b=UD6ZAIvmFAyGVeNk1pjtBFq9DHyo5zSO3E5rG8P75DtipEpF/w9A9f+51faNnmeeo/
         eVqGW1KgbjPxvgHJZw4TFaxxnd9huBKaXP3U9cejmOEubQZa9RGmDCt1iMu5HU4tyhc1
         MF4TXAish2CaQPz7PQUdNwUgJkZa/gde3FBLkLoERzphO/k+CYgKogBCnTaxo6hF3Vzh
         xkRjlGyFMW/5kfuuCuP49zkjS4jMG8a9XDNHYdrqXKMr82iv+2BK/t84WxYFCPp2lprU
         FF+o2KEGWRwce0HkxqrKoL6lOIq1VkErZ7s6Ye4DAKxs5r/8HWrbjEhzwSrT4BeZnKbJ
         ESVw==
X-Forwarded-Encrypted: i=1; AJvYcCU2P9x8dKz+SrAR6YxEhmV+ahbH4HzAuE1DB5dpcKJQ48iDbYTIEDLCVwG2/j1zqXVqRN5/YpIFSYdmaU6NiIM+@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+JYq98c9pb96YZsyBaEYhd0eteC0N30nFx0PADpJUQleW6V//
	2YYHQO4aHYmPIr3yzHHSZcncq+httTTCOOzRj65enaHj1Z3DIoSnA8DrLvUPvI9zk9c=
X-Gm-Gg: ASbGnctV64NV5J9iNIeB0bvxsbhZp6jx2XKTcj3NBjWbFN7QnoQHYOJmsNiD6IzBCXU
	RX70JbxTZ/VaXIJ4Apmc4xae1B2BptBUCYdVe1DQr6yA+8LsnKc/EIJEO4d9V80w4dsUGvzmKHf
	Nx1EcLx6KVcfG76uUm7F8G0kI6QO4S5frFz9CrmR3QY/7SESJcFo+2T0stGaFPFfGmozNmNG+Il
	a6/EsvLtaU6rN9soAyjE1FX6pGMRWTwwNDbNyhutRRejKFCBm771gI3BGjJzv6swxE5OKikNQCk
	fq8biWwzDtYm6B8nD7zO0DMaAvThQYL1R0h8jdcp5nQU/4w8mtL+erz1AyEMOoE65RYKe4k9JEU
	wibjwPuvlHbkvWjiX/VBJkMYkUtziYwXhEWPjkE5m73pAZT5caeNS2X9LlUdetpU=
X-Google-Smtp-Source: AGHT+IGWRDOeJaAPpLWfekSMtMXpy4Qbpyr5pWYSFND6wauYCuulJRLUbo01wH9DLbqwq7ctNEf/Hw==
X-Received: by 2002:a05:600c:1d24:b0:45b:47e1:ef7b with SMTP id 5b1f17b1804b1-45b4b3b2723mr5193455e9.17.1755687797808;
        Wed, 20 Aug 2025 04:03:17 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b47c90cc4sm29805385e9.16.2025.08.20.04.03.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Aug 2025 04:03:17 -0700 (PDT)
Message-ID: <660c2594-9a93-450e-9a2e-17ef6b4c696d@linaro.org>
Date: Wed, 20 Aug 2025 12:03:16 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/11] Peripheral Image Loader support for Qualcomm
 SoCs running Linux host at EL2
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 linux-remoteproc@vger.kernel.org
References: <20250819165447.4149674-1-mukesh.ojha@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250819165447.4149674-1-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 19/08/2025 17:54, Mukesh Ojha wrote:
> This is a further continuation with a new approach to the topic
> discussed in [1] regarding the enablement of Secure Peripheral Image
> Loader support on Qualcomm SoCs when Linux runs at EL2.
> 
> A few months ago, we also discussed the challenges at Linaro Connect
> 2025 [2] related to enabling remoteproc when Linux is running at EL2.
> 
> [1]
> https://lore.kernel.org/lkml/20241004212359.2263502-1-quic_mojha@quicinc.com/
> 
> [2]
> https://resources.linaro.org/en/resource/sF8jXifdb9V1mUefdbfafa
> 
> Below, is the summary of the discussion.

Which tree does this apply to exactly ?

git-log-graph linux-stable/master
* c17b750b3ad9f - (tag: v6.17-rc2, linux-stable/master, 
linux-stable/HEAD) Linux 6.17-rc2 (3 days ago)
*   8d561baae505b - Merge tag 'x86_urgent_for_v6.17_rc2' of 
git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip (3 days ago)

b4 shazam 
20250812-qcom-tee-using-tee-ss-without-mem-obj-v7-7-ce7a1a774803@oss.qualcomm.com

b4 shazam 20250819165447.4149674-1-mukesh.ojha@oss.qualcomm.com 

Grabbing thread from 
lore.kernel.org/all/20250819165447.4149674-1-mukesh.ojha@oss.qualcomm.com/t.mbox.gz
Checking for newer revisions
Grabbing search results from lore.kernel.org
Analyzing 18 messages in the thread
Analyzing 0 code-review messages
Checking attestation on all messages, may take a moment...
---
   ✓ [PATCH v2 1/11] firmware: qcom_scm: Introduce PAS context 
initialization helper
   ✓ [PATCH v2 2/11] soc: qcom: mdtloader: Add context aware 
qcom_mdt_pas_load() helper
   ✓ [PATCH v2 3/11] firmware: qcom_scm: Add a prep version of 
auth_and_reset function
   ✓ [PATCH v2 4/11] firmware: qcom_scm: Simplify qcom_scm_pas_init_image()
   ✓ [PATCH v2 5/11] firmware: qcom_scm: Add shmbridge support to 
pas_init/release function
   ✓ [PATCH v2 6/11] remoteproc: Move resource table data structure to 
its own header
   ✓ [PATCH v2 7/11] firmware: qcom_scm: Add 
qcom_scm_pas_get_rsc_table() to get resource table
   ✓ [PATCH v2 8/11] soc: qcom: mdt_loader: Add helper functions to map 
and unmap resources
   ✓ [PATCH v2 9/11] remoteproc: pas: Extend parse_fw callback to parse 
resource table
   ✓ [PATCH v2 10/11] remoteproc: qcom: pas: Enable Secure PAS support 
with IOMMU managed by Linux
   ✓ [PATCH v2 11/11] media: iris: Enable Secure PAS support with IOMMU 
managed by Linux
   ---
   ✓ Signed: DKIM/qualcomm.com (From: mukesh.ojha@oss.qualcomm.com)
---
Total patches: 11
---
Applying: firmware: qcom_scm: Introduce PAS context initialization helper
Applying: soc: qcom: mdtloader: Add context aware qcom_mdt_pas_load() helper
Patch failed at 0002 soc: qcom: mdtloader: Add context aware 
qcom_mdt_pas_load() helper
error: patch failed: drivers/remoteproc/qcom_q6v5_pas.c:235
error: drivers/remoteproc/qcom_q6v5_pas.c: patch does not apply
error: patch failed: drivers/soc/qcom/mdt_loader.c:302
error: drivers/soc/qcom/mdt_loader.c: patch does not apply
error: patch failed: include/linux/soc/qcom/mdt_loader.h:10
error: include/linux/soc/qcom/mdt_loader.h: patch does not apply
hint: Use 'git am --show-current-patch=diff' to see the failed patch
hint: When you have resolved this problem, run "git am --continue".
hint: If you prefer to skip this patch, run "git am --skip" instead.
hint: To restore the original branch and stop patching, run "git am 
--abort".
hint: Disable this message with "git config set advice.mergeConflict false"

---
bod
