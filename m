Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82AF2349B0A
	for <linux-remoteproc@vger.kernel.org>; Wed, 14 Jan 2026 10:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768386402; cv=none; b=L9Zmolq+S4xBFamtmBsFzQ47ZsXJTeXxFroIqePJU0x2bV/XF+q3robFMpXHLIZhrIwES5X+Pd2pM4ptKTHwgW2NTkou7VnvRjiPAUzPBZoQfzWSNW9xyzwXNC9f6SOH5hC8P3soU7KegZyAcipmT4H+UF1cbU4rlsXhueVJM24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768386402; c=relaxed/simple;
	bh=Fu8MtgpqCxZ9sGmx8hkJ/VocCQe/lZv5XoRHvC6Yeb0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VeukjRgG2JZY2b/Ng3nCu4k5rpw4SF45kl7ogCxxY6F/pd4G16FaYo4BfZNgjLga6MfTUPcq1aCG2cmGFc0sgtwcpr4LsG2IKwna3hkP6vcbEHMpslIM+8aC/snUQTlJpGeoiY+xVXG/EYznq1A7mur7jXEpdfjOg7Ogpi2sPos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WDt2rwrK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TN8ls7qD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WDt2rwrK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TN8ls7qD"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60E7j6PF2841198
	for <linux-remoteproc@vger.kernel.org>; Wed, 14 Jan 2026 10:26:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fA5tFWc06sbtbJJSPWLf+rY1+5q51zBFBkLrZ9oIlz4=; b=WDt2rwrK9qwcNcxN
	PCA5eli9kwn0fjmAmwsHjzCBb+34sd4HbPxF7BWP5vXSP8K5EkZGAfL37cJo4ebL
	9ZX/ieJPUd2B+sWQvjwpTjWcnU6FSYOKqmpevHg9wIKOG+EpTIC5ZKEa52lo1vtR
	Kv3N4YUMK/Ju2sWbAWEzINeUf936RT0ZzbbWKRN4XjObUTL9T8iyYDEKYZ1BO9yX
	gcM+UJZnB9cYIdUu5vqH2sRpUH9Qhq467OAWsU0fjQrbMing9XG8qhd9Og0CXQJy
	ZIAtelGIBKx5VYOm4jM43nRDGc6Mkgb9kBtFhPWm4WjnUbHLJbOlGu48KsacyXPg
	3M/0FQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnuk92xpt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 14 Jan 2026 10:26:40 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5014f383effso327961cf.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 14 Jan 2026 02:26:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768386400; x=1768991200; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fA5tFWc06sbtbJJSPWLf+rY1+5q51zBFBkLrZ9oIlz4=;
        b=TN8ls7qD65k5AjZpG582nbJjLFlz8elNbcPfps+n+hLGpFLLzPAE3WE9NfNr2GBcFt
         aDwyrjnfEiE8Fcsw02119/AAAIk1L7C7bbnMyFr7NGoXoP4qqpjWXcYQ912td6byGwlO
         z+N5nTaiBltJQW8b88DV+FXfIx0kahO0+PFZ3zhSrJdwVeDYBGW7syOo7R0WN+EbzaKG
         2nvUkmVNF8UOFW/x6UgD8i+xO+6pRx2apEBHAqnnGTFK49cNmiEcbGbvliQjvVjvL7k6
         L8qjQQ46tOo4JGVaiwQzYty7lPkbppMob+4RBSQIWcKJjNM32rxNnowufcmUS0df0W3r
         Nn6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768386400; x=1768991200;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fA5tFWc06sbtbJJSPWLf+rY1+5q51zBFBkLrZ9oIlz4=;
        b=PqtMO+73VImL8QlzfNPRQ73JTHb1zslh60A6FnaQ1HkCg0cQPjxaByGEwDtJ1Qmxrn
         xza9w3vRhzy8+iRSzV1a8eogs3T8FSq6gz9WSzb8mw7aurYBBuQtYC9J+iSaSZudBLDZ
         mPiOnsfwuBLmagO/RwGj9Iv+OVK1Opue627vZHIsEogkXWH3VhNPSSpnvTvm5W7NaVpU
         j6vdWtIB3UeRfgtKPGpMVZcu1Ff7PrwNX66Oc9P3+zZoJSpaVJUIpg5zwVtvEYIzsFm7
         Db6xio6hK7DhFE0iPvEeR11GFS+WEy+FoBxfI4/0uJAcvHE1hgl0vO0NnQob80uzXMA4
         skag==
