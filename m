Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54FCD30B50D
	for <linux-remoteproc@vger.kernel.org>; Tue, 23 Jun 2026 16:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782230503; cv=none; b=MOeX1WgEQlZt7hGQlHtfVHdXsKe/bU3RWpd48P6lhzfl3YO/ZV+KbvEJgxZaseMBJUyFx0IMnQMY1eODlak/cn3L1o4tuV0dg2NjbTvIcs4RsM5Cuji/hL2XQ3hXTr3WZnXYVIcPpIS4eYAo6/DuwsycjvSoaKu4Yp8yli0UEcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782230503; c=relaxed/simple;
	bh=5x4Qn2jScmdpoYjTC9i8ZyEGJGnapAS3dQcXy47NxoM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wx/8U/LtF1Ve9+jGt3+SAscLKaROGkFnzrSUZxugg0dlcMMsCfUd4GX9fSTSIpCwOhgXh+4gmKL73yhxYSxiKI/4YDHxXt96Wi7NeG08YuO9339BTtrVEqWwDIgt/u0+XiYj71BtiLT7LDhicfDJe0Ai1rH7Dd2/9QLrsvClFnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pTuTu6VL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=keYMcU8p; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pTuTu6VL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="keYMcU8p"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NBY7DK1156291
	for <linux-remoteproc@vger.kernel.org>; Tue, 23 Jun 2026 16:01:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fBp3puLUMyEYdihfHRllMOzm
	OhNKSVobjoArydDpeN0=; b=pTuTu6VLcOdZek5XiQjczXrIbU1f+VkphV8IA/LO
	+BHESQR2mmvobiSi8p/SxbO+3YjMedTXxG2dnvouEPWaSMTg7f5YO2Y4qBPgoH+s
	ViWw9Ox/oVOUotiE/F4UjiUT8y8kV0slc/W/c/WCSoEf8inFZieHKWE+/xvYV3WK
	8j1ui22tbyD5h393Hnq2My/0x/SWEGCXuIWtv/O4gUcvmuD2igoHyptnxPzF0Y3H
	0MouP9NaoKl+eR/fZpsXO1v+q4B0UadEB+oWHhREUg1t1RHGS39BWH6qwTGHF5+k
	HEqfiH6x8bl1Ua+G5TFcFTXssOhADIFR1JkHtEzGtbCFYQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyr28sey7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 23 Jun 2026 16:01:41 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36b982ec338so114834a91.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 23 Jun 2026 09:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782230501; x=1782835301; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fBp3puLUMyEYdihfHRllMOzmOhNKSVobjoArydDpeN0=;
        b=keYMcU8pSc3RWqfi5MXWPe7ZwcS4D+1ui12nOKVZ+LOU9LWEgN0B7jZ27i4LNeXgTi
         0dCdxEBzxd8+8xq4h2dRrQrOQJOXpcdq09Aq13nci1NQBr0RAEWSV90zxXCGPrXA3+lF
         N5bzY8vxT01E9ogxQYeEx1i0ikKolD5D7u3iRk1Z74HYXBusc78xlLWThVjhj4r32eE9
         qTzC+hcmcq/WMJHsbxFaxk1gzbUoBb69g/4FBjo/SdJe+YCVabTqQZzBE/GrEPqzLS/c
         lFIvR89u24eDj3fdLtHUrnuif0Mzrg8iWVlEnm009hzigiJeh6MixGpGNaZTPeUpbSVQ
         WKyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782230501; x=1782835301;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fBp3puLUMyEYdihfHRllMOzmOhNKSVobjoArydDpeN0=;
        b=bIW45poenhiHHvRuZ750aBGqu3G+E6wI4w4PHeujTXAKujbsGQD6GnTkdQa0nxkxve
         1eM4K606bLw+5NSlot787UDzW6j9VJzMbidllNiG7i8uNA/qpEkKw59SwZJclAhplLnR
         ZLfoh9TI6lE9IXzB76NXvLY+qxZV+l0Y1LoNT5/jrXOTX1wBsfOHsz9ZJYHJulD4yHok
         Zpu9UPI2qGNtdcsesVyPogB1+VT4mllqNMNVIpsuXzJfic78ug9UPnGM7Gogbstnv+VZ
         CFZbzn/OJpMA0MR10n01KcbRnhGb19J+Zo+0xlwcSRAy1JOsMRbc7Q61y1W5zy1HOxxm
         0SLA==
