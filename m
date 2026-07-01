Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 606BB3EFD04
	for <linux-remoteproc@vger.kernel.org>; Wed,  1 Jul 2026 09:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782898678; cv=none; b=bPacddNyARvt1yfCcov3TzSlz6wr6hmlWjN1sSeLM5OV+6aF8YdbVtPcDfJPKedH+qUcczrImqZ3KjDWGBXFriRvk2AkjFiGDPYFab6YbSA0bWRlVEgik/ScreQvkbLY067MSmuOp/DGK1w4mBxjtMKdBwR8EB5nbuyunx9Mxsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782898678; c=relaxed/simple;
	bh=IhViHuiHD+4a/eVxtydhx8UFtN9IIBo2uUmeHl4uCmE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pPQReCeJObgKaMPLm0fyChx70fxb80UVJSJ2/xS4VpKTf7k63S670H7b8vylo2x3o4upWeRQv3zhVolzcYH+Ybi23Wiwp2viTDidNRK9fyvDwqJD22Br4GlHtOohE/dU7mR7AG2Nktebhq9myGCe18/i+6MU+k+artDNRTW4gBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KErIeuBd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YsMVqnfY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KErIeuBd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YsMVqnfY"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6618Ft6I479252
	for <linux-remoteproc@vger.kernel.org>; Wed, 1 Jul 2026 09:37:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dkNSglQHh+DSrxluFJY8Xgw/XVzoYMUDesnUTObiszE=; b=KErIeuBd/daoSoDo
	ZrtlSGcQRj5csk6Thc1M//qNfOV0CqfHXWZPoig8YuaDn161ujoI11E+U3Y6jaTb
	rHI8gqwQpcSvVgX7YaYG3PbGom0IDhAqtWFpja379j9Gs6e4SC9mw4aZZw4RUnMJ
	GzxoAIqBD8jv+7BeZx4MGzX/W2hAbe5XkW7xaqzAigRFnlHRv9pup/MHaUlUXoBh
	Iz0BWg4M35Esuv9ZMofta2QkNfVFJ4xp52xYiw0DKHObcFAofH27NdwvWFtMt7oM
	9pT82fRWFXLq6G5fRILy8cBbM1D4/RYGsvE/10dZlEQ+iVwsfg5IwBd59xqNBi7R
	mjT0BA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4x0tgrvv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 01 Jul 2026 09:37:56 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-847bdf7a7afso106538b3a.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 01 Jul 2026 02:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782898675; x=1783503475; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dkNSglQHh+DSrxluFJY8Xgw/XVzoYMUDesnUTObiszE=;
        b=YsMVqnfYSdis5EkD3HYJI36qswg1ArR+fBi5DjbdIerqES2QCRU6gAA5W87OEBnelI
         Val/zuDGYAGOOs82jsXMXGXsgE7sRrKD/akZdFkiWdkv1WhkB2R1P+9vauaDGCOgCDVb
         qovnw8KTyTH6zVuXEFYiVQdh8Xn37vQ5+zZSxzr9dR677iGz0vug/nt2U6Q79dxt2Omk
         lw1lCw0q0oga4iBUbPDkuAwMsuvErVH/WhVbW9g56H87qsLbvDWGcs+BPK52iVL5ClAr
         QZVCSHL2lw1amB87eikn9aBOeDhF6A3FV+6VW34tJGfFzvdmh90E25hVn5XRxTtOoibr
         iaZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782898675; x=1783503475;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dkNSglQHh+DSrxluFJY8Xgw/XVzoYMUDesnUTObiszE=;
        b=aDTTqcYzMll/DEpp3J7rUsuoJVMnkzVeAuMWygI+WqdKp05c3mhqRtjKyZjllgAeuQ
         C1Uubjq9jSZzUUtGuQLC9MAIvjNJxEgcnDC8ZwTC1FWqPHhzWSlADcPwZIIY6HhB+9az
         9UEcUNoxt3+IQw+fE4q4TUiM9EphBH70tq+f4cXYCldjZeNgu3qgJqNYJIAc3F1S1Oru
         SfB39MTv8jCccCZelm2ZJ/IQUL0iNk0DIgK9podKl79+NOrZcdFtrE56Sy9Sz3TEDcDH
         nCzo4+SBtfNqF8TXeQVwoicxb/T9T4Ht5l5roB1F7A4k7oBc14IxQcub1uvQDJKAYJFY
         JhhA==
