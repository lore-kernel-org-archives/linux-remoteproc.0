Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5A44258CF9
	for <linux-remoteproc@vger.kernel.org>; Tue, 23 Sep 2025 09:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758620429; cv=none; b=BKy2tC/7SpobHiOZYAfuCHjpm1M6B8i1EV48gZ3tqeZPG5gLyWMLqc+Uf55hFi0lIW7pZhJrthmV9h3bfbo5CG/arVuTMh6dlJoYLq9LSZn+CEDaWyTY9me5yJCaO8jZgDSRrk9sTYnNzoxxos01v0AaxjpUoAw3l+LxU6ZC0W4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758620429; c=relaxed/simple;
	bh=lrniPcq/EMoZoJ9q6kpsy/moAyYYSuWej0Nz5iwRsx4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RkU/uHAfjcW5DKNZtuvcUjrXKAlBDV6KeD9cWOq7GOiJ1qeCAdekk7JufZO6gv2oR+Q9sdKlHdJyVVwOYGRf0CAzHO5kR6dzzvAGQYeC71tu6uRzitT3uxjcBK2keB5zXoyrblzKNnFOO8Ye3EuJsM+C00pUR2VuQRaSE+l7Xlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KPqGjOEa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KPqGjOEa"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58N8H6Ic025615
	for <linux-remoteproc@vger.kernel.org>; Tue, 23 Sep 2025 09:40:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JNVgEX4hQucPST2Eo16MWxlRv5Mi9D4k3k6zXwC4jYw=; b=KPqGjOEabUKamGAp
	iiIpQPs7QH10ywmOgtgwam8/vfuyOc+wADHY8NnKSsK5DlZT9YMi1BLOVbMjRo3a
	dp6yyhHhi74wQB3MrMdfbAsxBI4vmWbE16uHSdIFjBaCo/BGggjnrpVLGnGdX6fd
	m0/DPz7yznUsPA7ATZZTcsr3smvxONLMd9EBBgeJMgE7hyJvT+6qAVsUCfUj2S9b
	t5qt3uTfoApUaAflhcEyp9mx6eE7FE84Ff+05XE0H3E/v0ea4k08ude/B4uOpam4
	boLmY4LAeN+jqmZIYo02ce06sCQx5UMpW6pRq6teYNf3OI/St0srMMsVzPSzVTIy
	qNwF7g==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499mn7g34c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 23 Sep 2025 09:40:26 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-27c62320f16so11607095ad.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 23 Sep 2025 02:40:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758620425; x=1759225225;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JNVgEX4hQucPST2Eo16MWxlRv5Mi9D4k3k6zXwC4jYw=;
        b=bWUVZV0DHVb8B1j0R4yj5yd9RRF842d6heMcVGdpjheMGcGfS3domFxURjpb+jdX8A
         0fOr+1+hVxefBuQ/HGQncMV0G2q1K5xZvYLIJtQCJ9aRUaFXNC7ffoFiar4EIygTpRbT
         OeWGCCS8FnHACpMSqiovSTRkTM2/EFvqHINbfe0e76FJEhDG5udbMtz5X/aFP1T4lze+
         epVUz1AvEAwsH9i6TUQErLhdOK2jjwfgLJhHu5w7Q/pzHC32O4eQljW00WdEiFKM6ItO
         HPmDgVCFyx0VbLRd5SjsEfLUHl3IFBOgjV8LNwXvjSB4ojmebBEJ6PeruQSI3xHTcXcD
         VR8g==
X-Gm-Message-State: AOJu0Yy1++SLT1byClxdD3CPkUVTyI86s3t1cUfdVeqXRxiBD6fdlzqN
	USJsbpfvaAJ5RAaZqK6YWjaY6r/XHvoEyE7jBYw5aNKI7Y1H7kv6OKNQ2W5/0gu8FdkpWFr3IRS
	z/4pKoUxvzdBxZP9t1DMWrWm3EI/O9MFS670CN/Flc9CLOU653d8L/tC2cwNJbhwp9nMMsZxw
X-Gm-Gg: ASbGncvkfURUZvcwv+5KN1GUvmP/LDpQm2OnFwZS9Bgwu/HtrglMe9j4CNpJtdpq93k
	yxNvJU8YKhYJAbX2aWlcEbbm6zC0c5M36Uz+6XBn/BDMAzGCVuZGTWXHp46KrBsvLLsrZcYXmrH
	wNStCn2mgM17XQQHoQFH/Tqb1ZNu565pJaZiyIe7pK/fds4g8pyApumrgxPf2lRdigvUwfB9XTX
	ZhT8QjFB3tjUDCaEA1z+KDcAUTb3q4nlxhanaSFogS43LG2khwP/QpzU8OMgWDY5umvpK2feXAi
	7FkVCPoZIwiYkpLNCYgVkI+DNj/9e1pzHzzI4Y461ruCEDyMb9yggQWIBYQOt2Jn0hAjniFBThv
	g+YeKUou4F0t+fK9FYZsmQNqiZlaGfoE=
