Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5473F3F1ACF
	for <linux-remoteproc@vger.kernel.org>; Thu, 23 Jul 2026 10:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784804106; cv=none; b=LP0tPNc9t0ROOEuaWQ6HY0r0JAUkYX1N2GalbtYDRyQXwbJUKbsk3tuv58CrMp1J+nH2uINLx/jvd/XwCZoNJ8WJ1DwMkl4iJQU3xcReKo7LG7mCRcJQnBb6icUCd9FsGwFm5+2bTDC0qqHVIYZ0pbh7fpKWCx63bYFrrOK4VLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784804106; c=relaxed/simple;
	bh=Pi70S02miiNHDRc/Q7mSW64ZqfbjcQ4++9v31z9RVI0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b/CQ9tZrD4fN/MWPA9IvIhCLGs6rWNtx1sh3Ndxcejj68Cx0sptykxtNuk4jyocZzuqiQaFiLFrKKorC5Q8IQxhP/P/EGCnFgSBwrQkxwN/JEaVQjXwIGdd5pwEyAdxjzyp6pDi8QTSR1CMMbr5QKBtGS2We6k93W4I+ejMBtk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lNG1gAHM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DwD3H1pr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lNG1gAHM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DwD3H1pr"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N8qcvH3668134
	for <linux-remoteproc@vger.kernel.org>; Thu, 23 Jul 2026 10:55:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bqfqaFsHDwVvg1n0mFLME+pVcZeQc0JW7wTTIKnGDmM=; b=lNG1gAHMBTlj/pEq
	9f0ohq7uQ7BhlhJgH3Nj9pD80u4AKEs6Gp/lnqQdCXCmTrdYLkBjsrLYLvDdQ1nw
	niYzZSbcNRbkSTA6kiwIy8/2bZ0RyuLKodC5nn17fbZHrWCP3giZTmvuDyML5eDd
	LZ0/TlhAlWWXGzZV1gMsJHsNXxW00QFsWcOCPEk+BgGeSQEwxl5f2IIv/gdFnjqv
	L8gZRhkUBX+4aS8mU079LTTQ0H7rkpQ70jSoQHdQlAQl2p6orrRZ5Tn13ZBDV7Jd
	z9O1LDJDuhNGWL3rOWIm8NZRg9X3yRhcL+YWqOAnZG44yUtXx9PCSOypfCn+kZUA
	+xLTNg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fk5cc2tsk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 23 Jul 2026 10:55:03 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93105103d06so11891085a.2
        for <linux-remoteproc@vger.kernel.org>; Thu, 23 Jul 2026 03:55:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784804102; x=1785408902; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bqfqaFsHDwVvg1n0mFLME+pVcZeQc0JW7wTTIKnGDmM=;
        b=DwD3H1prPznFLhz0RM3Ff7e9qMvt9pj+ZR2O3IH7hH1GNFiArHZpTz5qB/oLNGTLSv
         88YImaHEvhvOXYcWs/OTo8UnFYjjrv6sRRv030sp1nG8qWmdR8Z5HCYoQhf4R9SeN4ip
         Nk85U9YiqkMHLuCTjXWmxJojkHCOWdhoPxpCpYGT46GvFmnbcLkuZP3NIdsFvG4fd5Ei
         QVhCfwIGTGene+k3U/OrgrmI2VaL9IrL/iRgiuGoiwGR90h43EY9VqUxRQ0Zh3Zps/z8
         UOgK4+U48XXhbBstk+/s4x8me103Hx9NlJ8GPJCRACi7GpLNnvsYWHXbn/S12Eah6YQn
         HHvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784804102; x=1785408902;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bqfqaFsHDwVvg1n0mFLME+pVcZeQc0JW7wTTIKnGDmM=;
        b=Lz7F2ZnkLPz8Cwa15bvFodKdE5Y9+2c/loiKLpZ0m0B6KcR6kk8xfGrPAqbXpvvimR
         YcfWqxDvVNodYwjuEyc7zftJNLNyd5GOCAdDAJeG0brCihwNAeAn831PLFenZZCTUO2c
         4esGZdQv6mzhNFTSX19T5IRafQFfV6LnYUsOvYZ44E8zQICDt8nmiHNDLcVnxItkl/7W
         KnMCI6jVWqDymFkfbxIwFLmsyAUnThPj5L8OYiEy4IF9+LZ/MrVar94taVC61S+ksH3W
         XwSQxxTYC1GxuyEtxsmDTcLoBKkskqKGGHvRXdfZNUWGxHlQ0AJ3VxNQhZQFbSnozkjy
         5kCQ==
X-Forwarded-Encrypted: i=1; AHgh+RpVVUBsVfuSBgWTPEYF2XLNaixscjxZTWYciKXCxgBLPVCEl9hTA8hwMEOwelYS5WATygSjI0BdNMv44goGUTAm@vger.kernel.org
X-Gm-Message-State: AOJu0YzV+669YneOeKuoMo26RdFL7Uat2uHCU3dxZW0ougl5U3Udt4RP
	+5K+zbBPjUibzB6WnfGhTDoFH2Wuise2erXiq+V48+GtnMLDzPT6bzPfTZfP8fBb9hFVxdpJWOg
	Ull0XFvzLnN+HcYcVHJgDo+u9fovEI5jWc8ZTx/+kOQlvwDTMF+x5tgPAjxhtgVV1yMy2BhHp
