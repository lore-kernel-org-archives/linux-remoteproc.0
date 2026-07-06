Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18CB942F6ED
	for <linux-remoteproc@vger.kernel.org>; Mon,  6 Jul 2026 15:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783353601; cv=none; b=dX+JuQ5dKTfSQg9d19CX/IlzPKsLDbnSqm4aqEI6hruA3fyonInWq0rx2OBwCALTwLg4mxXBvNwu7gZJjoj1Zf4nf5yjzXr1IWn2qu4HHOi7fBi2Zt6Fp4JQt9waYs52d0acdRAsSb1kTlQGSTIrxTjlZET4l50Kyj1C5cL5Tbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783353601; c=relaxed/simple;
	bh=hx9hFVRpS614H5BAyhPDMyQPp4NKocJkb05aPAhprV8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kYHi8NtaszFXVf0HvUQ9WBwjArWZdyPYmVlVBcuwZ2f/8EBx3nTTT/b1U//K3/mGm24VvUxD4RYtKvK+2yfPXRNv85Xf0eNzTngcC60AEU2EaSsu4Ze5TkuuE3aMdao0KkEou9BQTq0dfxFj+fyu3XPT4sOwHCHOv5leca/PLf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EmOt1d4z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e/iDLJlf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EmOt1d4z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e/iDLJlf"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FF0kA825599
	for <linux-remoteproc@vger.kernel.org>; Mon, 6 Jul 2026 15:59:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7l389H1fOTwZSkP2cKRpQJfFvQtVaFL+y7C5m61EiFU=; b=EmOt1d4zvYCEMKXn
	PgJjgDRRZG8LwLCtni3y5WUAcFOwLe+/abXrYliwUq0Op8d//m/1Chm9/kez0v8i
	buZExoeYovTt4zCeZwDh97lkTYH5A3OhjAe3miPujOBJ06WrjCd7gdz8k94pERVw
	OqNT50N9Oc6FLlBHJ2BnhshkLSHy7+BYqhjWABfoKP7vIr0pRczeQs2dGDgsa9Ua
	ZkDwoMkyGv/HTZWsTrvc3xnjN8O4y0aJWJVzVshOd+o4DUaiWbYNlqdjf0hMLwIH
	64Q7xVArmGKZ/4/t+/zm3klnSa2ttaAAwoY5yX1avyStweGTtmZg9rmg7y0+tgL0
	c6rh9w==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88t8a0nh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 06 Jul 2026 15:59:58 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51bfa45b280so8779451cf.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 06 Jul 2026 08:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783353597; x=1783958397; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7l389H1fOTwZSkP2cKRpQJfFvQtVaFL+y7C5m61EiFU=;
        b=e/iDLJlfcER5ixMqjWEbZnOTeIqenw76t6N9wJ7gsRO3qIrNCytX6X4BF9rQwEfgaT
         Fw3Rt22SM4bk04nIH9qWlNYJNwxJLRTj527kIR6RwcJBrGbfHDbMygTldGusT9ld15mP
         5SlWR4dbEl34e8W3SN35gLDjPoZd/BqK0+lnOLXKDJfbQxIbWmbhHd9fvQO07DvkY6bF
         4bju6ZKImdqnSRQMm1zoRRapsEMDS2TCGSgzP6P5wGbrpcyzoYGHe1uWlFt2iRRvG502
         A+QcSdYENY1RwGeVOaaZt4adURGjCR5n9K3Og2kj/E2xFbp5F+FNDK+BrZgNqPzh6rsQ
         x6kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783353597; x=1783958397;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7l389H1fOTwZSkP2cKRpQJfFvQtVaFL+y7C5m61EiFU=;
        b=VzFlLUe1r/yNDCDuhG8pOIO91VE+6jES8tp4YiKstzZslm9Ttp9/2AXzGN/xJLOv/V
         OkNObD0jPMF93U9bf9Nb3gJ0nwymXbtjTeF0vcRBurDHZQ5cxEVK8mwJOv4K8WMpbBDS
         G9IjAxcundGd41gdyYHSy4hf0r0HVsGq94CTS6EWSK5OKpD5eapRD0OVk8YlQQa+xPrC
         Ii1d3HgT20pPvdCZ1aFCsAbje0hTJL/qzyRX5i5LHlIPCGht1hVsvjzP7VaW7O05FVth
         J5tb58MBulmyVAhVWIzZE+TSZVzCEseN0+XNbE5Jb5qXkMltSy00/yzRpdWnl5561dh0
         vLXQ==
X-Forwarded-Encrypted: i=1; AHgh+RpPswTDIbs9xy9qfCphRDJb58U57ohhQ5iOxoc36aH/21yRbJTR3EHx+JWxGrHXQnpVtJ4oHjyCqx4O43JBntER@vger.kernel.org
X-Gm-Message-State: AOJu0YzG5Ieh8dnEawJ0z5vDsjmTJSkfis/nfEMx0wUdRCR6pBK4RR/e
	25v2yUf/laI0mcExr+l6PvH6jGkq/lSfCSHoMQic3uS9A64q7nbyVcGj8y5pzodlS2hp7Kct0kf
	XqCK01Bhgv5Aeg/SyaOBvKxmxOXTA/Ixba7z2qW2GVlIrwe+UDToUmB6X38UeKxG8RspfuJKlaX
	59o93g
