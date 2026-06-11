Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA06B22156C
	for <linux-remoteproc@vger.kernel.org>; Thu, 11 Jun 2026 03:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781147436; cv=none; b=itOv7hcWaQ+ViBBxv0G+bEDovDZU9G0MAFB4ArMJ3kq2vnI1VdX0P2OPGqM9qtYFNuOJNtmyG/rJYwYwc387n+JE2ToEIvGyvbL9SfVrXLSGCpEPinAyGQWsj3A+ljFQ32+qwt84OkAkM8Tewlp63HMDdKPexXyLD7w5MUH4fY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781147436; c=relaxed/simple;
	bh=/xDqAx/7oWtInGBo7t87Mo2o7EzRq/zRTqU+5rnPOvs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lfet1ETCB2KnUFqbzSMbziIAdeNX83d0WXS9PA5tgQdPZrgWbQENyx8wXgd9XfXOgoM9wmu5nNoS5vk+8MG04MDisvRcE3WzEzlaMYQBHhz1Zke3+idl2nC52xVYPdekbsH7fkcKoGlvtJDZ6mJeytuuysl61mPPCJ21vo8Kj6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KcH+fQ0T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cZLZku9o; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KcH+fQ0T";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cZLZku9o"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B0Nb8G3132316
	for <linux-remoteproc@vger.kernel.org>; Thu, 11 Jun 2026 03:10:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bfOXY/bV6WKanzF7Cg7TmExSjsVgoEG3Y8BQ1vxwqO0=; b=KcH+fQ0TPi0X+nmB
	+/D2wqO1pwI3aRF9/pjdfsU8FHH9iIAihTO2EqVifeZQecpVKJ8t5WSbnShJHfM/
	MlRtMKnfmYAstu9Wn9qnoM7EvNsRxUJwN0FsrLhzqG92LInwz0+H9DjauVR9pnyb
	lMvnKeGFxcdSpGZQosBMGqdoQn2H3Sakc0sn8hU27KduhdU16WJYFW5KrkMLwGzC
	AE4EwnEb7d9STfP9QY2zxes7/TfCXs7aJ6j/7xIBCQ28TlMn+VwnwwLvEEFLhEHY
	W2xL4HDxdUF41mqMQzfvWqBDhHD8P4ifIUyoSEAd3TncAWp9b6KL74qCb00oWBa4
	cLY9CA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6shdtw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 11 Jun 2026 03:10:33 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-36d6d07d2edso1863488a91.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 10 Jun 2026 20:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781147433; x=1781752233; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bfOXY/bV6WKanzF7Cg7TmExSjsVgoEG3Y8BQ1vxwqO0=;
        b=cZLZku9ohUY3Kyh4kJ+N5u+FBb4tognclMkXq8Khwn+fFFuc7z0vl+U5CkTWeNaKbg
         zTcRzVlOT5f52BgR/ky9jgoDnD3PgDT/UZsFWjMjccxFYL3dGd1b2sMNiwbIGRmffLAv
         RYwx5yOJB+U6HVpcntj+61N4mUNfmWI3QtnayhQZ+lEpXYYP4kvysBkvliWr3I5/3tvg
         K9wRDIwzOB7OHZg1/RGSgbgtel7/2J/MErVCqN0vPzPRWFp+rdGcukk6wPXqbaYebECs
         2SGtm2L6SHnX4UMbutsWbGKEx1Yw4SIXgEuS/f6/l7qrWQS+SVwstv9x0kIfQlAYroXL
         F8zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781147433; x=1781752233;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bfOXY/bV6WKanzF7Cg7TmExSjsVgoEG3Y8BQ1vxwqO0=;
        b=CnmcAmjvEcLWofZx00/RmQXwX6gDiZHYP2zU8/tUXuvHhDM1BvZXRaiy40fJoPp47W
         p2bzrMSi4MprKeK7NnfaQUc3um4qsjGsrzIqu2l4AQGRTabld6cbYBir1e3r89UpILww
         jXterZsJ9JIMUvmsngSdQ8cKw2Kro0HUfJVZzlqyxyqnQ8IbYieblixfpP5tr3+gZRT+
         zZP+dsYd65JecNNVVXRhUW/T6zvNGFVipb/Pz9iCtDg+KzlffoUXmsrFF9//yar9t8LD
         WldyuSLtlfMJuYpGrHcIwEQFXB2+PZV4A4Pzt8cdo7I3wYhff/gmAIkV7aF6fAcyciST
         SY2A==
