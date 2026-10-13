Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8B785013B0
	for <linux-remoteproc@vger.kernel.org>; Tue, 13 Oct 2026 15:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791903879; cv=none; b=NhLn++Jw1onGFaU5zAUWCuD8Xq9j/7IONX24+dwKmplRfTs62o6Ivss9fShQ008BWmZFdnFBM+57JiQxfW9nRfXyE8NtlTB/OI65KztW7niyvSFSJyMrxX6JI/QbIV10ixeERDm4wh0s2YGT/uUKpyxqjwiXGma2v3xPOx/2Q1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791903879; c=relaxed/simple;
	bh=YwJ/4Kh8dgIbqE3SXVnIlum34oAB97j1aaSxvl4JjT4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LrwL8588XSa/R0Gg5apg2qdFDLJPhESII8uRS641S61Qfvm5jMCIv7LKu6MuKHxpRzEvkkPDByPUH+Buwpvtmq+DLqINwu1a07nJqXekxy0XrBSwZQY9tKZO2Nu9cuhk7HWeEGWbvJH5NuQVuIw6xBIlwP/Hs2tbm0mBkxTiPxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bc9TZcGX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HctcgWR9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bc9TZcGX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HctcgWR9"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69DE41tn900255
	for <linux-remoteproc@vger.kernel.org>; Tue, 13 Oct 2026 15:04:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TPK3uPVCdiplnO240T4BT5juz8bHcffFNDKBRzJrh6M=; b=bc9TZcGXX0RUVy6/
	RlvZU14waSJxX9UDqnxpiQhwDw/UrzN2l5KqwUbMnKN0XU4Uov9spoCzfv3xfS0y
	P/84TpmlCIusv1RJlvpYOfVs7/wFQ1AHOgVIoFy1E7nys48XBdqoJHJMx3FIpFOe
	Xzg9mWDk16PB9Dj6YTrjWOQGE7GsHf36tUVxL+z8C/z0qzY9dNzlzXxCe9O8DFqu
	uXlKG1u6XTbQnyczpJ8eYBBWK3qNa0WjBAye85R0oAqvhnx0pfgujaQ5PPiO/mU2
	+nv/hIl2dX1gD4wDJCfmmWJWx4DyPbQmYSqaKi1d+3Z86rpkHNJMM8MAWYqdKxea
	vQK3eg==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9g7uhwgp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 13 Oct 2026 15:04:37 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5c97957d83bso81422e0c.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 13 Oct 2026 08:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791903877; x=1792508677; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TPK3uPVCdiplnO240T4BT5juz8bHcffFNDKBRzJrh6M=;
        b=HctcgWR9+HtTlmKJZeKe9tINLcgVpZCn3TBN0n74FOroc/C0WX1R7T7hX3S1RXIdyb
         6ujh9jWnXzKl4aVR3/2kDe+y69qReyWrZaUnREPdhAgCCuhlfhkH3ox4In0+BypnMwp8
         kqHBlJQunNpYBH7kVUcaelr688OxsGQO7lpkLZAiVUSgXmZqpCOC+9I2z881OUlXCTy7
         qVa2QdM468noaVXJPYSQRg9ApiAUQaqjYR2cUZPWI5ynGXP8oPImmHuXO1ltfI4URDF+
         siqGlmpt8mW4v9jZGYXl4H4ESF6ndcRV8UZHNRWrMgsaoRMZAW6ECtu3W3zHik9co/7M
         4W8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791903877; x=1792508677;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TPK3uPVCdiplnO240T4BT5juz8bHcffFNDKBRzJrh6M=;
        b=CvCabarz8nO+jrijoKsqqDPLW3+xJVplW4qchQJswxhnSwzfirSsl3QrwKdjSrEsJe
         NH8JlJmSfs9ckzthO/TA4T7VspkIAjSzanvjj7JsboDSJ6Rj4+Z9Ogx+3vCx3r0pCE4a
         L+nMXkugMsmFwe9qWYGYzC2uAPMTeAXrfTz2QnTtuITZru3HV6Yl6kCv5aA05+1y8ARN
         LnvX4iSB2mLhaPx2eQNX57NKmGLDrPtcdOBkHBR+aeM/wVOyC12g/mqXpDAzTxJXfMxe
         EJs3zSoabaTiv9W6umEFhgQFWjNSXsSMHLyNksIWPx47FlWNre9H9nnnCYtIHPK423mC
         HSVQ==
X-Forwarded-Encrypted: i=1; AKwUvBwgJ+533SEhifZqnJ/1Rh+Ue5q/lsaIOYu6dPdIxSs/EZcOg2UbLjxbPv9j1ofOsOSm1ypNWjTQ0JJkZnNJlNNf@vger.kernel.org
X-Gm-Message-State: AFq9FYIwSN6RepP5+V1VBJ10MsAZJxkC89AILgQTZ6K4vhf+yrPN52t1
	p6XTgPVH27jkyW5hIC/4Kk/r4sYB1TNaL44CXb66YNsdCvkZC5BkPMcMNm/jtvOVBrEEiA/XlPs
	GLZ8IAIqAxf2nYlwrrbjsJhljyTigQptNfEd2U63KnPVbvDot1wvrV1uDAwYV1tXY7A5H2axX
