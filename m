Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECE5E242D88
	for <linux-remoteproc@vger.kernel.org>; Wed, 24 Dec 2025 04:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766551411; cv=none; b=Lv/ifJMcKmekctfeqI9lLHXlf6BmEcnwLjiG9zB7j4i3UTK+3RZfO+opueIeL4Pdo49XScLOnhUU+j64qsGGfKXTaXCoSKhgpSsgrEdVKFC4dBuy6YVNEmwByQ5VWOW7vcPy8XpNk3VgigP5Umpdyb+CBW46QlEWxd/9Y7Wb7h4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766551411; c=relaxed/simple;
	bh=7AnAY1VSKRpLhFsr6vc0i3JglJIfczIn7APLeqeEZQw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cvkEfwelRjpeu30wUC+XIHy92thUwnC9MUVL2pqjYo/1WM7DcNnd326a6/P81Q2P1Hs1Qngb8HmTQKhtDlQEonfCR46BKPNKPnYA6YGB9IMYSEbAnWxUd1AVZbsMRqzJQrqiUftcQaqeTjhyTstwaJVrqgzkrgJOjDY3g47rmWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lptUDiMD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J72xlBg5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lptUDiMD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J72xlBg5"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO326E7462214
	for <linux-remoteproc@vger.kernel.org>; Wed, 24 Dec 2025 04:43:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/NKX/57tYYBCmkhefEDajLW0SWz9CgJw4SMyS6Hgi3A=; b=lptUDiMD8lWvBeu0
	OzkHjgLNGwbPOmWjlYj670wIGUXDFMgOm2/iVryRX5cASMdgkjfMLBYdLd5hb4Tt
	jJEensK4SuRIecb+F5JaPP8R16vytpGSOqyBwCCtbkXq3vETxUJHAQE2Rsu6COO4
	8GwUG834w8LYbXl/drMvCMXHCoKDP1BCYMFclswbkZ9CFpOq0L9JKtBkQCFOjeZq
	ymGYM0TujPWCRgHUpUgOWNefx5puFOkTaSc8YkeQ17a50/gyqg7Da+eR0OBRN9cK
	zqYkEexns+3HcoS3LYS9h1ndi+UcJkcUExrwkOsimZgw45WBQOz2Tl5kDr8ep++i
	nvM/Vw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7w8ft31b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 24 Dec 2025 04:43:29 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7b90740249dso9797052b3a.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 23 Dec 2025 20:43:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766551408; x=1767156208; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/NKX/57tYYBCmkhefEDajLW0SWz9CgJw4SMyS6Hgi3A=;
        b=J72xlBg5AJmtqNjZV2c3LcUwRrLip8/essbTt/WccSiXjwZzJIN6dlM6VO+s/Ix6Iw
         p52AGXQmuPaH9I/jVb1Z5wMSD1EO7gerU3Szm1wJub5QxP5B5Tecv/xHH/tif5578Cfn
         1WHfHM8wXSyv+VVXPcq8742w64nlvWJ70BDAU0LjpN5ZwlZIK1sXNybNTPrRXG67nFJL
         KmUNjw/20IR3qavJE5UJukGPMvEd5wX5WBAQ1mPBiIhehbjqh49NFYqtAwkZFQWl81yj
         YR9/TiOcrZtNEs7cyvuLlAkEdw2VH5POrE234jtTTD4GGxskbC0TYOfveMpvUSs93H1C
         0lLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766551408; x=1767156208;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/NKX/57tYYBCmkhefEDajLW0SWz9CgJw4SMyS6Hgi3A=;
        b=CP3jF0pv+w43ZFpvXavNv/yRxM1Or5OVod9GaQusfHSOASaAsojnpsBcIesOxkzjdb
         ktQ1+p7WnQAZswgrux6o3pRu/29l30dXdL20YmOY1hvOmF5FgO7eTRkuJ1cRt99Qqxua
         ad1z6R13VN3jAGsVWvxhGy1EnxhbbfqutRo9rhrfMxLFIpfVlAsf7YB3i2I6bzJ5okQw
         7wj7RnffMpKogb4b+gwbWcO0kNl1utXHf2OWR99fqoF2okZHQot9wu0PNKDh5h/DWSe2
         ksSpAQ4OdKuxTBOsgx4TNjjSRA63rI+kw2m8jG/nPcz1kIOMp28Yi9GKrva/APSO44XP
         kgLw==
