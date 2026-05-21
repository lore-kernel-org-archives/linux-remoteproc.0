Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 330E23B27D0
	for <linux-remoteproc@vger.kernel.org>; Thu, 21 May 2026 11:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779362538; cv=none; b=FndCXT6YWL9cNk1WzdmJykQ79FXcDF+/PjYVrdfSgGQbdkQCnJI3+r2mHxl/btnG443cse5DWG3NDCk9RxHXBeMIyXQia+sOvTx/2zYrBYmfP/76gp3kjBg6CnQMfB+XNt750hUVMX8YLoUcd5/v8tITvvLtkoF98RqXnzXQpvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779362538; c=relaxed/simple;
	bh=J1KhW2ltIzpa2rePa4djf3RrBVwWOAY2xFAF5Pl7tbE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lz6LCnp7kDiuu+5glfgtjoLDeR1oumv7LTAZA9OIZAiNmO7QUnz/7wJgCrT5JqXLtr9qPIXASjsFh+1MSKqJAlsSdf5SBBTiZeq3XiUAfrWx0HyWW3YvXy6Q/nmHBgcnKvKZ2saGYO5L7sWbl/2JBQzXfOR4MnYrFz1KbqxcsLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JtJ2zDA9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Rc6Dgeaz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JtJ2zDA9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Rc6Dgeaz"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L99nn0517713
	for <linux-remoteproc@vger.kernel.org>; Thu, 21 May 2026 11:22:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4r+ZJjB/A49+K5p9aefAxCsw
	o6iufgazJ25EeAlptdQ=; b=JtJ2zDA9frgdMoySGBS3ueizp0kl1FFrLP49qBKG
	y+WUh74xVbyqE7TFudnPGQl5/OnyuurQSq57Hu77SYl/UFJbZwfywmT7WZTxpY2q
	APMvKEv4rVOXajckwzut09l355HglZLA7DPPQ6sVsOVHrLM6GknKgkhBqidISe3K
	eLRC42KazMFpX5pBY647GlQj+2ZN6e4LF7OLe/GL26evu4ZAky1A2QlIOfyc2jC5
	Js30gClpWQuAUXKU/SxHbiOcUGn1DAguj3eNPo23C1DW+kFGxNgQZBNdILzwmyyY
	IfxhHn7akogO68q1UPYkjrYJ1WXmDEG06Ey7Zw4PrBuVMQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9saa1y9h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 21 May 2026 11:22:16 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-369467ab5bfso5399467a91.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 21 May 2026 04:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779362536; x=1779967336; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4r+ZJjB/A49+K5p9aefAxCswo6iufgazJ25EeAlptdQ=;
        b=Rc6DgeazyorsnQSnN8leVZaBM727bQpznJimbKVOYK1fndEkEXQVU/kCAjABK+WQ5O
         wE0lYtRXllbVnSoSnpglN5Xs1neq4gzt+6HbZ/FiczeLgDWamfLCgpi1npdWasTbGwY4
         BRqykM9/1p2q+fBS7Kl2E5BVVSxWyoqYhFVssl2trUxNnFG/tmMGOuLb3J4hvTRcQ2QN
         8fXi+LbIPaSwYj6Zm2JwqhKcOQgkIgJV+BnTafdWSsWlPIZlptIhmO6za4cdkFhCBksH
         JBPVILYPZ6Q+TZRaOv+pZ5q55mbv2UKHVR6je45kwKpghQfw1ouEZhiBfUX9sdi36o29
         iVYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779362536; x=1779967336;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4r+ZJjB/A49+K5p9aefAxCswo6iufgazJ25EeAlptdQ=;
        b=mbO9Ka1dVdL0CM0/cn1fHSOnzYrWtrb35o4qnOizWtaAWks4oD+buM4V8yeJQWQBeY
         bv0So30hMU/oOh76YPuRbrvRewvYWPTkfMTMdtgFpIv9eO1bvn05sT9ij4IvGsCKoi1A
         ZKHPlxJZ6bwp+MWtyh52517+vj1haUZlG3vu1m+FBlZEI9VCnxo0aQv7gJ4/FRiykk5y
         LJhrWUobjQUdHGcPB2EUAyC7zi9jpqaV1rPox2kYJHu/w5mfcm3eI9o6B7Use1oZGC4Q
         /apREkinsYxLRysx7d6ty7dqSIWBQJiDShGbIAu4BDjapWgFg/nh6Elb6i9CV+LgwYYY
         Gm/g==
