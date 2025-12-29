Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5060310625
	for <linux-remoteproc@vger.kernel.org>; Mon, 29 Dec 2025 12:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767011871; cv=none; b=PKxirfHYHYyIvHih7eXuLysVOYTfVWOHW4deFbyvTK18Ek+47zbQkjPKD3hGa4vtilUpbMffPTQpuCZL9dnPSfDTD1m751PqaZFhWB2JFF7j+EKz88a0/TKbHA50TVkvLPon9MkW9M8wwhtNTUttG2KrWyE+mV0vA9X7eF16Iyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767011871; c=relaxed/simple;
	bh=nT92qiQlJmJbd7SItIsGenMKubhtenI2TnajlR3nL9g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q+CT8UOAf3Q0qWm64TG29XTukhoZnYnAf/46zqvGB5ECilrDc5PQ26tfgUz/wePJN4fP3J+QQ4kytj8ycvlqOfmoyTqvE2DsCi1BNLpJJV0gcqylqIWI/w1OcnFt6q2RNKVUA2A6QARnG/IQ0GEr8GME6ZLpjZBU+Iok9N5chv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KQikgAu9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FCBg+KUJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KQikgAu9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FCBg+KUJ"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BTAhiHF106121
	for <linux-remoteproc@vger.kernel.org>; Mon, 29 Dec 2025 12:37:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HaZHnBGnmNXjwkhAyFHlaI3G1ZN1jGr7tnGr4jzkuTc=; b=KQikgAu9aJCkLTQ2
	HA8tdbIq1C588ai2r2NVmAsprKTJTR6iE97k3ILeJ5OhfHvXGZPy/A3FSGCAJ/3f
	oTlaUtNuR4vFSH9tREnzCwoWX6YKortVu+dis3bI+Fuq182dN1ELmRkRyvS1d16e
	KjKnGwsz7Smg1u3iEjakNSFZX34jIJpHdanD50feWJwqsTjrEIRue4MfLVTtx5uQ
	/nU3/3f+IyhTnhXZnTPDdpJlsEpSwxDFTcAXDrzg7qo/y/Re2Cva1QLI7w4uehgE
	Uu4TSPVESkEfbndYP6ols5Jh2ME87qzTP783OB35lSVVkgH6rvKccUdPzu0KA8hf
	XOwjIA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba7u5m9mq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 29 Dec 2025 12:37:48 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b9f3eaae4bso303788485a.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 29 Dec 2025 04:37:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767011868; x=1767616668; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HaZHnBGnmNXjwkhAyFHlaI3G1ZN1jGr7tnGr4jzkuTc=;
        b=FCBg+KUJWOzI6XuCKw//A5rD/2UGci95ngd0aHrvAY9victiHzQ13UHiGb3w52KVgl
         VI2o2FJWwUDCIPUHMqvy0dDl6haTTCxXjv3cl3o3wDc3UaT5M94uqN5eGk9sEKVK2H9H
         metOyesveWlKyrgKNb1hezq4inKtRlzCrLjO763rV2n02X68xNEEQLDX6O2itjRRH5Bb
         TEBh3q28qjFmYETV+twlJMQ/+MvkdpFvMXb8Z17J3Tdkn7RYCw2Z+nknJ/h0zHPNOsNY
         VhtRTcTSWnNrvQQS2DQJ7+KHio14e0B1mZvt9fapI5WYuFcYySNqV3gIY8ttsYTwRt+P
         YHLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767011868; x=1767616668;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HaZHnBGnmNXjwkhAyFHlaI3G1ZN1jGr7tnGr4jzkuTc=;
        b=Vid/TQA2Inu9kTobmpNTJUHS0kqgkuWQB1vOPzNr+2MKd2ylCECAGctEoHxu9xFTPt
         MERVrQYxm0SG89rEbMcXhBYolDM/3WkQRtLtN6wxdw6DJk3BYV/Q3viHfUpg/Sw3sr08
         iMPlpJ69+4tL7pp35Zrt2DHnCDhrcZsXKAQwgMg0i6GxQaD6zdMU8NEB+RulVgc5oyil
         SAUDHZsDDQdAfOGTYcrNHOc2tyYYeEKSBHW1dvMNjTznvKuu6uMRE1B9V4VLL3u+dZQG
         92nno/0/7Uv8a2jEj1D7SozXqIoQWDS4geQdGzpxF1Q+jcGHY93YxEoH6vVQSfXzIgtk
         6L+g==