X-Forwarded-Encrypted: i=1; AHgh+Rqh082MAc0Av9fXcyQRB9A5imq+EfroTuhpor82BgQkfeDHQZ3COpKjsqqg+yi5wBF92Rz0ZF89GriZ8dQ9TAhj@vger.kernel.org
X-Gm-Message-State: AOJu0Yzm/+hIRR7rrtFL6ty52SWetV4fisJXdTbKmY6ITAm79NESh5/0
	5IUTYfH4ZXgVaCnVzkwBPCr3K8DIkOqmUahRx0cE44lnEh4GGy5DtbtlEcionb+2ZK+xIfJQD5X
	memRu6YbE9TjXNOk7g7cX9Hpiy/Md2G8KAUX6qv6llHY7BbcMhit4xKmW7n8NbbEe9HyyeBai
X-Gm-Gg: AfdE7cmJAGr6SUs1PNLge6srOPEwFvhkYVE5T0rzXKQ8QnL6Nk7+BHIcxf64sR9jTxF
	yOjIeJE/sprS4ZgwhCdX+dDvR0tHy604hu+amGBKry1PQKjgQEeTA4wFOKZStTkRbhkt4U0r3dw
	SEhBax3TP9R6WIDb5632x8xxIHrxhl96Ujk/MJNjw+4UucxvaEpxV0nXLnVXEkDGr8HHcJiqrIo
	dRzQpbAtMslELTtCoqIBZvx/aJlrjCQWTqbyVg7m/lUDcE3C5w/GnSSBhDKk7+vJVhBrgsxGYsi
	KqQ2DxL0cHl/bRwohXK5L28N6HhcQvuADp7l1sHvjpQuW+gVKg3sB65xOJeZr7bJ+HvRnPvL6n9
	91uz09F4fRaj82oYmUMkPM/gqBQyx4eiwrYE9Br0CokdsQFtWesUI3AgP/7BoBmGaV1uryYikc7
	7I
X-Received: by 2002:a05:6a00:2d9b:b0:845:ec35:6d7f with SMTP id d2e1a72fcca58-847c082be1cmr558471b3a.4.1782898675317;
        Wed, 01 Jul 2026 02:37:55 -0700 (PDT)
X-Received: by 2002:a05:6a00:2d9b:b0:845:ec35:6d7f with SMTP id d2e1a72fcca58-847c082be1cmr558440b3a.4.1782898674611;
        Wed, 01 Jul 2026 02:37:54 -0700 (PDT)
Received: from [10.133.33.21] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8479fffa4f0sm3710945b3a.19.2026.07.01.02.37.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 02:37:54 -0700 (PDT)
Message-ID: <83ff7ae0-1804-4528-8897-bc5fc93373f9@oss.qualcomm.com>
Date: Wed, 1 Jul 2026 17:37:48 +0800
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 5/6] remoteproc: qcom: pas: Add late attach support for
 subsystems
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
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
        Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
References: <20260623-knp-soccp-v7-0-1ec7bb5c9fec@oss.qualcomm.com>
 <20260623-knp-soccp-v7-5-1ec7bb5c9fec@oss.qualcomm.com>
 <20260624080833.wcqaxuhlch7ljp2c@hu-mojha-hyd.qualcomm.com>