X-Gm-Gg: AYBFou2aa+sn7H8LmLm1T4f/DIOMlv418E58UZKEziT7AQBXN0wzcjhQSEuOvYIs1IM
	HbxfT9qI1eJjlo/a89mp5T1A/7FYmcDB6sBkqaSAHpi5a3xLf0kTaiSvrxeFLigLCWSO9glbCqY
	nFeY28r7O5+ZCYnC0cYE2SW1MT6ylPuXEE8+CmUrsmwtYFrmUtqVmNJTBRvRf/97jIsLuYR0IJt
	ltp2vDAuHuYBEBEmBpWmmErvsLJfkEoC3l9r2tACcOP/cYnKg9Y+gCD/BpGFUIhHx/9/mjBRpCn
	4Kqj/YHJxHVdtFflq7oDpXUQCRYeg4vg1RQyGWRMTevwXvolaUe9eH4grEGSA84V4+7JiIp1OJT
	Pb037pWKKATECKrQZEfPPNQ==
X-Received: by 2002:ac5:c001:0:20b0:5e9:4e2b:4c9f with SMTP id 71dfb90a1353d-5e94e2b4d71mr1052079e0c.4.1791903876730;
        Tue, 13 Oct 2026 08:04:36 -0700 (PDT)
X-Received: by 2002:ac5:c001:0:20b0:5e9:4e2b:4c9f with SMTP id 71dfb90a1353d-5e94e2b4d71mr1052049e0c.4.1791903876180;
        Tue, 13 Oct 2026 08:04:36 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9a9f776sm595740966b.48.2026.10.13.08.04.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 08:04:35 -0700 (PDT)
Message-ID: <0c195d46-64fe-4d27-9147-678ccd561329@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 17:04:33 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rpmsg: glink: smem: preserve IRQ acquisition errors
To: Avi Weiss <thnkslprpt@gmail.com>, Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Sricharan Ramabadhran <quic_srichara@quicinc.com>,
        Arun Kumar Neelakantam <quic_aneela@quicinc.com>,
        linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261013124328.1273340-1-thnkslprpt@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261013124328.1273340-1-thnkslprpt@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA2MCBTYWx0ZWRfX0uu/NgM7bskt
 3uvsF6gcRXouiYzxH9Gn86WrhwFX40iz/NhkQX+qO6ySOQDcSmR67id4R+f4oju4eyazwh7xivn
 ZKc0/QHJP4nLVPJ1AZyYxp/Y2sGv0ivFTkfo5BbAaYPK4pQLdTiwx7nG8XwLlCF0GF6fkBLD8Uk
 WJCLTAVcFlu3YlyYya0pIS9KLf5v7FRtrVYH/NH2DmUKqF8tdRE3hAk/YeZ1wuUdIAEYp0ygvzK
 CJLIHQEsiJr2mZJm1EuhsWadzknAmdsl2gvK9WODAwDRB1II6e4dRAyPbV75SLqKPbplw4/DJGw
 yKFmuzn92WM+uQKQ6572xsPJOlEbKffeWd8b2WSMnOkdYWC9Wy1H5P3D7Swrj0Y5xLLnKqmoEJI
 2BagfSt3Eum5FJwabaaKutgJThRfillq7ClXiNyJEgX+6Kq6R4JbpCjhIjr8tQg8CzypQqErUHP
 gPFRb9kUIca2B+H+4NQ==
X-Authority-Analysis: v=2.4 cv=Z495j3RA c=1 sm=1 tr=0 ts=6ace4885 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=pGLkceISAAAA:8 a=RAclOZT44kLJCt7_HWsA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-ORIG-GUID: wNvpoMcnsZj8534DMfZXlHJDu9e9Iu1c
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA2MCBTYWx0ZWRfX995lRJOISvje
 BTihJYBHUPrL5IdaBN4FzEBqezO6q8OlFTAeCGpRDZflwC2E5PRXbuD0UtYCHCp89fkw+3LwxnE
 KkKw4qa32hyMDOxChIC41AjD5X9Uppk=
X-Proofpoint-GUID: wNvpoMcnsZj8534DMfZXlHJDu9e9Iu1c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 phishscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130060

On 10/13/26 2:43 PM, Avi Weiss wrote:
> qcom_glink_smem_register() passes the result of of_irq_get() directly
> to devm_request_irq(). Negative errors are converted to unsigned IRQ
> numbers, causing the IRQ request to return -EINVAL instead of the
> original error.
> 
> Check the IRQ before requesting it. Preserve negative errors and
> return -EINVAL if the IRQ mapping fails.
> 
> Fixes: caf989c350e8e ("rpmsg: glink: Introduce glink smem based transport")
> Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
> ---
> A dev_err_probe() diagnostic can be added for IRQ acquisition failures
> if preferred.
> 
>  drivers/rpmsg/qcom_glink_smem.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/rpmsg/qcom_glink_smem.c b/drivers/rpmsg/qcom_glink_smem.c
> index 35bb03e67ae8..010a7da64906 100644
> --- a/drivers/rpmsg/qcom_glink_smem.c
> +++ b/drivers/rpmsg/qcom_glink_smem.c
> @@ -312,6 +312,11 @@ struct qcom_glink_smem *qcom_glink_smem_register(struct device *parent,
>  	}
>  
>  	smem->irq = of_irq_get(smem->dev.of_node, 0);
> +	if (smem->irq <= 0) {
> +		ret = smem->irq ?: -EINVAL;
> +		goto err_put_dev;
> +	}

platform_get_irq() lets us drop the zero-dance

Konrad
