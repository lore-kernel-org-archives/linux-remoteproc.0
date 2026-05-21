Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 645E52FD1B3
	for <linux-remoteproc@vger.kernel.org>; Thu, 21 May 2026 03:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779334980; cv=none; b=FQpoGIrrC527GzpTBvslRDAr+1f3ZvgDCJV6fEN2HWoLYhNleDbArvLaTXo/9kRg4KAY+IPN3qQZOkKvctENH+35nHnDHU7PEJy7rmy+LEvUZS3I7EZyZG6zvxy+2yqx5yaBJcSQp480ruC2hLMryT0v0NFmq2FiEYYZWhc/7JE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779334980; c=relaxed/simple;
	bh=/XjCPxEgGNN+atUEroSNZFqHio63EwE/Ev/LLcgANKA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cCkNx3x2Dm6K7l4pQ7tKindbUdwaS+GGv84svJ+UW3OvfXUWHvTRr6Z2Os1QA5Re2MmP33+bce2/D9N3bqp/a1gC164Hx3hr2LpyJrJbexRVwjPggPhivPOzj4xRTC/sFs4D2Q6kXif9Dbg33w2Gm/p4BQeATGPZP8IBI/Rw0B0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=otHukdjL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VOUOXefT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="otHukdjL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VOUOXefT"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KLsg7D118975
	for <linux-remoteproc@vger.kernel.org>; Thu, 21 May 2026 03:42:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xD5NLpXfnIseB9t5q7naGLC9DxcIYZPc4Gj/KvnSuTc=; b=otHukdjLjLP/a0v+
	GZmZgBpQBVcGemFoWKF9OoFOSUvPetMbMyXqmdMiTX+P/YStfx0OAXh4I4FnGm1U
	AIZ3aZZcK/OmrsJU7J6Q4spuZc2zTw8kRNTh2qwyU8+XTZeK/X4uwr0OA1dwV1yf
	l04ZvB25l2Ig/KvlX8GIAw7qL6gWevCeLnljm9sPwgHshkRwCchqOx6VW5fkVpr3
	VbAJvZHUIHS+/kHRuSxg2k3S0ynw7u8ogMcNycaBVQUR2kcf7e1teZAk7hAO5hv/
	Ij99zbu1I+YXsWomEryopQz/o7pdNj2zakear5DmtNn3GUZEkwYeEorE45uVBeOy
	+MG0Rw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9ee8ax35-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 21 May 2026 03:42:56 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2bd1dbcccf6so91304245ad.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 20 May 2026 20:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779334976; x=1779939776; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xD5NLpXfnIseB9t5q7naGLC9DxcIYZPc4Gj/KvnSuTc=;
        b=VOUOXefTwdADgc7Z2HF17qt16iNdGda2ISHsa7ownwKWtLx5QXMX9hI25/7I6BVHKV
         TUel36VoqMFjlZP+S6WzPVCuOBtHvVwIC3WDVXXShArt8Enylcz39plnk9fL/lpX7DCv
         Buv65PaLI7XYX1btQRrtBYWJoFO7MEuN+cV69dBwaW86EGbByNL/ItcOi0U9C/jfmqw2
         SOUOJ1Q7fP5jL1rxXo/mwzGpN/HWNG7pxJZ913LemXxZk7GclhufFTsJXYQ7djt98DUa
         FJ3VCmcvXyP/mAmSNUO2o4cHNxrIYnRtt1TiH4lgRtq89TIo8h91AuNxQ7j0nONsCEUS
         9yMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779334976; x=1779939776;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xD5NLpXfnIseB9t5q7naGLC9DxcIYZPc4Gj/KvnSuTc=;
        b=Z0GDhj8qJmgU2TajPNNc+7fX+5XVjsCFpRwNW6N0MzY+NiiHITAwfNd7lbWJs3z9Pa
         /zFzPnGNDLiY4XirSQ29MOJ0bqUJjWw9aXqKfbrINdt/A+iurlT5uTPEcF4dTcNBnWRE
         Ihb4vTmGCKD6kO2rDfUFL7/xmc6Fhod4l7Nwcwv7sn4eYiEim0oh/kRPUN6Oi9pLGGbw
         Ikq+YBD7Pj5x9Mjn7TqeqQL2rw+2dPg5T95ZyfdKumDpFNUNXUimC/scmxxCJg5ABlPV
         +wWJSXwc0Af6IzospnkfyOVyWTzraZmvYXMCfMVgTed5NPDFMPHJuOenIH2XdNIySQPa
         yHSw==