X-Forwarded-Encrypted: i=1; AJvYcCWsKcLKiTWflDdFObs2qLTTYM6MmKrSmY8vn0ekX1SNUse76NqsBATLv5InXjJ865zYRnAWD1+jL/G65+RS/vDm@vger.kernel.org
X-Gm-Message-State: AOJu0YzLPz3b3NBOQ6mH8qNKP7/Dvv3IV7Kb66/sY4Wa5o464RVExKDa
	NETn0IeHOaVU2Ai/0KTzCIm7BJuqFUlM0bd4uoclHlXY8kG+l7FL23kuWHZX4kfjrPfaa3rGRhO
	GPnbNFW0/wI91nuD8UI6GYxLVGW7JO9rzC1zG9ybJ7+pQj//fY2FRRxcHgZ4QUYr9qF22BkYc
X-Gm-Gg: AY/fxX76FVetUoLxbK/yEqjwIxA8yaMCe5oQcA47vyVwam5XihLHQnF8JZspGs2q7en
	vqS8y4SOi8nqMRtEmAD++xt+J9dsxaNZQq+Tcj3/VqoqOfjxoXBUsWeYQXWCVd4bMxfPdZ6zASs
	2IfUj3Dl+tEbRQhw7+NDkmAMl+9XLvt+2AdwFWaim0HJuyQdYLU9Zppfq0KFBXF8JG9+CkZiSL0
	mrm3Bbv6+/vEYd+VWejSqvMrpZ0LdcfHQp13ZLEAb9P8+tZ4DUsgWrZAbWCUoH5ZtkLuwMXHM8F
	R3mhoVqvzqsrwN8IBgS02FugTqUZJ+FNxRqLIx4vttzM27lnoW3790CjTqCvC2s44/HaKLxu1FW
	mdWCFAeEk8ZjY2uhi+rINYbHJtm6jmOM3c3rqyrCBEkjTjzhyIc/d1ULZTIDNDclKF7c=
X-Received: by 2002:a05:622a:520e:b0:501:4ba0:e06a with SMTP id d75a77b69052e-5014ba0e3a8mr6840431cf.8.1768386399684;
        Wed, 14 Jan 2026 02:26:39 -0800 (PST)
X-Received: by 2002:a05:622a:520e:b0:501:4ba0:e06a with SMTP id d75a77b69052e-5014ba0e3a8mr6840271cf.8.1768386399212;
        Wed, 14 Jan 2026 02:26:39 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507b9eb402sm22427982a12.15.2026.01.14.02.26.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jan 2026 02:26:38 -0800 (PST)
Message-ID: <577d547e-6311-49b3-9c74-84797b281447@oss.qualcomm.com>
Date: Wed, 14 Jan 2026 11:26:36 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/9] remoteproc: qcom_q6v5_wcss: add native ipq9574
 support
To: "Alex G." <mr.nuke.me@gmail.com>, andersson@kernel.org, krzk+dt@kernel.org,
        mturquette@baylibre.com, linux-remoteproc@vger.kernel.org
Cc: mathieu.poirier@linaro.org, robh@kernel.org, conor+dt@kernel.org,
        konradybcio@kernel.org, sboyd@kernel.org, p.zabel@pengutronix.de,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