X-Forwarded-Encrypted: i=1; AJvYcCWbxjnpshq//bttNVUPFGgHLszXo1ySt1mqI2zjiiZzNRG1E6gysF1X12VJNPqh2DxWfOwI34fcGlA4uPLMo1An@vger.kernel.org
X-Gm-Message-State: AOJu0Yz71svPNfHXoK0LxemUUv12bBRaAumKDwP/kEqw/8Kwf1HWyWXV
	F/Dc4ngyoDHdnLeMnEm+tsuiN6C4iF0qbhH+us7wufrY3kdQJYB77jkHAysxUXBLSxPmY9yNohP
	UWyGEeZFzk6RIMhKr2UQrKg15M8m5c+eyCfwEWWOmQOh+K+nVAIg3wd17FpmrUBIM5MdEXh1V
X-Gm-Gg: AY/fxX6BlL+RioiInZ0aydR4544j6ka0TQZyLw8VHHwucZwV9DhXFBUrhxzZSl69OqO
	0zSNm0ZKeDsDKagV2jvgGMpLzxr30UuL6ZGt7fxYm3H2AMy1AItI6glOogXgRiuCMPi8j7QK80/
	OrG5DBO4tgb7v3TNwBR6/mN5aMt9JJp89Uu0wiepX8RGBtu9bw83F6DhZD9NXVOTR1MMJav0rU+
	3LcgG0hS78ZHC+8CO8mON/gR8KtDHG32Oj70wXfSXUshwTCnRBrQ0shivnoYxGt/7xQtYXGaSiy
	XSqEYoGpYFb64nGFNnQwnI5422FuRcByd9LFkBCNeiHGveu/8/GJMTavoQYnnIdLvS18vyxEth8
	6D+fgjObKF2UDyagQ47TfHfX+08DutxMaabjhkRsqDrm7o/2AIhvMLfmX/WVECZKU2g==
X-Received: by 2002:a05:622a:11d4:b0:4f3:616c:dbed with SMTP id d75a77b69052e-4f4abbc85d9mr342484741cf.0.1767011868234;
        Mon, 29 Dec 2025 04:37:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGo00Bspo+dJ305XE3GhkwO64txDaV2RvGiGPAuWEJUOqnB9MRjGLEEumjHYKJoxgoT9LfHlw==
X-Received: by 2002:a05:622a:11d4:b0:4f3:616c:dbed with SMTP id d75a77b69052e-4f4abbc85d9mr342484371cf.0.1767011867710;
        Mon, 29 Dec 2025 04:37:47 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f512e3sm3302470766b.67.2025.12.29.04.37.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Dec 2025 04:37:47 -0800 (PST)
Message-ID: <4e21205e-0b09-496e-9d6f-9fe2c327c13a@oss.qualcomm.com>
Date: Mon, 29 Dec 2025 13:37:45 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/9] remoteproc: qcom_q6v5_wcss: support m3 firmware
To: "Alex G." <mr.nuke.me@gmail.com>, andersson@kernel.org
Cc: mathieu.poirier@linaro.org, krzk+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251219043425.888585-1-mr.nuke.me@gmail.com>
 <20251219043425.888585-7-mr.nuke.me@gmail.com>
 <5b9cd24e-7eae-4cbb-b013-6ef135902ae7@oss.qualcomm.com>
 <5116928.iIbC2pHGDl@nukework.gtech>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <5116928.iIbC2pHGDl@nukework.gtech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 3M7lkw6ilUVom_gorTMV5y4DwWM7mBxZ
