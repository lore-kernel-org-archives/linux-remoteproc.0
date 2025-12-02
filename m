Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0616231ED72
	for <linux-remoteproc@vger.kernel.org>; Tue,  2 Dec 2025 13:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764682416; cv=none; b=SNCvMrfIxH6M3scdX7j7E5LC/8ZFxBqfU4B4mStvzujQ4umqxp5i2ZkjJhPKKPG8bvIoYdISd5hVUa8mqVGWMVPpy64WsSXb7rFFHNVOWu0+c8F1wH1yWG4TJZBAP5vL8aF8b8hKq+58PQ0fuTYMaOM8iXJ/nTkU1bso66ThMUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764682416; c=relaxed/simple;
	bh=AM+aHzsRN4qi42SpXw7pHbMlE7KECMUcJIs6y1jEZ0I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C9dT1ifqumrogWmCi9GRLWhqzEIgTA2OQn1fi1YjEl9ygn5PLmCF0zm8GpZ4I3Nb7XOlSjH8dJwsEAiv+JsDy2dzmqzmJ2UXnsJokbA4zIBKqYY5mDau3EG7Qfn/yqMNbHobuE+r7G25Qp/5ARzgrgDucJbRcDKFGohKJz/qbcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F80WNxdn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=axiLd/f7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F80WNxdn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="axiLd/f7"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B28FQ181932593
	for <linux-remoteproc@vger.kernel.org>; Tue, 2 Dec 2025 13:33:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UVH1CgY1TXot5Gm/ufc63RsLSbUZbk1zNOoBDq0gsC4=; b=F80WNxdn0O0u1CyB
	r0xOhXJWsFsBOWYqNGGzBAF18JyXk61jW7/tniYy7Au0hkOhlOtQ5bvO8hebxy6I
	fYiT0OFCrwUow2Bvf763+9pxaCgb/+81ue/juhJ/2UdbJhFzRQJj8GVfPVvYF9XG
	rDcfwCZ8apdfNk0lRYL9F5xHF2V9gGCXT4Zo7yWYvLWU63HMhpWygsOIIOqedDAi
	OFUL/HBBj7ibwTAHhDaaX+gjYVhexGuoLkLRI4IZho2O5cOvxZb36MEG55QNVG1d
	EgrTQB1BkgvUlgBWnDilAqpr6qax9R6nVLrwsafG8S+z0eAvRzSJIxPwD1Hw00pZ
	10AqJw==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4asm4xtd4j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 02 Dec 2025 13:33:33 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-5dbd3b72401so470826137.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 02 Dec 2025 05:33:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764682413; x=1765287213; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UVH1CgY1TXot5Gm/ufc63RsLSbUZbk1zNOoBDq0gsC4=;
        b=axiLd/f7rTLSrxo2eN5vO3Qjour1MC7O5knRXEEBb9C1cJL+yODO9UcsOa28P4iEf+
         uFBZUaS0rJQDyYhi+c/T88N/xs2d8xdeoEXi4CGS+Cc/4QiG+RXOOFae4gJFQTM/1/lT
         bVL/a7cq4g9UvtsM6/fcb9R0zzrxl32VGIGwroEshi9fLT/x6r+nrksP5TVEVauMw/iB
         UZnj6J/Wbj2lPoqp2QunRhsD99yy2k+zLHYoKyq8PIqhOeNZRHlQo2ggkRbcWT0IG+Zv
         C8QkfoKLWeayLTPfO7L1AgngBWuzjHB2PTTlt7niMqt1K3auXSuG0qYyMpMm/0MN/0Wn
         nXsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764682413; x=1765287213;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UVH1CgY1TXot5Gm/ufc63RsLSbUZbk1zNOoBDq0gsC4=;
        b=uwJ1tHdq99ehu07QsawuRIbytQN26pMLOqorMCppjQrG+4ylisgMOVZ/bDdW/RAPwJ
         JU/BAsVSVBm9PYcPVRAZ4PLrvvpna48R7bU5u5cvAbCPi2+XRH29ZCXEUEY4XhMgZcUD
         4KwS2MJZASpeegM31XpAEhX6PAbiNC/x9VbgthdFPpkr2ytBh3sa+S+IJHJ3wM/t1OvN
         73KcDSB/sTJ0WQQZ5I8KQP+HVe+Zrt0QHqqd1Ty9cnZZkW9B8tIQgOz89HB2qFB3Bml6
         73hQIhQ1riDnsSVcXtrAxmLGCpJMmxylHomvdZNnOlEFnONk8RJBB4Pz95JLNTdXoLr3
         jZhg==
X-Forwarded-Encrypted: i=1; AJvYcCWh/9m5fQPL46wuKVyfN0bGLTssJauViwK0DQ22LdMfDRnirN9iIHu2VL0UFy0UTnXqaP+owwEJAuuGYMvAB94R@vger.kernel.org
X-Gm-Message-State: AOJu0Yxzo42BGWiJxzXKe7Cn+UZnsZglQ0WE2I2Oy+dU6qS0YZ+jMGsY
	gqGG/ML/dvBv4kJtdk+0G5v6CvpdKCkcLj7nKkxZezw7yq/6gwGSlwxpr+pMjiMlG+Gzjc8BoL7
	ZQk7pYSGDFH2TO7AQGmRJV4J3ARYD9IUK9oj7LbbfY2YeH65zgocs9Qc73gshK1sli9sYgQmi
