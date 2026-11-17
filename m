Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794903022;
	b=n4JEDgWN+Yv9RuXnfPwOZKE6Tf2k+sIqguAzGM9FxW+T99h4CGScPs9POBlDDewzfOD4
	 vLzgf5qiFHP3YVBgg/LGB33OpypRKgFHhWC0xsbWXbKE0/CjY9u6hckipYOEfU4v+f0MX
	 0Eq7h+uJjdf5oR72mp4WfKm7kkpJ7kEYW3ehDvOQ40mltU6koEelZk+IVQvSY9IXM2rXe
	 BCLT/bIazjOCuzsAvzLzcd9BPtWLgY17Cki2PZPtwlX5i97gyyv1Vumpp3/AeHoJBX7Gq
	 CurMv8uxpe42PGvdLDhZ0d9/UyBziDG3OibQ1hvbPhCHQJF985Ve2knhAAep8BadoMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794903022;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ywfuAFd/K5ZUKJsJaSHr6Wq47xa9wttISztoP/unkLc=;
	b=v4I+WavJi9d2f7xn5uUwdJ/Ya9vVTWf8ErJDqYn/8K4skwwJMelevIYGsfncyEHS/nnS
	 bvJiG6hx0Y2R/LThgZpSzaRUSXltW4pJxHjfdLblD7BHwhkU7itoR786M6MCMWnOsZCbv
	 BMsX0nseaCbgbnX+J2GAACqtizaHP6LVlp/0j71bZFakJBBQ3WxpEkxEfNrlfKgfTYUFp
	 AJRn9G/ibrNaHotRUZFYOYLlG0lkEGN1RAzda/tM9/XLxgZetDt0iDTJb7Fci8nmrGuv4
	 hrYeF+JP2NgrVKqHMbIEeO1VtsFmgOyigiGSjDci9ecjSvGlFnblq5KYBrZFRzIk2bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g2TQsKck;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HuGfjZBv;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACBD9606A330
	for <linux-remoteproc@vger.kernel.org>; Tue, 17 Nov 2026 08:10:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ACBD9606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g2TQsKck;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HuGfjZBv
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH6Lrph3980793
	for <linux-remoteproc@vger.kernel.org>; Tue, 17 Nov 2026 08:10:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ywfuAFd/K5ZUKJsJaSHr6Wq4
	7xa9wttISztoP/unkLc=; b=g2TQsKck7ce39yLpfcRic140Te0EI4E5oDBeqc0o
	Qq6yLaKkluY+RugReFLf/qwujhtvYwHFo+CcSDi/l9lMD5zG/J96rul2KlrwfhFN
	Pyo1CY9CWypdPP6c62Shfre8J4HpG7MuQTr1qliDwQ6XSEKEhiE5902MnFT0dXkj
	e9IcXZ4/i3Z99haFWuCaTPFKXMPnWwo6XfgxKF59sKC6vL5y0ynpwPp6Q6VATdHW
	dKXmctcbZ2WxM3RzZWOPVMtHiU4Pk+lVaBEfv0/9xwdsLd3ypo6GtmJyHA1tiQXT
	5chLK0zBmPV4LSz3SaOJ27EWl2aSGWNs+9DvatbEQ2gXmA==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0hkd0cyq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 17 Nov 2026 08:10:20 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1b3a348a6dbso4209768c88.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 17 Nov 2026 00:10:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794903019; x=1795507819; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ywfuAFd/K5ZUKJsJaSHr6Wq47xa9wttISztoP/unkLc=;
        b=HuGfjZBvQwN7zBcq7zFNygWl+Q21UtxUWx+XEAnPl36L1EkapFRa326VTS7zZAFoGW
         Z/ZlXdZT+icBO4oE6o/Qavixnv4V5uA465XoEOg/YcqKCLWfL4/iAmANxw8zv05giCSe
         vbsVMaj6mT4ITk1EPnMOU7o9DBUZ9+zbsDo2kMjk4SeoEVEWuXs610RWST+boLEHX89x
         lChN1dCcSvAUDyu0xrihVMZCqLWbvYXNCW44XZJMJHbNzeP2RcUY9BfhrG3jpOlQn3oJ
         oVEo3KRSfADvfdpZ1DTit7xSE3uBqfgYzLGvAC85CoiRNwl42X0u2zeOt6r6y77g7MOf
         xVrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794903019; x=1795507819;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ywfuAFd/K5ZUKJsJaSHr6Wq47xa9wttISztoP/unkLc=;
        b=z8sZhs8g940yvWSiHgM9J4/wAQMYnCDiTh0E1Z5c3PWnDGrgpfJxRHRK/mtV8P9H4X
         UBPqs8dAOV2RSDsVGgrGTZ9yeWToy3sUgV36cVKEmN6+gUWXo+iOjOSHDRNgOsDnziqW
         qVz2wdGwbRN7zBxZUGYlzMi9+VAFRBpG8v+8oj4N6CukODeWF05lpVpw1DTu9HpIXgzx
         /6wX94RVbxMrpkQZ6BSp50nrmkja82xCQFFuNb31Lfd7bM0x0EWidvt9Y6mJOEvUnSMc
         t4ily9WIGO4i9jNYaka2Rqwfk/dALZOgkfF56uLmax4gmnKi3AJGfINgHcD1vF3E4Fpr
         wMCQ==
