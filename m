Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A8583148C6
	for <linux-remoteproc@vger.kernel.org>; Wed, 24 Dec 2025 03:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766546466; cv=none; b=bGESGV32io5LA/DwGRlNaBgPL+9csDKYqj0zxZ+60g+oW7Xfj2exJ0TwF9OdbAKBOsmNgQRFn46/Et/Q91v2vkNNm2z/w0nZkROrNmmVrEDkcoPF9oIojd2R/4U/5BXaDjQSXYyUkSOkH/urVqQyRN/iLKaEWT4q8wY50hwmenE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766546466; c=relaxed/simple;
	bh=T50vE2dUYm8Zie1nHtYyZrvmnFybSZOoezC3TSTzs28=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tbtdvC74m38gkeqIshkOTR+dya+BaRMA7o5uswjDVVrr0ARsuW6pu2oiDF4kEaq+S3PpxFjmGwjyqB750z65FXDqL1+RWe4Ca0p28P6dVsRyz0O5OQoYjdDhr2Hzzi8d/EpBdCJs1+ohMwwW9OzhjplU8tRQmLsh7xT4uBFIVWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ymnzvl/G; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VXaV+P5y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ymnzvl/G";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VXaV+P5y"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNGOELw1018224
	for <linux-remoteproc@vger.kernel.org>; Wed, 24 Dec 2025 03:21:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ef2xbZYFBLvV8iHc1w+Z8FJ2huGyVK0CDpCPxQoM66Q=; b=Ymnzvl/GE98rvMHF
	9M4c7i5jv0O9mzPwTJwvVy93CoB6epDZmX8N2h/EKVLfeNZFEl2lMj53DzLGAfKV
	KLIjPzq2whuYYND9qWIvjEnigsNyluy2Mx3FzZn7M4nWcPj3ayuugb9HWd1mU8MF
	9GZg3cjqGsrE4qYUOCSGG0NPmLdasaZG/OY+jkJ3q0nQ8+yRkg6PuMEVzeTLH9V6
	9Pc/V/sDWoZGuFlO1f0hw0Xm9FjYsw1F008nKh8fbO6mcI9m9ILfJOFQe0XTaRgN
	ZXJvst//6ygpyaGYsdw5F2vA+fi+/BINmdVQvg4N6LxPFYCuyw2+9oknqJDWeGvy
	64cF+w==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7xjs9km3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 24 Dec 2025 03:21:01 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a0e952f153so170290255ad.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 23 Dec 2025 19:21:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766546461; x=1767151261; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ef2xbZYFBLvV8iHc1w+Z8FJ2huGyVK0CDpCPxQoM66Q=;
        b=VXaV+P5yHXmdmsem7Fa8aV5KJDf5qvwKiv0yfRvAsazc4ZpdKc/KZPlwFGmsZiQi2p
         PO+SYp9MDoaoCgBNxi3uOm7ebM6+XA0WbGqQVrxJr2E9Ch4xWJ+uS8JEkgqdYMP6WKqb
         0N4NeAwAkq9H6ncRSTXq5w8iDoZLVMKwODT8adpXJVD86ogRh8oAYpthe+h0zW87XjWM
         hYvCpwEJOMxeI+3zkd7Qheq/6+2g0vOuOVy2MT8oOLcRSPgFmzFgkbSEjWhxOuaDeBwo
         Nb1qxhclaww7it6FElMxukJ9tmCIMlJJppKDrTFbYs069wC7cF66Oy/zTNSKuj2XtHZc
         E9iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766546461; x=1767151261;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ef2xbZYFBLvV8iHc1w+Z8FJ2huGyVK0CDpCPxQoM66Q=;
        b=FHbA07Tao1ID7mmq08Kor6RU4556GhXQQllH0wSm8S/NOEj545BW/s8HB2+yuWTxDn
         /CasqwV5cTGPApvnPYpVD3/So4U0kSRGbnXr721rJulK+XHdJOop779ZX1mVzOBS+Vvw
         6ZhA1E6jT7l/Hf5EvWe1Jl3Eb9jxRJ3jzwX5LOmkE2ZkdO9fW7l7c9hAVJRE5DbU25XX
         j+7yrxvSXfo0LYxAR+tvgB3R8BkfxyFHhSBv3Vhjl2SPFKuAoj0R3f7vGxYIzkC09hRM
         sX+5jMV/Pw3hzre45c8dEnuPPlNWdahS+mJXM02JoC+CqTbR+pRHqzqYNzDCeEaMDyp9
         uAOw==