X-Forwarded-Encrypted: i=1; AFNElJ+0kxL1nUrhuyAVVNHjmVhHUGp6I3bPJO05fXkH4TZPuGE08YQP3VsnGgKNYu90fMX1hm63NroNeccOF24Wgw92@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6beEH1d65+JY6JgMTUID7TecP1vJSkudkGIqTwQcU9cnnG+uF
	ISzar0ltWqgKPHsk9bDmzXl78k1sw8VR+wsw7s1zyyFAEXYNnGuGlsLZ1JX7Rr1cKMmnQCmVcOn
	xwD1PUC3JqyLYrn+i08+/JKJ5CKN1PDCk9qxxMStcv5/bYRIPTkt2nCVj93RUrC8ha7TFWMcp
X-Gm-Gg: Acq92OHn6pKQYQp2+GKIhTt83gmjkjDxQHlYCR2KB/CHlxEELOFT3tFwSaI2iY95MLR
	WtaItcGcmje1ea7BHIM4xEUoewg5gGtqaTV2EHIhfQnl41+f+NVWjnranmEzLIcHa4RnlHUDc0E
	c/i6jg7Z9XLgHSI0kcrRdTmq4BUgW3a+LnXi9/2R4ucBdyDxN2yO6g9a9oN73fnxx4Xjz5P+lu/
	clxgLaYqDXu9YwFauqSQ5092MXqR7ro422Y/n/pUuD1w3qRfwJ/rcT9Hn4klYz2FOPhdnYtLnn+
	FMov21fBjynTOvHUWY8W/HAfMJY+Ar8upJRMHJ/DtvjTzngAdqJX0SJiDl5bsXYK0ezDdhUobJ/
	hP57Yu2+M1nMNbPwBBTcILzznU7apMbWmD7+szz2E5CUs39ciYJzYpM3rZyn/9oPINOCE9I4wcx
	obE1SUdgMQrOL0o+iDBUeqYXw=
X-Received: by 2002:a17:90b:384b:b0:36b:5b82:4846 with SMTP id 98e67ed59e1d1-377a73e2c9cmr539092a91.5.1781147432866;
        Wed, 10 Jun 2026 20:10:32 -0700 (PDT)
X-Received: by 2002:a17:90b:384b:b0:36b:5b82:4846 with SMTP id 98e67ed59e1d1-377a73e2c9cmr539052a91.5.1781147432287;
        Wed, 10 Jun 2026 20:10:32 -0700 (PDT)
Received: from [10.133.33.246] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3774f99cf24sm847549a91.0.2026.06.10.20.10.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 20:10:31 -0700 (PDT)
Message-ID: <6df4c351-7287-4fb9-8af8-83b5deabfa07@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 11:10:25 +0800
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/6] remoteproc: qcom: pas: Add late attach support for
 subsystems
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
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
Content-Language: en-US
From: "Aiqun(Maria) Yu" <aiqun.yu@oss.qualcomm.com>
In-Reply-To: <ahBG6jKYdSAboWjs@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=GbMnWwXL c=1 sm=1 tr=0 ts=6a2a2729 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=h3XtbvSS6J2BgG28aqoA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: Co475iG689lPhGYIHXc4j_x9-dh3VU1r
X-Proofpoint-GUID: Co475iG689lPhGYIHXc4j_x9-dh3VU1r
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDAyOCBTYWx0ZWRfX15bDYEoXNl1S
 kQPJGzUk/HbVsjZuf6dI2uP7q5mSeimeAdkCy3UisU3vNHPmOM7X8bYq3T/lnGQAaV/xQgEX7DU
 whagIl27i2+VAqcAAra0VAqinhZeHHevL2r4oE3mzPsXv8GrapHkv5j5Ii03XTIMBo5VISSKLSh
 08npWE63zcnYGDn/QhIwW/9fl/E572ESyw+CaawMbEKuOLm/cGMt6t8vvgPDMVz3aJeba43QrES
 K3w0JeSSMHLHky1J2pHCk3xpT7T+TUPNByn5B9RyTwuX0M3fX8vGBT38Il9gBTzGy2Tuy7a3kOC
 oisI7e3dCR2sfRALfKuuiRGuQ0QKmcSilU3+ZVTWOr/N+w2COSt2uq4o0jBdBMoQYDmozb68FdN
 uC+1l9aI/qsACE0/HUYdfft4Ta6bO4WAPGjSI6VNd7d1jSt4+0UUtfCD69Kam1CN17ZPKUsHVjS
 +ZqTvltTEfguDAoV+ww==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDAyOCBTYWx0ZWRfX8ttuNIozvolH
 45k5TFb93vtHw/5qZSQB8fs49A25QmCHhVFGCMUniijKLE7M4ZQTN747/HW78xVVHagXJvrZq9T
 DtYWXLcMAitcHTe6wJ6Fxlph4PpdyQc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0 impostorscore=0
 clxscore=1011 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606110028