X-Forwarded-Encrypted: i=1; AL+hErHbUM0ej2rzgZPavC/Ye37ydf561u4aTvD1KXWKVezIXRApT/IeDPfsglG+UHJrXquzLGE7tXJxEuc4JKMG30S4@vger.kernel.org
X-Gm-Message-State: APuU4Z8Pr/YrmGczaCvCMauC7FmGA+QR5NPKv50ZX+ixrpA4U44CQSoI
	TXr2KcEoKnsLuPYlT9tAlYg+API6e4hONAo5+1llGib3la4ZOEwqgCFWGUyV2Naf3lYDLceaekF
	wyVXUBUTjykqOuEl1Zwo59+3ioN/29ozz36tSU3KBV/CTt9ItWJXkK5j5sQ4uGSvwyUFJAJ+a
X-Gm-Gg: AYBFou1oGxFxoCgEesI9CKQNaHq7V5mksNh+eJ0Wmzuj96Au7cjUgiDwH+dAkOYMp97
	wadUrq0jYdGFAX+E7P42VUlGaoWjdUNwv3fJT+ff+2m6r6pwPpmQxIUpski9Bj6Wa03Xxmf0Afh
	P1lI5/Myznf/g0CSr8Xk1NZWzdWpK5Rj50pdTDAbJoqyKV0WJvE0k5h2q18YtbbKXSTBHys9UPU
	Tl3qrGGSw5UrXpG1goEDORd2zrd7teJvXe5KB0FkHEQELipXka4EeqY6dWIpENwtKq4nAW4U/pI
	vlm2TFbM0Md2qeidd/ZyyzJ6Rpz3fhKeFsz2ChcFw2GkF7OFwzmZSqQ7IC+i2CXt11mtkcAiB0f
	HLLU0tEYt6Vu87hq6W4YuYd1FnhmF67kAPPqS1sGz80ORNIedzMG4wktf042ONNfh6bbGMLiHCz
	bd
X-Received: by 2002:a05:701b:2202:b0:1b5:e9d:c641 with SMTP id a92af1059eb24-1b50e9dcabfmr9827920c88.18.1794903019152;
        Tue, 17 Nov 2026 00:10:19 -0800 (PST)
X-Received: by 2002:a05:701b:2202:b0:1b5:e9d:c641 with SMTP id a92af1059eb24-1b50e9dcabfmr9827891c88.18.1794903018317;
        Tue, 17 Nov 2026 00:10:18 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031b98e5sm42451898c88.14.2026.11.17.00.10.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 00:10:17 -0800 (PST)
Date: Tue, 17 Nov 2026 13:40:11 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Subject: Re: [PATCH v2 3/4] remoteproc: qcom: pas: Add coredump support for
 secondary processors
Message-ID: <20261117081011.jcuxog7ixwbfbyce@hu-mojha-hyd.qualcomm.com>
References: <20261015-oob-support-glymur-v2-0-715435f52dd7@oss.qualcomm.com>
 <20261015-oob-support-glymur-v2-3-715435f52dd7@oss.qualcomm.com>
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261015-oob-support-glymur-v2-3-715435f52dd7@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=eqFKXYpX c=1 sm=1 tr=0 ts=6afc0bec cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=VTWUisejw7g24Mmt_jYA:9 a=CjuIK1q_8ugA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAzMiBTYWx0ZWRfXzVPMBY/5Cs/k
 VTKtRJQVVyXXuupjZfvhpyyS8rajtKgrOdAs00HxOG6dAmCxGRhgpARqsts3mbhPb7dfkoFHDcs
 MkbY/CqP6dpzxXpVJvwLS+JqJYjJq0E=
