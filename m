Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 817341FBC82
	for <linux-remoteproc@vger.kernel.org>; Sat, 15 Mar 2025 13:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742045732; cv=none; b=eCdiCoLHDJbdjb69BBZNeuqzHFFsUhbvfv88isW52R7VMntGSCoSxT+0W/eqi1AF008HQ0E14ITO6S07+oCMWrJmaB7k7ko+SsO8POIMCD/VM8gO529xc6lY1RI1Wvp1f0uNqBhRS4yVlLWcL5leU9Dfj1daU99+fBuOGTAA+Dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742045732; c=relaxed/simple;
	bh=4nGul00PFPYuxPFc8NzuD8+xTAp0O0vvI3/6uULZ+aE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P7fQVJsvqKMGTNo7ONDU/RiMoe1C4Z3dWxokMwZuv4n5jbZH8diXiGV4Max19l8i7U3yT/S4uBFgUUz9o4oP+ie1eU6ppQMQTuZLJLmP5oboOSnMrKppNnmyC0CQn8TxiMqhgb+WHz24o6XJaYBXur8Z+n1sNn8DlzCeAIo8qMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Uy1WMNjH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Uy1WMNjH"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52F6v9cQ019290
	for <linux-remoteproc@vger.kernel.org>; Sat, 15 Mar 2025 13:35:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ELoMXopsFlC91W0vkPYgZ5nldR/fx2jN7YEqrQPh+58=; b=Uy1WMNjH2n2elD0y
	AhAMnFl3UA+e5f1ndWrLt4VRgegxxxKQP6o/0QW76sSPtHw1T2alguaK1AhaP/ca
	jBGElgMy57WDfzQh2rt7/4BHi385J7BzBQ9xRdcRE8ShmF1Wh+qFumBZS/HP+xI+
	TIxBuhtZZaNEmM4/OpL7UR6xN+NgvmOsK9FaBq4+t3Z3NWGUngs+YFLS5looYnAU
	fNGhP2RKJ8V6dpg9V7wqltt1yJR6GUlX6S+9ZbCG7ZxgKlOPgtcCFoWIsN/j9q3C
	MQmhGdk/IFjFVTv5Zd+56nu7cYTPROaEb8xi+tYRNSJZ+ehcKRPMPdb6Q7l0yXlJ
	XYE6tw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45d1rdgr5y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Sat, 15 Mar 2025 13:35:24 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c552802e9fso35651385a.0
        for <linux-remoteproc@vger.kernel.org>; Sat, 15 Mar 2025 06:35:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742045723; x=1742650523;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ELoMXopsFlC91W0vkPYgZ5nldR/fx2jN7YEqrQPh+58=;
        b=sj5fEGdWLbzuyYxbnaQfRSzVimYYg8PX1f5sbacRJ8an9OZtlfYmFC/1q9YOUb8RSo
         9knyRv2l0IYa79W+r51hYSkqzBlj17bPkPZMyOQdX8U/GMtR6DgyEG5SHdL8tebivi0n
         ozC885ytoiVs9ca9M69VOGW4Ce0R6cw301erQxxAZQx1Nt1A9DZLrD37pwcNo1PhN6I0
         apoD2K2Q9dQBKzPJ4TDJ1oxfj0UhNehsM3KQ1IxPAX3LDLPcJ/whBM/V4tfuFMrHq3Rd
         z9BOAsy4fR/oQ12Yfa0CTREU3uNPY0lDUDHWPtkn1xAOMQb+5rmK3bflRWAvlf1E2jyI
         zzKA==
X-Forwarded-Encrypted: i=1; AJvYcCXPqHpvlRDvPBdeZlCBTlI+Sq5OfqZskarHsvVs5CMblpQrMpB/jZxLBDBt4EEXtBRLf3WiLuwZUpjdGppJrfvW@vger.kernel.org
X-Gm-Message-State: AOJu0YytkYlazO+XoQHRbcHxo/YUtVRYAio3M6UElzCcbvZmb5rjgBh+
	dUo5qILcRdyiPgyYgDDvzOagSnKs3BSbFlBipGBjW/f9MRALLhY6DWPTJlvVLbH9wZvVvbg84nC
	j3qdib39VQ/bDQI+zZ5dtVteiEMuGOX8wKt3v++55jV0381VPl2SmbYRBFdrUAxn0Bt6t
X-Gm-Gg: ASbGncttmdwjnqVWK4dAOd+U/0LrY5n4Y8Jwr5o8FkaIMaI6ya/9qQWMcqWhNdqIbAU
	TRPjnUM82Jienvq8jyyuHCiHSI5YE1G5zNViYULkzACvWKtG5V8AOeJlcOXyc3cPCaIeJBIQK6C
	bemoyYjUEfwZQpjxgZH28LdlP1thtsSfnTAsoJVLtWGVzzcplAFzGhsYkdk7vTB+LuIt/1Bz1e5
	N/KBdcJOm+oi01MLGV7auCkLdsfI0Wcp2MgNfLGjAO2XUViB/9oItDyyQYYXZDORBNzn+/AuloO
	VuIG8XEyYmtW8QcGR1QoYMcmzUQbG+K0ly4tojvB4Y+lvLiO2gIhllV/k+3vaJpwz1KPYg==
X-Received: by 2002:a05:622a:4e8a:b0:472:7a2:c3ca with SMTP id d75a77b69052e-476c81963ffmr34953691cf.7.1742045723087;
        Sat, 15 Mar 2025 06:35:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEUt8dFc6yPLQJViuCPwIfOTQX3Mc3p85ry4mkaqwHjoZSmg4ktb3m5OS0Fe+df4/y+GbHwlw==
X-Received: by 2002:a05:622a:4e8a:b0:472:7a2:c3ca with SMTP id d75a77b69052e-476c81963ffmr34953521cf.7.1742045722700;
        Sat, 15 Mar 2025 06:35:22 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac314a9db94sm379385766b.171.2025.03.15.06.35.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Mar 2025 06:35:22 -0700 (PDT)
Message-ID: <b1dc178b-73d1-4fe4-852b-0a1f5bec2b63@oss.qualcomm.com>
Date: Sat, 15 Mar 2025 14:35:19 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] remoteproc: qcom: pas: add minidump_id to SC7280 WPSS
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250314-sc7280-wpss-minidump-v1-1-d869d53fd432@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250314-sc7280-wpss-minidump-v1-1-d869d53fd432@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Fe83xI+6 c=1 sm=1 tr=0 ts=67d5821c cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=WWQFUNGd85j635JlVwcA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: ApmZYzj00tPDxcUFIc9CE9v2pB4Pr6Ky
X-Proofpoint-GUID: ApmZYzj00tPDxcUFIc9CE9v2pB4Pr6Ky
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-15_05,2025-03-14_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 mlxscore=0 mlxlogscore=882 spamscore=0
 clxscore=1015 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503150096

On 3/14/25 9:24 AM, Luca Weiss wrote:
> Add the minidump ID to the wpss resources, based on msm-5.4 devicetree.
> 
> Fixes: 300ed425dfa9 ("remoteproc: qcom_q6v5_pas: Add SC7280 ADSP, CDSP & WPSS")
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