X-Forwarded-Encrypted: i=1; AHgh+RqK2tzO6IxuxctsyBSaJBuoHKXEWpL2ws5yemZnbGbzyqCM2UkKVPBUlPrb89gv6Q362yQkBV/QntxpNdDWrrqY@vger.kernel.org
X-Gm-Message-State: AOJu0YzIC6Xb6iZK7K9QV0yzgiMAJkv2lr4XMr7/K8fzbLaImYPu9Pa5
	NudDcGDwpghrmIKyWbCcJdUko9HxtLYr2FUx8jrCc84qEq3JxeCx4yqPDROdw4oIkyQCOFHNOXq
	Y4td+zXa5k4s3XB0W4KFeCsdn5YT/a9RksOl6x5pVsfKKcPrN1FTQA9yE08OO2L1PXOumBDc+
X-Gm-Gg: AfdE7cn1TBtpQL1wJ1Cgc0VEkP1iVdeaTNsL39FkAtzSokNG7Gj+AUMTkQHSSvOXgyE
	1BT+vy93C7J20C/ZrsVlmgQmdvcW192wSU8lg++m4qclFdokAAiaex+C8lnVlrcaymk1vhXdHVt
	hnt27SM5QWxioc9bToQLVbb/FsK+8v9+U3RVf2R8QmeR7TJzRJ3aURgTJK/94nYyzaUBkRnIUGY
	1eLlth0MyCJNFHPKu++itDzEtjzZHcZa/bxPsaOgBHx55SE66zPxt/z76Or86yn5bLhrCuKOYT7
	QvIsGww4Z7lSmDGg63jlTDPZgB4Qo9XuaWWX6gsuXnQsRZ+XorCHYvt1Uc6bUxwaAXWAO6cRhD1
	PTrV6QleVCUOcaJBErFtTqH6Fseoyjj7VuG95qQ==
X-Received: by 2002:a17:90b:57ee:b0:36b:bbee:fb28 with SMTP id 98e67ed59e1d1-37d160bd6dcmr20063047a91.2.1782230498917;
        Tue, 23 Jun 2026 09:01:38 -0700 (PDT)
X-Received: by 2002:a17:90b:57ee:b0:36b:bbee:fb28 with SMTP id 98e67ed59e1d1-37d160bd6dcmr20062934a91.2.1782230498192;
        Tue, 23 Jun 2026 09:01:38 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37d4f222bafsm10452458a91.7.2026.06.23.09.01.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 09:01:37 -0700 (PDT)
Date: Tue, 23 Jun 2026 21:31:32 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Haoxiang Li <haoxiang_li2024@163.com>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org, djakov@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] remoteproc: qcom: q6v5: Release QMP handle on ICC path
 failure
Message-ID: <20260623160132.5rknnudcs7g7haoi@hu-mojha-hyd.qualcomm.com>
References: <20260623132015.2243317-1-haoxiang_li2024@163.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260623132015.2243317-1-haoxiang_li2024@163.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDEzMSBTYWx0ZWRfX6G+kP6bskDzx
 FkBwpSTcWHnZwBphbl155VGcaRZ54xRHr5+q78Bj6kPprPcQXOSC5fq7/vBZSPuqZipSTawb/uG
 YjlTxl1PDxK8Z2k7wW2JPG8vcyexi3o=
