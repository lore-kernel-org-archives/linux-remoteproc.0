Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42465372681
	for <linux-remoteproc@vger.kernel.org>; Tue,  7 Apr 2026 02:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775529895; cv=none; b=m8LuedQARPVaJyuaqjQVS44D3iT66SXY9obbBMNgP3LDiO2WmHJDnoxKSH4cm91L09QyHR0XMiZU/kl9iIIv4B+VxikRwRjtBUjXs4WUOeianav0s5x1hLJFGPWatKW/abIYoEtIt/Wdlnf8T3MpM/zplAUSwqlHGJmbpwvfn7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775529895; c=relaxed/simple;
	bh=YTTUS4dKbdrFclyiuTc0LyXDlRM7xWRQBgFkBbr/f0c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Mf1xRCY75m1jUfRltCBnWdEebRe1rPipsG2i6F7BuEXPYW7eqtl77cSwnR7WqHXBoa7mN5A7iv9Tw7vSgXiwgWG6XC3asrpGliXgdCZxcAFtwPbYhHIZp8OP3M7Vf9HCCWl//6Ay5YmdtL2EO+q54cHnC2reuoAZQKiEdHSuYak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AQ4QOqIP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bVxbjLmi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AQ4QOqIP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bVxbjLmi"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 636LRhK92009220
	for <linux-remoteproc@vger.kernel.org>; Tue, 7 Apr 2026 02:44:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jAyngMCsjPzTLmN8SWJDtHWahHL17W+Hc/zSrSVW3hw=; b=AQ4QOqIP9NjjBNcd
	wIbSxpXdWOycqRLqMrynlo3iftndQDWM7X195S1xTnk4jXdHHSX20gWgGUkvkjj1
	IxM4NLprnUDpxACuZMVFDux9EGawO35mKB7sedR5D5uC0vfWjsAYQMb3gkxRvu4w
	gFm6eXkISsZMmn5wpNE1u+GGP34koNdsx4RCODEp+onj9gp0navmLP+3akKwmNbg
	Y9pFlPmJojGiDrUyIvxd8dWtecmpkb5woKTSuHYgofrP9RLU2OKE6oVDM5nJ7obO
	NTdT/Nu6fCcXuOg+UJ+td3xxZogn4cHCddM0EX3wGJwtzhqCwWO5c+bpNqIKU+2C
	jdB6CA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmrrrpdm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 07 Apr 2026 02:44:53 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b256ed2cc8so50616395ad.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 06 Apr 2026 19:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775529892; x=1776134692; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jAyngMCsjPzTLmN8SWJDtHWahHL17W+Hc/zSrSVW3hw=;
        b=bVxbjLmirK5OmWcSyo9zPuipqsP4dnAcY6U9Phyq+S/HyGdSGxt9CwWPH0vcEysCap
         wWFlVTQtJBn+aUtgifYwdIfkZHk7syrz8VPLAqmEepf0/4COY4xF6dUqFDtXi8U4PCzP
         U1DVIasE7sTrD8jCLB9MZnRqGsYBomWymRTlh6ShDfTbACWvc00oZ9iJff9Y6iaZvaOc
         Ymftftx2jZ+LXUwF6zceGOMM+cN4exwQ91IbWhi0L1SR5hJM5hAZJazP/IoZ6WLvd1XH
         L6nZad/NMuzpxAaAqksW3kpsgThExieNZ8TFMuKyFVd4uoIsweBDSq+qiC8Y0ebKgP9g
         0qVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775529892; x=1776134692;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jAyngMCsjPzTLmN8SWJDtHWahHL17W+Hc/zSrSVW3hw=;
        b=Z4G3wg6KKwbJQjY1+cwyK2kyAMZi7RMS4o3XCTwPCnEjII9brCmyJMKkGTK1EvwsPa
         Q46+0666v1D7QtxlGz3AAIvfdncaOivIhUQMljxakSvKEWpMEBnlcBohLD4fNd3uq9YQ
         qnf3W7KOG4bdBH+N+j3hosJ9lyHcYKrx9tJ9iNn0rs19lUnsnYClgkCyfn3vK4VfGkF5
         gxHLPnS/68nCRHJpxbVBMj4ZzK+Z1V5zjksnF4SSykLHE++8bagYyGg2U5+HDCNWwN4Q
         EeBnq/2pgVu+Nu1zQt4plTVF6SotPjV8G4b+65ZC77fLax3X1Jgf5sazxjXvDLSYdoWG
         XzfQ==
