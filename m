Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17169429CE8
	for <linux-remoteproc@vger.kernel.org>; Wed, 19 Aug 2026 09:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787130369; cv=none; b=SpOJ6gsTEuHpGZgPnrr0uYlOhVa0CdZsAkyMrLvCM4PXGFvyJxMOhej5JSTVyCb3p60AVdHM1RGq/oK/LTZgZbbYLRndMMXYDbpO1g6I+GOdpA6lOuvmuG1WD7E1qddRRwXUVONKRhd6D5mWY9NGnCU7lGlk42gIjK6RFkH90xE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787130369; c=relaxed/simple;
	bh=eSQrFRRMx5JNsp5FA3A2pJQvR+CEz2VhjHfc1J2lBws=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YbE5KWbpwXVUtMdjYmOxB2UEDcb+oc6pJpVR8KHNEDUKyCe4QggUyxqbA0UdMRVit+BA95tRmYUjQ1aTU+IkdmkVwByYI4K2K2C8nrqS2JfDbc1nJK6COmsCY5F7v0eP5iJL9DRxSiU88P2fhTl+8uVU8BXdVVGaTcUIhfd9Jso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xs2slEjp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ge860YCa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xs2slEjp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ge860YCa"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67J6ZVMY3240977
	for <linux-remoteproc@vger.kernel.org>; Wed, 19 Aug 2026 09:06:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+GtT+fPZGOG8ZITwvCYqym1Q
	aFRBvjYyrBnZbVNoGw0=; b=Xs2slEjpkrgKSdZ1RYVQDab7O1xQKLbcWCf8Jlee
	tSHNuguDrxAQuu7BU5wFK6Wq13lHxibWu0GU/Da94T1BX+e+68Ks5QzyFMy/AWbm
	ohsxdMS8CbxvY8+AKh+4y0U2pXfXpJgTI3rgBIVEFB1U7hGrets/7d3XHYuPCxoQ
	r4SmUIC5PSexyqMcTl7EdAkCNB5HEyeXxpPpbU7XIVK9qEejDk2McUO8io78vHlN
	hXN0zkwV1MUYyP+rWMaHBwkFkEjBYNUKf2rndtRvlANSycvL3NPKEXndI+Dw8gba
	lS5WQIkUEYGb8uTxxEUQ3QjpZztT/yyAL/ZOVGmxbFpEtA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfmab3a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 19 Aug 2026 09:06:06 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38ea32e57e2so1787146a91.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 19 Aug 2026 02:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787130366; x=1787735166; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+GtT+fPZGOG8ZITwvCYqym1QaFRBvjYyrBnZbVNoGw0=;
        b=Ge860YCaPayzwD1U+RITWaTdVKqENRNyFN6lRf6lpwnVBCrK2VsYVx7IMQrMNPlUEY
         rhvQFjxO1bvnklkTJMnhmT2YD3hVSKuCuibhAzUUVMXcMMtfE6dMJtmOTSNIX71CWP3+
         mzXb1w3hYANcWaSBDWYSLcR3xHKsR8F5wmcXC810O+1TK9ITeTZGdWt97/Pu3dazwsU1
         YLRvwJRUU3VmKBcWLru7ofWnvsgf1PzcgwKDcmNYxVo3EQNxaTfNdvwFSuK99AnHS1zH
         4KXPcXYO6cKzqwEpbkzMrbjjAPEsUaNcwdsBsgTex5dyl0Qw03oHPpUBa61IMVOTF0mT
         3+vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787130366; x=1787735166;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+GtT+fPZGOG8ZITwvCYqym1QaFRBvjYyrBnZbVNoGw0=;
        b=E/bhiIk87nuPa93Xse1m3QH6h4eP4FY++3JgvBlyJefvy1qZOgnW7uyBY4kvbKN4od
         dcQsZxo6ZycDIS5pf7iUK2rCbQxD5ecNQFq0/QjiNAbQH2YqdTxUojl2gQnS/9JK06sY
         /h3K5Lq398ozoxa6wmb3zTaWPbMtKkVQctuDj6H5W5F0QM+EZ2nonG62YEB0wRxScVSA
         bursh0ttE/rgvtWnPZiuPB6ksDoqbNpX3DiT9NENdGgNtXO86s/0ySY7E41P46L7gFmI
         hWGMEby0LLDlaMJGg6Q8KRRpXbJggq6S6bK6mHwBzM8K8TwZXK0SkTqVePd+t+uP6diW
         KrPw==
X-Forwarded-Encrypted: i=1; AHgh+RoRBRSCxwX69WpHLWJP7mQYKmfRad1TtE8yTUH2IRp+aMmH3nWEbDaGFlw9E+YaMwPivHX+q8aJT3aN54pkUfzD@vger.kernel.org
X-Gm-Message-State: AFuF++n9+aAwA8InEMIlV6ZyN+8Xq47sAECbd+lBM1oT8x8ejtymcErG
	M+E09O0lMs2/SHUnSDOk4Hi2TsjnCvNBdRpabLJ1ljYHIzVRvVUiGF+M/lQCiy5q8xvG8TqsbOl
	ZtjnW0L0hO6jqmhnLxxbLKPdHGaBrM/0QercJ8aHzNfRJz9r5uoEPM9EpcIsQqeLwDDn3fmHx3n
	MfRg8J