X-Forwarded-Encrypted: i=1; AJvYcCVtfph9GvF2eyz9CCYZ+x4Hh/8svfWfFRpKiweIsMwotE2CyTy68N6CtCXnA73JOpJ+ZRS+5KUkn0KxT5HOholq@vger.kernel.org
X-Gm-Message-State: AOJu0Yy35nc/g5aOkSNKsqYO7cFUSNHF9Wga0s3clLVMPA7xMdhKv10M
	K8+DViyLUa1VuXwHmHLLWefiMP3MumqjjGhb+GfNfc6zwiBU6WLm5td7WQMZjwMwJCXhKbPrKEE
	mriniBSA1lfHtxgPy8bveoGw1o20MOvzNMJyjeSthWI0S5evWm+J2BPkfIClJfAYq/PxVjd0y
X-Gm-Gg: AY/fxX5+qPESpDBBbumfdC6oZa1w4gQpGIASPyQPT1FbFp/cZPpXglcGa3vudXmXjHQ
	8Igx2zwRaQOQ5nrr9Z2vmqtov3O5ajIeEoVeeDHRIZCAisp+nqehgvBqFJFgTn4y0MMXwY21t5P
	BEj0tg8z8bEM0rU9c2lH7zxOuY3TsRbPHhAAu2tdbXKcCi607+KYhGpBB4az9fq04SRjDzg0/ly
	ipRJlMRUWzjdkRHhKFLcXCHfHC0JSTn1useqQEvOnzvLRxjjgd56j9VACZak4S2kBaDficviaZQ
	PeYeBud7bbGqgJ9fgfIXjn4RY9p5iMHMSOkEfV+UpqIWGdR8WYDGhynUX92iFOhgXfUWvZq4i2z
	+9azwJRBR+CVnCnPTbLkYViHCLKZQvNtysqrHs9NO00EPh1fDFP2r7UXgfGHkekxebkfsCZP/UV
	mVDHIK
X-Received: by 2002:a17:903:4b08:b0:2a0:d692:5681 with SMTP id d9443c01a7336-2a2f2424895mr139884975ad.24.1766546460870;
        Tue, 23 Dec 2025 19:21:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEr7VP+KbQ00quvc7LFltxfmgOjKAAucSk+LjkUtqG/DLGixAnZdWekuOsy1KNQfere6mRwcw==
X-Received: by 2002:a17:903:4b08:b0:2a0:d692:5681 with SMTP id d9443c01a7336-2a2f2424895mr139884815ad.24.1766546460362;
        Tue, 23 Dec 2025 19:21:00 -0800 (PST)
Received: from [10.133.33.224] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c66bd3sm139239235ad.1.2025.12.23.19.20.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Dec 2025 19:21:00 -0800 (PST)
Message-ID: <9681baad-08b2-4935-a3d1-587458c3502f@oss.qualcomm.com>
Date: Wed, 24 Dec 2025 11:20:55 +0800
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/5] remoteproc: qcom: pas: Add late attach support for
 subsystems
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gokul krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
References: <20251223-knp-remoteproc-v3-0-5b09885c55a5@oss.qualcomm.com>
 <20251223-knp-remoteproc-v3-4-5b09885c55a5@oss.qualcomm.com>
 <zavjg2ciefd6fmlnqryzvo6vmtlk3xmns62hn2kwctpgtstski@p6kk3tn6c6bw>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <zavjg2ciefd6fmlnqryzvo6vmtlk3xmns62hn2kwctpgtstski@p6kk3tn6c6bw>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDAyNSBTYWx0ZWRfX0Ywp9ykwdBmb
 +s8r5OkqmsuTerc9PhLcC6L6Z9IvoXGopH29iOqsA4dIL/spVozUti7AjEqP3MNFil1kCsWTvJd
 IZMRdiBJnm7eXNp/QYnfVGtshTMi2lHrH41g/hl4vmbFLmNDvXEkzlBkerwJc1vYejLemXi3hR2
 1A4qnn/aD7Y+t2ckxXc2Tip4iF2A50jzZhsRGZ0UX0D/BuVkz0zTqN33Fx7tJzBWQVfW3JvhLi7
 GjQLNvovWDPsOlUw58Z4RJhKka2QMSLvZyQd8T4lcDri6lfZ//logVUn8fL6Vm0Wr7PsrS4hV12
 /w2i9Sf9N3OnDCUrpqTh+eNjNX8maXYfTGKeIa5MwuIv5QJXErUiQu8Thy1O9IXoP3I3ILaQPMg
 30tDzFLZycjdYcxu4xBn4xpQAgl7Bm45fzOPJ8ln8BOUpq+148QeZoIBlE0cONWpvtx0Yo3cGo8
 nYJ/Mzaz/3wb9WWHJ6A==