X-Forwarded-Encrypted: i=1; AJvYcCVLZ2u5kYfvKkhAtWps5VH/0U8wKkk9ilItRFRPuM8DaOBFUpHXZ3RAZ5D2CC7bHUi7N5FD5gFuuXF2haGGeDQg@vger.kernel.org
X-Gm-Message-State: AOJu0Yyzcq+kRpXQpP9uYoo8dO9WR6OBYf644mph9/av3tQLIQ7narSC
	wixM5iVbbP35RjkaRNEDE1ltZABbKqPgkihLR0mxNiEAGrNoG0jZhuywTw6p5DTFpmwH1uoYSj1
	TcLTTReVO2nPi+CHDFwtBYK5iKND2Eoh8z0e2qy9DCOhB66a+PSXRxHAt5nuSOf4UOJWbCutV
X-Gm-Gg: AeBDieu1YJOVQM7ZjJYzICwP1s7PoeA8IWu8JINvrL9h6YIL+pn1VbjikO/6TXzFQI3
	BqKZWSY0AoNcqMyMTZG29nuzpux1zn7PCfDm7z0Karg3qyeopFBN/UXTaShOzfCrFSdGYjETmJc
	UYjg6RWrqfQev7AL9FSvGi6zhTA+0W3h9p5XP/nF6M27H4L23Wlqopr5++tj56ClFNnMvw5qP/A
	z2Hu1EKQ3m1U/DypYWMSFVT7NtB7YRJMycgGLaFQSK1yc/Ybl7mnj85GOMonwj4oN5l8Tkxvacy
	Qtk4kJd0Rwh7C2dLDS1uxUxdvZqMydXEl5XxddcCZ+cTi51oTkOKjf+b3XkNcPRFGcbLRlDlp2x
	QtfbtpaY8mT5+sokYAi3fER/RpwfHepCLH+wd6Or1GQtQcQmjUJqERUZPphwAOJAgnkKW178k7M
	6GZlFVtHzGnZSI30dJ
X-Received: by 2002:a17:902:e546:b0:2b0:6e8f:8e73 with SMTP id d9443c01a7336-2b281926350mr156600845ad.44.1775529892094;
        Mon, 06 Apr 2026 19:44:52 -0700 (PDT)
X-Received: by 2002:a17:902:e546:b0:2b0:6e8f:8e73 with SMTP id d9443c01a7336-2b281926350mr156600435ad.44.1775529891436;
        Mon, 06 Apr 2026 19:44:51 -0700 (PDT)
Received: from [10.133.33.209] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b274756621sm151304355ad.20.2026.04.06.19.44.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Apr 2026 19:44:51 -0700 (PDT)
Message-ID: <cb6c9710-3fa5-4113-aef7-d2cf2bef5214@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 10:44:45 +0800
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/7] remoteproc: qcom: pas: Add late attach support for
 subsystems
To: Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Bartosz Golaszewski
 <brgl@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
