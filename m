Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC0492DB780
	for <linux-remoteproc@vger.kernel.org>; Wed, 10 Jun 2026 03:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781061129; cv=none; b=Sx2Py+SjGNjAE6uqFVPgVlJqC+i7t2wrmzid+cA7S4lqUO2/W1vuch8KipZqm4Ye58FT+GaCOsDMaTnJ1KWGITwNyZ9uiZ8Rnh6G4o4yFw2/1twAABGIoYyWmf3HZZz55ZBEW3GI4C1oAXdiAKHBVPxJ03NReME9dViniuomcaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781061129; c=relaxed/simple;
	bh=/NryWXkR6E+3gURwL7KyTpAD8KltnuDEeM+zlykdqEs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HutMlOpVGggNsY/PcthQhI/qs2QL1I6JyZ4Df0jOo5rr/9bX8Ohb6XbXtKQPabI1AmfCNv2J3ErULDSjwXdC/et7gn1PIH0rNh7i6UZOITSYOgRfP0ZJ8z2zeqHa2Bw5oMuzjdEGhYid2oyDHUXGNaTBqo8mqluM9d8zNbUMpk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aTKptZ+9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TKzkbSAP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aTKptZ+9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TKzkbSAP"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A2efGv282545
	for <linux-remoteproc@vger.kernel.org>; Wed, 10 Jun 2026 03:12:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3KdVRlNi9iQwpjqqFmnz7dwVDhPsaks/t9Zm6pawkFs=; b=aTKptZ+93aq1bhm2
	NHkU7BAiHlgkKB1GI0ZTUT1xy+lj8r57tB38BoMSkJVWwVHjrLZHCSa2Dn2/uL9l
	/oE8i4v6HnWqCGB+S1ek+LuOYarUD6DRa0yjmcqmfQIT5uXfxi6YijQ0sG4Wa7zE
	I072jF4sMqCM+u9uvBTUyro2CdydWnQXP6b+65O+O4MeZT453xb6+rE6nQcRUWZF
	YH9aR0Oca8MwQOmgJRx0zgPUy4XNJc2fUWJfKoW182gsyi1bAEh+wcSfINtR68L9
	fSW+1swmACxIzUW2hiiXKtRCThJLlcuC9yhhsSMniZQtBNhgDzxjdDqzVv2zttUe
	lRPXZg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epwnnrf62-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 10 Jun 2026 03:12:06 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8423970cb30so4073048b3a.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 09 Jun 2026 20:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781061126; x=1781665926; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3KdVRlNi9iQwpjqqFmnz7dwVDhPsaks/t9Zm6pawkFs=;
        b=TKzkbSAPdI+y4cxkiGWqoH9Eahl7IaLXoMFpa7Ok8P7SUfCWUkoSIlVw2nRxJNTJS8
         iuhq99qAVXJn1ndZGh0q6CMD942wPHOKW0DjMcPAYgzvGf9WSrBs5j0JsopabS5YKFO5
         +FbEp11xvIXkyyYRcuPDrgcEnxre0ZhifEmIp6E+zWlRvV35Sgi6XlomQLxnnVp9p/0w
         zjHFeoatt31m58lZWIfxSJVAlDACb9obEFf/r+5dQAiQmtuAEzmvn8ciyzAgwFjHhzNz
         J717Zg89wpsG8tmOrV/YnUJ1FHjKkQcZcd2kn3OKnJlj7OZdpAAPbqxI90tviQ59ZVWd
         f+2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781061126; x=1781665926;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3KdVRlNi9iQwpjqqFmnz7dwVDhPsaks/t9Zm6pawkFs=;
        b=KSbdFDLkvemhEcSH2a6rHnY2ZDSvL7MDVYiT0Dz/7Cw4i2ikdE6tYA22KW5uR77+Z5
         cecjiWqjKNeCp6+Cnas0B+uSP86RnDIbQX2VKn336eW+LmhjK1G3mTtFIe9EYlLp+AHr
         4MKKIwv1n+/+94t4K5UCqyLWjVgD/4+chGfKnio8XB05NcZGB8vp9/fIXsNSgqhuVvPf
         ZTJqyLozfPQJ2qFqwgrt/2jxeecei3as33/y1wKTEjnULIiHWrkusu8xJCSzeoWV+X//
         ivyh0T87XeVKj0w/lA10MWYHbrXwR7mbV4GRV/ZfJWfrhBrGR1vs3IwHYdj09DMhBi3S
         /Ymg==