X-Gm-Gg: ASbGncuZxmk4xQfhVNz5w0G7Zt5299Ceqx+yoGEm/EswBNnhr17Axp/p5bup/Je6D/f
	cZas2/z8IZG0DLLA2goJ6TJthiwmkBuL6I0s/O8p/TyC7k1UxuE2OKbY4zzm2imB98d37MyjNHv
	rN4TjGfYoV3CkJ5cai3vxfUFPDHrUbNEczsaYrY0uJRnI6zwtjQiUWuAUgRoCJH/n/6OpfqWOif
	6C58kDJWpdR1IFqBnJJQ4vcSxB3SZtPxMUNimrWj58nEi5eKekGM6v2bpJsQgVnw1kgmiJBEYGL
	ZDTiQmCDNnUMhykbLo4QLOSRnKDwL1fV2nqGGmP/+ng/LtII+gdCgWORQe2WFIC1WAoCfa3sV5r
	qCm1SoHSSchYKlWgCS8JZwQdjDAgfrFq7diyK7jv749XCm0DBgG5t1wJTf8W3MYcI6Q==
X-Received: by 2002:a05:6102:510a:b0:5df:af0f:309b with SMTP id ada2fe7eead31-5e1de4f3ad6mr10222135137.5.1764682413215;
        Tue, 02 Dec 2025 05:33:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGaWNELjoSxvZj1BH1eTd7MqaX3ipOuH2ZofSCDSU93F2r9VP/Kg9DzlmcWOXUfrhOiURgeIA==
X-Received: by 2002:a05:6102:510a:b0:5df:af0f:309b with SMTP id ada2fe7eead31-5e1de4f3ad6mr10222122137.5.1764682412836;
        Tue, 02 Dec 2025 05:33:32 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f51c67e2sm1532385266b.27.2025.12.02.05.33.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Dec 2025 05:33:32 -0800 (PST)
Message-ID: <7b7655e0-198a-44c9-b49e-1ec030816527@oss.qualcomm.com>
Date: Tue, 2 Dec 2025 14:33:30 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] remoteproc: qcom_q6v5_wcss: use optional reset for
 wcss_q6_bcr_reset
To: mr.nuke.me@gmail.com, andersson@kernel.org, mathieu.poirier@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-kernel@vger.kernel.org
References: <20251129013207.3981517-1-mr.nuke.me@gmail.com>
 <20251129013207.3981517-2-mr.nuke.me@gmail.com>
 <1ba66817-42e2-4c63-8a94-d2e5c9cb8c34@oss.qualcomm.com>
 <47f6bed6-4d21-4e11-ade5-b3314d026502@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <47f6bed6-4d21-4e11-ade5-b3314d026502@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: SALuCPTyCCXUcK5vJDzLW2AJE5Bcf1wj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAyMDEwOSBTYWx0ZWRfX1dPz6GWIRJKH
 GEL4NxgxvHMj94SsHT+maYp4MMIWsoQ4oeJ5BU/wwSF0HddjneWz/Vtgvu13jQDgHW/Km7v4OKn
 bvD64ZhU/nsgbX2xDy3nXUiSdNUCT8c/Hl68XMJq5pcIXwYcWkEmURLTaioa0CI63R/PvS4lanh
 ihBeMcJOQIgkHQEY3P+XFKJ+YGPFDVgEceWkPMcKgNkpNY7Aoz+0fsi2aWNCDW7LADToSdP0upI
 5NdNwiU7s4ytRW37Q3KRbLSJ1tvX8/wtcn6ctum5jmLAycNQvbV4AhwsrcTheJDPrXMRZ2kxIRH
 l92JHGFG+dgRRFmFGgs+u2U82M2nB2kgifyVf574d8BZpqcCgFhGfR5JGH1JFC7QEBp3qLNwR2O
 ZoG/+VbWydrRS0fCe8vf3+FLq0dZmw==
X-Authority-Analysis: v=2.4 cv=cPTtc1eN c=1 sm=1 tr=0 ts=692eeaad cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=pGLkceISAAAA:8 a=mJIYNzVwy2jAzWdldTsA:9
 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-ORIG-GUID: SALuCPTyCCXUcK5vJDzLW2AJE5Bcf1wj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-01_01,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 clxscore=1015 phishscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512020109

On 12/1/25 10:04 PM, mr.nuke.me@gmail.com wrote:
> On 12/1/25 5:21 AM, Konrad Dybcio wrote:
>> On 11/29/25 2:32 AM, Alexandru Gagniuc wrote:
>>> The "wcss_q6_bcr_reset" is not used on IPQ8074, and IPQ6018. Use
>>> devm_reset_control_get_optional_exclusive() for this reset so that
>>> probe() does not fail on platforms where it is not used.
>>>
>>> Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
>>> ---
>>
>> This reset is not even used (or documented anywhere).. the closest
>> I can find is "wcss_q6_reset" in qcom,q6v5.txt, initially documented
>> in:
>>
>> Fixes: 3a3d4163e0bf ("remoteproc: qcom: Introduce Hexagon V5 based WCSS driver")
>>
>> which claims it was made for.. IPQ8074
>>
>> Peeking at the GCC driver, this reset is most likely present as
>> GCC_WCSS_Q6_BCR
> 
> The downstream kernel uses GCC_WCSS_Q6_BCR for ipq8074 [1] and ipq6018 [2].
> They only use of ->wcss_q6_bcr_reset in the QCN404 path, which does not use
> ->wcss_q6_reset. So maybe we can get away with calling it "wcss_q6_reset",
> store the pointer in ->wcss_q6_reset, and drop '.wcss_q6_reset_required'

"BCR reset" is like saying "PIN number", both of the ones you mentioned are
referring to the same thing

Konrad