X-Proofpoint-GUID: yq7vXodnDBKEnsqGF9HsSbE3Y1JOyzp7
X-Proofpoint-ORIG-GUID: yq7vXodnDBKEnsqGF9HsSbE3Y1JOyzp7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAzMiBTYWx0ZWRfXzGcQctIGw2I/
 bZQSVuw4bcFdJVzr6MQEXUinZqMCA4pn7vc49d9wLfAbK3F7W73Orf8iYfdKIERAZOXmOZyoOQh
 7aUvE2rZP+WMQMGK4oMLvD8WAcwz6won4sSSIfikdZrCLEjRB2yk++xKPw2+un0DL+HwSqXWsZg
 oZnyG6HhS3LSjzRDf0+gRT3f4EUDbV3w2vT5kzfw/TTj1bG4cVz1fF16VkiTFnhPnkLtLi6aCU3
 DFT6buRupiukYlzwWjFcu11n5yj1aipghFMdM/A69Y+vRjDagJ4IMwcf9OlJqh24+IKJx0V8oBX
 yehMXlUe9qWQRsmzWBYNtbliqJ1E71k1YFxlFfAST004Fp08n6Ub74i+KjJ4Bxhvz4r4FaKSDP2
 gtuMzV308vwvtY6oBl4JsMLAPhQvMPMQHp6LVrhk0EvoOeJpz0oxmQDbflFTh+DBF7m5iPlMazM
 b9DVTr8wyRS4Sd9W3DQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170032

