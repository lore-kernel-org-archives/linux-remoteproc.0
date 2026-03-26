Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BEE92C08DC
	for <linux-remoteproc@vger.kernel.org>; Thu, 26 Mar 2026 13:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774531933; cv=none; b=ke1iwRXE5ZBVIUmbHOdYKmvdEfhJoQyWG8s7KnBOq3eRD1W6XEVo2Nbnx7bQ+mOnxF/D7AnvTkxwMHPr4MxSlw7W30l9Kx7cOjrI69j7IMS3jH+ib7v0LwGyVAPuYWtc6BjGmqGOq0dYXyYjiAQB+HK/Aq/NrhxeE6fJJgW/B18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774531933; c=relaxed/simple;
	bh=e2Y4kUvGQmv3yempSyUOwIYwIPOnZpWe7Gku6I1GxuY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nSdfpnu4rXCc9oig08mBBaJudBgPsPbQAs5lMPVoYzfaIZvofxqtwF6mmxLnIDBchcMShwwHScdYxBBqMhLAZELt6ghvfoeuDtFJwA85KrPK15bcaxRRR6Z7Wev60svxLTA4xkWZ5EQx+yn7majOLPprRRTK0Y9gle+haIZom2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f1/1DyYY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RnZKbJjh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f1/1DyYY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RnZKbJjh"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62QCfE461965106
	for <linux-remoteproc@vger.kernel.org>; Thu, 26 Mar 2026 13:32:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gvpfj3DOGxiEiy85LKlrP3RfkspNDgFSSE3+aeFG5pY=; b=f1/1DyYYNortjJW8
	c/SciHWSY/miKZlZFiM2Z/rtecDbCI85ycdHU3JJcHCllfQoDyFgXUr94TzWYeKs
	aMGvjbijQwFlyGXIar6EEnsSqBtylIGnw1PwCXf+4ZGaDE4l3SUJ6dpEKx3SKOvt
	JWYDcXo88V4ErDm9ch6SpvTXKbmBsCCgy8cMLE4nDvF6S+6WgjjQ4u07Tw3A66t5
	E7c82lx/9u+0dhgTyEn8cVrnpouX10W4EO8lG1meFmZHO99j1dcwuwE4XlcTmZyp
	5GeBiwrjQiAZqVhObSGl+JWarNyPhKDASRe24pRujpWDB32YBELG/w1NLlkH+rkK
	Iei4eA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4pymjyua-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 26 Mar 2026 13:32:10 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-60274569cf9so62020137.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 26 Mar 2026 06:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774531929; x=1775136729; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gvpfj3DOGxiEiy85LKlrP3RfkspNDgFSSE3+aeFG5pY=;
        b=RnZKbJjhN+A409sOdjdZ7NFNZJgr5ruv/tuTWETt+lXAcbNMwW2YrcEXCZb//797iR
         9bV8qkOpJLPvrxnBnuhnmxhmz2wUiNvMtVFmNguso84kmC1wSEq5/Gc6e1jERa2bOvOm
         HH059LPLIXJrUyRBIPpn7NbQq/Vh/iveEdEPdl33VQCUlHh6uw5L2H2Z6MvWGHmQQnvg
         TBqFQZVS4YKALKvDcPXnlwwn4x+33MrtjNVQRZiIe5ZUVukADKdDIkHQmqO6vfcd5GDX
         CJywxaDtpSNRtKzgvZZSZuSdNU4uEFB5uZQc7enUTAOEi+cAjKzmARU2Bqy5J4hZ2z/1
         4PIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774531929; x=1775136729;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gvpfj3DOGxiEiy85LKlrP3RfkspNDgFSSE3+aeFG5pY=;
        b=NfAFmlPlji1kpPp70ttocn28DsPlgwKWShgjD0s1ASr7PWsMQHLzqYkRmdCm9RYoor
         hkXiDQEnniXW09tUETaYcQTt3xiK3mdKt6EC2tdQTpcpVI+lzmogfy1d/kbh3oUeUAkM
         pVhiVqRVzekfynzqkQUGDtb5atG7eXJSzGvnxdha1vVblvqKGckCoVoWVmlq7HCpMwh5
         zRfhUsNW3eF8LX/ENP6NBEpvGKBaDxclGgoiQvY9O6dmwjwgFXLBmUU+9LkTbg+Tv+Ez
         B0TtXn1/7vnUp8TLTtyDtgffcEqTbK1XMySBO/HrV0lSBKSDudRh7jcerZOCf0N8MsJt
         omQw==
X-Forwarded-Encrypted: i=1; AJvYcCWnMqguTSCiSXz6SDCx7B+9tPT5Os95lXl7gbV/T5sz0bKh6OefoYbAWIv6rziqxqeEguY+R+jJ7ac5ezpcgV+Y@vger.kernel.org
X-Gm-Message-State: AOJu0YzngUB+0z7YEzcioiKzNLRSRNtnwyvRmx5MLTn8wJHYlh5mADon
	cmAcAPpgJbQQDT+DWNAM8uNLdJtKDUetB2w5WT+K5uPB31UkhQpNTx39WH9h7Owezt8tSue0Jx5
	/FE+utghfESHEvMCQNZ3fBSXE4hZnLm1M2EPzqVvZsOvP/2vPcVcKKSpr2S9Rn3Fs4BYudLqQYn
	3YTES/