X-Received: by 2002:a17:903:11c3:b0:267:95ad:8cb8 with SMTP id d9443c01a7336-27cc874d3edmr23610375ad.44.1758620425343;
        Tue, 23 Sep 2025 02:40:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFC4W4K3LDTrf1UcmNKSDWbYbjQQR77LQfcgbxBqvaDdoFPpjfSSwDPQj+qqaBnWwRKsbAo2g==
X-Received: by 2002:a17:903:11c3:b0:267:95ad:8cb8 with SMTP id d9443c01a7336-27cc874d3edmr23610165ad.44.1758620424882;
        Tue, 23 Sep 2025 02:40:24 -0700 (PDT)
Received: from [10.133.33.135] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-26980053dd5sm157818035ad.26.2025.09.23.02.40.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Sep 2025 02:40:24 -0700 (PDT)
Message-ID: <f6df1f13-518c-418c-b631-cc9452ea4842@oss.qualcomm.com>
Date: Tue, 23 Sep 2025 17:40:21 +0800
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] remoteproc: Fix potential null pointer dereference in
 pru_rproc_set_ctable()
To: Zhen Ni <zhen.ni@easystack.cn>, andersson@kernel.org,
        mathieu.poirier@linaro.org
Cc: linux-remoteproc@vger.kernel.org, stable@vger.kernel.org,
        zhongqiu.han@oss.qualcomm.com
References: <20250923083848.1147347-1-zhen.ni@easystack.cn>
Content-Language: en-US
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
In-Reply-To: <20250923083848.1147347-1-zhen.ni@easystack.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAzMyBTYWx0ZWRfXxFeJhBcnpsTt
 2v/3obMjjHf4t9C8za9NEQscK5ebRW39Gaq68Hy2EHqE39F3+3uD7tU1H4wTdo62xcCWVPgzW92
 In87XDtEn+PeLDVVFUipb3KbXe8JV1dVwilO4bslY4/y/Ir1Lxm+sMqqQbNzsWp1Az8iGCMCSMJ
 I1rn6y3ByTqc9rUMmbpJ9ZasRdDe87uVRGpZXB8kx4lvSTcJcveVM8EW3pfG6gKy5g54LRjOv+J
 MQ9xu//egkpfgpS3a6GWGHtbJ3meC+LSa4WEHOoAwggKcf1kJ483yNU3c/REsjeGaq2vdFgxwV7
 PLKL/p563zSOnlK8OjcflmLbEyZvJgRwityeJQTpZgjh4B9Vg+i8k/RUsTX9zHDsmos0aSYs45e
 VriaORno
X-Proofpoint-GUID: Y1NYdW5hNUcVDsHjORRFQsqlB44QsevR
X-Proofpoint-ORIG-GUID: Y1NYdW5hNUcVDsHjORRFQsqlB44QsevR
X-Authority-Analysis: v=2.4 cv=EZrIQOmC c=1 sm=1 tr=0 ts=68d26b0a cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=BLr15FpE7PLhzqKsQ1oA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-23_02,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1011 phishscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 spamscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509200033

On 9/23/2025 4:38 PM, Zhen Ni wrote:
> pru_rproc_set_ctable() accessed rproc->priv before the IS_ERR_OR_NULL
> check, which could lead to a null pointer dereference. Move the pru
> assignment, ensuring we never dereference a NULL rproc pointer.
> 
> Fixes: 102853400321 ("remoteproc: pru: Add pru_rproc_set_ctable() function")
> Cc: stable@vger.kernel.org
> Signed-off-by: Zhen Ni <zhen.ni@easystack.cn>


LGTM. Minor style suggestion: consider changing "null" to "NULL" in the
subject/commit message for consistency with kernel coding style and
terminology.


FWIW. Please feel free to comment or override if needed.

Reviewed-by: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>


> ---
>   drivers/remoteproc/pru_rproc.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/pru_rproc.c b/drivers/remoteproc/pru_rproc.c
> index 842e4b6cc5f9..5e3eb7b86a0e 100644
> --- a/drivers/remoteproc/pru_rproc.c
> +++ b/drivers/remoteproc/pru_rproc.c
> @@ -340,7 +340,7 @@ EXPORT_SYMBOL_GPL(pru_rproc_put);
>    */
>   int pru_rproc_set_ctable(struct rproc *rproc, enum pru_ctable_idx c, u32 addr)
>   {
> -	struct pru_rproc *pru = rproc->priv;
> +	struct pru_rproc *pru;
>   	unsigned int reg;
>   	u32 mask, set;
>   	u16 idx;
> @@ -352,6 +352,7 @@ int pru_rproc_set_ctable(struct rproc *rproc, enum pru_ctable_idx c, u32 addr)
>   	if (!rproc->dev.parent || !is_pru_rproc(rproc->dev.parent))
>   		return -ENODEV;
>   
> +	pru = rproc->priv;
>   	/* pointer is 16 bit and index is 8-bit so mask out the rest */
>   	idx_mask = (c >= PRU_C28) ? 0xFFFF : 0xFF;
>   

-- 
Thx and BRs,
Zhongqiu Han