From: "Aiqun(Maria) Yu" <aiqun.yu@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260624080833.wcqaxuhlch7ljp2c@hu-mojha-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: jfgx9frux-C9OBRlnkJWB6fa2XGuFmLv
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDA5NyBTYWx0ZWRfX/A3MfFlfhBmd
 mrVl4cqMGhqAerNmYuKtfyOCJfWsBNMJFL5LQ39624W1NIc898hVM+CoH5v7syQB2DTsXdmTwWg
 fSQsem7Xo2SRUNwSiTeX9QcUz25wg7w=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDA5NyBTYWx0ZWRfX8PsCI/dqaagZ
 yX2u6JQamiOhd9yydApNhKkYHyOIDDq6YUc4PCLvbfxJyVTLK/wlLeOvI7asle9hmqzqv/Bf4sm
 xkDFdPTJoGt8lliQZnvIGC7wUTChBQ5JgbpdItfAO48dmvoTAWXcG4KE4QwLcwtRIEsHJdnVIrM
 VWQQX2A85Pp4j4L2rCXtYjNL0omARviewCzwDQqQJMAmPirU9KRAU1zsNxjHn6BVAWCbEH0wfOt
 eqbJBSC+Ximr97PmbalERImUPsCm3f9mYvQn/ffXwn/g9itpoYxR2h/eOuzPzzc7AoLZYJ6cU9f
 OKMzfWl4FsOXuyicKRozsb1D6L5fk9fRRlLE5y137pI2VflymNWGyKNIP5V2F1f/ace345+v+5Q
 zVduoOdTdK+A7HgmAJORCNi7WEMMfWPhI0eKZR6TrDtbCfJN0nx0t7r/wPOhe2badJ2Yn1eFrS3
 UTtdR3U3dJJUlINjpxQ==
X-Authority-Analysis: v=2.4 cv=T5+8ifKQ c=1 sm=1 tr=0 ts=6a44dff4 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=j2ZC3VUGMi8-CnbsNg0A:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: jfgx9frux-C9OBRlnkJWB6fa2XGuFmLv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010097

