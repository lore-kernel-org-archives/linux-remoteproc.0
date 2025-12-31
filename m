Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBB2A329E66
	for <linux-remoteproc@vger.kernel.org>; Wed, 31 Dec 2025 12:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767184061; cv=none; b=qkuC9V4zwxB9X3e890C1759GYEs5vH/yY4qvJWzTyETjFYCJX+GsIDGn8zSKepOuYzs3Two8pUI3V7TTstZwKMhfWrvsg1sDsr7lEgiauOA/IT27wNy9RwrBANNlOuECHTZuJd9z68C3mgjPGqHs+G+2R/rwg1l4GNwAjKNssbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767184061; c=relaxed/simple;
	bh=ACksNw+NYkkl0s0wHrxcavYpqmO07bWYFMNNNVklzRI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Fww6xdtjGNohBlzYXXOg9wJctoYC9qtg8g/qtdb3Ao916PPgoJ3qYO8oC9/hylA0uF21TrIc3h9PDL8a4jeqlDpoJD11C69VdFXUGSsf+iBC7+F6nII540QxQVcayPl27Ks2f1ZjTek/VAX12VBHNmLbUJ6Fd6ySMZbNibxLnNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lrBBKipC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=US40zznq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lrBBKipC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="US40zznq"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BUNkeAf3138113
	for <linux-remoteproc@vger.kernel.org>; Wed, 31 Dec 2025 12:27:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+VMa1aZZxFb7V0dJ2w4Qwd1Wv7+cAd4IqsBj+pDQQ5Q=; b=lrBBKipCAIGuRvyR
	WzkF+dHmJbPsluaqkz/uSHYarUFNJQ4268ATtpU5fWeqDYgb9240JGV4rBTLls2A
	1pPJ1FpTbB6use19naR4Ew+hWZpej0B6V7C50dP3rXhqKKfdSML9uq36Cf0SqcwJ
	41/pdAdW5oxRBpz2Bc8iqMRLCPdRrKYfJkDtkMeAKq7QaFedtni4efqJNsVk2yW0
	8/Btk+vWxIWyICE2OpvpcPSAIrd0veJRUAYvml+w8KNTkyyqFbwJjVSSB8xVXQj6
	Y0lwVe/Qq+JPyRmp8qZ8NVi3qA6qu24Ki44H1LeL1BilJd+yHxBwuiKw781JwngE
	hHEw4A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc8ky3ee3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 31 Dec 2025 12:27:38 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ee07f794fcso42603831cf.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 31 Dec 2025 04:27:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767184058; x=1767788858; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+VMa1aZZxFb7V0dJ2w4Qwd1Wv7+cAd4IqsBj+pDQQ5Q=;
        b=US40zznqzFQAqvOFHP8/6wIHyvWIaf5AUrmHfXWmvMLAAse6B/I4DPGNpwrtDxjGOX
         aOREcj8eKLjSICg6MzqdrL7lSBBSGJd3BerqRZ/YQYLCMOiw3VOc/T36JzO1TlyQDPWZ
         0FlJVCmW0DiPQ++XUZyRC2YwftOnEYk2+CWTISNWQXqmCOt3ai1CK3kDbTeYCR0dnkZm
         zRQu2pAz6IEfqFQA3ejfleetcVzQ7gbUX6Rkr9uk7Pe6jKkRiT7otLtuRyT8bo71mr/m
         SMJA6R4ggjmEiB4Yjt+D4I6FW/JigrqDmSEVh5vGugGbgEqJdIf/jcebnC1tA3jKWBgx
         19Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767184058; x=1767788858;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+VMa1aZZxFb7V0dJ2w4Qwd1Wv7+cAd4IqsBj+pDQQ5Q=;
        b=hyOyBoaQ/JexkrWb16syeAAWEneIZ7kQhfanSudm0zDR6Qx3IUjTmcfwCFxYySOOI3
         PDGMwkyGFSkhKzY3VApqW9/lkGwZ4XH9IfY+V8yH4TRYe1LeaVk0kl3XDM1GwCB6SkG7
         +FBUCArHEFPSYZwA3FeOUk5Skno5ticwoyIeFTwRwiJjrdi0qTHSLU7V0yon9IVfZTZ4
         vcFiRAuvlOLlfyaBmZXkZt+lTTTRds0rqEU/bn/JI7b6vc75tlQqKXsnna5e7Wg69Nhm
         f4LbSFaC54e9M86gH3HibnLG9mIOGY/1H7q9NLyxfVeoqzN7AytOkoJjWW2yUDbP/W5p
         Nleg==
X-Forwarded-Encrypted: i=1; AJvYcCX1QbSC2RDcFE/pMkjgIXFyE9etFEPV5SVKEwzRR8nt0tqfVWKhbbXgnVhwSNi6HBctXtTBI/YEbl6YxiqGONw6@vger.kernel.org
X-Gm-Message-State: AOJu0YxdTdiN7WG0c7uJxLIsh/d82HtNi1FrffGaZ9shgE/67gIaF+4+
	BMAagWUT0nWfOAG1Hh5TbxRmjAy3M+79uneleuMbKXEysRa1Zw8xmZWeTMZWJp2r9rIMNXFTi0l
	wZTbpFIWaoU4XZ3ICm8zV4/hgxZNFyA92Knd3lTqFdHCguzdF/J1r+/EUoxU9PxLejK7Nh+/ih/
	X8EtPy