X-Authority-Analysis: v=2.4 cv=b4KCJNGx c=1 sm=1 tr=0 ts=6a3aade5 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=Byx-y9mGAAAA:8 a=WIYw4C37AfVeLPo9jZYA:9 a=CjuIK1q_8ugA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: CSXtKFOHUufqdoHQV2O19R09DiyyUdD-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDEzMSBTYWx0ZWRfX+6JFi4BlnyGx
 T2Zux4Jq4uM06zRF21Q+a9a18mLD7pjeOX6PD/Ndp4gM/XFGi8q6qv7MTrw/RLGgfmneWBeILF+
 c/fOS0P0NAQn8t+/j4w3LIHKORTrLgvcC8KjGzd1fBgYPtTfndNJLosld6SUNBNxkqnV9ib3AlE
 nSMt8Jz6ToYN/bbKXbnys17rjwS8greie2MyFiqlQloIcxiC1RdpM2Q+stSa2lGCHdmQes4e96a
 pvPshHDtxKJFEZEuoyBGKMceqSLRYvyfsFqFiNhanrDl57QCHZuyrS/O7umPjs+PVquRxTfdOAw
 dYpjkSH5Xs5DcB2e/JToChPME8C5Q/V7zePl7iW8O67uf9qz6+xMqbFf9ZvWNbGbg9Rivy6KwvT
 XS7JKTPqwkxk/VvvutnbbYYKWOtM4ASlhJSFGYw5THTozIlFMc7760ixgPC2nwRJyEMWGTzOtYI
 mU3mO7TaiHq030GVVnw==
X-Proofpoint-ORIG-GUID: CSXtKFOHUufqdoHQV2O19R09DiyyUdD-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 impostorscore=0 spamscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606230131

On Tue, Jun 23, 2026 at 09:20:15PM +0800, Haoxiang Li wrote:
> qcom_q6v5_init() acquires the QMP handle before getting the
> interconnect path. If devm_of_icc_get() fails, the function
> returns without releasing the QMP handle, leaking the device
> reference acquired by qmp_get().
> 
> Release the QMP handle on the interconnect error path before returning.
> 
> Fixes: 8d9be5c6bdcd ("remoteproc: qcom: q6v5: Add interconnect path proxy vote")
> Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>
> ---
>  drivers/remoteproc/qcom_q6v5.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5.c b/drivers/remoteproc/qcom_q6v5.c
> index 58d5b85e58cd..b57041a37d28 100644
> --- a/drivers/remoteproc/qcom_q6v5.c
> +++ b/drivers/remoteproc/qcom_q6v5.c
> @@ -347,9 +347,11 @@ int qcom_q6v5_init(struct qcom_q6v5 *q6v5, struct platform_device *pdev,
>  	}
>  
>  	q6v5->path = devm_of_icc_get(&pdev->dev, NULL);
> -	if (IS_ERR(q6v5->path))
> +	if (IS_ERR(q6v5->path)) {
> +		qmp_put(q6v5->qmp);
>  		return dev_err_probe(&pdev->dev, PTR_ERR(q6v5->path),
>  				     "failed to acquire interconnect path\n");
> +	}

I would have preferred to move devm_of_icc_get before qmp_get()


--- a/drivers/remoteproc/qcom_q6v5.c
+++ b/drivers/remoteproc/qcom_q6v5.c
@@ -331,6 +331,11 @@ int qcom_q6v5_init(struct qcom_q6v5 *q6v5, struct platform_device *pdev,
                return PTR_ERR(q6v5->state);
        }

+       q6v5->path = devm_of_icc_get(&pdev->dev, NULL);
+       if (IS_ERR(q6v5->path))
+               return dev_err_probe(&pdev->dev, PTR_ERR(q6v5->path),
+                                    "failed to acquire interconnect path\n");
+
        q6v5->load_state = devm_kstrdup_const(&pdev->dev, load_state, GFP_KERNEL);
        q6v5->qmp = qmp_get(&pdev->dev);
        if (IS_ERR(q6v5->qmp)) {
@@ -346,11 +351,6 @@ int qcom_q6v5_init(struct qcom_q6v5 *q6v5, struct platform_device *pdev,
                return load_state ? -ENOMEM : -EINVAL;
        }

-       q6v5->path = devm_of_icc_get(&pdev->dev, NULL);
-       if (IS_ERR(q6v5->path))
-               return dev_err_probe(&pdev->dev, PTR_ERR(q6v5->path),
-                                    "failed to acquire interconnect path\n");
-
        return 0;


>  
>  	return 0;
>  }
> -- 
> 2.25.1
> 

-- 
-Mukesh Ojha
