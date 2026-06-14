Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37C3E262A6
	for <linux-remoteproc@vger.kernel.org>; Sun, 14 Jun 2026 03:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781408333; cv=none; b=jIgZeccac+3BXOeBYJfgbE6Bzf3YokxJz248tMqNv9aI1htR/hJRVtel7twSGD3kHQQ1Q2g/GFy7JYR7E8atV659n47aTFUfBSp7xMoo7AwFUQBf6DqcjK5b1r88lvu7XkD5BbbJX9zdWUrV9Fdc34xOv0h+bqyUtwR74Op6gR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781408333; c=relaxed/simple;
	bh=WLiWxTnhzrQgPu7cNyodDOXgCHLzQQEe2vLlFVSwvqY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CGGmueZnhwQFhn8ET2j3ILO8IwNJQyOXnFSfjPnne0ksdwSyWascS9CVW04oHb7MRZu0/osZcjC0rcQDOdP5x74k5stvQBzMKnx+YuaOV6K/jb7cbIZo6xCOkafdiMklLFq196GOometZ/0057G1iRzwZDAYgtoYQi9ZN62x9mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hqmU9Rqj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bwhqh97H; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hqmU9Rqj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bwhqh97H"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65E3APBa566186
	for <linux-remoteproc@vger.kernel.org>; Sun, 14 Jun 2026 03:38:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HwSZ0vKlQfQiOlii2mBhbv7y7KAwnruxesTxj6LLNZw=; b=hqmU9RqjIYtYVAKt
	35G3C6DE2qi+zkwOqQAjcrgESITOW8NyTkj7bl7U/8PntyYLtC/v2TW9B/M//sPB
	Tpm6ZoCFadAhlDwHdYOKcqaIX5QH4axia/11lASzhs6W34/iJqjZoAQ669/hS0YW
	KAYksgufdtFoiqfUMbtCqqV7ktNHAleHQAy2YRg9lsxSj9IhtLcZP6JBlUbXuM5L
	9f1H6uf9JuPGtptlfHSM7wRFy7jNuqo1zpPUcABIsMfm/5ezV+1OcVB/wN2DHE4e
	6gXccBWHE8Qjzs2MLs+uL+ik0mgkvnonHFBaGpAzmJX2/CbXQvH0CPzteoxyg2pm
	vL0NlA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eryc6tn0h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Sun, 14 Jun 2026 03:38:49 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c0c210168fso4275985ad.0
        for <linux-remoteproc@vger.kernel.org>; Sat, 13 Jun 2026 20:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781408329; x=1782013129; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HwSZ0vKlQfQiOlii2mBhbv7y7KAwnruxesTxj6LLNZw=;
        b=Bwhqh97HSuuMG4+GIdC5EjKS6pma0Q9IEUEnk4XRPu8bmQEpTQipVE3XOr1Gotq16o
         ehVovTPy0zlRJ+8lcPAnh6FpOCWDntZpMHOQKl4V7FnO6F2flBCF/GmQ1yv80f9nuaOX
         MgCt19L/81wrFNut8ndnRLLHnSvTLFmONXGAO9YFeSHBvvL2LqgkKfc7WAP86asZpOKw
         vhtS+D+pYyF6P1w6CeRINlemG3H4Cll27O9XZqpuEOTYRzCmpzCI5lYSz6Hh/d9EDy16
         GQeTo4QP6xOHSkmZjPrbg90EZZMSxpaKXy4qEoY1hKt4mNblNM8pH/p9uIq05jPl2s3Q
         AWoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781408329; x=1782013129;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HwSZ0vKlQfQiOlii2mBhbv7y7KAwnruxesTxj6LLNZw=;
        b=naRi/H1c95C1+xHlcS2HErLdWRSzfGvVtP/cSrfQBlvVR/1vW09dQdOLb+j573MyeP
         GPJ32kkRTrfm3S/Veg8sdqa1T2x8Es68S9YJvgfe5m+AdknPCG2nIJuXOU5eVh15dGHl
         gp9H3P+gpB+LBm8S+57n0nzycQhySg3F/cQDzifuTDyVI+9nTe8u77jTWo2EVxC2zFkZ
         M6DVV6cI+TCrp4DHXbqAwkYVIIdTBYLYQVgDFqd8t6pUCJXCFR5Qv5KtmlstP3txG9Mm
         N+bmDnik26Dz2qWFha3/n5+3VB1Yqtxk13Qak3MMbTc5g3dSyQnIeYYiGnua5wRBdRGU
         PwUg==
X-Forwarded-Encrypted: i=1; AFNElJ9rydOp8PfeOWOJfeJttWd7Q+NbXBABWHUJSleihgDojnsq4hzW5OsPRZKBKDfDiE8XqNeD5BnyAn6vGOdfHdTY@vger.kernel.org
X-Gm-Message-State: AOJu0YyqwzQmNexoOaySBJn5mtbM0ikuwygHIFf3vs67QcTUT6aOjbQO
	hZ+oaip4ek2GnQGLeKKnkFNVdGBfJTC719qxn6048WzDPzsGUkHr9ZZXsp3XjqWhL1CSK43lKdA
	Tl/CWRrj77/91tWUBJ5RHW2QyZT1RBJVaFSzM7Ngn4bS75qBF3DCcUr6yJm/92rCDQYvsfdR8
