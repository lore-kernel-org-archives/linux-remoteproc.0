Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7237E429CF0
	for <linux-remoteproc@vger.kernel.org>; Thu, 23 Jul 2026 09:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784800793; cv=none; b=VrvlgaR0pPwKv7MRu9Oonc71xnTEiKratCnQD3oq/01pwCFbs2iBXsiKXgq7MHtIaOqlwJAt7I87nGjhwEz3Y2Az7hDRektlijUa33WAdjwzy/UgdoAok+bScewZRy3eynS3yvq+eUc46JQNr3GfQczm2Svu8SgPChHOXlYbEwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784800793; c=relaxed/simple;
	bh=wu6r3ZNw+XXWQmsPOWxPu9W7TaRQ182lxP6eznQUIGA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H/CjGIp94BeZfavyGfTqxAzXGjMrKpWL4dTJC4REeF0RkfZSxLPJBvuSGX1TFHSul+/rvVNuHizBl7XyNW05rcOxBnFu1elsVy/IbPpgJytyd4GN7RJd7Xl5MA/CRyPzofidY/k95tyUu2lPRiD5Eh61PxEC0lM/+IOuQ6aN6fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ch3hcOWh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IZgIU+pj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ch3hcOWh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IZgIU+pj"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N8qVfS3648545
	for <linux-remoteproc@vger.kernel.org>; Thu, 23 Jul 2026 09:59:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1eKyXYHNKvqtAF4BG5ZtxDXRV5EfpzhdAHu/XxYkUIU=; b=ch3hcOWhUJ42rYKA
	Z2FyeXeu6NKQBuVtRhq4fhTr0SrEAkguYgySdPG3c9H8ZNV5fIDzrBLbDcbOXDBQ
	FTF1SiUlDJ1WyzpqFDiUdFqZZM3PZEKiy4g9s+RGVULfeyVCpSeDK80H5sU6ppvc
	eQtAQaW+4Evj6fKFfSJXCByanU6N/G/qHaeNtk7++vPDU66YzjDQ9xYisA5zkPKI
	m+Lko1wNDRButeN/QS7sp9pqla5leEnIF9dSbG5Kb70mdaUBUyLRa/2BpFMpdoU4
	wspqgBCh1wHPbhMs7rChaCCoEid9mm3yJS9+6XxDHwNLxAn1eLMQddyXI+xUQ39W
	r62myQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fk6c7jdtg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 23 Jul 2026 09:59:50 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93102454272so17432285a.1
        for <linux-remoteproc@vger.kernel.org>; Thu, 23 Jul 2026 02:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784800790; x=1785405590; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1eKyXYHNKvqtAF4BG5ZtxDXRV5EfpzhdAHu/XxYkUIU=;
        b=IZgIU+pjA9qAqYO5dMWKtM4TrA1K8OvZ7rAyOzsMM3lNIUKvMxfTcTHEcsw+/u2O8R
         ST5DlLdfoTXebj1CyRm15WpAq028Zv9ABZNxjNmTMHn7ec/QK/9MV5o9ooDVFmcfRjhD
         HU4Uf2Tp1QFVWQXy89bJU+yd7H+VS1onjenyTRWhDpYXR6gMnNoxZrTplC50DjFXinmi
         UQM1zN7TO5z5BK7hRYwivWNVJMIMZ0nYQTP0VyaGJVubxLffiicsNtNrW7J7WcCIWtBh
         ZqD3INKLXbpO4HZOl9T7GGf2Eff8JLaf+EjdePumnzWgzh5FoI1+2Id1oS0rf/8hoxIb
         +k7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784800790; x=1785405590;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1eKyXYHNKvqtAF4BG5ZtxDXRV5EfpzhdAHu/XxYkUIU=;
        b=NnwVbL3YS/L1QREgZty2CZH8PfKa/a6hJZaR9NSVGAQwgV6Zt2OC09E3cK8tlkVUKM
         TkIooQXO6+xWgXUYtPLUuRA3NausnqKsRQdVutQRLvmvZRctYYheCjHWgE1VK74Wki7E
         DyAuaVtKPWrFuLgdzU017B7DRFhXHFwgaLDqmtu2aBvLIm82nji3s4NhcqtMapprA4CY
         jbD4GgiDm+EXGi/XqSPWNHMbNcDFFlKlzUwYnAkb8CfIYw2X7oDOcf+PAnecTlQ20Dtg
         xvy0N0fTFzsbePzpKUAKN/SBYs7IFxswlSdO+KYfHUuLIERC5zzwf8Z2iPi3GtHnC0M6
         ULEA==
