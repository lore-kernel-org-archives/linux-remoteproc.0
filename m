Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DC7238B7A1
	for <linux-remoteproc@vger.kernel.org>; Fri, 10 Jul 2026 20:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783713710; cv=none; b=uqp8i19AzASHK0WN6ySpkxFMBhEzXzq91iK6w0R1OaSNUQewW8Iec02BAtnwxjW130qWP3JF1ck4RkOpLjFz/lMKtGowQ3oYUimoaLyMb7jhOyC1IrTb8UHLtZbPnXFyhRi0MJEMyMn34R6UHkj50Q/PqciY/+esm2AgRfHi1SQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783713710; c=relaxed/simple;
	bh=Wpj7biINABXruyl7S8E64d6S+aIPAP+SvchHl1VAxwI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uBtk71J/eXrplyErhyQnx8Xrue2WlWWEyLk49jg/9t55hqzwixOtN+g1o3qnvprrdWbsGqf5qDXgEtHy/3JaI8wYrw1eQzmdly+tr/whfQX21qC/vcHstfXaStn3m9wXd0Q1SCCmUHfYIbbwS3AeCNn0QByGiDjqj+CXZ7Y0tP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ekx/Ir9K; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AOq3Cy7k; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ekx/Ir9K";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AOq3Cy7k"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AH3mBX1450881
	for <linux-remoteproc@vger.kernel.org>; Fri, 10 Jul 2026 20:01:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6TauvJkutb2hiYeXYH72NLc7gaplt5eyXb6hMmwHelw=; b=ekx/Ir9KisQqT+sO
	S+dKYkRjkjB89OmCaMF97bUAQTE4ze415+U13BgRp71chl9J8OEjUDfECg6839Yc
	nrHU8OXQkaA3HRIHSAsV8zu4b9FSDGXSVoYE3+JqrgU63WAXQo7Y+LXc0Qn2dbNZ
	212MK8O2wSik+3XE3fyIz8kqOILZi9bFNmrGti4fH90kNAuOWbthXc1f5nzxXi3Z
	i3SUAjXVjvtmqxsJsvxaQjH7BE46ROkkYC942Ci3GUBi7ZxKgprf/NNh+C4N9Moi
	KcwsOwgJ4eWEKmHL0/2w+8WpmOwVO7wPVFc8npsdtlae8mdoAPVb52lzhb7gw2wn
	ZmWaaw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fas6n3gam-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 10 Jul 2026 20:01:48 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c9151bf6ce7so1576624a12.3
        for <linux-remoteproc@vger.kernel.org>; Fri, 10 Jul 2026 13:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783713707; x=1784318507; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6TauvJkutb2hiYeXYH72NLc7gaplt5eyXb6hMmwHelw=;
        b=AOq3Cy7kLjYvtouad62OWQ4Hz0BUGrJWoWfaFZYQ+UAAfLCk9iQzwU32o0ZSkEmjdA
         OwNPgep4vtPyQf61sNtQQRd9q0Q2pYXndD8N4j57pdnV4pPUPe5hHYlFf3BDm5pGyL1q
         A8F2jE66JQc4v0Qd7nLOBTnL3TFmvjUU+M/DbmPz0GTlzDXMyiM1JCTMpcX1orHj/s18
         /gBHicyDXtIV7OcIm4oLn9UmPp2SqWCGwnkxRtzaNRmuo2pFvPynZ0hF6NxcrJY51U8D
         L0+JcLo7/rLULsaWz5bKYDJjTAvPLMtVo0Yyrvn1piTIIiU038paEVLGc7RfdgEBqKPZ
         uppg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783713707; x=1784318507;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6TauvJkutb2hiYeXYH72NLc7gaplt5eyXb6hMmwHelw=;
        b=rlrDsrMVNKO0gY75v3PdOxvgOniM1/SM3vRs4lnOvp8u6Z4HoceOUkwGRes8yPu5Sw
         SQJJ8TeXevZ+ZWpnbcOKNZooyWsKZdzQmcAe/SHa6Xf8cyKeesO9T6kC42QrEnbJsNjK
         CK6U74fMQ5H6S3eryqFYN0QJf70bCpqiBkku9aPs4ERoBbiL6zc1rAKvjWfW8pXEgILt
         nEqd+fhAuZkSb1zBzAEup0olIcL0AFQjpijI3yXioMKlP/ZjpE2/1Di4cGsAG3F0yuhi
         K6dd3/ZHO+n5cslvgci84X+GAtGMcESQx/Pe0rnA3k8XD7zu8TanvvzRcbDwC5tpjLeB
         oVAg==