On 6/24/2026 4:08 PM, Mukesh Ojha wrote:
> On Tue, Jun 23, 2026 at 03:05:21AM -0700, Jingyi Wang wrote:
>> Subsystems can be brought out of reset by entities such as bootloaders.
>> As the irq enablement could be later than subsystem bring up, the state
>> of subsystem should be checked by reading SMP2P bits.
>>
>> A new qcom_pas_attach() function is introduced. if crash state is detected
>> for the subsystem, rproc_report_crash() is called. If the ready state is
>> detected meanwhile stop state is not detected, it will be marked as
>> "attached", otherwise it could be the early boot feature is not supported
>> by other entities or it has already been stopped. In above cases, the
>> state will be marked as RPROC_OFFLINE so that the PAS driver can load the
>> firmware and start the remoteproc.
>>
>> Co-developed-by: Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
>> Signed-off-by: Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
>> Tested-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>> ---
>>  drivers/remoteproc/qcom_common.h   |  6 ++++
>>  drivers/remoteproc/qcom_q6v5.c     |  3 +-
>>  drivers/remoteproc/qcom_q6v5_pas.c | 68 ++++++++++++++++++++++++++++++++++++++
>>  drivers/remoteproc/qcom_sysmon.c   | 19 +++++++++++
>>  4 files changed, 95 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/remoteproc/qcom_common.h b/drivers/remoteproc/qcom_common.h
>> index b07fbaa091a0..b0e7e336d363 100644
>> --- a/drivers/remoteproc/qcom_common.h
>> +++ b/drivers/remoteproc/qcom_common.h
>> @@ -68,6 +68,7 @@ struct qcom_sysmon *qcom_add_sysmon_subdev(struct rproc *rproc,
>>  					   int ssctl_instance);
>>  void qcom_remove_sysmon_subdev(struct qcom_sysmon *sysmon);
>>  bool qcom_sysmon_shutdown_acked(struct qcom_sysmon *sysmon);
>> +bool qcom_sysmon_shutdown_irq_state(struct qcom_sysmon *sysmon);
>>  #else
>>  static inline struct qcom_sysmon *qcom_add_sysmon_subdev(struct rproc *rproc,
>>  							 const char *name,
>> @@ -84,6 +85,11 @@ static inline bool qcom_sysmon_shutdown_acked(struct qcom_sysmon *sysmon)
>>  {
>>  	return false;
>>  }
>> +
>> +static inline bool qcom_sysmon_shutdown_irq_state(struct qcom_sysmon *sysmon)
>> +{
>> +	return false;
>> +}
>>  #endif
>>  
>>  #endif
>> diff --git a/drivers/remoteproc/qcom_q6v5.c b/drivers/remoteproc/qcom_q6v5.c
>> index 58d5b85e58cd..a11d8ace554b 100644
>> --- a/drivers/remoteproc/qcom_q6v5.c
>> +++ b/drivers/remoteproc/qcom_q6v5.c
>> @@ -202,7 +202,8 @@ int qcom_q6v5_request_stop(struct qcom_q6v5 *q6v5, struct qcom_sysmon *sysmon)
>>  	q6v5->running = false;
>>  
>>  	/* Don't perform SMP2P dance if remote isn't running */
>> -	if (q6v5->rproc->state != RPROC_RUNNING || qcom_sysmon_shutdown_acked(sysmon))
>> +	if ((q6v5->rproc->state != RPROC_RUNNING && q6v5->rproc->state != RPROC_ATTACHED) ||
>> +	    qcom_sysmon_shutdown_acked(sysmon))
>>  		return 0;
>>  
>>  	qcom_smem_state_update_bits(q6v5->state,
>> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
>> index 808e9609988d..8a0bb4b2e71c 100644
>> --- a/drivers/remoteproc/qcom_q6v5_pas.c
>> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
>> @@ -60,6 +60,7 @@ struct qcom_pas_data {
>>  	int region_assign_count;
>>  	bool region_assign_shared;
>>  	int region_assign_vmid;
>> +	bool early_boot;
>>  };
>>  
>>  struct qcom_pas {
>> @@ -507,6 +508,67 @@ static unsigned long qcom_pas_panic(struct rproc *rproc)
>>  	return qcom_q6v5_panic(&pas->q6v5);
>>  }
>>  
>> +static int qcom_pas_attach(struct rproc *rproc)
>> +{
>> +	struct qcom_pas *pas = rproc->priv;
>> +	bool ready_state;
>> +	bool crash_state;
>> +	bool stop_state;
>> +	int ret;
>> +
>> +	pas->q6v5.handover_issued = true;
>> +	enable_irq(pas->q6v5.handover_irq);
>> +
>> +	pas->q6v5.running = true;
>> +	ret = irq_get_irqchip_state(pas->q6v5.fatal_irq,
>> +				    IRQCHIP_STATE_LINE_LEVEL, &crash_state);
>> +	if (ret)
>> +		goto disable_running;
>> +
>> +	if (crash_state) {
>> +		dev_err(pas->dev, "Subsystem has crashed before driver probe\n");
>> +		rproc_report_crash(rproc, RPROC_FATAL_ERROR);
>> +		ret = -EINVAL;
>> +		goto disable_running;
>> +	}
>> +
>> +	ret = irq_get_irqchip_state(pas->q6v5.stop_irq,
>> +				    IRQCHIP_STATE_LINE_LEVEL, &stop_state);
>> +	if (ret)
>> +		goto disable_running;
>> +
>> +	if (stop_state || qcom_sysmon_shutdown_irq_state(pas->sysmon)) {
>> +		dev_info(pas->dev, "Subsystem found stop state set. Falling back to start.\n");
>> +		goto unroll_attach;
>> +	}
>> +
>> +	ret = irq_get_irqchip_state(pas->q6v5.ready_irq,
>> +				    IRQCHIP_STATE_LINE_LEVEL, &ready_state);
>> +	if (ret)
>> +		goto disable_running;
>> +
>> +	if (unlikely(!ready_state)) {
>> +		/*
>> +		 * The bootloader may not support early boot, mark the state as
>> +		 * RPROC_OFFLINE so that the PAS driver can load the firmware and
>> +		 * start the remoteproc.
>> +		 */
>> +		dev_err(pas->dev, "Failed to get subsystem ready interrupt\n");
>> +		goto unroll_attach;
>> +	}
>> +
>> +	return 0;
>> +
>> +unroll_attach:
>> +	pas->rproc->state = RPROC_OFFLINE;
>> +	ret = -EINVAL;
>> +disable_running:
>> +	disable_irq(pas->q6v5.handover_irq);
>> +	pas->q6v5.running = false;
>> +
>> +	return ret;
>> +}
>> +
>>  static const struct rproc_ops qcom_pas_ops = {
>>  	.unprepare = qcom_pas_unprepare,
>>  	.start = qcom_pas_start,
>> @@ -515,6 +577,7 @@ static const struct rproc_ops qcom_pas_ops = {
>>  	.parse_fw = qcom_pas_parse_firmware,
>>  	.load = qcom_pas_load,
>>  	.panic = qcom_pas_panic,
>> +	.attach = qcom_pas_attach,
>>  };
>>  
>>  static const struct rproc_ops qcom_pas_minidump_ops = {
>> @@ -526,6 +589,7 @@ static const struct rproc_ops qcom_pas_minidump_ops = {
>>  	.load = qcom_pas_load,
>>  	.panic = qcom_pas_panic,
>>  	.coredump = qcom_pas_minidump,
>> +	.attach = qcom_pas_attach,
>>  };
>>  
>>  static int qcom_pas_init_clock(struct qcom_pas *pas)
>> @@ -852,6 +916,10 @@ static int qcom_pas_probe(struct platform_device *pdev)
>>  
>>  	pas->pas_ctx->use_tzmem = rproc->has_iommu;
>>  	pas->dtb_pas_ctx->use_tzmem = rproc->has_iommu;
>> +
>> +	if (desc->early_boot)
>> +		pas->rproc->state = RPROC_DETACHED;
>> +
>>  	ret = rproc_add(rproc);
>>  	if (ret)
>>  		goto remove_ssr_sysmon;
>> diff --git a/drivers/remoteproc/qcom_sysmon.c b/drivers/remoteproc/qcom_sysmon.c
>> index 913e3b750a86..a0830a48b1f4 100644
>> --- a/drivers/remoteproc/qcom_sysmon.c
>> +++ b/drivers/remoteproc/qcom_sysmon.c
>> @@ -736,6 +736,25 @@ bool qcom_sysmon_shutdown_acked(struct qcom_sysmon *sysmon)
>>  }
>>  EXPORT_SYMBOL_GPL(qcom_sysmon_shutdown_acked);
>>  
>> +bool qcom_sysmon_shutdown_irq_state(struct qcom_sysmon *sysmon)
>> +{
>> +	bool shutdown_state;
>> +	int ret;
>> +
>> +	if (!sysmon)
>> +		return false;
>> +
>> +	ret = irq_get_irqchip_state(sysmon->shutdown_irq,
>> +				    IRQCHIP_STATE_LINE_LEVEL, &shutdown_state);
>> +	if (ret) {
>> +		dev_warn(sysmon->dev, "failed to get shutdown_state: %d\n", ret);
>> +		return false;
>> +	}
>> +
>> +	return shutdown_state;
>> +}
>> +EXPORT_SYMBOL_GPL(qcom_sysmon_shutdown_irq_state);
>> +
>>  /**
>>   * sysmon_probe() - probe sys_mon channel
>>   * @rpdev:	rpmsg device handle
>>
>> -- 
>> 2.34.1
>>
> 
> I tested the series on Hawi., it works but unsure about newly introduced
> stop and shutdown status checking why is it required ? I think, you are
> checking this for sanity if it is left some random state by the boot
> loader..

The stop and shutdown status checking is to address a valid scenario
which Stephan brought out in previous comments [1]. The more improved
robustness for rproc_attach fail cases including Ping-pong is at [2].

[1] https://lore.kernel.org/all/ahBG6jKYdSAboWjs@linaro.org/
[2]
https://lore.kernel.org/all/20260623-rproc-attach-issue-v3-0-8e24310707ce@oss.qualcomm.com/

> 
> Tested-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> 


-- 
Thx and BRs,
Aiqun(Maria) Yu