X-Forwarded-Encrypted: i=1; AFNElJ/WskNE/fJ3Pwq2SQJimwO2bGu+yYZQb07UhNv0bN2QYUamdWgYazdS1zZuYgiaeb6M8b4Esl1Y7SzT5yIuHH9h@vger.kernel.org
X-Gm-Message-State: AOJu0YxrEG32mnnTSOhIY1aCtZLzPAIKyCoawFeJjr92m5I35tkn7iQN
	56qhMwnFSu6CgUcdgTw0AJck8niInH4JU0QeXSzuCX4id4eoQtJguirxn9WxE4kl4MZ0YhKcPmU
	kI4C5NuoDsur2cZgFrYs2i/y011us1PrurinarKjty6xGZs6nqxa7KGekMvgLOq9Vt5RBI2/U
X-Gm-Gg: Acq92OFory69djh/cd4g/y59ejbpUrQHgmRzQfPlfR3YGcLCd30TBXe+bj2oqiv4j7p
	lQxyz+ws8gAp7rF0AX8JwXhhr4MTK2ZYnJk54G2JE9Q1TTN6m73r/cl88Dkilpl+uSs7pjcvW3o
	c8ZTAkOI2/ybSHT6lCQ7M9xU4MPZI7nqKqUC4wUsngM15mBWDlTp8SgB/rH/CxYraPTOFeXJAMg
	pSPY8LdYwgZEk2LAHn/SKeyvNX1orld+TnV80SC+l/IV8iFAaRFHlO6QDe4lsOS82lZ1VHxO2vl
	dzFbml4SFLZLj21rRxRCQdz9c6cprHiVnXbt85aqENj2inXeq7Hwn86ImQhwsgOaMqEfZdi0aRB
	vbg8dxX0mp3B6OOnoYeHtJjTW8OHjHv20Z66QiXx349Jmcx5pQnmIFqZ7kI4=
X-Received: by 2002:a17:90b:1348:b0:366:7dbd:cd50 with SMTP id 98e67ed59e1d1-36a45c6950amr2756174a91.27.1779362535575;
        Thu, 21 May 2026 04:22:15 -0700 (PDT)
X-Received: by 2002:a17:90b:1348:b0:366:7dbd:cd50 with SMTP id 98e67ed59e1d1-36a45c6950amr2756138a91.27.1779362534935;
        Thu, 21 May 2026 04:22:14 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a45c7fe7fsm1144008a91.2.2026.05.21.04.22.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 04:22:14 -0700 (PDT)
Date: Thu, 21 May 2026 16:52:05 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, shengchao.guo@oss.qualcomm.com,
        aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
Subject: Re: [PATCH v6 5/6] remoteproc: qcom: pas: Add late attach support
 for subsystems
Message-ID: <20260521112205.rq6g6ev56l4u47uu@hu-mojha-hyd.qualcomm.com>
References: <20260519-knp-soccp-v6-0-cf5d0e194b5f@oss.qualcomm.com>
 <20260519-knp-soccp-v6-5-cf5d0e194b5f@oss.qualcomm.com>
 <20260520082747.7seyyua4gfv256ev@hu-mojha-hyd.qualcomm.com>
 <e67907bc-ce96-4654-b210-2ae8f35cacc7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e67907bc-ce96-4654-b210-2ae8f35cacc7@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDExMyBTYWx0ZWRfX7NeEALD51EeP
 8nt1NYIWeczcrJSEkP5Lm/kBSGQHQWSZ7erNXDErFWTAcoC67uuUJtD9uA/obc/NG/kpT+NxgdE
 ZPoakmRQTIhyNRuSSkjAiIZ2VLHyzfzoldZ2pYDe+SnsZn6bwPFNp+zoClxDeEJixCBNhoHp0mI
 Ws8zrQAqDz/InwBMpsceUaOq8rUEjpgq6OWOeal1Odp2HHFrxVBILKqSUYe7zPzi8yZTJXAj/pb
 5PZUP4tohomvmXGiW4OPWxf5GWnWxDACOe1HMVq5w+DuCaHpC4X5OvOHDt1vprRU5CkpsXFMc0O
 8n2VSlyowq5adjVSKhjTyAGsK9WYII6LvCb1jII1WSp2/kKYRU8E8CY5hjBH/XRzqQV57OQZhuA
 8Hh/HA+fbXNxrVQppnaZg++CgZCCzvmi2Zq/fU0hl7vwAvqM8NSA/tOjKWuWmGZQAcRpHA99Q5i
 5dzmmG5zwl7KRd2KkAA==
