Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D91EA2F361E
	for <linux-remoteproc@vger.kernel.org>; Wed,  3 Dec 2025 11:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764761069; cv=none; b=G+LtIdPLmyxipzatSsahQQVzjee5XFu08x849czCBG5UMRAniOLSdO0VhqDWW4ZFaIhDHbFWAKIP5rOllUlvlWfrXw1/MqCZipDFa+tofAWifp0mkhrbOKMPQN1fmJikECvJr1zgSe5uvEkOA/AkJjxyOGNdD8BEGgWiJD+HkqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764761069; c=relaxed/simple;
	bh=ji1dONw2LNM94TB9nwze5H8PR0IE5FBS+PMY0gqyW9U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d78ly49lhL58BQoFvhOHblwj0qOkEC1aJkK4C/AlWxeSFVUSWkqcLG0vupENimIrnAevkAA8e6FCCW8v4mwA28DLwhZz/Cf44xKhuP1vR2ol/VXzQ4LYkuHnkDdF9xO6aAE6Ewk4k7VfLX4+tmzIkOkK7wn5AhXdDQGDXxH25Xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W7SWidSj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=haH2kNAm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W7SWidSj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="haH2kNAm"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B39PxDt1969515
	for <linux-remoteproc@vger.kernel.org>; Wed, 3 Dec 2025 11:24:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A0p+brFxfrSugope+I1XqLDlsGS2ChZBIMwEp27fsuY=; b=W7SWidSjs7leqt1S
	TDxCwQAIPXBZMQFXNHsO4+58xThsybahbcQhBNHUNm19yZhpFIlUsaYifTUtmGM+
	BvIjX68qYHOVQSbi22nMJVAr+IBB6KiukpZoOy+t0aiS26CnhM+M88DMDR2y2B+k
	YwJCbm8dbHsAZMCU7Wt/mV51bQftoQ2niQdaG9RbbMDC4eJSCD2cnbloSxyQHRrk
	JylMD7ED4CSWo34xb9aQ2+a8lamMVq/FKajMXDGm6AVyfqtL5mEEW6Y7h7pyGX92
	bkZ4MviuiUKISMeOMnJiGVmwp8AlkYJokEPNCKOorgQCzwAM2gAIU3si1h0ibZUD
	yVPsmA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4atjjs0d19-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 03 Dec 2025 11:24:26 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b2fd6ec16aso106974185a.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 03 Dec 2025 03:24:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764761066; x=1765365866; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A0p+brFxfrSugope+I1XqLDlsGS2ChZBIMwEp27fsuY=;
        b=haH2kNAm/0u11o85GDl4Fdhus5NyHBnzonK0K7Fbi5yPepto+b9pX+Avqgz2+FDpxA
         nSXlI5/XFIeRTzTeiY+FoRqcNcWytXt7789l9SF1xpRFqWlkYooK8biOBNw70VWw95A8
         0dHfpDOQUw5QhHqo2mfwD7OIDA47M/LXRNSXcvvJmndT3hs3O7Bb4Lr9dVohTL+/jBwj
         l9v0T77k14vvAn2HcoWkx5i5TLUwMC8ucrQsqwsn3Z/NkblVn9JDjgQEBayvlU8hSzzs
         ftK60NbIs0iZ6sj6i3Psj4Pz9tpzTDQbQeKxv2eXWRe8SZpiXryCB6E0btF2ay1NDA0R
         6hyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764761066; x=1765365866;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A0p+brFxfrSugope+I1XqLDlsGS2ChZBIMwEp27fsuY=;
        b=eKJZpCs/vXiu+IpcLMSW2SJTghf0vhpfEEZvrMt0PiMMVuGTvbddmTQUI8NlD1xFP2
         k1X7ENN7FnPGu+QxBkdEmeERCvMsuBJmfzQC9Q/FgPhxbVOEhtSNN1CzCdcYXZoUI7Z4
         QtWa+1tXffNZGi8ZslZ5/t9+kH7/6fm8OBdl91C0RJMhd2a9HKql4e+3z99A7Rlzg0VL
         77H0HdZM8B5Rdz4P/z+y/u8XQdOZ2y+5Qdglhey0q/NDbaj3Wfv/oFM5xc+fobuf8K8h
         u9Hw0czTEqmex0xPP1cBZR/+whwLmO37PrEEPmk1v0muYichG0vw0kGcGmR8eVCGhctO
         kqwQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/8k5XJyauNsRdd9ctRyCIUTRUkq9dgLuPkVtTz0D6daVQmDi6oooLUin+NecEPrza6plQEA3PmoxpLsYXdTaw@vger.kernel.org
X-Gm-Message-State: AOJu0YzQr69xilQd6C/KdbudFszGXXw4wbSiUpvqf55bMcZGvmtFbKNT
	E/9OGS8RRhgNcqt0jcskZsZ05im8KPzfALyf7ej52sBGwVkQlJZIe0oxUOZhBNdH5ahvCY3Rgq0
	g1+gfzPO3d9KcRfD7QTfm893p/u4Cg3FuLW8GWO2Tc40lDqni5nmzcOtieN5hKiL6Z/TQov4c