X-Forwarded-Encrypted: i=1; AFNElJ/+4x4wd2OZ2GPg+axEOlw57ec+jwMhORFT6n6Zkw25k5/tOPATzdtnH025xkjF/mJBvvpd96/42rsxuM6Gb2Vp@vger.kernel.org
X-Gm-Message-State: AOJu0YwlK87B7tzTt6RGpf5qjbWvEr+QoaELBvF5lhBtN267Dyxy6MGd
	PX6rbUCtExer4wRyfmcO270cOo++cbfx0KFXQbgo+F6Dr221G4JNpNCEhjojNuEbcvq76/jjqUF
	cgWxhL3RZdOqs+sMOA1xKSaUyjD3y5CANeiw5bRI7h5hG77f2okUgXlY3SDTgOwXIpAoaeEuzrO
	4Bb/dE
X-Gm-Gg: Acq92OE1tulDlxb7Y0la9vlhn/iqKbkUYY5yVYM48pkZf7boEG83AGBQW7mABdSItR/
	sxSbwxfE6GIGUB+GeqmJDrkVE7Ftgq8Iykz7YR5Xr5GvfACiLYbNWHk+Ojhk/1rhWHiqsvpk+aI
	htGzC5gImKl2KfsDGNoG8bcr9ZtKeS5BYOEDvH8WBDOZ1wqa17bPq478noDI4Urop4lDvDfVj9q
	cThRGlJzTRih0BWaBHTzqmE/J7T6t+wzCp3AjB6yRpp6dxRZxZJa1H7FlbuB4nMdF8bJzlQM/AU
	7jHHCxLYZr5A8xjgrJ4QLWANjedgzIooSiPD9eHGsV2LRPnMfZts90q6TMmyfM2VWo1QQLZ1peQ
	yEuco8jLJpvMw3v5Lb1hg8R7W4zTuJzoYa/r/J4c0p23fHP4YvIFyH14oIWMtjclhpgNCuRFPJ6
	rAkoLbUo/l+IFdQgCv
X-Received: by 2002:a05:6a20:9185:b0:3a2:d838:bfdb with SMTP id adf61e73a8af0-3b30885a85dmr1362729637.29.1779334975995;
        Wed, 20 May 2026 20:42:55 -0700 (PDT)
X-Received: by 2002:a05:6a20:9185:b0:3a2:d838:bfdb with SMTP id adf61e73a8af0-3b30885a85dmr1362699637.29.1779334975454;
        Wed, 20 May 2026 20:42:55 -0700 (PDT)
Received: from [10.133.33.112] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bb115c38sm21138070a12.28.2026.05.20.20.42.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 20:42:55 -0700 (PDT)
Message-ID: <e67907bc-ce96-4654-b210-2ae8f35cacc7@oss.qualcomm.com>
Date: Thu, 21 May 2026 11:42:49 +0800
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/6] remoteproc: qcom: pas: Add late attach support for
 subsystems
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
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
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, shengchao.guo@oss.qualcomm.com,
        aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
References: <20260519-knp-soccp-v6-0-cf5d0e194b5f@oss.qualcomm.com>
 <20260519-knp-soccp-v6-5-cf5d0e194b5f@oss.qualcomm.com>
 <20260520082747.7seyyua4gfv256ev@hu-mojha-hyd.qualcomm.com>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <20260520082747.7seyyua4gfv256ev@hu-mojha-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: AKTvrBuxNX6TPiofbUiPXRo-pdJ_FKbd