X-Forwarded-Encrypted: i=1; AJvYcCXYJ3t+mvKzoH09crZX8aWgO1EyxGcIM4Igm0VxdA9QN7hicdACg6P1gnNtiJREkI3dAWNTcmmvl0FVpWA+3H34@vger.kernel.org
X-Gm-Message-State: AOJu0YyDx9x7HiMyAwRXsr7uZyBco7vSYMNf67+kMdIR0fmEQ76MQ9Ht
	blAVHk1Udy5Rjx/itaPnW9kf9xC9Aip7sc70VrVsyw3B4TKR94M2KXrPGBGbJXfi1oChk/+hkKT
	P+T8OpNC2/eT1+BG+02AQ7pDQ1CqdH8mgMnhrU3+W26faX3EDosZg6iIrCtDIiTDFJ2Z9YMIvPM
	QV3HYoRLA=
X-Gm-Gg: AY/fxX4lVEbMFSEiNB12h4mf1h+UXlqzwTSOW0JLp91WE49WUnRKeX8b3r6PP5WTZo2
	rMskngOgYe6c0rNdevKoBLAlzy5B4YuPeRrvd6WLGR9uwyLNz7KfcAZogfVX65cxEdSe+iF9hw/
	T49hTtjbFaj6kI/2rZ8Jhl8Iij3uaee5wsRnmgbLR2mUXPztn8A5ZrxP9mjPpXnVECR7ys3qxty
	jrlfgDTcJVOSR+A+FSNAUz2BjT8tSgnfNTx8ZzHYRewWm2VBjv67ViPYX4kg4wVJLYob3/BuYPJ
	kxCmXuG5zMYQEevHakUCRyYhsnq4J63mTw6vdJzZaYpESxXI0Apw4GEHkyRTJd65vxB1CtYEBTl
	JdfpOOn43e7ctGxyb/qFLmrQSn/WH2r7BUgJYefoSg1lTX0HBnHFxXTF/+1iuYqPuqEOdrFijIn
	/vtILy
X-Received: by 2002:a05:6a00:8d8e:b0:7b8:3549:85f9 with SMTP id d2e1a72fcca58-7ff64eca979mr14445126b3a.30.1766551408208;
        Tue, 23 Dec 2025 20:43:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHvc4FrnFMsQMIBE3qVedvVFkxoaNx3NeqcjjCZI3I6L2rFmIE9Yn6mBYWW9e5zltIVhIzrsA==
X-Received: by 2002:a05:6a00:8d8e:b0:7b8:3549:85f9 with SMTP id d2e1a72fcca58-7ff64eca979mr14445098b3a.30.1766551407668;
        Tue, 23 Dec 2025 20:43:27 -0800 (PST)
Received: from [10.133.33.224] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e88c8f0sm15536300b3a.62.2025.12.23.20.43.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Dec 2025 20:43:27 -0800 (PST)
Message-ID: <51e0665b-42c4-4084-8019-9fbeaefb5b56@oss.qualcomm.com>
Date: Wed, 24 Dec 2025 12:43:20 +0800
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/5] remoteproc: qcom: pas: Add late attach support for
 subsystems
To: Stephan Gerhold <stephan.gerhold@linaro.org>
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
 <aUsUhX8Km275qonq@linaro.org>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <aUsUhX8Km275qonq@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 9kPfVzgxXNi_gzGVOShxZbX9xVlczWUy
X-Proofpoint-ORIG-GUID: 9kPfVzgxXNi_gzGVOShxZbX9xVlczWUy
X-Authority-Analysis: v=2.4 cv=QutTHFyd c=1 sm=1 tr=0 ts=694b6f71 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=xPClpbL46aL21xVsldcA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDAzNiBTYWx0ZWRfX50pCp/Isifh+
 qs1UF497yKzL8t97ICf9kGLm5+lPF59sLmo3RNbKayh69nq1ThtH28NLq+DYLSX3uvj2XoFMRgL
 VC1iZG7jRxlXx1eC3z609LOROENnkdaEXqXwjE7p+R04oMoW4U8t820hXUrJaYajcxP7EmjOCKJ
 NCNvrWaoAw+X8RZjONFJ4yXkn8OPUR+9EYc2M8iNWSOWkBz43q+r85yIqPCtvCwG9T2TbXbT+Hf
 y2rr+9QxdHp8fiuSaKyP8sruBacezJkyee9tuY7srQ9F4bIc4VQ9fhJrNC6XMwuPrsvCW7hYRzb
 VPpU+PBqfO38IOjVbggT2avGx3BcgQ9OA8ywsUiWNTfcqwIIaXpGBoVQ/dBSLa0iAHCU3kFka2M
 Xpn9fyTzSuCEHHPf810DPI++o5FVmPOh4HWU7hS+1RAfilNjGv3dEsVb+9//ifqq2jQsfKfdvzb
 gr7Lx5OYUk9ew15o20Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_01,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 impostorscore=0 spamscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512240036