X-Gm-Gg: AfdE7cmwGdnLT8a/mg/5a6UxVfrd7dWZCvtIsU//bOsvL3ckPQ+DDHUUgSe+21pF21y
	o9GIm9HfPINNYHbUfVXmuvPVMlyvTjXer5rzMzVfktmyFSyG95MxeFCx/eXh3Xdn1bf0++aWz5H
	H6Fk/aF+0pw+wNQlcdj01fAz/QsesWHx40uv39HfSZFA4ciuEop9eUsor6nNrqXuoMIQZDkbsZU
	Bpxr4vA2AsWOY9NZ/163YjQjNA7C7CbyzdXMW+5j4EHHD9HQ6axJonHpF6uNlsuWJly+WyCHqr5
	zlQEVJCeIQK+SgCzJBO8Cjx2oZ16Nf1uZUOvjogmRcBiAKt1LPr6ho/+CpOs0wrgHV8rCyiL3OE
	xVTrrg7Hk/+UsXXNSe562wwWpUo19y/jUiOg=
X-Received: by 2002:ac8:7f93:0:b0:51a:8c9b:64a5 with SMTP id d75a77b69052e-51c4bf181ddmr100375201cf.9.1783353597322;
        Mon, 06 Jul 2026 08:59:57 -0700 (PDT)
X-Received: by 2002:ac8:7f93:0:b0:51a:8c9b:64a5 with SMTP id d75a77b69052e-51c4bf181ddmr100374851cf.9.1783353596808;
        Mon, 06 Jul 2026 08:59:56 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b6091ba1sm771602066b.17.2026.07.06.08.59.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 08:59:55 -0700 (PDT)
Message-ID: <dc99e50a-76ae-4f92-8eae-eedbbf39c58d@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 17:59:53 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] remoteproc: qcom_q6v5_mss: Fix MDM9607 subsystem
 control instance ID
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260706-qcom-q6v5-mss-mdm9607-ssctl-id-v1-0-f59e728af621@linaro.org>
 <20260706-qcom-q6v5-mss-mdm9607-ssctl-id-v1-2-f59e728af621@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260706-qcom-q6v5-mss-mdm9607-ssctl-id-v1-2-f59e728af621@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE2MiBTYWx0ZWRfX68q5yGcWltx7
 D3h8M+kwq5KVr+mA+WC+ogBwrtYp/b0eRddw9XvK5gPgY3OyTHpS1q3UQYDn+J2KAZ9Y5oO6j7P
 hfAWMakRFqUwcZXdSRkHUBZ7DIF1030=
X-Proofpoint-GUID: OvhrvU_HCcW07FMx5EWWEs5liQGBKlUJ
X-Authority-Analysis: v=2.4 cv=C6zZDwP+ c=1 sm=1 tr=0 ts=6a4bd0fe cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=NXwEpaCvRp95LVLdM_UA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: OvhrvU_HCcW07FMx5EWWEs5liQGBKlUJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE2MiBTYWx0ZWRfXwmxalneQg9cu
 YzX+LYmitwOYggyIFDqqwrjsqCWMBHEYtI+KKtp5PK+9Cntt8LhoAW0nQR2K/rZghON6POfoEM3
 kArBnhgOxqFhRW1MdvUoQ1VBedmD8M/wezB19uyHM72ZKGYS1mxBjAGz8vLGaSh4nbQNGPR0pi4
 uwQd4uJJ4g40/YAEryHzYWSDRbFwe1EESArw/M06V4coZuznJysF+GdHlCQEEXjyX9mICezzRH7
 t6bL/lUxVIksgUdZ0E11dRKl2CJWqJ7x3zO1+6oX1ZAUzqMC4FtOKl19ZfXVyfursedQR78CR/B
 FaXBTIDuSXDQJXPRXwHEXaiG+nlzSLiPwdJe6kLMldU5kbq3GN0g/exykrXfqGM2GfM/jrMS7G6
 Teu6yhIzaoUl50yuZRmhL0rbSelt/ZZ1R1zbzOvav+e8KvdanagwNguUbD8V+brdjYxod+4v9UY
 TEeMcN0mbtJzVGO4uCg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1015 spamscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060162

On 7/6/26 5:37 PM, Stephan Gerhold wrote:
> On MDM9607, the modem firmware exposes the QMI subsystem control service
> with instance ID 0x22 (34), as visible e.g. with qrtr-lookup:
> 
>   $ qrtr-lookup
>   Service Version Instance Node  Port
>        43       2       34    3     1 Subsystem control service
> 
> Currently, qcom_q6v5_mss uses ssctl_id 0x12 for all platforms. The QMI
> service never shows up with this ID, leading to the following error when
> trying to shutdown the modem:
> 
>   qcom-q6v5-mss 4080000.remoteproc: timeout waiting for ssctl service
> 
> Set the correct ssctl_id to allow clean shutdown of the modem firmware with
> the subsystem control service. ssctl_id 0x22 is also used by other
> modem-only Qualcomm platforms in qcom_q6v5_pas, such as SDX55.
> 
> Fixes: 4fe236a1d024 ("remoteproc: qcom_q6v5_mss: Add MDM9607")
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---

The downstream DT hasn't caught that.. but we can clearly see
otherwise in the output of the command you provided

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
