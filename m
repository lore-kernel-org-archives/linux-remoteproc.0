Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18A6F425CF7
	for <linux-remoteproc@vger.kernel.org>; Mon, 20 Jul 2026 14:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784556049; cv=none; b=uPoUeDbvcsujyouRLaM8ksPVt2Hmb5dB/GLPVER5SDErf970h6ia6yrm18yrH+QCOu8qMmzgBn+9R5rCKadUHrBph5HONc1xPigLa9OAVJyr3pMWuixXq3nzJUdaTgW3rMCDDEd9WxQA0+9+ka2HjyMFjUCJ6NVtl3O1dgtYQz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784556049; c=relaxed/simple;
	bh=oBMb12/jBWSOUvFZOYBVI8AV7upjkyjqsD/frlDb26A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UW6ydsJYQVzSiQfp+NEc3J5R7+FA2bspSD10J80bViVf95RNu1H986Ci/x/mbKjYQ8rzHy5BwJdxlpRKmqMU4GKA6UXxmTnnDK5gJfltNGpsAdRB9GeJOH1GbujP4/9BOVo5bVDcNtvZZIkKHlzyyfyYDU8/8gzPQLNFoTopJB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EU6TpSs8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kHXxnJ5h; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EU6TpSs8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kHXxnJ5h"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KDqR1t2745334
	for <linux-remoteproc@vger.kernel.org>; Mon, 20 Jul 2026 14:00:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0k366VfeOAZj7ASsgZuqs3BZ1DxSbGgGfa+ewz7+L+4=; b=EU6TpSs8zU/dcfla
	OPJ6bbP9TUkk/NOy7EMSy1XhXdTsue8kk1IdFnr58rG8n6uOr4g7W0+hFSLmPg9E
	kzZirMVV5PIkmx3NIhhJWsEu+08c4Do7BH56KaRbjZCeyjD2NLaXE898onRvRk/h
	igAAclV9CLNvbllpGfI/2SCWb+a+6eAyZ6ZM1oETTS5ZY/rmdboq90yUhuVUECC4
	tTNgT4BA0URq5Rm5It/i9yzZNVmrbYg9zR/YXvs3071j8T580rIe8L0vIH3LwfHZ
	Zd4gy3BwNEedWQA1jlsrnZjex7t1TUeCM9FfywvyMM/ij3qLF91keE9As1j5PsCr
	9W7MHg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhk2f8j0e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 20 Jul 2026 14:00:46 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51cab6f7517so13681131cf.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 20 Jul 2026 07:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784556046; x=1785160846; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0k366VfeOAZj7ASsgZuqs3BZ1DxSbGgGfa+ewz7+L+4=;
        b=kHXxnJ5h/prbePkLOEiRY75da9wqd+fDzd4j8i7kwcsPXrQ0HXj3ZlZrFH01XhVXPQ
         oMwQvk2xLb8glVN8+HOs1l6GUVDC6+ttV22hKY4bCiPC08jru0JleV4G9T3cYlac0QO/
         gXky3u2ftJQ464WRXPtyh14kum69tXdtCP06IH+vVr35IPgV0QQttF4PFJJT5zfBcyB9
         znUmujvJ9AyGWxY4+6SHqP9Fqi6wBfkJ3en+yq5LVW9Z+R2WLod7qpx6g7NSN6OTSczX
         Ool2mOLENEWXWjQb+QeuLcvdbZV4QzPP2pc8U6N/BYdWhNTtTjUeNl61uLQ0X2iGoQKw
         u4DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784556046; x=1785160846;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0k366VfeOAZj7ASsgZuqs3BZ1DxSbGgGfa+ewz7+L+4=;
        b=sZEN5fuKOSWXAealLqp3u6Jy3ovCxL6UVbDzMUGwUYVrDxM5/NWgnxAognAoaSGOIO
         IT76X9AgZZV0nm7eN2cygLm0BqIFqrLg8P8YtdpwVuCo9hKgs7DwqLBgNS4UJmTh+VY5
         F+cfOeurdjtjA/LYOV4ymWvsFpoYf4sk5kSDB6T6RGSUoKMOCsY7lW/AJPOFrkFTJhfw
         Re24zDhfmJpwqIA3TPfEDTBQrWpaMH4xbRhcb6xkw8GS3+i5YBeqQCrfVGid+LrLYgH2
         8FtkhbW04Zd4eEmh2HU4qmS5n9g20bb46n+mL0qonRQuiHJNoPDUf7VMNv73rWSUKbEb
         N1YQ==
X-Forwarded-Encrypted: i=1; AHgh+RqUOpWo4Zvh6/Ko4lf1qMJY14JHiPqmz3TVnCb0f4UrbMbBVb45M7RH4vcODIEBKrbLJpKAmnJMRc7Ke2MTHCDw@vger.kernel.org
X-Gm-Message-State: AOJu0YyMJ1bs6MqXPJBWLraR/NxW94iRjCz+kFuNxUJWfq5iPbPyP5X+
	LMJkxdhmfcytRYqUwyqou3u2+7igUvngOA35PROtot89UZSmgvb67STohUUbM6JJkCquVZ8xssM
	luJjGngmQ50Ye9OYHjGk86vVd4/oTJwJH31IbGCfKLEGEvlUnpM5UscquWjkNBCf+h7uPytZj
