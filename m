Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41D7A286409
	for <linux-remoteproc@vger.kernel.org>; Tue, 14 Jul 2026 07:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784012662; cv=none; b=DkbjZw4s3/uORFywceC+uvRbti5P9vSTQKzTyYjjN+Tf4NcJ6tRhBrh8TYzDRjFO9r0fEBTrYaJNbwhHR4DTvGL+WWT8PFDXCmPHlW4XMCZn5IUnQGKgQvYPqldHriBhBDKcBY5s+Z1R980Jd6uhij7eVzdnuylAQFmoe3FitnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784012662; c=relaxed/simple;
	bh=AwSHCjZnPNH28NCllLARawhdoELgkT6oB5VwMBtEsoY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L0Rj/zxgSKg7GBUBr4TXReuf3CEaT5wPL7uw7N+S7tquLtB3EYH+3IMdVoYeWuIskcH4YL7d67o3hAR5KWI4bmQ4+G7aAHTYhSqo78hz7KN47q2Pd2ocKwpDukA3f35kB7uUxEvCooEuRX0hamajN3XtXxLQwNNObWoUYw4rGl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VQfrsCzI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=chg76cYL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VQfrsCzI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="chg76cYL"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66E6SdxW3887451
	for <linux-remoteproc@vger.kernel.org>; Tue, 14 Jul 2026 07:04:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	33OQNJjnR4vVB/ZUfz5W9v5v4LaPR0+G7DvFFOtEWZ0=; b=VQfrsCzI4gmaRiHK
	YB1XGvqDAMOQvWWwIUfvR2x7XIe/Kttd7sqxYp5eO8N8FRXUY6I+6xASfcS4Lgno
	3n3FLgfQRtlHJzGMBBnjUV+h8FNRzg50LvEzlftLQz9WCkyB4lM4HzZkAZm8ewvs
	f7c5Qo1wgJsvqAutzqyZz2y8Yq3vDyuLutCsMkuVaVbsqZ2HcfMXEQYeAfa1FqAE
	Ksi/gXzCR18Zfb635xQN3Cy/yey0jOQ8FtqD/rHQU4nn6YQefMavTBuqZpAj6a9M
	nlFIzCSxJmCykCjotVCLky0GQT3OWCBLD4sd9cLTljQFrx0AUCVmH10+j7jfK+yx
	RftxSQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdbr491q0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 14 Jul 2026 07:04:20 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8ebb599e528so9547226d6.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 14 Jul 2026 00:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784012659; x=1784617459; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=33OQNJjnR4vVB/ZUfz5W9v5v4LaPR0+G7DvFFOtEWZ0=;
        b=chg76cYLeoXGB3ql52Hn8fXbzgleR8gQ60OIbiXdUcE+8Xa0uWG7t2dH/xwxSejOen
         dBgsmBlnddxQQUC+i2r9lB9OYBS4nLVIRE0Ccjq8nOtQKbxBF0e+0O48psSsnUMl4J8M
         vXnAWiCv3Bq6EZoQd5ykHUxfVAXHSTCYFi2vxa2NmrmEq/XEQSNky/pJqr72Ju/dfltH
         LCfBYMN5KNelZMsb2zJfmRRluh0uGn3Kqe6NhGBpwa4RkFilN3w1SbDRnPgLGFx3RS+N
         1EaCoxATHud0+Cl4Q2CmvLSJFoRwME/znmA9YUhFfRhCFlAnDu1texeiAf1a0M4mnfeB
         CgLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784012659; x=1784617459;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=33OQNJjnR4vVB/ZUfz5W9v5v4LaPR0+G7DvFFOtEWZ0=;
        b=lQFRGddOpvHzfDrZS12GwlFmAi961pxnSUd7ncwg1XCvZ/H/dMj3HgurG2JV4YO9hx
         pvdsM/tEMYYYN9Et9uD+Ihaic5IASq/XoP6YWAJmuJT1VNKxeicq3kkXjU8FTv1MBLLn
         0AN9taC4XX99DyPg8431HEJi8QQUir27WnTut3AqQWhwQ6ZJs2kAt9h5208CDIsgEoz0
         s2IKJMWygGaHfBW3OIYWhGcIgXuohGYQCnBNzBMvlTkOY54/9R3hzvs1N0I/XtbH42ID
         tgSPqw5kg9EyANPsoIjZd74igiDAMC3/4kFabImczGDgOUUxvvitKqqPoDgrKDsr6W7B
         CYQw==