References: <20260310-knp-soccp-v4-0-0a91575e0e7e@oss.qualcomm.com>
 <20260310-knp-soccp-v4-6-0a91575e0e7e@oss.qualcomm.com>
 <adPI2w5tVGCdo_x3@baldur>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <adPI2w5tVGCdo_x3@baldur>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDAyNCBTYWx0ZWRfX43b3WpkHPvwg
 DuwWYy3IBwCVuhaYNTn/4ukXtI+Zz92noBTVR9/F2IFdb0bzhDczHqPTfr1JX78TnHGi+dYlQo3
 /GCIIssjebKMBojOQBIEO9I9aCq2ZPDSDnQR4990bgiMpscbwWJceegNlOLJc1T129Msk98IP2H
 ZGKs/gEq6GfLEatifOJ2J4QWZdk8f3LtQeXmqwzLyjm41yDhInSjoha8KqFeOPrNbX8r+vHqFFR
 zFA51eTTQUT73zq6feEjdLlLnw8qB2WbOA8PBlrLwDfwAHyWmboh3M+yrdTDk43PJZid7NHYsNU
 yZuFlMtBxda8usHEmcatGKFqGo2PoWlZclR9dTsY9Md1AQWmV6yy7wWGtJroLUnjOul7l9MIRaG
 UXpgycIIUoBCFVbzIbpPSKegGgTcjAq8AqSvQtj6ZYt99iFsBnSwt5KN1LHJ8Pb6LtU7SnXBueC
 6vLrdxEHetV6BFOCb9Q==
X-Proofpoint-GUID: exaZYhnEUjoeJWwN3t5Kx6-fXPymN4yp
X-Proofpoint-ORIG-GUID: exaZYhnEUjoeJWwN3t5Kx6-fXPymN4yp
X-Authority-Analysis: v=2.4 cv=LquiDHdc c=1 sm=1 tr=0 ts=69d46fa5 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=tektXMGjzHmvKWkVxE8A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_01,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604070024