X-Forwarded-Encrypted: i=1; AFNElJ/52wRS/CrQSavYMgnvtmDyWxSQZlLn/pOD5Oa/hYDIGeQFWYXP8hd4lqXDYThwRojq4J+A5nI8rvyW5pxqqtOR@vger.kernel.org
X-Gm-Message-State: AOJu0YzIjC8CAYH08fkHXUCuFpFyc26c51sP1K5g0I0eItB/yrGsibiC
	4ZtFhRksMhO+Ajbee9zihaVuuZjYX1z5UpF5/zpWwIZkbNVxOFWP4mQKh1jZUuPfQB46Dp/lwZ3
	4bNgQr9fHGmo4Zq0LUI/8QVne/OfhtXaqyFYWsDSHU7Oif5NJCmIMWsuKQTnk2BplovoZwZU6
X-Gm-Gg: Acq92OGecTnUSsPuLF1muBe9Wqu4fAYlZAV0TrAhkIO8M/Gk625JqW8+S2tHkdPINW6
	qeE4ucOaNZlLK2e+G91WrkN5kPjojqZdROF/8hwt4G4YVtQst/aEhTwUgMA+anhsUsXT4yqoRGJ
	2gT9cWjQy41VF54vMP3NQncH9twpzEdyxdiMuzZSbqod+Pdf/fE31+Wdg90BctNI7NVP/QmBypy
	B1h3B42pl603Z3s7OLZo2NokYSoSP75ob4DRecNg3qe/SG2psJMrEkNlo+qC1jwb9gWdnaNVLsW
	RUBCD2GoIQLPZcgCJoOzu1aI6HmqPws661qsa345HhGPRxj1UAK2ihwAZsTuJa2/wmQmkCmZjM2
	QoXDfEMQo8Dqyw+z4wKEb33ZDkGrMgsnhtdjOl6siflDGaoQXUY4B5L95UkItQUjk07Fakhm+ei
	k892INoV0q/l36ksc5Jj9lVqP3yQ4=
X-Received: by 2002:a05:6a00:f9a:b0:842:7296:dba with SMTP id d2e1a72fcca58-842b0e2fb1dmr24452667b3a.7.1781061125738;
        Tue, 09 Jun 2026 20:12:05 -0700 (PDT)
X-Received: by 2002:a05:6a00:f9a:b0:842:7296:dba with SMTP id d2e1a72fcca58-842b0e2fb1dmr24452638b3a.7.1781061125289;
        Tue, 09 Jun 2026 20:12:05 -0700 (PDT)
Received: from [10.133.33.195] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842824a1cb4sm27496629b3a.26.2026.06.09.20.12.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 20:12:04 -0700 (PDT)
Message-ID: <88c161d6-caa3-4fff-afaf-d10cacfe9929@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 11:11:59 +0800
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
 <e67907bc-ce96-4654-b210-2ae8f35cacc7@oss.qualcomm.com>
 <20260521112205.rq6g6ev56l4u47uu@hu-mojha-hyd.qualcomm.com>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <20260521112205.rq6g6ev56l4u47uu@hu-mojha-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: UUtpytxMEkvUZpeYYIDYWwxnD2WOKvXu
X-Proofpoint-ORIG-GUID: UUtpytxMEkvUZpeYYIDYWwxnD2WOKvXu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDAyNyBTYWx0ZWRfX+IOAS+5yih06
 w77jGiR12QT8xIiq7LQhYkmm8pWbS+/T1xsapCsdtYO7S3rkCbH2Ujc8tMRwTTfzeebeMxnQRa4
 D2bZCvR7IjZlWcirXPfcNrK0nq8kuBHupU9j6DblEPQrpVDsI/jE1Ma/VKdJxuUtid+93VrBxuR
 y67vgOWZZtnN8N4fkjxYGdnED+V9mBEGPwvqMEZNAmMXbFjzCsBzVhR0z2BU069b5mKn6DEonGn
 9GsBY/crhjlj19qQTFevqzL78gOZoMHcpDE3RGWYmwenxQylX9pHcF61ZvC3RmBs6Rw/fsZMziE
 EFjvnYkqntBSV7my2oS4BRTnS3uzcNTCt1KgZllD6Yh9MfHSLFYB9yDpaXxvhcLmHurXtpAvGYE
 tzc6lJXXZf9k+pURR7VXf5YeHI6ZeM6bzzYG83rVdrmFsPu/war0FYGXJGb6RnVISNsUNpWB+5L
 t/8MtLAeCUQME3c9svg==