X-Forwarded-Encrypted: i=1; AHgh+Rq79P9/ZncoYAEEdlYcX1dOa3WoY3nTWeRUP//n7nKtmuKBtHfrnwJqPhcCrHrHdTTGMj+F7Lp6n/fFFX0dlmdH@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2pJmx+Ao7syKdZq8j/CLfZSFn7ZSE40jGrfSpk4lpINLDslWQ
	ziHnj+mO2AzP0zTiF3kc0gY6CwsQ7iz3eCHtR3d+2K66Xjnj8wk8K6F2t01WjLDzSFX4YoDaeR7
	+5pN9LLJlnRMc1oAxHORX7fRrRRRpT77nkjMRDYcgeZsz05bOxeDYysuu7nHhhHyHHFdyRUAX
X-Gm-Gg: AfdE7cm+/Vga+4pF54V5RM3tA60CvJJbFQMa6yqwoObQFonuavv9rXbVDflebceV5Lz
	uDkVt7vqxeJMO0Of45RTXAzz5jLwVV6Kt855MXJcWrLKGAdK/kFFwD4VvfJtVou3wD5J2aAztew
	ZTLO0zdvH/y+7PPydZK/GlMkRmC9Mbno/CjSbaPoN+ieDMO7YA6NBZJk6a7W4QGY57DtSKIhe79
	HXmnmrsMeKLfhwPtyBgSfKQ0pVWoijhsN+OJDz66wJh44HphMnR2KHJTn4BYGCd3827UHoM55I5
	BTV3pdsfpAy0atK8SnwBtCESPwr/4QA5PxDPbxPkR5mHxx/c+g88xL09hPZrTesC3zyPjyHhIsG
	6Wt4FghwYk1r2RG91S4/eVi1vroyXAGdP4LAmmX1iki6ksc06PR4Hw7QhUFWxPUoiF+Ss
X-Received: by 2002:a05:6a20:258e:b0:3c0:42c0:702e with SMTP id adf61e73a8af0-3c110ba2a31mr439556637.52.1783713706908;
        Fri, 10 Jul 2026 13:01:46 -0700 (PDT)
X-Received: by 2002:a05:6a20:258e:b0:3c0:42c0:702e with SMTP id adf61e73a8af0-3c110ba2a31mr439205637.52.1783713701649;
        Fri, 10 Jul 2026 13:01:41 -0700 (PDT)
Received: from [192.168.1.11] (15.sub-75-218-246.myvzw.com. [75.218.246.15])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659666e7sm50819545c88.7.2026.07.10.13.01.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 13:01:40 -0700 (PDT)
Message-ID: <3f399cac-d82d-4d52-8a52-45cd9a0e31d8@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 13:01:37 -0700
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: (subset) [PATCH v9 00/14] firmware: qcom: Add OP-TEE PAS service
 support
To: Bjorn Andersson <andersson@kernel.org>, konradybcio@kernel.org,
        Sumit Garg <sumit.garg@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-remoteproc@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, robin.clark@oss.qualcomm.com, sean@poorly.run,
        akhilpo@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, vikash.garodia@oss.qualcomm.com,
        bod@kernel.org, mchehab@kernel.org, elder@kernel.org,
        andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, jjohnson@kernel.org,
        mathieu.poirier@linaro.org, trilokkumar.soni@oss.qualcomm.com,
        mukesh.ojha@oss.qualcomm.com, pavan.kondeti@oss.qualcomm.com,
        jorge.ramirez@oss.qualcomm.com, tonyh@qti.qualcomm.com,
        vignesh.viswanathan@oss.qualcomm.com,
        srinivas.kandagatla@oss.qualcomm.com,
        amirreza.zarrabi@oss.qualcomm.com, jenswi@kernel.org,
        op-tee@lists.trustedfirmware.org, apurupa@qti.qualcomm.com,
        skare@qti.qualcomm.com, linux-kernel@vger.kernel.org,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
