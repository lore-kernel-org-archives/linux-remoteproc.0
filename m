Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C65D16F8E5
	for <linux-remoteproc@vger.kernel.org>; Mon,  5 May 2025 13:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746452839; cv=none; b=cNc5sY+t0tFUN1tUtjzH/qI4mCsFPvpS38dSxfGS8/O3vQC0CNk9+v0x9LXbmMYoEc3+W+EeUd9G/hspXm07TuMlDBqBY/+wqg+N0jpeGvyTY4Y7ZIz6ahdKQC3OIEWSmQHsNE4+m7PJfQvDSgnzP9Myzl+eW3L2Z4UxZ2BBJEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746452839; c=relaxed/simple;
	bh=35A1pFwBLp1C8a+0gKuucdcy1iYJ5R3s8OvY16i34vs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lvVp0d2rbNqQHISvdpBGhW2XBkPysfQUOxTO411AEOC4BxGBkf6G2PUJhjoNgGA4Vf8S6z/4GNmOrHXLFdN/9tcomZI3oa5P3vLIUI6hcxchgKfy0wqSmPFmBwOBYhGajIEuHwZENsT8ReFatrNqLW34F/87iXa2/c/u9YIajj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nh78tSZU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nh78tSZU"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 545BXM7E022011
	for <linux-remoteproc@vger.kernel.org>; Mon, 5 May 2025 13:47:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6O7SMxPcdaogCQNY+g+fJpiy2D9+24j+Ytoifls3m6Q=; b=nh78tSZUjf+FXTAe
	QWcdXEUYlQfuuCcUQMILZt8rwpxhHuDgJDtD1BBky9fi2h+ev0Z8FTEaxoaoYukC
	9W0umYDXQ03K9G5BfOy/CnnuXBEDWc+fNnNizYIGp9ANcr6YPYzYRvdjes7RbJa2
	yDMysANrF/+SK19+KUrIvIOrxeC+zOM7ios0bWIIiu8mMtwvYqEGIW6+XK373+gc
	n8AWDEWOaFoqLI+TOG/xzWpQiiEZRkjWavI1iDZDCGtyequqvIhxeakxY/SkrofE
	YZ0VNKSlgavGDxhFfWG+llZnPacT8y4Dt1P3ojcdjrIlGptHNsmkwtH/nk6/4IEt
	BJ1nbA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46dafg48gx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 05 May 2025 13:47:16 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-736c1ea954fso2381509b3a.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 05 May 2025 06:47:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746452835; x=1747057635;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6O7SMxPcdaogCQNY+g+fJpiy2D9+24j+Ytoifls3m6Q=;
        b=sOO8oA8El8hdeDvSBZxmmghnjg6VmiSGI8V9wnny2nm22zUW+E5SXxdeeHakSdnAlB
         K6jqQxd4gdjwpA15gFUxr3N1ZVoh41dmRgYgcVJG1zCuCiYKJValX2guCmJdng2UnwGB
         ALq5Tz3lozEI7dHMVuxPm0ByuTegmF5jF0wSlV0iZJP5NPX11KhFfnmwTCxGebHJ46UO
         FVT4upvcGH81tmBvPUBKoSqwtG/Ysb4M3U+4MSj9R5xcp5RpTsjdsm5sjpVmgJ/j6t3B
         nEK4chHKfaDpTwquJw2CHJXagndPXSGRTnsdXvSDjKzV/Ah2CCpE31f5SxsbnA/rbnza
         58+g==
X-Forwarded-Encrypted: i=1; AJvYcCU4Qc49tfaEjc0WQXvKKZG0OgK3jJO5ByySvdzd8EaupZvZ1yR8tHf9ZwWBSLIOpFRxx+lLRErgth8X4+y1BzN9@vger.kernel.org
X-Gm-Message-State: AOJu0YwmUVtWDcz/qMztELyP2QTuEdFCZiwiXhxu0k7NxfRefU/2DAzC
	MTPWjLjDHqRd9xEWt0E71ng9UUz3mpBIIaOdLjVNUj3eaGCUuP6rJz28hawkt+HO9DqB+6TBVgx
	5lgfncdBm7sDZxJzF5rGOghs2xLFGwFkQaN0ZjddI6gdndfCPyxJFtIknK6RcjtHxD1K8IU3Uxb
	YF
X-Gm-Gg: ASbGncsBoP0vAPgGgWQ9sPIFCITRaLXX6aO4mHXmXJDHdAtNek7/kqI1xMWCR3FcwXQ
	Vk/6Fz3RWGMWHqkZQUmq5Ob5hUEfJqh0qkKSAzuJ6yQkqBrYXuIH1jrrsiPqEmysmmBPLl4kfPn
	i/r+qvQ2yidjBSYj1bWG4WbG4yzZcJ0LH2K66SfItlIxlYRn2UCdt0s3I20z+YbDSBwwv1vwktr
	3Lao9sA6wdY65TFIBT9yjWvdrcPP5c+3hLhIBxZXYEB95syhmbY7D4NLarGca8QVOI12BivEZdM
	X2eppDuKOdyTPTFmpF6/Ckaigr/WthD7avYL/TED