X-Authority-Analysis: v=2.4 cv=Qe9WeMbv c=1 sm=1 tr=0 ts=6a0eeae8 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KqSLSXJeGewGWCaGpY8A:9 a=CjuIK1q_8ugA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: PwsJIVWXM5-fdqlSsisTRvsNp_Aog18G
X-Proofpoint-GUID: PwsJIVWXM5-fdqlSsisTRvsNp_Aog18G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 phishscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605210113

On Thu, May 21, 2026 at 11:42:49AM +0800, Jingyi Wang wrote:
> 
> 
> On 5/20/2026 4:27 PM, Mukesh Ojha wrote:
> > On Tue, May 19, 2026 at 12:24:23AM -0700, Jingyi Wang wrote:
> > > Subsystems can be brought out of reset by entities such as bootloaders.
> > > As the irq enablement could be later than subsystem bring up, the state
> > > of subsystem should be checked by reading SMP2P bits.
> > > 
> > > A new qcom_pas_attach() function is introduced. if a crash state is
> > > detected for the subsystem, rproc_report_crash() is called. If the ready
> > > state is detected, it will be marked as "attached", otherwise it could
> > > be the early boot feature is not supported by other entities. In this
> > > case, the state will be marked as RPROC_OFFLINE so that the PAS driver
> > > can load the firmware and start the remoteproc.
> > > 
> > > Co-developed-by: Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
> > > Signed-off-by: Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
> > > Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> > > ---
> > >   drivers/remoteproc/qcom_q6v5_pas.c | 58 ++++++++++++++++++++++++++++++++++++++
> > >   1 file changed, 58 insertions(+)
> > > 
> > > diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> > > index da27d1d3c9da..ac2a00aacd2e 100644
> > > --- a/drivers/remoteproc/qcom_q6v5_pas.c
> > > +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> > > @@ -60,6 +60,7 @@ struct qcom_pas_data {
> > >   	int region_assign_count;
> > >   	bool region_assign_shared;
> > >   	int region_assign_vmid;
> > > +	bool early_boot;
> > >   };
> > >   struct qcom_pas {
> > > @@ -510,6 +511,57 @@ static unsigned long qcom_pas_panic(struct rproc *rproc)
> > >   	return qcom_q6v5_panic(&pas->q6v5);
> > >   }
> > > +static int qcom_pas_attach(struct rproc *rproc)
> > > +{
> > > +	int ret;
> > > +	struct qcom_pas *pas = rproc->priv;
> > > +	bool ready_state;
> > > +	bool crash_state;
> > > +
> > > +	pas->q6v5.handover_issued = true;
> > > +	enable_irq(pas->q6v5.handover_irq);
> > > +
> > > +	pas->q6v5.running = true;
> > > +	ret = irq_get_irqchip_state(pas->q6v5.fatal_irq,
> > > +				    IRQCHIP_STATE_LINE_LEVEL, &crash_state);
> > > +
> > > +	if (ret)
> > > +		goto disable_running;
> > > +
> > > +	if (crash_state) {
> > > +		dev_err(pas->dev, "Subsystem has crashed before driver probe\n");
> > > +		rproc_report_crash(rproc, RPROC_FATAL_ERROR);
> > 
> > I am not sure if this is already discussed, but what if it is the first
> > crash with recovery and coredump enabled? What would be in the dump,
> > nothing? As there is no segment, is it expected since Linux did not load
> > this?
> > 
> > This is even true if it is a crash after a successful attach.
> > 
> 
> It is suggested by Bjorn:
> https://lore.kernel.org/all/qfls6xlvfppqw7p6rjpmzqesh6sbob4myfc6dz47qh3jywqrjk@5xiutkbybk5d/
> 
> I did a hack to test the recovery by setting crash_state true, it can recovery
> (stop and start) successfully with below patches:
> https://lore.kernel.org/all/20260519-rproc-attach-issue-v2-0-caa1eaf75081@oss.qualcomm.com/
> 
> For coredump, it will return from the first "list_empty(&rproc->dump_segments)" check in
> rproc_coredump as segments are not configured in attach.


I was not against any of the stuff, but mostly checking, if we agreed on not collecting dump
for first crash when soccp minidump is not initialized which falls back to full dump of the soccp.
I see soccp minidump id in the downstream but we have not added in 6/6.

> 
> Thanks,
> Jingyi
> 
> 
> > @Sibi, has this series been tested on Glymur with KVM?
> > I don't see the iommu property in the below patch.
> > https://lore.kernel.org/lkml/20260403-glymur-soccp-v3-1-f0e8d57f11ba@oss.qualcomm.com/
> > 
> 

-- 
-Mukesh Ojha