On Thu, Oct 15, 2026 at 11:25:51AM +0530, Anvesh Jain P wrote:
> Add coredump support for PAS remoteproc instances with a secondary
> processor by registering fixed dump segments for both primary and
> secondary carveouts at probe time and mapping them during collection.
> The attached-state path is for debug dump collection and does not
> provide operational device recovery.
> 
> Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> ---
>  drivers/remoteproc/qcom_q6v5_pas.c | 102 +++++++++++++++++++++++++++++++++----
>  1 file changed, 91 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index 0bce2f0d5b4a..374cafd04b62 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -117,6 +117,7 @@ struct qcom_pas {
>  	phys_addr_t region_assign_phys[MAX_ASSIGN_COUNT];
>  
>  	void __iomem *mem_region;
> +	void __iomem *secondary_mem_region;
>  
>  	size_t mem_size;
>  	size_t dtb_mem_size;
> @@ -162,6 +163,28 @@ static void qcom_pas_segment_dump(struct rproc *rproc,
>  	memcpy_fromio(dest, pas->mem_region + total_offset, size);
>  }
>  
> +static bool qcom_pas_has_secondary(const struct qcom_pas *pas)
> +{
> +	return pas->secondary_pas_id && pas->secondary_dtb_pas_id;
> +}
> +
> +static int qcom_pas_register_dump_segments(struct rproc *rproc,
> +					   struct qcom_pas *pas)
> +{
> +	int ret;
> +
> +	ret = rproc_coredump_add_segment(rproc, pas->mem_phys, pas->mem_size);
> +	if (ret)
> +		return ret;

Why qcom_register_dump_segments() already does this ? why need to
add entire region ? please modify qcom_register_dump_segments()
according to your need.

> +
> +	ret = rproc_coredump_add_segment(rproc, pas->secondary_mem_phys,
> +					 pas->secondary_mem_size);
> +	if (ret)
> +		rproc_coredump_cleanup(rproc);
> +
> +	return ret;
> +}
> +
>  static void qcom_pas_minidump(struct rproc *rproc)
>  {
>  	struct qcom_pas *pas = rproc->priv;
> @@ -577,16 +600,38 @@ static int qcom_pas_stop(struct rproc *rproc)
>  static void *qcom_pas_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *is_iomem)
>  {
>  	struct qcom_pas *pas = rproc->priv;
> -	int offset;
> +	phys_addr_t base;
> +	void __iomem *region;
> +
> +	if (da >= pas->mem_reloc && len <= pas->mem_size &&
> +	    da - pas->mem_reloc <= pas->mem_size - len) {
> +		base = pas->mem_reloc;
> +		region = pas->mem_region;
> +	} else if (da >= pas->mem_phys && len <= pas->mem_size &&
> +		   da - pas->mem_phys <= pas->mem_size - len) {
> +		base = pas->mem_phys;
> +		region = pas->mem_region;
> +	} else if (da >= pas->secondary_mem_reloc &&
> +		   len <= pas->secondary_mem_size &&
> +		   da - pas->secondary_mem_reloc <= pas->secondary_mem_size - len) {
> +		base = pas->secondary_mem_reloc;
> +		region = pas->secondary_mem_region;
> +	} else if (da >= pas->secondary_mem_phys &&
> +		   len <= pas->secondary_mem_size &&
> +		   da - pas->secondary_mem_phys <= pas->secondary_mem_size - len) {
> +		base = pas->secondary_mem_phys;
> +		region = pas->secondary_mem_region;
> +	} else {
> +		return NULL;
> +	}
>  
> -	offset = da - pas->mem_reloc;
> -	if (offset < 0 || offset + len > pas->mem_size)
> +	if (!region)
>  		return NULL;
>  
>  	if (is_iomem)
>  		*is_iomem = true;
>  
> -	return (__force void *)pas->mem_region + offset;
> +	return (__force void *)region + (da - base);
>  }
>  
>  static int qcom_pas_parse_firmware(struct rproc *rproc, const struct firmware *fw)
> @@ -598,10 +643,21 @@ static int qcom_pas_parse_firmware(struct rproc *rproc, const struct firmware *f
>  	size_t table_sz;
>  	int ret;
>  
> -	ret = qcom_register_dump_segments(rproc, fw);
> -	if (ret) {
> -		dev_err(pas->dev, "Error in registering dump segments\n");
> -		return ret;
> +	if (qcom_pas_has_secondary(pas)) {
> +		if (list_empty(&rproc->dump_segments)) {
> +			ret = qcom_pas_register_dump_segments(rproc, pas);
> +			if (ret) {
> +				dev_err(pas->dev,
> +					"failed to register dump segments: %d\n", ret);
> +				return ret;
> +			}
> +		}
> +	} else {
> +		ret = qcom_register_dump_segments(rproc, fw);
> +		if (ret) {
> +			dev_err(pas->dev, "Error in registering dump segments\n");
> +			return ret;
> +		}
>  	}
>  
>  	if (!rproc->has_iommu)
> @@ -716,13 +772,21 @@ static void qcom_pas_coredump(struct rproc *rproc)
>  {
>  	struct qcom_pas *pas = rproc->priv;
>  
> -	pas->mem_region = qcom_pas_ctx_map(pas->pas_ctx);
> +	if (!pas->mem_region)
> +		pas->mem_region = qcom_pas_ctx_map(pas->pas_ctx);
>  	if (!pas->mem_region)
>  		return;
>  
> +	if (qcom_pas_has_secondary(pas) && !pas->secondary_mem_region) {
> +		pas->secondary_mem_region =
> +			qcom_pas_ctx_map(pas->secondary_pas_ctx);
> +		if (!pas->secondary_mem_region) {
> +			dev_err(pas->dev, "unable to map secondary memory for coredump\n");
> +			return;
> +		}
> +	}
> +
>  	rproc_coredump(rproc);
> -	iounmap(pas->mem_region);

There was a region it was unmapped once done to avoid speculative fetch access.. we can't keep
it mapped all the time..


> -	pas->mem_region = NULL;
>  }
>  
>  static const struct rproc_ops qcom_pas_ops = {
> @@ -1133,6 +1197,12 @@ static int qcom_pas_probe(struct platform_device *pdev)
>  	if (desc->early_boot)
>  		pas->rproc->state = RPROC_DETACHED;
>  
> +	if (qcom_pas_has_secondary(pas)) {
> +		ret = qcom_pas_register_dump_segments(rproc, pas);
> +		if (ret)
> +			goto remove_ssr_sysmon;
> +	}

For early boot, we don't even have support for the primary image
itself for the first crash as we did not load for its first boot
up. So, this is new and you don't have check why do we need it in
probe whether it is early booted subsystem or loaded by linux
Also, not sure if it is right to dump entire memory region.

> +
>  	ret = rproc_add(rproc);
>  	if (ret)
>  		goto remove_ssr_sysmon;
> @@ -1144,6 +1214,7 @@ static int qcom_pas_probe(struct platform_device *pdev)
>  	return 0;
>  
>  remove_ssr_sysmon:
> +	rproc_coredump_cleanup(rproc);
>  	qcom_remove_ssr_subdev(rproc, &pas->ssr_subdev);
>  	qcom_remove_sysmon_subdev(pas->sysmon);
>  deinit_remove_pdm_smd_glink:
> @@ -1169,6 +1240,15 @@ static void qcom_pas_remove(struct platform_device *pdev)
>  		of_platform_device_destroy(&pas->bam_dmux->dev, NULL);
>  
>  	rproc_del(pas->rproc);
> +	rproc_coredump_cleanup(pas->rproc);
> +	if (pas->secondary_mem_region) {
> +		iounmap(pas->secondary_mem_region);
> +		pas->secondary_mem_region = NULL;
> +	}
> +	if (pas->mem_region) {
> +		iounmap(pas->mem_region);
> +		pas->mem_region = NULL;
> +	}
>  
>  	qcom_q6v5_deinit(&pas->q6v5);
>  	qcom_pas_unassign_memory_region(pas);
> 
> -- 
> 2.34.1
> 

-- 
-Mukesh Ojha
