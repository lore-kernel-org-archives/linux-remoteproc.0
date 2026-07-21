Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF7E64BCABE
	for <linux-remoteproc@vger.kernel.org>; Tue, 21 Jul 2026 14:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784645122; cv=none; b=H5Rdvj1E6626yaZ4aoq2Ef/z0H3uzneyRvSj5D72Fv9x290/omRG0LakZqvJLcX1ISt72TzxGzRBgJuMVBMxC5N5Km05c5r2oqwsEbI05i7NAtRboY814fs+Hd7j2Jxw/U82jmCpNu7mg/4fMXfDyJF2kRTOS/iButXonWyLqqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784645122; c=relaxed/simple;
	bh=H+4jDtE3mCl734BSgWWpyd0ijnfyrGtaCzTrdfh66/k=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=mqbWg6MGcCceU6/lsF6qZdjuejYodJO3S2vHgNyWW/ycYWutptfn45OqmytjBcc0Uis58wkx/Y68rFI80PG4UnkNR0gj/wgM2wl3eFlE3dt71q7pKGuipqr4E3+wX0LKy1dNIydJoro9chdx1m5C9WkspYAkrJJBgDw6sDT0/Rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fUcN344+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Rmub467G; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fUcN344+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Rmub467G"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LDfwti1707197
	for <linux-remoteproc@vger.kernel.org>; Tue, 21 Jul 2026 14:45:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+SBCyGgJbN6sunp0BYwaF3O9zR1Mj7Y23sL1OJAiSLM=; b=fUcN344+RQW5y33K
	LIoxDMbgnxXqORPDQ4aSsSLu4S7rnHyurEQnSwr7HcaFEu7YD6u1IBM7Du1Gc9b+
	1tPcJzigyuZDUjbnITzTkaljq/AOYQtuhn5lJe6R611VJmQKgR/KmEj5uILWifWr
	FWddZeevM0srWED0IBVJ+LO116+ld2Enh7oPpglHWbeQICxhuGq1dwo0LOuAiIMl
	uaYHHljB4FBNJKP6bjPOnN0AYyJagej5euqRSUVuiMGz+rD4lmDTtHSP2s3t8mjt
	ggf/8irY6g9wnBFspeFmDhaekkWZ1SaMlys9xDd0DtMIFF7zwIfz8FaINOpjVqQw
	PZ8Jlw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj9ae8gj0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 21 Jul 2026 14:45:19 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c07f25de2so110060601cf.3
        for <linux-remoteproc@vger.kernel.org>; Tue, 21 Jul 2026 07:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784645119; x=1785249919; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+SBCyGgJbN6sunp0BYwaF3O9zR1Mj7Y23sL1OJAiSLM=;
        b=Rmub467GQe1p74EIGZaQJjuvUjHvoxeFTVTS4JIRbQq3zd3zOVcGb95HrKuMymy5Qw
         fUfO33HVkFkhU1YGyWydmJdEYR+FmkHM7LPHfvQznX+eKSom4SSawMThNmkcMvDLALah
         EhEDMdyBdWIRQcSqnL4HlR8FC0N1dvb5k10ahgXjIpFerp6bP5q+IfM8yWmavHxWs6Mu
         UwrAmc5EURAU5yN4RxswMSfY0HKuHRWGSupbgd9zqEBdxQ12JozBxs2nlqGAabQQfYLP
         cb5P/41mBgKCNfDoSJwscLTiDjqn3qfXtZ/MNQfiZlNdpdUdQGswGK3rGfcf8wGdN28O
         HLZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784645119; x=1785249919;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+SBCyGgJbN6sunp0BYwaF3O9zR1Mj7Y23sL1OJAiSLM=;
        b=dyhX8dNO0Y6XNRUHkv7sR/Khd67NbHKEMUF3NsxM7/jEqUKz05+o716nPt4Cp/ZGiE
         geoBV7tCgLfJSmA4YFAi9gt7N29SEULK7+M/kyOMNPv0z5n0LoJSJdjlxL0MAaDu/M6U
         3qywxDRpmWzTMRNP67UIsX2exFwO3M2wPrl2+G4dwu5cL34DYU+8JlUT3ytD5SYajgt6
         4my0QpMMnTtmlB5UYG0NoME4lxmSggngoG3uS+1MMBm1zYDqydjawcryxs4kvtBljG4Q
         FPrgy7Kmhn9Ofjy98E5SMMGWL+Tjyj/TVVSzyQdzOzAoFU0efWiDCOU402M1OigUjry+
         N53w==
X-Forwarded-Encrypted: i=1; AHgh+RqX0jK0aWd+TgSyQBpTJXCRNT6E4A1xerY9hbaxVPz1tU3jwJ0BjFGYs2oE9YzSnsC0/pnHpIVXgaGra5sOjniU@vger.kernel.org
X-Gm-Message-State: AOJu0YxumkUc+S8Wq8IgUuJRvsXwVVa5jacNJ7adgNsMRAnqog0YN4kC
	pp3VPaop7mr7UWJl+7GSjFwL5jpJT/iiQoHsGQPBC4ZajEV2sub/YMs7HiDT3IzO0S8gC6MCkya
	ZkFFx8LLwP4SrAOtgGKo1HmmQ96r71dy0zXktyL96t/fDqVuqjHg50jjX+x55ESI1uvnnMG4E