X-Gm-Gg: ASbGncsATgjmPHADMgmeaDhT0sJm9ApMpBGFQ+S5iOjOlU2vqdcyZ57XmKvwjnA0FmQ
	k1nWlIUhRqbdYcJT3Z/exBHDge4uXVopdN5yv6ZbWh81n6+/qW3LgEWNgru3lnMzLwCh5YpdcNk
	G9w6KRuV+gGPH1T2HNR5p7C7r+9Eg9ldSCfjyD4kvof6c41g2GXwgo+Gri31X3P8xAV9YvWwQ9i
	H6BJPGij+N6k03DkQnoRKBlRyrTJgwdTd4cRHe9DXpkmr3yYWUZ9I4EmqB5+L2uf7rrkpXH5ZxQ
	IE5usEtL+Gi7EKCmfc8IMwqduTCtk2pGWvaGh3azn9BjrzG07w0+g8Pjv0qMc07jQMelCYXjS04
	XY/T+ZWtbS7HgA1BKw5NzS0F/E/mvF1J9Ea0wzVfJYaOhvnsbCeTIO5Z7/+nV3JwPsw==
X-Received: by 2002:a05:620a:7008:b0:8b2:5af3:7fce with SMTP id af79cd13be357-8b5f952bbb5mr73148585a.7.1764761065980;
        Wed, 03 Dec 2025 03:24:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEg8GJlxN8yk6BV/gW7Vu8pEykoa/iBTfz1ywQwTepsfqi1uelVNjpJfRSA+lYOTUVInXu6kw==
X-Received: by 2002:a05:620a:7008:b0:8b2:5af3:7fce with SMTP id af79cd13be357-8b5f952bbb5mr73145985a.7.1764761065581;
        Wed, 03 Dec 2025 03:24:25 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64750a6e873sm18901140a12.5.2025.12.03.03.24.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Dec 2025 03:24:25 -0800 (PST)
Message-ID: <62911215-1211-4cd7-ac9f-232e3f585249@oss.qualcomm.com>
Date: Wed, 3 Dec 2025 12:24:22 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] remoteproc: qcom_q6v5_wcss: fix parsing of
 qcom,halt-regs
To: Alexandru Gagniuc <mr.nuke.me@gmail.com>, andersson@kernel.org,
        mathieu.poirier@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, p.zabel@pengutronix.de,
        Govind Singh <govinds@codeaurora.org>,
        Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>
Cc: linux-kernel@vger.kernel.org
References: <20251202162626.1135615-1-mr.nuke.me@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251202162626.1135615-1-mr.nuke.me@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: LOpeoNBZzw1w5xUoNzXOVI_7wM5bOuCv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAzMDA5MCBTYWx0ZWRfX6rzkIZ//BdxF
 dVGDTtsSwPXI9QIFRS3TPKz2U5AzJJDz6EB2z61Ix2jKGX+o0oD92XemN9zIfqqM2wedNNQfWTN
 oM0mZxWePWfWxbnepYhFOckXIXp96OLe/7nlbY4X739Al0iLqs3VY5yN4iLrONppqd+l5RwbhBS
 g8uyaNSGMb68oytqx9HAgYzvcNPXKeSi4zD1JHlZKwn7QEP6+zQsrGvMe4Z31QRCl/t/X87O7yJ
 ebjuZkPcpkj5GFBHd5Bh0ip2yyvoDSpZtot37AG5sDjnaVsHWJXiqR2dRBhxzZ+LvJ2110gJupt
 DXm43CyD2iPhlD9yt7txoMuf3/aNhTq/J8GdIVNLzN5mEr3/2nuX024Mq8Hv2WPMLsAIV9GaXLN
 rCpkGRXLb0qyeyfY8UZ2kavz3FRCvA==
X-Proofpoint-GUID: LOpeoNBZzw1w5xUoNzXOVI_7wM5bOuCv
X-Authority-Analysis: v=2.4 cv=ZqDg6t7G c=1 sm=1 tr=0 ts=69301dea cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=0I7aqVnf0aXTppol8EEA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-02_01,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512030090

On 12/2/25 5:26 PM, Alexandru Gagniuc wrote:
> The "qcom,halt-regs" consists of a phandle reference followed by the
> three offsets within syscon for halt registers. Thus, we need to
> request 4 integers from of_property_read_variable_u32_array(), with
> the halt_reg ofsets at indexes 1, 2, and 3. Offset 0 is the phandle.
> 
> With MAX_HALT_REG at 3, of_property_read_variable_u32_array() returns
> -EOVERFLOW, causing .probe() to fail.
> 
> Increase MAX_HALT_REG to 4, and update the indexes accordingly.
> 
> Fixes: 0af65b9b915e ("remoteproc: qcom: wcss: Add non pas wcss Q6 support for QCS404")
> 
> Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
> ---

Hm, that surely could have never worked

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