X-Gm-Gg: AR+sD12+IWNsyLqsYw+HlcUbNvZQJutqSIe75lGpYxBiOXhfr9dcJ7SO/Njt9qJtkvo
	pSpvn+grSNyvuNcvCiM9OnA7Szxg8vPZiOsLheph0t7Uv8Yr4hXFibe8sCvHki9PQIvavOdbShT
	gBNDUne6tr7DVbGQghXH8873U+ISz/4utxy12jmpLYRGcSsHi0Ev6VqGkSIrFMuFqzNnCqC0akg
	enotKWtuyNTgfjABJncg2B28YU3y0CJdKgcDRZoEOUmtyOdB91/DNFMSXGup5htkeifn1aW9Lxy
	N4PJs23FARc6QVfda+uKS2moEYzaB9hRYONO87b6wlJFYn0i5Fojwpx92AwvcuK+RwfI7DEuZ+P
	70JXVJaUDGcI665Z8Nn+zPZhdRKE=
X-Received: by 2002:a17:90b:380e:b0:38f:5869:387b with SMTP id 98e67ed59e1d1-39581212176mr5780089a91.9.1787130366152;
        Wed, 19 Aug 2026 02:06:06 -0700 (PDT)
X-Received: by 2002:a17:90b:380e:b0:38f:5869:387b with SMTP id 98e67ed59e1d1-39581212176mr5779961a91.9.1787130365511;
        Wed, 19 Aug 2026 02:06:05 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1416aea2429sm4873245c88.15.2026.08.19.02.06.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 02:06:05 -0700 (PDT)
Date: Wed, 19 Aug 2026 14:35:59 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] remoteproc: qcom_q6v5_pas: Fix error masking in
 qcom_pas_stop()
Message-ID: <20260819090559.t2uqn4dk5nmqc3f6@hu-mojha-hyd.qualcomm.com>
References: <20260819-rproc_dtb_fix-v1-1-cb6be7f93bc9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260819-rproc_dtb_fix-v1-1-cb6be7f93bc9@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDA2OCBTYWx0ZWRfXxuhv2361SQ/n
 lXGgpGadb1tbdfVXET4Heze+vy/6s3ezkgQZa3ROR4pNZcWZUqdywEbU8QcqAJoLycrYEmFla8F
 wSZ/KMnYJSxsHaoA8F8K+xeHCdsQGDJRci98HqGNuY7ixv1sOYzCtRtETAfu+NCTiW5NjwkujZ6
 icOwrSMyPAXdEcjbh/zZe9YNb+DQNTPhNQlpRtlZJiOqE6o7MYpnGokpLV6bMJGAIMezNd/V0Ae
 0bRMnM/Hed8MUZXD6P/6d0hu5lk5lJLAmrz57F1V6RA97IekAQSOhX6jFoRDpvnZ85fJwPyHVch
 CNwSBeB7gW7tuPTtJoF2WHP5NhruiYLtU7Z/l/S0sStNDnTpgAxyWIa418fwDwCEemaMSPJARcs
 HuWwtZQg3eQeF+qbgt/6ujgdt2/oIPbqmKIRQvKo7fPhngi4XuL0jLcUvlcQjA97avDbHaHVe+D
 gG1TaBghg1d8ndpwhDg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDA2OCBTYWx0ZWRfX2J8XuYIWwdxZ
 iFyQqUKUvZtovKi8n3P4FybAdVp4ORiY+HLDXKg0MyVMS/QIuFmYJK3acxA3XZegfbnwbd1oy5y
 3tVN6O5JQmGIzfSTEbdSIe6VfxA/bJY=
X-Proofpoint-GUID: ykxdPKGfxPBjVkjLZYU0iMcNirVnktvf
X-Proofpoint-ORIG-GUID: ykxdPKGfxPBjVkjLZYU0iMcNirVnktvf
X-Authority-Analysis: v=2.4 cv=J+SaKgnS c=1 sm=1 tr=0 ts=6a8571ff cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=dFXGKhbd_zlHOsaMqXIA:9 a=CjuIK1q_8ugA:10 a=ZXulRonScM0A:10
 a=zZCYzV9kfG8A:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_02,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190068

On Wed, Aug 19, 2026 at 11:00:30AM +0530, Vignesh Viswanathan wrote:
> In qcom_pas_stop function, return value of qcom_pas_shutdown for pas_id
> is overwritten by the return value of qcom_pas_shutdown for dtb_pas_id.
> This causes errors seen on qcom_pas_shutdown failures for pas_id to be
> masked to the caller. This might lead to issues where the memory regions
> locked by PAS, as part of qcom_pas_auth_and_reset, are not released for
> access by linux and rproc_coredump flow will end up accessing the locked
> memory, leading to an access violation.
> 
> Fix this by using a separate variable for the dtb_pas_id shutdown call
> and only overriding the main return value if the pas_id shutdown succeeded
> but dtb_pas_id shutdown failed.
> 
> Fixes: 29814986b82e ("remoteproc: qcom_q6v5_pas: add support for dtb co-firmware loading")
> Signed-off-by: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
>

Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

-- 
-Mukesh Ojha