X-Gm-Gg: Acq92OHpWbs/nOkYFNivyxiAqYHqafevwIEfr+PfWfsVbDIOF665Weuk1wEFmrfJ6kF
	ZjYdl3nTZ/KKIVtDPvU3Zi45mgskjkUKse2ULj+wTY00wVSIPgEa8LhvC2DI8+Aa/SUsCiVHjae
	uc25Jb1ygK6rPkXA7pNV6uknNQRFgYu/ikk71Tsaw7jJIbGQ/W4u9d417fz0kF9hQ5rbhvCCsoO
	YwSPCxEKufHVd82gJEYsFo7kKNJ8TR7oT+0C00Pb0Flg/+6h6biM5GtqEMti9mxT2R2Gtmx+7ae
	rCkZhORUhScx63HZjBrppFOH5J49sJEjVnZqTLObJUbTZ+sA/WmwjwEAzUEXXlaijYXJjq/WYxk
	y7EfV17/i1Djw/YA4Oxj3TtMI+21B5y8INFWKrD8aRzHvkw==
X-Received: by 2002:a05:6a21:6d90:b0:3b5:52b6:f641 with SMTP id adf61e73a8af0-3b78420cc46mr4683341637.4.1781408328869;
        Sat, 13 Jun 2026 20:38:48 -0700 (PDT)
X-Received: by 2002:a05:6a21:6d90:b0:3b5:52b6:f641 with SMTP id adf61e73a8af0-3b78420cc46mr4683313637.4.1781408328271;
        Sat, 13 Jun 2026 20:38:48 -0700 (PDT)
Received: from [10.239.132.150] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c866519f896sm5703024a12.23.2026.06.13.20.38.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Jun 2026 20:38:47 -0700 (PDT)
Message-ID: <cdf6db72-244a-4e18-bfc2-4ad52f9b8777@oss.qualcomm.com>
Date: Sun, 14 Jun 2026 11:38:39 +0800
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/6] remoteproc: qcom: pas: Add late attach support for
 subsystems
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Bartosz Golaszewski
 <brgl@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, shengchao.guo@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
References: <20260519-knp-soccp-v6-0-cf5d0e194b5f@oss.qualcomm.com>
 <20260519-knp-soccp-v6-5-cf5d0e194b5f@oss.qualcomm.com>
 <ahBG6jKYdSAboWjs@linaro.org>
 <6df4c351-7287-4fb9-8af8-83b5deabfa07@oss.qualcomm.com>
 <aip7feoTn0ncwzL7@linaro.org>
From: "Aiqun(Maria) Yu" <aiqun.yu@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <aip7feoTn0ncwzL7@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE0MDAzMSBTYWx0ZWRfX9ll7+nXhkPzF
 ieA7WJFx9ziIvMJHsUMY2A2gHYWgNx4rt050advkxVoG6LTSvzjnvDfY3EEVBNx1DVz2iMu8XiB
 klS0+ulDazDKRmlnZQJd5cSd8u5BAbk=
X-Authority-Analysis: v=2.4 cv=Oop/DS/t c=1 sm=1 tr=0 ts=6a2e2249 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bdzlAc8VpKKGP06_0pAA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: 8Z6muIBL6bNDEa9FY2iu2kFKoLypO-1J
X-Proofpoint-ORIG-GUID: 8Z6muIBL6bNDEa9FY2iu2kFKoLypO-1J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE0MDAzMSBTYWx0ZWRfX/z+2grfFQeiG
 vHQlcKpHtW5YQ9EwFgenAhjXPZBpb4vdzeRv/uaLFSEtM0dqu5ZYQ62zs/nTAXgbQ3EezZhQ3si
 l8GPqKV6PrUr0jO21lDOXE3tp+od1CC+lW/dmCLmnF7dsbqBDxOaw9qX52K3fuA2PazvTaOjKWf
 TtE1gjp2VGZYodCLOvR091uDsKoDBB1SPwo8Sh8JjyxTqQN0wDm4hxQ56BpN8bJcQJTEK3yfwd0
 OKA90fXNDwNzLRDBJSLRAc/irC9O7p5TchfGIr/IyEj70OdcDy03uuvN5S4YYRb15NCXUPt8wPV
 K/TFke1YpQNV/4AYYPStArLk8LZyByPA8GiWIPk0bWoOnyo8J7jCZkSIMPW+iQWqEZq5e14SSJ9
 7zf7p5185Vmurz7vIhHGu2wwfDoyQx5o23mRASVpuNELyOdxUjQbsT7S+ts1OYsb5rmFOnMIo76
 KgQAaAF5f8rywYhsrHA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-13_05,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 spamscore=0 malwarescore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606140031