X-Forwarded-Encrypted: i=1; AHgh+Rp2inTqRvxOA1y+WUkBF8JjO8qBH9ChhclDOSPpCJOfbBl6HCnXubuXTbeF67Kt5VUz7atoL6/TgEuZ2wfQBXJf@vger.kernel.org
X-Gm-Message-State: AOJu0YzHmlD0tfV8ml65Kw16d/XlONh8AtrqsOmklrGkViGRkMcvU3y4
	rAtqrRw6Il/buZDZF06YYMoTUnzesMd7c+Tv/BtVzNJp6MlYsNjUOIGPzlVPyfZI3sJQ+OUzFUy
	vGCxUOiLwz6n6GG7c0QUHlK4cVXJMmRepnnm5vnxYb7/vtnnZRtzaFigjF3FvoIdiR03a0Ayj
X-Gm-Gg: AfdE7cmaTImR4rk/xNcWJ/6CH7vrR1VQCMngHEeo+QOctm0lusdJlpl5u5bSgQDOmRf
	PuhpXEpeRQaPQ+kbpjFKm34u/ZD20dZf9DdvjPLijAZN6Nvhgj00Zc9U7fsQB3gU63eYbkx1h7A
	vBKpdw+3GYHcl8c2YpoEo7uCywkWfTHOv393Oe26dt4KuGRvlupahsMo722WelMWw5vJY963vU7
	Y8U8UTiLKC7XaSec9U3p+33GSBQ5murGypfMHvEz2/dYsWBKBqLB7rnCoA/5N7J8+eXlnYKdMx3
	NuXax1/Pkpm1fppxI0N0EbctigJjTE279MvEJH3HDbU3ahpc3M+JoAbmTecRI2NDH5Nk/RTHJOM
	o+fQuN3z1x9cacKCCCwU1dnntHKtKUvuqxuE=
X-Received: by 2002:a05:6214:1bc7:b0:8eb:1061:552c with SMTP id 6a1803df08f44-90402468080mr109014966d6.5.1784012659679;
        Tue, 14 Jul 2026 00:04:19 -0700 (PDT)
X-Received: by 2002:a05:6214:1bc7:b0:8eb:1061:552c with SMTP id 6a1803df08f44-90402468080mr109014846d6.5.1784012659270;
        Tue, 14 Jul 2026 00:04:19 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69cd293aa31sm882074a12.21.2026.07.14.00.04.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 00:04:17 -0700 (PDT)
Message-ID: <aed4b20d-084f-4e49-a019-55cf684a8394@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 09:04:14 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] remoteproc: qcom_q6v5_wcss: remove unneeded semicolon
To: Chen Ni <nichen@iscas.ac.cn>, andersson@kernel.org,
        mathieu.poirier@linaro.org
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260714032253.2768008-1-nichen@iscas.ac.cn>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260714032253.2768008-1-nichen@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ufSCQZavZELXclG8Ex38w7BquzgPhKAR
X-Proofpoint-ORIG-GUID: ufSCQZavZELXclG8Ex38w7BquzgPhKAR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDA3MiBTYWx0ZWRfX6QMfOh5YoN0J
 q4TxcyCpRBmhZEUCJ56Gwlaaqr0r0dkUhk7M8c7FNQaU1h6QACesh24sDBJuNNIWchH+rQ09HAS
 7KV8n3LbiThyd9dfCrn/ROFfo80cABKY4PeR1XdGNZjuAcZeggzPHP3SGouF1E1WGtdV16Q/4vk
 HLJ0RW9HziYC+yAFr94jRNSHoGGmoxRkCofwH5ezOenPjME6Kkh/KmXGcgc91QYuY7qkijustVc
 oKKQjbSpy2e7IzRmuJY+50e7kUCg3C106CUJ5OLtfVATFD4QKctYGk9rab39aVxkpM3jx09IbMg
 NFDzv6pAbKde5yGl1AO8YWQlN50HYZymTIMe7Q9lcZmVD/MhpGbCSPiSQwk93W7NZHPptswmvGz
 DISEVakPqv7nqWYoVaupvtEQ/rPP+BWnmjnjw7Lt/2X9Nc2P6xOytKAIGqUmLkeVhc8Uv1coDMP
 0WG89E4uGtQpIdGlrZQ==
X-Authority-Analysis: v=2.4 cv=F5hnsKhN c=1 sm=1 tr=0 ts=6a55df74 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=BFaq2IH8av6HCuzV_xgA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDA3MiBTYWx0ZWRfX6t+iq4GVRIzd
 iBuxCd63R0OZh2iPuPTOuWxJn/pSUVQaSdGrvKpc38nSj1BKThwir86WEKTpIVC5iohCiyYb4WR
 ib+ZJxgO5vUtgY532AEIJHqFHpJ+Kgc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 adultscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140072

On 7/14/26 5:22 AM, Chen Ni wrote:
> Remove unnecessary semicolons reported by Coccinelle/coccicheck and the
> semantic patch at scripts/coccinelle/misc/semicolon.cocci.
> 
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