X-Gm-Gg: AR+sD11R9qSByZOGZ60KOEeWaqHNUTfPYCOx7I17JRC8/Mo8ILANQ+zXyaLgXzfHigu
	tQFewnI3M7UfkwJ/UqCkSAeR4t7f0wm/YJ/FIEQ9oQ/z0whInJ3nGu6c9VUGSJvvkXbXtu4ODDZ
	4CaljXY/0YRto5WJfb1p85pscuP1ZoUMjZ1KuOr5hNNyQemzotgBWPr+SPc69dSE5ot+NMdycz8
	WziPh/7yHAspDXJRVCFPZj1oCn0uX/96p6LOywKanSmpeIyJ8tamdUyThhRnX8tFsA3EVd9DLm7
	xEUgou1J+72QWYEnQFOF76vNUwoUwgx6HntA03MluhUPQGvtiX7oDd54bKBos+QO6BsJzsLf1ry
	JQycfG3i6Ba81Q+b/4IQbBBH3
X-Received: by 2002:a05:620a:470e:b0:931:23a:83ca with SMTP id af79cd13be357-9310378b626mr218791585a.4.1784804102499;
        Thu, 23 Jul 2026 03:55:02 -0700 (PDT)
X-Received: by 2002:a05:620a:470e:b0:931:23a:83ca with SMTP id af79cd13be357-9310378b626mr218789785a.4.1784804102018;
        Thu, 23 Jul 2026 03:55:02 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c3260439esm214896266b.0.2026.07.23.03.54.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2026 03:55:01 -0700 (PDT)
Message-ID: <413bcb02-4823-4c2f-8e0e-c9a40664caf9@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 12:54:58 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] remoteproc: Force shutdown during device removal
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Shengjiu Wang <shengjiu.wang@nxp.com>,
        Fernando Guzman Lugo <fernando.lugo@ti.com>,
        Ohad Ben-Cohen <ohad@wizery.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260723-rproc-rmmod-not-crashing-v1-0-546dfd5de0e6@oss.qualcomm.com>
 <20260723-rproc-rmmod-not-crashing-v1-3-546dfd5de0e6@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260723-rproc-rmmod-not-crashing-v1-3-546dfd5de0e6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: V8pPJ8wReNWKC-L8YgzBkePXG4X_q67H
X-Proofpoint-GUID: V8pPJ8wReNWKC-L8YgzBkePXG4X_q67H
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDEwNyBTYWx0ZWRfX9YVkGEocCcpw
 B2qqu6Mko1JxxJ7P2uKUZHpLhVM0MpOf033u/uwoy54w/QYNdzXUYYsoQdoG05kRgjHfivo2Bse
 ne7g7qyPWASA4JlgExDXYzN5VFurdaU=
X-Authority-Analysis: v=2.4 cv=L/ItheT8 c=1 sm=1 tr=0 ts=6a61f307 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=B9Y8OgnbIiifJ16KBmAA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDEwNyBTYWx0ZWRfX9yMUCNCL/bM2
 x4jwUr7KLz1BcLyYEb7ozbKIUZjMCUWM+ZMLcIRru8sOaoocgLNyIqLNhEytw+PDCAt3nlQoM+Z
 +iyQQWmBdMoWfqB/HewLr0PU/qbbnTCtPOmDiDN7n+3jhYuQe7ExB9jtHsKa6KgleuwZnyIhGtb
 yI/2E65vdXFPmpGWAYbnHjTM3Tzeo5A9O07dlIEcn/v3cd/jkWNKxEmYcVkM/8qXStZ6qUi/kIE
 H9oN9DgfP0ZtfygA3X5ofrscXkEIf9m4IGw+fLZosvwxmtG8jyRbn3bxuMY/R9G5L+cVio86ujK
 yoOUfVuDrvma4RzeImpmzxHh+1OyEn0wA8RKAtDlNVBgjTeyKHO8mh4eljnb78x+tKv/iLyF2FX
 EhikHMdajffomc/B3ztxCj7KjcdKbz+mVPvhmHLzZEheo1x4wDohRRDEhMGL/hXs/Xm8h3WnN2C
 yGdyrr6LhsLQ76u2MDg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_03,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 bulkscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607230107

On 7/23/26 5:52 AM, Bjorn Andersson wrote:
> rproc_del() is subjected to the reference counted shutdown path, as such
> a remoteproc with more than one reference will be left running as its
> resources are released underneath it.
> 
> Refactor the shutdown path such that the reference count value is
> ignored when called from rproc_del().
> 
> Assisted-by: OpenCode:GPT-5.5
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> ---

[...]

> +static int __rproc_shutdown(struct rproc *rproc, bool force)
>  {
>  	struct device *dev = &rproc->dev;
>  	bool crashed;
> @@ -2029,9 +2008,10 @@ int rproc_shutdown(struct rproc *rproc)
>  	}
>  	crashed = rproc->state == RPROC_CRASHED;
>  
> -	/* if the remote proc is still needed, bail out */
> -	if (!atomic_dec_and_test(&rproc->power))
> +	if (!atomic_dec_and_test(&rproc->power) && !force) {
> +		/* The remote processor is still needed by another user. */
>  		goto out;
> +	}

GPT makes some unclear suggestions, effectively saying that rproc_shutdown(),
unlike other paths, seems not to first check whether the rproc is deleting
if the shutdown isn't forced. I think it's a valid concern.

Konrad