On 6/11/2026 5:10 PM, Stephan Gerhold wrote:
> On Thu, Jun 11, 2026 at 11:10:25AM +0800, Aiqun(Maria) Yu wrote:
>> On 5/22/2026 8:07 PM, Stephan Gerhold wrote:
>>> On Tue, May 19, 2026 at 12:24:23AM -0700, Jingyi Wang wrote:
>>>> Subsystems can be brought out of reset by entities such as bootloaders.
>>>> As the irq enablement could be later than subsystem bring up, the state
>>>> of subsystem should be checked by reading SMP2P bits.
>>>>
>>>> A new qcom_pas_attach() function is introduced. if a crash state is
>>>> detected for the subsystem, rproc_report_crash() is called. If the ready
>>>> state is detected, it will be marked as "attached", otherwise it could
>>>> be the early boot feature is not supported by other entities. In this
>>>> case, the state will be marked as RPROC_OFFLINE so that the PAS driver
>>>> can load the firmware and start the remoteproc.
>>>>
>>>> Co-developed-by: Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
>>>> Signed-off-by: Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
>>>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>>>
>>> Unfortunately, removing the ping-pong functionality that was present in
>>> previous patch versions makes the whole mechanism a lot more fragile.
>>> I'm not entirely sure if this has changed in SMP2P v2 or more recent
>>> firmware versions, but in my experience the SMP2P "ready" bit does not
>>> tell you if the remoteproc is actually running. The problem is that the
>>> "ready" bit is asserted by the remoteproc when the firmware is ready,
>>> but it is not cleared when you shutdown or forcibly stop the remoteproc.
>>>
>>> If this is still the case, you can easily reproduce that with the
>>> following test:
>>>
>>>  1. Start the system as usual and let it attach the remoteproc
>>>  2. Manually stop the remoteproc in sysfs (echo stop > state)
>>>  3. modprobe -r qcom_q6v5_pas
>>>  4. modprobe qcom_q6v5_pas
>>>  5. If the "ready" bit is still set, the driver will try attaching the
>>>     remoteproc, but it's actually not running. No recovery will happen.
>>>
>>> In this situation, it is very difficult to detect the correct remoteproc
>>> state without relying on an additional query mechanism like the
>>> ping-pong feature.
>>
>> This a valid use case and concern. We had a discussion with Bjorn, and
>> want to take this scenario into consideration of the separate robustness
>> improvement series[1].
>> Stephan could you agree to have the basic function in this series can be
>> go in firstly.
>>
>> [1]
>> https://lore.kernel.org/all/20260519-rproc-attach-issue-v2-0-caa1eaf75081@oss.qualcomm.com/
>>
>>>
>>> You can make it a bit more reliable if you also check the status of the
>>> "stop-ack" bit. This would tell you if the remoteproc was cleanly
>>> stopped with the SMP2P "stop" mechanism. However, that will typically
>>> still not fix the case above since nowadays remoteprocs are typically
>>> stopped via the QMI qcom_sysmon and the "stop-ack" is not set in that
>>> case. I believe this might set the separate "shutdown-ack" bit though
>>> that is described for some SoCs, I never finished testing that.
>>>
>>> And even if you check both "stop-ack" and "shutdown-ack", that doesn't
>>> tell you if the remoteproc was forcibly killed using
>>> qcom_scm_pas_shutdown() without gracefully stopping it first. The ideal
>>> solution would be querying the PAS API to tell us if the remoteproc is
>>> actively running, but the last time I checked I was unfortunately not
>>> able to find a documented call that would tell us that.
>>
>> It is a state currently kernel don't know whether the remoteproc is
>> offline or crashed when ready==1 && error==0 && ping-pong==0 scenario.
>> If it is re-modprob, the software don't have any data and only the
>> firmware can tell us whether if it is active or not per my understanding.
>>
>> Maybe let's have this scenario and solution discussion in the other
>> series I mentioned before.
>>
> 
> If you add a new feature upstream, you must make sure that it is
> reasonably robust and reliable. The other series is about generic
> limitations in the remoteproc subsystem, so I don't think you should
> move QC-specific parts over there as well (personally, I would have
> probably kept all of it in one series to make it easier to understand,
> but that's subjective).
> 
> With the current firmware design, it's hard - probably impossible - to
> make the status detection perfectably reliable. I would therefore choose
> some reasonable compromise to start with. Given that Shawn (and actually
> me as well) would like to have attach working without firmware support
> for the ping-pong functionality, I think it would be reasonable to start
> with the basic detection scheme discussed above, i.e.
> 
>   ready==1 && handover==1 && fatal==0 && stop-ack==0 && shutdown-ack==0

Ready==1 and fatal==0 is already checked in current patchset.
I am not sure about handover state, may need double check.
stop-ack/shutdown-ack can be added per my understanding.
> 
> The ping-pong functionality could be added later for platforms that
> support it. It would be good to have the interrupts already defined in
> the device tree, so you can tweak the driver without making DT changes
> later.
> 
> Thanks,
> Stephan


-- 
Thx and BRs,
Aiqun(Maria) Yu