X-Proofpoint-ORIG-GUID: 3M7lkw6ilUVom_gorTMV5y4DwWM7mBxZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI5MDExNyBTYWx0ZWRfXxTN3zOrucw+Y
 mtU6VXwRxo2aKQLsaFHz8tvyu7S7k3NwdzopogX+Y3QRmaa3namcIQCjH+vgW+xOwytN+xRkZSR
 5xOyvNreoispaGvWD8afVZroq6g47dMflQVMB1a+amo67jHg/VT0WzMzlsXcb5Rs29NWjdCvPqi
 OwHxKdxg9/DVPGgbA/P9IkZObx5SpYPsLNHegcQ1CSDENB7fWHQQxN7BZiu4BZSPWoRApTt8NMW
 9Ua+/RdpFbf7gTVG0ET5WmPnnQ6YHDIDjmamLBgA9ib5kq2esb8hWMUtre8fj9wXvWQn+nZ52NE
 BWcQg/tHDTQ8u4Y8gLWDaVmkzUqnf5J+kNJvwtIwPlRcW4puIBOHicQDqBsxqNXyS05ixbTKrms
 x7piFgWdwmjdX7FZLN/cKGhKzB/lnxy8eg26hV7UQl75kWOE2ti9jKUZ6W7t/mJwvib8Ar2Qvyg
 LSMAYKG6lFE8+h6aevg==
X-Authority-Analysis: v=2.4 cv=DptbOW/+ c=1 sm=1 tr=0 ts=6952761c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=pGLkceISAAAA:8 a=xfDH5INOwdilrQn0DfkA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_04,2025-12-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512290117

On 12/23/25 9:35 PM, Alex G. wrote:
> On Friday, December 19, 2025 7:29:07 AM CST Konrad Dybcio wrote:
>> On 12/19/25 5:34 AM, Alexandru Gagniuc wrote:
>>> IPQ8074, IPQ6018, and IPQ9574 support an m3 firmware image in addtion
>>> to the q6 firmware. The firmware releases from qcom provide both q6
>>> and m3 firmware for these SoCs. Support loading the m3 firmware image.
>>>
>>> Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
>>> ---

[...]

>>> +static int q6v5_wcss_load_aux(struct q6v5_wcss *wcss, const char
>>> *fw_name)
>>> +{
>>> +	const struct firmware *extra_fw;
>>> +	int ret;
>>> +
>>> +	dev_info(wcss->dev, "loading additional firmware image %s\n", 
> fw_name);

Your email client is messing up the reply context - if it happens to
be Thunderbird, set:

mailnews.wraplength = 0
mailnews.send_plaintext_flowed = false

in the config

>>
>> I don't think this log line is useful beyond development
> 
> Remoteproc driver prints the main (q6) fimrware name, so I thought it would be 
> prudent to print the names of any additional firmwares:
> 
>     remoteproc remoteproc0: Booting fw image IPQ9574/q6_fw.mdt, size 8140
> 
>>> +
>>> +	ret = request_firmware(&extra_fw, fw_name, wcss->dev);
>>> +	if (ret)
>>> +		return 0;
>>
>> return ret, perhaps? Unless you want to say that "it's fine if the M3 image
>> is missing, particularly not to impose any new requirements on existing
>> setups". But you haven't spelt that out explicitly.
> 
> I intended to not abort when aux firmware is missing. Maybe the better way to 
> handle this is to check for "-ENOENT" in the caller instead of return 0 here.
> 
>> You also haven't provided an explanation as to why the firmware should be
>> loaded. Is it necessary for some functionality? Is it that case on the
>> newly-supported IPQ9574?
> 
> I don't have a good answer. I reasoned that since the qcom provides it [1], 
> the M3 firmware would need to be loaded. I haven't done much testing without 
> it.

Well, could you please try?

IIRC it was strictly necessary for ATH1xk-on-PCIe so I'm assuming it's going
to be a necessity here as well 

Konrad