X-Gm-Gg: AfdE7ckZrG5MbvgJNStCma4z21fl4lbU4D+zMcgdDjasZPUkARxS7GZmbjKuDQpgyIV
	dxT2Xc+ly8Y2PMpwbovmU0aXHcZj9lzd6A+D7bLE/cQ5WC/0lGzMHe1PzrpvQFk9qPsgdRCaqii
	NFaS/8vK+ctsKXfI+b+OZ0T6oFIwey9PC2aaJOLhAs8uM5+MWT++mRHtGSLfZk88iaaValF9cc0
	nIT+jiFxuFfhAmuCDAqs7Oepos78elvUFI1AX8D2PPOuy0cfDA1kcVyfuKb1/nMqgL5/ziWTauP
	eHArHuencc8rmQL7Dv8R+dKZlMolOAy/onkWPZRNdvXdYGR77zBTMVi8/wSXkgKvDrCuZ9rtr1F
	dIpTZ28YPcwryHO5+I8MFBDVW
X-Received: by 2002:a05:622a:148:b0:51a:8945:312d with SMTP id d75a77b69052e-525f5d98602mr8068531cf.0.1784556046058;
        Mon, 20 Jul 2026 07:00:46 -0700 (PDT)
X-Received: by 2002:a05:622a:148:b0:51a:8945:312d with SMTP id d75a77b69052e-525f5d98602mr8060731cf.0.1784556040194;
        Mon, 20 Jul 2026 07:00:40 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c170591172esm479090266b.15.2026.07.20.07.00.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jul 2026 07:00:39 -0700 (PDT)
Message-ID: <6d3ef3fa-d7ee-4963-9c18-32c7605b762e@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 16:00:37 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] rpmsg: glink: smem: Use device name as IRQ name
To: Chunkai Deng <chunkai.deng@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, chris.lew@oss.qualcomm.com,
        tony.truong@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com
References: <20260720-rpmsg-improvements-v3-0-e7b6070186bd@oss.qualcomm.com>
 <20260720-rpmsg-improvements-v3-1-e7b6070186bd@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260720-rpmsg-improvements-v3-1-e7b6070186bd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: jpupg8n0sfYf733V8GcfDiFAsyNmVGsV
X-Authority-Analysis: v=2.4 cv=X8xi7mTe c=1 sm=1 tr=0 ts=6a5e2a0e cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=M4aA-yYNIiwQogNIN3IA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDE1NSBTYWx0ZWRfX8alRhqO7deUs
 Ta0afBN1skD0VOdtOhPDGnx+tkSSO6Y2/EGssYvLJ8qUtkE0nkeCvCPJ4ii+BgGKtcF7iONw/EN
 ZWyqZWxuZhlSZXpY5+ezCvAzjkDn4hg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDE1NSBTYWx0ZWRfXz/g/cLrg13Go
 uNff7TgT2Lx0kgC1O37fT/E7wjGPutRhFit9XkPw5G1BidZpyRDvVvT1XdTgI8tWrEA2qJqX2Eq
 eVcoY7ODz+jlkPOcKq/OkZrOgwjzNIyVCw5ZwyI/lU7r9yz4y7VX/HZDSB7rwudf0rxTpz5eg9u
 NmD4nCCyttcGXxxLAXN94lAy36iaFRP0hd73simBT+rTU/4vNOxuhRRewJvjyLzZ0qGprCg/ell
 UT5Z4jQK6MoSynaeJQBGX5l+U76e7ACVUZbWVmCE1zWNF0+gwMEzcmqMTW3sCeaZK9V+f8YHFnX
 DdTwpiEUt+vXaxrbOR4bizqYP8YwGMQRsd0B/wnzIu0My0iRYaxGuIBPl2IzyzD5iB7WbGTLiaF
 J9EB689Md6MDfI0ny5A1QvkgAbbuHuTMa1l9lk42RTNyutepez46QEOS4E2rlgc/ClLmlv1XKeV
 ZfrI37vHd+nkhkw763A==
X-Proofpoint-GUID: jpupg8n0sfYf733V8GcfDiFAsyNmVGsV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_03,2026-07-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607200155

On 7/20/26 3:25 PM, Chunkai Deng wrote:
> A SoC typically has multiple remoteprocs (ADSP, MPSS, CDSP, etc.), each
> registering its own SMEM GLINK instance. With the static name "glink-smem"
> all instances appear identically in /proc/interrupts, making it impossible
> to associate an IRQ with a specific remote processor.
> 
> Pass dev_name(&smem->dev) to devm_request_irq() instead. The device name
> is already set to "<parent>:<edge-node>" which uniquely identifies each
> instance without requiring an additional field in the driver struct.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Chunkai Deng <chunkai.deng@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