X-Authority-Analysis: v=2.4 cv=e5k2j6p/ c=1 sm=1 tr=0 ts=6a0e7f40 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=h3XtbvSS6J2BgG28aqoA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDAzMiBTYWx0ZWRfXxDNBd+hbCR1P
 2tQ1kWXIkOAISO+X9p7wjquIUoBB7DM2zBjMAC4ptSH5FM0yXVDSjp5j4lQ3bLrhTI4k0z4ui/u
 GkATkM+4k4UNeFRXbubZdhmn/f++J2orj83qIURPoKdDWhlqMvIo6l+CH9XYbF7Yo4rbhyyJNwm
 kTKds3U4UWN2FlFGW03F3e9JSb3aXbM3aP33ieUQzs3vgCUV3XQNx+HTW7Te/b2paXao3T3kWCO
 eN5k+swNnzlZLqlkQRaPS9MuSrLTGIJt2yq1bLRus7qud0Ib+uzw6NT7eA9oY2wSrEZPCQRRdrG
 pQDBQPu5a7Of5HiLz2rMBdpF4s8WoJna38sc3Nflejcg4EmesZ4RC9k+DdR6T17CcpzIsUy13f/
 mmYzRwbHESYNGgZJX+/5NyP28V3aTMbkJzb8ZSIIm7LmO5IjM1X+MiHu1BYKpgWmZ61hqlN6Ek+
 EQlH4sc+9NBWOVOI1ZA==
X-Proofpoint-GUID: AKTvrBuxNX6TPiofbUiPXRo-pdJ_FKbd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210032



On 5/20/2026 4:27 PM, Mukesh Ojha wrote:
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
>> ---
>>   drivers/remoteproc/qcom_q6v5_pas.c | 58 ++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 58 insertions(+)
>>
>> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
>> index da27d1d3c9da..ac2a00aacd2e 100644
>> --- a/drivers/remoteproc/qcom_q6v5_pas.c
>> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
>> @@ -60,6 +60,7 @@ struct qcom_pas_data {
>>   	int region_assign_count;
>>   	bool region_assign_shared;
>>   	int region_assign_vmid;
>> +	bool early_boot;
>>   };
>>   
>>   struct qcom_pas {
>> @@ -510,6 +511,57 @@ static unsigned long qcom_pas_panic(struct rproc *rproc)
>>   	return qcom_q6v5_panic(&pas->q6v5);
>>   }
>>   
>> +static int qcom_pas_attach(struct rproc *rproc)
>> +{
>> +	int ret;
>> +	struct qcom_pas *pas = rproc->priv;
>> +	bool ready_state;
>> +	bool crash_state;
>> +
>> +	pas->q6v5.handover_issued = true;
>> +	enable_irq(pas->q6v5.handover_irq);
>> +
>> +	pas->q6v5.running = true;
>> +	ret = irq_get_irqchip_state(pas->q6v5.fatal_irq,
>> +				    IRQCHIP_STATE_LINE_LEVEL, &crash_state);
>> +
>> +	if (ret)
>> +		goto disable_running;
>> +
>> +	if (crash_state) {
>> +		dev_err(pas->dev, "Subsystem has crashed before driver probe\n");
>> +		rproc_report_crash(rproc, RPROC_FATAL_ERROR);
> 
> I am not sure if this is already discussed, but what if it is the first
> crash with recovery and coredump enabled? What would be in the dump,
> nothing? As there is no segment, is it expected since Linux did not load
> this?
> 
> This is even true if it is a crash after a successful attach.
> 

It is suggested by Bjorn:
https://lore.kernel.org/all/qfls6xlvfppqw7p6rjpmzqesh6sbob4myfc6dz47qh3jywqrjk@5xiutkbybk5d/

I did a hack to test the recovery by setting crash_state true, it can recovery
(stop and start) successfully with below patches:
https://lore.kernel.org/all/20260519-rproc-attach-issue-v2-0-caa1eaf75081@oss.qualcomm.com/

For coredump, it will return from the first "list_empty(&rproc->dump_segments)" check in
rproc_coredump as segments are not configured in attach.

Thanks,
Jingyi


> @Sibi, has this series been tested on Glymur with KVM?
> I don't see the iommu property in the below patch.
> https://lore.kernel.org/lkml/20260403-glymur-soccp-v3-1-f0e8d57f11ba@oss.qualcomm.com/
> 