On 12/24/2025 6:15 AM, Stephan Gerhold wrote:
> On Tue, Dec 23, 2025 at 01:13:50AM -0800, Jingyi Wang wrote:
>> From: Gokul krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
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
>>
>> [...]
>> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
>> index 52680ac99589..7e890e18dd82 100644
>> --- a/drivers/remoteproc/qcom_q6v5_pas.c
>> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
>> [...]
>> @@ -434,6 +440,85 @@ static unsigned long qcom_pas_panic(struct rproc *rproc)
>>  	return qcom_q6v5_panic(&pas->q6v5);
>>  }
>>  
>> +static int qcom_pas_attach(struct rproc *rproc)
>> +{
>> +	int ret;
>> +	struct qcom_pas *pas = rproc->priv;
>> +	bool ready_state;
>> +	bool crash_state;
>> +
>> +	pas->q6v5.running = true;
>> +	ret = irq_get_irqchip_state(pas->q6v5.fatal_irq,
>> +				    IRQCHIP_STATE_LINE_LEVEL, &crash_state);
>> +
>> +	if (ret)
>> +		goto disable_running;
>> +
>> +	if (crash_state) {
>> +		dev_err(pas->dev, "Sub system has crashed before driver probe\n");
>> +		rproc_report_crash(rproc, RPROC_FATAL_ERROR);
> 
> Have you tested this case? From quick review of the code in
> remoteproc_core.c I'm skeptical if this will work correctly:
> 
>  1. Remoteproc is in RPROC_DETACHED state during auto boot
>  2. qcom_pas_attach() runs and calls rproc_report_crash(), then fails so
>     RPROC_DETACHED state remains
>  3. rproc_crash_handler_work() sets RPROC_CRASHED and starts recovery
>  4. rproc_boot_recovery() calls rproc_stop()
>  5. rproc_stop() calls rproc_stop_subdevices(), but because the
>     remoteproc was never attached, the subdevices were never started.
> 
> In this situation, rproc_stop_subdevices() should not be called. I would
> expect you will need to make some minor changes to the remoteproc_core
> to support handling crashes during RPROC_DETACHED state.
> 
> I might be reading the code wrong, but please make sure that you
> simulate this case at runtime and check that it works correctly.
> 

Recheked this part, current path has some issue on recovery and subdev handling.
As in current code, rproc_report_crash is called in the ISR/callback, it may
take some effort to call it in this attach path.


>> +		ret = -EINVAL;
>> +		goto disable_running;
>> +	}
>> +
>> +	ret = irq_get_irqchip_state(pas->q6v5.ready_irq,
>> +				    IRQCHIP_STATE_LINE_LEVEL, &ready_state);
>> +
>> +	if (ret)
>> +		goto disable_running;
>> +
>> +	enable_irq(pas->q6v5.handover_irq);
>> +
>> +	if (unlikely(!ready_state)) {
>> +		/* Set a 5 seconds timeout in case the early boot is delayed */
>> +		ret = wait_for_completion_timeout(&pas->q6v5.subsys_booted,
>> +						  msecs_to_jiffies(EARLY_ATTACH_TIMEOUT_MS));
>> +
> 
> Again, have you tested this case?
> 
> As I already wrote in v2, I don't see how this case will work reliably
> in practice. How do you ensure that the handover resources will be kept
> on during the Linux boot process until the remoteproc has completed
> booting?
> 
> Also, above you enable the handover_irq. Let's assume a handover IRQ
> does come in while you are waiting here. Then q6v5_handover_interrupt()
> will call q6v5->handover(q6v5); to disable the handover resources
> (clocks, power domains), but you never enabled those. I would expect
> that you get some bad reference count warnings in the kernel log.
> 
> I would still suggest dropping this code entirely. As far as I
> understand the response from Aiqun(Maria) Yu [1], there is no real use
> case for this on current platforms. If you want to keep this, you would
> need to vote for the handover resources during probe() (and perhaps
> more, this case is quite tricky).
> 
> Please test all your changes carefully in v4.
> 

Thanks for your detailed review, the handover resources was indeed
neglected in the design, we will re-evaluate this part.

> Thanks,
> Stephan
> 
> [1]: https://lore.kernel.org/linux-arm-msm/c15f083d-a2c1-462a-aad4-a72b36fbe1ac@oss.qualcomm.com/

Thanks,
Jingyi