References: <20260702115835.167602-1-sumit.garg@kernel.org>
 <178362521364.2422497.1305957434056184382.b4-ty@kernel.org>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <178362521364.2422497.1305957434056184382.b4-ty@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDIwMCBTYWx0ZWRfXzG0Izhwc7Yl1
 z8+bPZSc+10ZLu/vQu4/yKDoOwHtLPnE6xAG+p0a7cXx2XTkeDwaOsRfpAMWmhc+6kK9mG8uyTW
 WEPJ4QX/3hktJpEc8ylcxv6ySip+2nU=
X-Authority-Analysis: v=2.4 cv=DYgnbPtW c=1 sm=1 tr=0 ts=6a514fac cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=6VQYfvmiyQ8t40WkS/mQdw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=G7o58nB-JDmhE5M--eMA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: bfFsd4ofEpGhAG8qTzyIdLFv4gWShFN3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDIwMCBTYWx0ZWRfX3nYLHf6RJ29H
 II3PwWQe8d4a/mCg2tXfCQ1kEI+rhsnSvm4JeXiymfEWptoWBLHgLBGs5pISDNAKuGr529UUgv3
 jwCmAkeHIgm5ZHRC3IaeQ4kZ2sNpxSUp2h6LWuVJ3Dm1pV07Sm8bljskFs7UmQmP2JcdfieMqpd
 Q+kuBN7EsQ756QYJgcfbrkX2ypAHGfa6Bso/GNRhLwvZLXR78bTpvKZsPKw9Y9Hkgffd6IMvT2B
 jmAbKOkD+ksbo8X8lf4BVYCEFuvoi9LDg4mFSoxFQspXNmxkuaZNFLyWFHOVSm11ghYAm/hLEtS
 ylXLe2TA2I8l+68Wp0vE9RcJvH6fGLfpwTFBKB7/egaCJtE+AHJtR7Rl9dDUQaBe3F+vBVnuwrv
 69KBRgr6a7qPFGqTBV+KIw1Tquoz5qdfValoyQkrS7AwNnFWF5V4Ucu1OIL9PnYt5xZ6/CgQPTn
 I/XVXOTaMMFMkhZjLlg==
X-Proofpoint-GUID: bfFsd4ofEpGhAG8qTzyIdLFv4gWShFN3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_05,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0
 clxscore=1015 phishscore=0 malwarescore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100200

On 7/9/2026 12:32 PM, Bjorn Andersson wrote:
> 
> On Thu, 02 Jul 2026 17:28:16 +0530, Sumit Garg wrote:
>> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
>>
>> Qcom platforms has the legacy of using non-standard SCM calls
>> splintered over the various kernel drivers. These SCM calls aren't
>> compliant with the standard SMC calling conventions which is a
>> prerequisite to enable migration to the FF-A specifications from Arm.
>>
>> [...]
> 
> Applied, thanks!
> 
> [01/14] firmware: qcom: Add a generic PAS service
>         commit: 08314e7c2c38b9ae6a5e01c58ed10a950859404d
> [02/14] firmware: qcom_scm: Migrate to generic PAS service
>         commit: 5c1a2975d23c51c01aca51945d0f10a4ee4c9020
> [03/14] firmware: qcom: Add a PAS TEE service
>         commit: b6f7978da0c4d26fe465aa6634f5a0b48f900de0
> [14/14] MAINTAINERS: Add maintainer entry for Qualcomm PAS TZ service
>         commit: 6701259025d49139131a0eb2257659a066dcca22
> 
> This is available as an immutable branch, for other subsystems to pull at:
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git 20260702115835.167602-2-sumit.garg@kernel.org

I've merged this branch into ath/ath-next so it is available for ongoing
ath12k support.

/jeff