References: <20260109043352.3072933-1-mr.nuke.me@gmail.com>
 <14283f23-31cc-4bf8-9762-f0348c30618d@oss.qualcomm.com>
 <4814455.tdWV9SEqCh@nukework.gtech>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <4814455.tdWV9SEqCh@nukework.gtech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ebQwvrEH c=1 sm=1 tr=0 ts=69676f60 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=MOnJJczUH92I72-_oswA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: IUsbabWf3-sq0d8sF7t1fd09tYpugYEu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDA4NSBTYWx0ZWRfXx2AvdarxMabJ
 3Q4tGt32tR29csjn73usKb0N+AHf2YJP7cMqn5l1z+a3DqD7iKjY3KXQxBpKwKSiKMa4xPQ6mY3
 aEeRy/vDVO+DYmZdL1iQylfJdP19G9nw/rufBqgpfm2tVst9bXHBnFeb+p2zPZNtEoiyfb32oIi
 DgRiB5WHF86AVAfZNDF7wANZ2lFQHbtpj6LRafaj7cvxi7lFf86dWx8iTnFvSyhwMI2sQ82Ppeh
 NIGSTeOkdaFZQO5FTtRh3OaW5bxji37a0han9OuYk5Tfhts4QKr7jz5e5Q9reWkskzN78tFVUUS
 aQFf7zY1nk1SiM0hJ+/YjXfq718JtOdRD/n/nE5okNQK0hGffUWR/a4/KN60BSiglm5I8iZ8yT+
 0R1AgX67uPYNgGtddgzwK5cygKVK0p6OWja2vnJqwM/3RgRMBdQtgknTchB+cvEm8Has83cOQbG
 lQgEPbDXEjLYYt9HmFQ==
X-Proofpoint-GUID: IUsbabWf3-sq0d8sF7t1fd09tYpugYEu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601140085

On 1/14/26 4:54 AM, Alex G. wrote:
> On Tuesday, January 13, 2026 8:28:11 AM CST Konrad Dybcio wrote:
>> On 1/9/26 5:33 AM, Alexandru Gagniuc wrote:
>>> Support loading remoteproc firmware on IPQ9574 with the qcom_q6v5_wcss
>>> driver. This firmware is usually used to run ath11k firmware and enable
>>> wifi with chips such as QCN5024.
>>>
>>> When submitting v1, I learned that the firmware can also be loaded by
>>> the trustzone firmware. Since TZ is not shipped with the kernel, it
>>> makes sense to have the option of a native init sequence, as not all
>>> devices come with the latest TZ firmware.
>>>
>>> Qualcomm tries to assure us that the TZ firmware will always do the
>>> right thing (TM), but I am not fully convinced
>>
>> Why else do you think it's there in the firmware? :(
> 
> A more relevant question is, why do some contributors sincerely believe that 
> the TZ initialization of Q6 firmware is not a good idea for their use case?
> 
> To answer your question, I think the TZ initialization is an afterthought of 
> the SoC design. I think it was only after ther the design stage that it was 
> brought up that a remoteproc on AHB has out-of-band access to system memory, 
> which poses security concerns to some customers. I think authentication was 
> implemented in TZ to address that. I also think that in order to prevent clock 
> glitching from bypassing such verification, they had to move the initialization 
> sequence in TZ as well.

I wouldn't exactly call it an afterthought.. Image authentication (as in,
verifying the signature of the ELF) has always been part of TZ, because
doing so in a user-modifiable context would be absolutely nonsensical

qcom_scm_pas_auth_and_reset() which configures and powers up the rproc
has been there for a really long time too (at least since the 2012 SoCs
like MSM8974) and I would guesstimate it's been there for a reason - not
all clocks can or should be accessible from the OS (from a SW standpoint
it would be convenient to have a separate SECURE_CC block where all the
clocks we shouldn't care about are moved, but the HW design makes more
sense as-is, for the most part), plus there is additional access control
hardware on the platform that must be configured from a secure context
(by design) which I assume could be part of this sequence, based on
the specifics of a given SoC

Konrad