X-Gm-Gg: AfdE7ckZuqfp1A/dlqImS8Rnn0GlKaSRl9VrqaqzM98ZvK+x5EJrg/z+FvcOYg5h27g
	+DtyMsPxEPt0G9LO4kl4VgZSPEu9vr1fo727WPzMe9ia3JceOwTdr2yS7D5/v+XWZVgsr0N8lOU
	EO18AIsomv6QlsNjjW4U6XyG7PaGRvR/9LiLBjPKjNh2eWoM34uYHWZaVaaxmyeVfNfS8Ibhcy3
	Z6okxixBYA3tj9+cIr0yVI3TCqt3oI2/TemSVZFmR5HIVB+lEUj/UGHb5VYkRNaKUeDcf4DnSRg
	8pPxSEk86rRP2iKxBGzMaV0fw0T7J55sqaajtR74VlV8drOEhrtZzl3h+7CPK1vavz7n0CMTryi
	qhTcmTcUZLrfi6bYCd9Y6D4HnnjK5m0HEGo8czxUSIjWFpD+XIlU=
X-Received: by 2002:ac8:5f4f:0:b0:517:c65c:488b with SMTP id d75a77b69052e-52137df1584mr169984521cf.0.1784645118833;
        Tue, 21 Jul 2026 07:45:18 -0700 (PDT)
X-Received: by 2002:ac8:5f4f:0:b0:517:c65c:488b with SMTP id d75a77b69052e-52137df1584mr169983961cf.0.1784645118298;
        Tue, 21 Jul 2026 07:45:18 -0700 (PDT)
Received: from [10.131.142.220] (220.171.88.92.rev.sfr.net. [92.88.171.220])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-495653698bcsm67022225e9.2.2026.07.21.07.45.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 07:45:17 -0700 (PDT)
Message-ID: <d5cab365-b781-46d2-ae36-815b228c0465@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 16:45:14 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] remoteproc: Remove redundant dev_err()/dev_err_probe()
Content-Language: en-US
To: Pan Chuang <panchuang@vivo.com>, Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Paul Cercueil <paul@crapouillou.net>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        "open list:REMOTE PROCESSOR (REMOTEPROC) SUBSYSTEM"
 <linux-remoteproc@vger.kernel.org>,
        open list
 <linux-kernel@vger.kernel.org>,
        "open list:INGENIC JZ47xx SoCs" <linux-mips@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
        "open list:ARM/QUALCOMM MAILING LIST" <linux-arm-msm@vger.kernel.org>,
        "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>
References: <20260717065224.600593-1-panchuang@vivo.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260717065224.600593-1-panchuang@vivo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 1y7weczgBFUGAaFgaAipKtS2GoNac_Az
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE1NSBTYWx0ZWRfX9dTMRujvYjdo
 Hg9mRhXKqt16MmTVoCYQKumxrUhrBn34MEDWAJBuhHxkh5dMk1D2kPaEAeO15C4oxLOkubLJf+j
 0uj2fBOLOPRPeFYAKg5lyfxin2qpLMk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE1NSBTYWx0ZWRfX+dGkIkPJypVK
 OiVDqN3oBU64rmBl/QBjIHLSKwDOgCTvHC3H5cLp9fpnEHTRthSgPnEFgAMiKq4BvfuPm+rzPhF
 6Fuifbto3appuSacZRgDwnL3mTClwlvJnawvT9a6k/RKJM5coN7ZRKwhMRx4TZGKSL1eDr1+yw7
 55IkAXjKWvWZ+MzVdBnvcrzcZljUugPYkgRXwmgMrM/8N5sfj2Oi3kRH/soxWYSyiueR8R3+mAK
 NUmSLpeDud3tCEM2rSKQ3crpXqFk0rR2uD7CLfp9W23H1mt27hC7d6NitCrHfLn4UQiKly7voyN
 mdyJz6Pveb254MT9ZAi85BgLOGCBEHMh831WD6pEo0kOKMWVT4kXznrKsDEZwxErPP+79CpMlrK
 IranAgVeX2kdiMhghTkcpwubXJMvBgnJElScAgUkBusobbrFnMnfkiy97ZHEtaNE3uTJUkglzmk
 9rT+tit4S0GNCYCy9xg==
X-Proofpoint-GUID: 1y7weczgBFUGAaFgaAipKtS2GoNac_Az
X-Authority-Analysis: v=2.4 cv=Cr6PtH4D c=1 sm=1 tr=0 ts=6a5f85ff cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=HvFMDRKYglX6yPpWI6gtsw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=1WtWmnkvAAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 clxscore=1011 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210155

On 17/7/26 08:52, Pan Chuang wrote:
> Since commit 55b48e23f5c4 ("genirq/devres: Add error handling in
> devm_request_*_irq()"), devm_request_irq() and devm_request_threaded_irq()
> automatically log detailed error messages on failure. Remove the
> now-redundant driver-specific dev_err() and dev_err_probe() calls.
> 
> Signed-off-by: Pan Chuang <panchuang@vivo.com>
> ---
>   drivers/remoteproc/da8xx_remoteproc.c    |  2 +-
>   drivers/remoteproc/ingenic_rproc.c       |  4 +---
>   drivers/remoteproc/keystone_remoteproc.c |  4 ++--
>   drivers/remoteproc/mtk_scp.c             |  4 +---
>   drivers/remoteproc/qcom_q6v5.c           | 20 +++++---------------
>   drivers/remoteproc/qcom_sysmon.c         |  2 --
>   drivers/remoteproc/qcom_wcnss.c          |  4 +---
>   drivers/remoteproc/stm32_rproc.c         |  3 +--
>   8 files changed, 12 insertions(+), 31 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