X-Authority-Analysis: v=2.4 cv=epLvCIpX c=1 sm=1 tr=0 ts=6a28d606 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=tERN6AOGqS7yUma0NWkA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 bulkscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100027



On 5/21/2026 7:22 PM, Mukesh Ojha wrote:
> On Thu, May 21, 2026 at 11:42:49AM +0800, Jingyi Wang wrote:
>>
>>
>> On 5/20/2026 4:27 PM, Mukesh Ojha wrote:
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
>>>> ---
>>>>    drivers/remoteproc/qcom_q6v5_pas.c | 58 ++++++++++++++++++++++++++++++++++++++
>>>>    1 file changed, 58 insertions(+)
>>>>
>>>> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
>>>> index da27d1d3c9da..ac2a00aacd2e 100644
>>>> --- a/drivers/remoteproc/qcom_q6v5_pas.c
>>>> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
>>>> @@ -60,6 +60,7 @@ struct qcom_pas_data {
>>>>    	int region_assign_count;
>>>>    	bool region_assign_shared;
>>>>    	int region_assign_vmid;
>>>> +	bool early_boot;
>>>>    };
>>>>    struct qcom_pas {
>>>> @@ -510,6 +511,57 @@ static unsigned long qcom_pas_panic(struct rproc *rproc)
>>>>    	return qcom_q6v5_panic(&pas->q6v5);
>>>>    }
>>>> +static int qcom_pas_attach(struct rproc *rproc)
>>>> +{
>>>> +	int ret;
>>>> +	struct qcom_pas *pas = rproc->priv;
>>>> +	bool ready_state;
>>>> +	bool crash_state;
>>>> +
>>>> +	pas->q6v5.handover_issued = true;
>>>> +	enable_irq(pas->q6v5.handover_irq);
>>>> +
>>>> +	pas->q6v5.running = true;
>>>> +	ret = irq_get_irqchip_state(pas->q6v5.fatal_irq,
>>>> +				    IRQCHIP_STATE_LINE_LEVEL, &crash_state);
>>>> +
>>>> +	if (ret)
>>>> +		goto disable_running;
>>>> +
>>>> +	if (crash_state) {
>>>> +		dev_err(pas->dev, "Subsystem has crashed before driver probe\n");
>>>> +		rproc_report_crash(rproc, RPROC_FATAL_ERROR);
>>>
>>> I am not sure if this is already discussed, but what if it is the first
>>> crash with recovery and coredump enabled? What would be in the dump,
>>> nothing? As there is no segment, is it expected since Linux did not load
>>> this?
>>>
>>> This is even true if it is a crash after a successful attach.
>>>
>>
>> It is suggested by Bjorn:
>> https://lore.kernel.org/all/qfls6xlvfppqw7p6rjpmzqesh6sbob4myfc6dz47qh3jywqrjk@5xiutkbybk5d/
>>
>> I did a hack to test the recovery by setting crash_state true, it can recovery
>> (stop and start) successfully with below patches:
>> https://lore.kernel.org/all/20260519-rproc-attach-issue-v2-0-caa1eaf75081@oss.qualcomm.com/
>>
>> For coredump, it will return from the first "list_empty(&rproc->dump_segments)" check in
>> rproc_coredump as segments are not configured in attach.
> 
> 
> I was not against any of the stuff, but mostly checking, if we agreed on not collecting dump
> for first crash when soccp minidump is not initialized which falls back to full dump of the soccp.
> I see soccp minidump id in the downstream but we have not added in 6/6.
> 

Hi Mukesh,

I prefer to add base rproc attach feature only in this patch and skipping the coredump in attach
workflow.

Thanks,
Jingyi

>>
>> Thanks,
>> Jingyi
>>
>>
>>> @Sibi, has this series been tested on Glymur with KVM?
>>> I don't see the iommu property in the below patch.
>>> https://lore.kernel.org/lkml/20260403-glymur-soccp-v3-1-f0e8d57f11ba@oss.qualcomm.com/
>>>
>>
> 