On 4/6/2026 10:59 PM, Bjorn Andersson wrote:
> On Tue, Mar 10, 2026 at 03:03:22AM -0700, Jingyi Wang wrote:
>> From: Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
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
> 
> The whole use case of early booting SoCCP is to get the charger and USB
> Type-C running early - so that charging and USB Type-C works in UEFI.
> 
> If SMP2P indicates that it was booted, but it's still not there...then
> there's no reason to wait another 5 seconds - it's not there.
> 
>> If "early_boot" is set by kernel but "subsys_booted" is not completed
>> within the timeout, It could be the early boot feature is not supported
>> by other entities. In this case, the state will be marked as RPROC_OFFLINE
>> so that the PAS driver can load the firmware and start the remoteproc. As
>> the running state is set once attach function is called, the watchdog or
>> fatal interrupt received can be handled correctly.
>>
>> Signed-off-by: Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
>> Co-developed-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> [..]
>> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> [..]
>> +static int qcom_pas_attach(struct rproc *rproc)
> [..]
>> +	if (!ret)
>> +		ret = irq_get_irqchip_state(pas->q6v5.ready_irq,
>> +					    IRQCHIP_STATE_LINE_LEVEL, &ready_state);
>> +
>> +	/*
>> +	 * smp2p allocate irq entry can be delayed, irq_get_irqchip_state will get -ENODEV,
> 
> This on the other hand, sounds like a bug in the smp2p driver. If we can
> acquire the interrupt without getting EPROBE_DEFER, then we should not
> get -ENODEV when reading the irq state.
> 
>> +	 * the 5 seconds timeout is set to wait for this, after the entry is allocated, smp2p
>> +	 * will call the qcom_smp2p_intr and complete the timeout in the ISR.
> 
> If this indeed is the problem you're working around with the 5 second
> delay - then stop. Fix the issue instead!
> 
> Also, this comment conflicts with the reasoning for the ping and the 5
> second thing in the commit message.
> 
> Regards,
> Bjorn
> 

It is a design in downstream code to avoid the irq is not received when
we check the irq state, but indeed it seems like a redundant design and
I didn't see the delay in the test for the soccp attach. So we will remove
this 5 seconds wait in next series.

Thanks,
Jingyi

>> +	 */
>> +	if (unlikely(ret == -ENODEV) || unlikely(!ready_state)) {
>> +		ret = wait_for_completion_timeout(&pas->q6v5.subsys_booted,
>> +						  msecs_to_jiffies(EARLY_ATTACH_TIMEOUT_MS));
>> +
>> +		/*
>> +		 * The bootloader may not support early boot, mark the state as
>> +		 * RPROC_OFFLINE so that the PAS driver can load the firmware and
>> +		 * start the remoteproc.
>> +		 */
>> +		if (!ret) {
>> +			dev_err(pas->dev, "Timeout on waiting for subsystem interrupt\n");
>> +			pas->rproc->state = RPROC_OFFLINE;
>> +			ret = -ETIMEDOUT;
>> +			goto disable_running;
>> +		}
>> +
>> +		/* Only ping the subsystem if ready_state is set */
>> +		ret = irq_get_irqchip_state(pas->q6v5.ready_irq,
>> +					    IRQCHIP_STATE_LINE_LEVEL, &ready_state);
>> +
>> +		if (ret)
>> +			goto disable_running;
>> +
>> +		if (!ready_state) {
>> +			ret = -EINVAL;
>> +			goto disable_running;
>> +		}
>> +	}
>> +
>> +	ret = qcom_q6v5_ping_subsystem(&pas->q6v5);
>> +
>> +	if (ret) {
>> +		dev_err(pas->dev, "Failed to ping subsystem, assuming device crashed\n");
>> +		rproc_report_crash(rproc, RPROC_FATAL_ERROR);
>> +		goto disable_running;
>> +	}
>> +
>> +	pas->q6v5.handover_issued = true;
>> +
>> +	return 0;
>> +
>> +disable_running:
>> +	pas->q6v5.running = false;
>> +
>> +	return ret;
>> +}
>> +
>>   static const struct rproc_ops qcom_pas_ops = {
>>   	.unprepare = qcom_pas_unprepare,
>>   	.start = qcom_pas_start,
>> @@ -518,6 +603,7 @@ static const struct rproc_ops qcom_pas_ops = {
>>   	.parse_fw = qcom_pas_parse_firmware,
>>   	.load = qcom_pas_load,
>>   	.panic = qcom_pas_panic,
>> +	.attach = qcom_pas_attach,
>>   };
>>   
>>   static const struct rproc_ops qcom_pas_minidump_ops = {
>> @@ -823,7 +909,7 @@ static int qcom_pas_probe(struct platform_device *pdev)
>>   	pas->proxy_pd_count = ret;
>>   
>>   	ret = qcom_q6v5_init(&pas->q6v5, pdev, rproc, desc->crash_reason_smem,
>> -			     desc->load_state, qcom_pas_handover);
>> +			     desc->load_state, desc->early_boot, qcom_pas_handover);
>>   	if (ret)
>>   		goto detach_proxy_pds;
>>   
>> @@ -855,6 +941,15 @@ static int qcom_pas_probe(struct platform_device *pdev)
>>   
>>   	pas->pas_ctx->use_tzmem = rproc->has_iommu;
>>   	pas->dtb_pas_ctx->use_tzmem = rproc->has_iommu;
>> +
>> +	if (pas->q6v5.early_boot) {
>> +		ret = qcom_q6v5_ping_subsystem_init(&pas->q6v5, pdev);
>> +		if (ret)
>> +			dev_warn(&pdev->dev, "Falling back to firmware load\n");
>> +		else
>> +			pas->rproc->state = RPROC_DETACHED;
>> +	}
>> +
>>   	ret = rproc_add(rproc);
>>   	if (ret)
>>   		goto remove_ssr_sysmon;
>> diff --git a/drivers/remoteproc/qcom_q6v5_wcss.c b/drivers/remoteproc/qcom_q6v5_wcss.c
>> index c27200159a88..859141589ed7 100644
>> --- a/drivers/remoteproc/qcom_q6v5_wcss.c
>> +++ b/drivers/remoteproc/qcom_q6v5_wcss.c
>> @@ -1011,7 +1011,7 @@ static int q6v5_wcss_probe(struct platform_device *pdev)
>>   	if (ret)
>>   		return ret;
>>   
>> -	ret = qcom_q6v5_init(&wcss->q6v5, pdev, rproc, desc->crash_reason_smem, NULL, NULL);
>> +	ret = qcom_q6v5_init(&wcss->q6v5, pdev, rproc, desc->crash_reason_smem, NULL, false, NULL);
>>   	if (ret)
>>   		return ret;
>>   
>>
>> -- 
>> 2.25.1
>>