X-Proofpoint-ORIG-GUID: SZ4JWMcsx5o_7X9FEUpkqdNZc81345-Q
X-Authority-Analysis: v=2.4 cv=YcqwJgRf c=1 sm=1 tr=0 ts=694b5c1d cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=AeEh3y5A5LJfT7oo4OEA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: SZ4JWMcsx5o_7X9FEUpkqdNZc81345-Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_01,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 clxscore=1015 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512240025



On 12/24/2025 4:15 AM, Dmitry Baryshkov wrote:
> On Tue, Dec 23, 2025 at 01:13:50AM -0800, Jingyi Wang wrote:
>> From: Gokul krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
> 
> So, two names start from the capital letters and one from a downcase
> one?
> 

will fix


>>
>> Subsystems can be brought out of reset by entities such as bootloaders.
>> As the irq enablement could be later than subsystem bring up, the state
>> of subsystem should be checked by reading SMP2P bits and performing ping
>> test.
>>
>> A new qcom_pas_attach() function is introduced. if a crash state is
>> detected for the subsystem, rproc_report_crash() is called. If the
>> subsystem is ready either at the first check or within a 5-second timeout
>> and the ping is successful, it will be marked as "attached". The ready
>> state could be set by either ready interrupt or handover interrupt.
>>
>> If "early_boot" is set by kernel but "subsys_booted" is not completed
>> within the timeout, It could be the early boot feature is not supported
>> by other entities. In this case, the state will be marked as RPROC_OFFLINE
>> so that the PAS driver can load the firmware and start the remoteproc. As
>> the running state is set once attach function is called, the watchdog or
>> fatal interrupt received can be handled correctly.
>>
>> Signed-off-by: Gokul krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
>> Co-developed-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>> ---
>>  drivers/remoteproc/qcom_q6v5.c      | 87 ++++++++++++++++++++++++++++++++-
>>  drivers/remoteproc/qcom_q6v5.h      | 11 ++++-
>>  drivers/remoteproc/qcom_q6v5_adsp.c |  2 +-
>>  drivers/remoteproc/qcom_q6v5_mss.c  |  2 +-
>>  drivers/remoteproc/qcom_q6v5_pas.c  | 97 ++++++++++++++++++++++++++++++++++++-
>>  drivers/remoteproc/qcom_q6v5_wcss.c |  2 +-
>>  6 files changed, 195 insertions(+), 6 deletions(-)
> 
>> @@ -247,7 +328,7 @@ EXPORT_SYMBOL_GPL(qcom_q6v5_panic);
>>   */
>>  int qcom_q6v5_init(struct qcom_q6v5 *q6v5, struct platform_device *pdev,
>>  		   struct rproc *rproc, int crash_reason, const char *load_state,
>> -		   void (*handover)(struct qcom_q6v5 *q6v5))
>> +		   bool early_boot, void (*handover)(struct qcom_q6v5 *q6v5))
> 
> Separate lines
> 

will fix

>>  {
>>  	int ret;
>>  
>> @@ -326,6 +329,7 @@ static int qcom_pas_start(struct rproc *rproc)
>>  	}
>>  
>>  	ret = qcom_q6v5_wait_for_start(&pas->q6v5, msecs_to_jiffies(5000));
>> +
> 
> Nope, unnecessary empty line.
>

will fix
 
>>  	if (ret == -ETIMEDOUT) {
>>  		dev_err(pas->dev, "start timed out\n");
>>  		qcom_scm_pas_shutdown(pas->pas_id);
> 

Thanks,
Jingyi