X-Gm-Gg: AY/fxX4wBQ8ofV8BCQyQ7i1jIF7M60y+KLbC1aNvZjrGy3LQtgwPo4Vm7GMQxgJ36Gf
	eKcsd97YCD9riU31F6qDIflIRlLv5dMkTsMJ/GDzeoURrpmcwqO5KLWCYqa6Y1yU4/QppYp8+lt
	uKUT4BQlGUUrGJQKL0RAVMUmn7pYAA+h2JXzaE62oWaZnDPzqJAZFfAclCE4OjJCzelKQY8PZrm
	9F2Yam4NARuvgXV8e7H9Dv9GducgVNu2p9W+JpjCGiExr5kF8QiE91P5rt3lUBG+O9NDRhyMbb3
	yTV+46wvL/rBTmAi8jq/0c6DOLS7ekwV33kVSSi4w0xq2a9A9ApUDL+aej3fi8RRagudnPHe5A2
	cwDqrXD+ViotGchvePNtiAwGWAnPcEwiXPP3nU6wfQ0vRyDaY0BFxa/BW9S3B+ejErQ==
X-Received: by 2002:a05:622a:247:b0:4e8:a54d:cce8 with SMTP id d75a77b69052e-4f4abce7d98mr420636401cf.4.1767184057895;
        Wed, 31 Dec 2025 04:27:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHB3TY6zH62/Mf3iEP4dkTisCB/m9YsUB739Jw0dZNO0RNTE1eGtqKAq+EBlz1huXNzUQ0PVw==
X-Received: by 2002:a05:622a:247:b0:4e8:a54d:cce8 with SMTP id d75a77b69052e-4f4abce7d98mr420636091cf.4.1767184057424;
        Wed, 31 Dec 2025 04:27:37 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f18575sm3859646466b.54.2025.12.31.04.27.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Dec 2025 04:27:36 -0800 (PST)
Message-ID: <e4e94f2c-98f3-414f-bad4-d23f7cce8047@oss.qualcomm.com>
Date: Wed, 31 Dec 2025 13:27:34 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/9] remoteproc: qcom_q6v5_mss: Add MDM9607
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251231-mss-v2-0-ae5eafd835c4@mainlining.org>
 <20251231-mss-v2-3-ae5eafd835c4@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251231-mss-v2-3-ae5eafd835c4@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMxMDEwOSBTYWx0ZWRfX16TE42ZNM58g
 Po+7tOCi1KQ7fa5Gc4oSMZGEH4KtqhQnQbQhOGPUY7R54iDijCuHnRI6jBjT/wP7kthQLvqk846
 f8rxLJGITvCklfv48CBgXCDTukTv1adQ5rXPfeh79pSp73ng1rmxGgX0yaKdqa6bLXL3tLpIEn+
 PuHOs3MWBNOCpkmkYUlF012Iic7xfhzAg/s4tVq9YH3mokqiV8n+BwU5bCO36gjmzGzIJx2GD0W
 m39dK0PsZ4nW72iTnW/U9gySwNu70nrRZkT/SW2epGmqpCX2J4kv5MD9SQxEiAnw0NSbGfH2PI0
 kC/TI04oQy4KjTvrD0DAPtdvzCbVV+xDa257fLJ+SicZCv//BNGWSnSdgHw5a3Wn1VWa+4BVaga
 rL9uGE64oboLlxwH0kSC6KVSukENiU58AA+BQjuGWmZfmCYXWQqcfqWQrtd9ui0SmC4PR4yiOQV
 0mKLM9sYLVxzN7c47XA==
X-Proofpoint-ORIG-GUID: ilsQi8oLHVDmbtyYwAjpK_ZVL5gRA1Xs
X-Authority-Analysis: v=2.4 cv=BuuQAIX5 c=1 sm=1 tr=0 ts=695516bb cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=j8Cu_9a8AAAA:8 a=OuZLqq7tAAAA:8
 a=1VDwhlkcsf7JRsAq08cA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=A2jcf3dkIZPIRbEE90CI:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-GUID: ilsQi8oLHVDmbtyYwAjpK_ZVL5gRA1Xs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-31_03,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 spamscore=0 adultscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512310109

On 12/31/25 3:29 AM, Barnabás Czémán wrote:
> From: Stephan Gerhold <stephan@gerhold.net>
> 
> Add support for MDM9607 MSS it have different ACC settings
> and it needs mitigation for inrush current issue.
> 
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> [Reword the commit, add has_ext_bhs_reg]
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---

[...]

>  			val = readl(qproc->reg_base + mem_pwr_ctl);
> -			for (; i >= 0; i--) {
> +			for (; i >= reverse; i--) {
>  				val |= BIT(i);
>  				writel(val, qproc->reg_base + mem_pwr_ctl);
>  				/*
> @@ -833,6 +847,12 @@ static int q6v5proc_reset(struct q6v5 *qproc)
>  				val |= readl(qproc->reg_base + mem_pwr_ctl);
>  				udelay(1);
>  			}
> +			for (i = 0; i < reverse; i++) {
> +				val |= BIT(i);
> +				writel(val, qproc->reg_base + mem_pwr_ctl);
> +				val |= readl(qproc->reg_base + mem_pwr_ctl);

Downstream doesn't do val |= readl() in the inrush-current-mitigation
case

Konrad