X-Forwarded-Encrypted: i=1; AHgh+RrmCULpXszQPc0Ovmx3Rxy9zUb9qTTZwmjrkA/ue8rTrLrVC82f6neZped1Fl8B1UedFTr/TFhNWy549NSCSM3X@vger.kernel.org
X-Gm-Message-State: AOJu0YzgqHjLBkEb5FSY89gkEYVvg0vr3JqdXEAyyl4GZ1YVsqKFBBZ9
	PXXDku6scE9UVD5iBaKEgXiAY4r0T0lOvzpn4bQxV9f7mvjEryLMureYT6QQxYn3yPlNEOMfU3+
	Y7MdhCeJuRfnYTZQK3qL0C1munSu15WLOJBP8J1CCFN+SEOhAj/YMqJiqLg05Xf8xioCaFW8a
X-Gm-Gg: AR+sD11expo3eEKwz0UwDXmk+XW656FV1yKwx15qBh8xfm5VPLG4Wy4gcsJ2uYQ7lbe
	2ygDSM/LHCFQist63yiplqwI7EgxTcS/DhuSNX77ocJduqe6D80A7dlgjAZ2jEJ9Hcdx2dhIdBG
	bEf4iEnczNKgApdgoXy5OERSPuf7YE3lTIaqwcYQwZasFtakoSAAPuEcg3NsRDItZux1oNMf5DW
	tlKBb8f3/NgjUTv9QpEnUKTIrRtkKVKmGLDBH0NQ4CPAA6P146vfvF1wpY9Px4GObf6S90UxqoO
	GF+HuR9xbCj7d5cgwggcJwVk7PzPs2nM9N9h5WujS/d1GRwOz/2HAZiqjBNQZf5dzU7arrlUBJh
	ImcRdv/VUz0c1uan7R0KQ8N0f
X-Received: by 2002:a05:620a:2a07:b0:930:f930:a09f with SMTP id af79cd13be357-931036542b6mr185431085a.1.1784800789727;
        Thu, 23 Jul 2026 02:59:49 -0700 (PDT)
X-Received: by 2002:a05:620a:2a07:b0:930:f930:a09f with SMTP id af79cd13be357-931036542b6mr185429785a.1.1784800789324;
        Thu, 23 Jul 2026 02:59:49 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32c8ea94sm210349966b.41.2026.07.23.02.59.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2026 02:59:48 -0700 (PDT)
Message-ID: <895453d7-2087-4639-87cd-ba3fcca9f657@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 11:59:46 +0200
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
X-Proofpoint-GUID: ltm7cNlgO2egm1BIv20VHtBelghuOcJj
X-Proofpoint-ORIG-GUID: ltm7cNlgO2egm1BIv20VHtBelghuOcJj
X-Authority-Analysis: v=2.4 cv=baZbluPB c=1 sm=1 tr=0 ts=6a61e616 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=Pig3eebz42euybiH1koA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDA5NyBTYWx0ZWRfXyzuzcpbFj5N6
 iWqjY5ZtsLqXcKzyBJmydAaSnzzXUBgV6mm7BwkLcwX9mF+ngWBzVGiVEA+wQchaV/nXVu+aPXc
 mrIVo53f4h/jIRS0oJNFaSTRC8f3aB4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDA5NyBTYWx0ZWRfX6hEKMEqtB4q4
 aBH6ISeVzfDIPmmEWV1Ui4wI/kRqkUn0nu8vPC/2HdYWpUfhRsykI4lNdsJODQ0ta0+LxCqyHJj
 ZE2ldXjoOHYVRuF45RjIdE5/K2Vk7VeAIqxLEkHOZwIjkyo2bitf9b//XiGtn/y4Uh2Rr52lMdc
 XaX0nY3P6cY05eFgtxGPvHx0DdS9QYrcyHEXvymuftNFwvxxdr7Ib8WMv4dsomf6vW6o7IFPPod
 Y1+rNvrQgQBB4kbm91IAx9+W4z70YVlhbNXEdug5WG4BLzNsK3pG0JtgszJyPBaU+lKR6q4eJkE
 Ue1LirmWAD3oILZDauxiWqdrLK0paVMFxAg9S47jNjWeVvjVoif48pP2ddFHS/8H+/WEgn5H8+v
 BczDkVTz96vB66B3n4Jj6eoKUelhbAyBZ2c8IG0yrxOtZ9R30laL93NOfXc8TJNQmISyG9mhzP5
 1QIoohHQCtB+OUZbVfg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_03,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230097

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

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