On 5/22/2026 8:07 PM, Stephan Gerhold wrote:
> On Tue, May 19, 2026 at 12:24:23AM -0700, Jingyi Wang wrote:
>> Subsystems can be brought out of reset by entities such as bootloaders.
>> As the irq enablement could be later than subsystem bring up, the state
>> of subsystem should be checked by reading SMP2P bits.
>>
>> A new qcom_pas_attach() function is introduced. if a crash state is
>> detected for the subsystem, rproc_report_crash() is called. If the ready
>> state is detected, it will be marked as "attached", otherwise it could
>> be the early boot feature is not supported by other entities. In this
>> case, the state will be marked as RPROC_OFFLINE so that the PAS driver
>> can load the firmware and start the remoteproc.
>>
>> Co-developed-by: Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
>> Signed-off-by: Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> 
> Unfortunately, removing the ping-pong functionality that was present in
> previous patch versions makes the whole mechanism a lot more fragile.
> I'm not entirely sure if this has changed in SMP2P v2 or more recent
> firmware versions, but in my experience the SMP2P "ready" bit does not
> tell you if the remoteproc is actually running. The problem is that the
> "ready" bit is asserted by the remoteproc when the firmware is ready,
> but it is not cleared when you shutdown or forcibly stop the remoteproc.
> 
> If this is still the case, you can easily reproduce that with the
> following test:
> 
>  1. Start the system as usual and let it attach the remoteproc
>  2. Manually stop the remoteproc in sysfs (echo stop > state)
>  3. modprobe -r qcom_q6v5_pas
>  4. modprobe qcom_q6v5_pas
>  5. If the "ready" bit is still set, the driver will try attaching the
>     remoteproc, but it's actually not running. No recovery will happen.
> 
> In this situation, it is very difficult to detect the correct remoteproc
> state without relying on an additional query mechanism like the
> ping-pong feature.

This a valid use case and concern. We had a discussion with Bjorn, and
want to take this scenario into consideration of the separate robustness
improvement series[1].
Stephan could you agree to have the basic function in this series can be
go in firstly.

[1]
https://lore.kernel.org/all/20260519-rproc-attach-issue-v2-0-caa1eaf75081@oss.qualcomm.com/

> 
> You can make it a bit more reliable if you also check the status of the
> "stop-ack" bit. This would tell you if the remoteproc was cleanly
> stopped with the SMP2P "stop" mechanism. However, that will typically
> still not fix the case above since nowadays remoteprocs are typically
> stopped via the QMI qcom_sysmon and the "stop-ack" is not set in that
> case. I believe this might set the separate "shutdown-ack" bit though
> that is described for some SoCs, I never finished testing that.
> 
> And even if you check both "stop-ack" and "shutdown-ack", that doesn't
> tell you if the remoteproc was forcibly killed using
> qcom_scm_pas_shutdown() without gracefully stopping it first. The ideal
> solution would be querying the PAS API to tell us if the remoteproc is
> actively running, but the last time I checked I was unfortunately not
> able to find a documented call that would tell us that.

It is a state currently kernel don't know whether the remoteproc is
offline or crashed when ready==1 && error==0 && ping-pong==0 scenario.
If it is re-modprob, the software don't have any data and only the
firmware can tell us whether if it is active or not per my understanding.

Maybe let's have this scenario and solution discussion in the other
series I mentioned before.

> 
> Thanks,
> Stephan


-- 
Thx and BRs,
Aiqun(Maria) Yu