X-Gm-Gg: ATEYQzxyWTRz69nQprfbcd+OTmOSYExhwmBVwPWeqQPmV//vD9r35Bg7KaKeIW9poEb
	KDEWYehIF5wfBTbhpHW0m7JagRa3q8kSBds9a+VqTz5c4TnqhXnFmdnhRr8Cfeoe/TIhUuQm2hM
	UcrDLvLBr1fR3lx6jNDqPOrhMCW+ACe51CYlzVIPYVUUsO4+FaukvaalC9odfWXGc4Vcqgf2vWf
	4r3Rp1BUph9HHn1sWuZswGKbEu2M5bHXMmjJPhWFfaM940myDOpzRnlQ7ppQ15C3s4AEbUy/eHl
	zHnDboMO8OcC4U3leIoYaidyvOl7/b9KttHoC62wrjDzP609XDLSyciP4AOgAMUxgXsGBhsamLh
	RbYTxXsBXzPsdGr3E4hMzsd7b1rurtHacgx8H7gOabTy7jpTFkRWuc/GrJpVmdvSceVCoo94swW
	uUStc=
X-Received: by 2002:a05:6102:2176:b0:604:f07b:efbd with SMTP id ada2fe7eead31-604f07bf4b9mr86944137.2.1774531929257;
        Thu, 26 Mar 2026 06:32:09 -0700 (PDT)
X-Received: by 2002:a05:6102:2176:b0:604:f07b:efbd with SMTP id ada2fe7eead31-604f07bf4b9mr86919137.2.1774531928865;
        Thu, 26 Mar 2026 06:32:08 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b20218736sm120142066b.12.2026.03.26.06.32.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 06:32:07 -0700 (PDT)
Message-ID: <2ed4c65d-92f7-4451-89b7-1e49c0a1ac6f@oss.qualcomm.com>
Date: Thu, 26 Mar 2026 14:32:05 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] remoteproc: qcom: pas: Fix the dtb PAS context
 creation
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260325191301.164579-1-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260325191301.164579-1-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: a_Ab_NqRy7Gl5gDljLRpXlBppsfTtFym
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDA5NSBTYWx0ZWRfXwqXVtzibCLfy
 aG7TlVBYrJOwA5brHu4iosFUFVY6XWvKKU/RDKT9yb5jxNovzk5DAfkq32Lp6Tk95qlYWMzUTSz
 oSvz9C/EQsA0Aj2tzw8Fn7He9Limeh920fUhsOculN+ivt3fNh6c3Cd7A1Y7IOaNAEzKYdGLEyR
 mVD9n0GiyUXVuDzPOley8n4quVH5+pyHKS3TnpVCuEODqfEI5bFlXNxO1THJ+CqQqXBPO5ZN4Li
 g7JQYaeXGf63kMijYD2oXAJ+iUhdCbGW1pcV2cUZ2z8tUBz8kaJoF3if9nTHUR8JbX8DopPo2+Z
 cXHExmhkNgKHrGW6eDnnitbN1xj1WP8u1DxztVwyLBfYW2xdjdP9WkSmaa67Nnw4TF0X8PRl/Y+
 VOuTtJ07f37uDAZ4UgVJfPyyfKL6IeFQQjj7s/EODC6eXt8PZcXA+MhbqAd+Qe/KJDoK2Wt7kog
 LNseoXlsgnckDns2y/A==
X-Authority-Analysis: v=2.4 cv=SvedKfO0 c=1 sm=1 tr=0 ts=69c5355a cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=NHyXfb6j7ZaXbkreoXwA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: a_Ab_NqRy7Gl5gDljLRpXlBppsfTtFym
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_02,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 clxscore=1015 adultscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603260095

On 3/25/26 8:12 PM, Mukesh Ojha wrote:
> DTB PAS context creation should be done only for subsystems that support
> a DTB firmware binary; otherwise, memory is wasted. Move the context
> creation to the appropriate location and, while at it, fix the place
> where the DTB PAS context was being released unconditionally.
> 
> Fixes: b13d8baf5601 ("remoteproc: pas: Replace metadata context with PAS context structure")
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
> Changes in v2: https://lore.kernel.org/lkml/sxklpgc2rtr75maiu7lg4iukmaetvjyho7ytyyykmtdu2tov3k@gctoozxj7frl/
>  - No change.
> 
>  drivers/remoteproc/qcom_q6v5_pas.c | 36 +++++++++++++++---------------
>  1 file changed, 18 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index 46204da046fa..3bde37ac510c 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -250,7 +250,9 @@ static int qcom_pas_load(struct rproc *rproc, const struct firmware *fw)
>  	return 0;
>  
>  release_dtb_metadata:
> -	qcom_scm_pas_metadata_release(pas->dtb_pas_ctx);
> +	if (pas->dtb_pas_id)
> +		qcom_scm_pas_metadata_release(pas->dtb_pas_ctx);

I suppose just checking for if (pas->dtb_pas_ctx) would be more obvious but
this is effectively equal and other places check for pas_id too

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