X-Received: by 2002:a05:6a00:301f:b0:736:9e40:13b1 with SMTP id d2e1a72fcca58-74058b25ab3mr18929011b3a.23.1746452835205;
        Mon, 05 May 2025 06:47:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEBYq/9PjHY+0aVxuCZ+xngOxYiSlU0G8RVr3lcCt0KMrkitx/IETIVjLPE/85afY1g0PR4/w==
X-Received: by 2002:a05:6a00:301f:b0:736:9e40:13b1 with SMTP id d2e1a72fcca58-74058b25ab3mr18928964b3a.23.1746452834865;
        Mon, 05 May 2025 06:47:14 -0700 (PDT)
Received: from [10.152.201.37] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7405909ca4csm6773759b3a.161.2025.05.05.06.47.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 May 2025 06:47:14 -0700 (PDT)
Message-ID: <e6d58532-dcd3-4c12-b70e-f765c01ec286@oss.qualcomm.com>
Date: Mon, 5 May 2025 19:17:08 +0530
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V5 5/6] arm64: dts: qcom: ipq5424: add nodes to bring up
 q6
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, andersson@kernel.org,
        mathieu.poirier@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, konradybcio@kernel.org, quic_mmanikan@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org
Cc: quic_srichara@quicinc.com, vignesh.viswanathan@oss.qualcomm.com
References: <20250417061245.497803-1-gokul.sriram.p@oss.qualcomm.com>
 <20250417061245.497803-6-gokul.sriram.p@oss.qualcomm.com>
 <5a17d866-a459-40c8-9e3f-90bb1cdbd846@oss.qualcomm.com>
Content-Language: en-US
From: Gokul Sriram P <gokul.sriram.p@oss.qualcomm.com>
In-Reply-To: <5a17d866-a459-40c8-9e3f-90bb1cdbd846@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: PU1gEbTPF9-BqCZ5UayzMtk5-fftHztF
X-Proofpoint-ORIG-GUID: PU1gEbTPF9-BqCZ5UayzMtk5-fftHztF
X-Authority-Analysis: v=2.4 cv=atqyCTZV c=1 sm=1 tr=0 ts=6818c164 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=PAShMIj1ugy68JlEE5EA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDEzMiBTYWx0ZWRfX6wSaxXWHkNzc
 k4+8Z38Cbmt0l3x+0SnPe3i4QLabwZ1wJuCUz+4h0EvBRpr7vJwtX09rf9gODVxEUr2+LMtVFx+
 +XnY9FVjKBlmE94SXiCemBGDi5xM6bwFpMxt+z6WDNg7Snbr5LwaSC4mfYtmhDSd1HEi9s6s5lt
 WZ8jnymAp/DWUgwEHHsXQX6Zx9vXDOBF9AaWzTKyNAej4Y1FihN5LRnQ771cEFJ1Y8JmiByJaG/
 ZlJtpe6wCfPMeMCxNfYykdT82FN5x1XtbSiw/MwBc1KBoQcfi9nHWllM6N0w3qMZGh8T6GuB/Ld
 RRh0bL7q/fbTBl+q0SPDWifozGO/7HRcSfFQZG5YBFx3o9NWm+Z4okT1pvp4WkJX5GZ1EBGepYn
 l/16+iisg9aSNEjLtqq1O5KfTdP+KMR8P+8FpbUS/VXjVW28OuOgHfPdFwhReCFDqybjzMyh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-05_06,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 mlxlogscore=755 mlxscore=0 impostorscore=0 adultscore=0
 clxscore=1015 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505050132


On 4/26/2025 1:57 AM, Konrad Dybcio wrote:
> On 4/17/25 8:12 AM, Gokul Sriram Palanisamy wrote:
>> Enable nodes required for q6 remoteproc bring up.
>>
>> Signed-off-by: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>
>> ---
> [...]
>
>> +		apcs_glb: mailbox@f400004 {
>> +			compatible = "qcom,ipq5424-apcs-apps-global",
>> +				     "qcom,ipq6018-apcs-apps-global";
>> +			reg = <0 0x0f400004 0 0x6000>;
> So either the offset in the driver is wrong, or the base here
> is wrong
>
> The IPC register is at 0x0f40000c
>
> + length is 0x10_000

with 0x0f400004, In apcs mailbox driver using offset as 8.

Should I use 0x0f400000 with offset as 12 ?


>
> [...]> +			#clock-cells = <1>;
>> +			#mbox-cells = <1>;
>> +		};
>> +
>> +		tmel_qmp: qmp@32090000 {
>> +			compatible = "qcom,ipq5424-tmel";
>> +			reg = <0 0x32090000 0 0x2000>;
> 0x4000-long, this should be much later on (sorted by unit address)
ok, will update.
>> +			interrupts = <GIC_SPI 126 IRQ_TYPE_EDGE_RISING>;
> I'm not a 100% sure this is the right interrupt, but I'm not saying
> it's necessarily wrong

This is the interrupt being used and its validated and works fine.


Regards,

Gokul

