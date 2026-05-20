Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DDF53CBE78
	for <linux-remoteproc@vger.kernel.org>; Wed, 20 May 2026 10:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779272326; cv=none; b=OL+nNXo3pPs4sjW7QyYp7+D8V8NoKNquUoPJZFqVzFQ6V3BWB5g2OlpzOkVmojftTPjxNoP5kBT7uFFtIYxKm0Nc725NFIqVuqlRdaOlO1G6w1hrtIO1sJoMVpnD4oRZHXJzTHODM8PBZmQaIidv3IO1VhxuffwcJylIV+UXCpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779272326; c=relaxed/simple;
	bh=9GvTCEpKamo7Puzjy5EVV1bfnNMCGtFBMZiQDoyLqgE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kv9wa84LifPKHm4RcHZt0uQsp9R7YJv94wTT6Lwhy2RaDItpvZwtjtnZjpynIRadNErKRqlJrp4aQUl3pbRE8FsAh319o4lLrN76NUJzvrIbG9NCuhPIhibsjz/ICuywzkAsdkvCkUg55NR6zNv8cLzSFIw9XtEPvP9LH6DFrYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T5A5FBU8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ku1N3QbL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T5A5FBU8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ku1N3QbL"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K9nOmF446356
	for <linux-remoteproc@vger.kernel.org>; Wed, 20 May 2026 10:18:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+k+oT4e6hBc5LIJSb/AfTwEM
	WHG0zOLB6Gqph0QfZLc=; b=T5A5FBU8B4Q49FYw6rsT+wuTQ1paFOGadPVRhIXk
	/I44B6NrnHNaxKO8yFIc2n1wxV/1tAfgq0BLZoOwssO+FBr2294U/r0rcjgCjWPH
	qSs28psZkfWx+V5KMxH1aB5icaQKhc0Wi5vTKnNk4iT+kxPFDSr5pEVt4gSvrbA1
	D7Q0F61L9IJu30hwCYZ55/wFWJZf1jtsnyjWGQInP9v2TQchtGLqPnKmmglfHmZh
	mCPIyD3lXpioILVw1HmEcyNWXBL9PDMnMhjSW2e2IT8oPvedqy5F99X8C4xYzF6T
	dG6TQYwPk+CNhK+Yuj/ExUV0fv7f3QBuDB8JIh+O7aJ4ig==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9anrg3np-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 20 May 2026 10:18:38 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2efc342ef15so5997380eec.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 20 May 2026 03:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779272318; x=1779877118; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+k+oT4e6hBc5LIJSb/AfTwEMWHG0zOLB6Gqph0QfZLc=;
        b=ku1N3QbLSrdyrL+/Pb3++SEhkOor2R3bg8JMZl9PmDcNsSaFd4rYgc3nvESeCHY/cU
         0/vUNlv0PvB9oeRGEmnnxx2cCDocW3tifXazvFYc76fQCqCJq+2vVINAC8Mi720kaxH+
         lXILxisaj4DFseLO5Ze8CMo/08UA8GVOW/4NUvd6x4IUR1QUCZaM7DORnI/t6P0F1TYJ
         ab2H8Kv+0/LapooyV3cm8d4Ikdyu5j0tIIMVzY2VR0pfCSnztuKz19vg0MfK6mg6HcP7
         GxtBPAAyBINonjqqfKtB3598RxqvuRewPMV68OpJxYptUfigmE/WJRepOucK4CD4KqaP
         HSKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779272318; x=1779877118;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+k+oT4e6hBc5LIJSb/AfTwEMWHG0zOLB6Gqph0QfZLc=;
        b=bgfKjoR9e5ax2GyX2cD7H7VVinDuBFF041ShDzLWeMhheVwbaZ1JklptvAYSZENkWg
         R5UqIgdUVCLB87Pp5Tn9HPd2JNJ7SlMkpqTxZF5Vyk5pM+K0BKbzS/rGRYLtRJv9Bj2P
         Jm3QUANL9aWG7N5TCVGZLT9M+dKkbB5nvnusKR+k3M2Ixc0TcrNdlpIhKsC2nKjfwAbi
         KVQXITQ5SMQlj1JMQqx44KVeMaIwXvQshpzolLfpJwubBuhHQWBZxaFnxLZLZxT/SXnH
         fWiOQ9cTSzp2WMWccIXR75IzWDcn4115X7S69x/HJ5op+XQbT6E5GEwE2PgX6KG9WFdi
         y61g==
X-Forwarded-Encrypted: i=1; AFNElJ8OCddr5c/Ktlr72FJGs6dzqQAND61PxkY1h14gGEYf2alIcfyBfrOksfnjEis6jO77xNky75e6f5a64aFBEh3k@vger.kernel.org
X-Gm-Message-State: AOJu0YyCojbblnwZ5fXHL/B+XtJrAixNgFek9o0dBWQMC52tJHf6XP+I
	P2rLKeTZzEVfc/qJDRen6LJH3iNAT6SYeS1LSSmLbPJrUzqithuMMdjkK73RSy2lP8zpMtb929+
	8kW2WSil2sNljbIAte6bfDqs+bHH3mktX2lX2fL5qfAJoXMrnZ4YZKUy6RA5iHgDaDTrm0w3k
X-Gm-Gg: Acq92OH8E3wMRGtcfak87sEP/zcs/+qX5uXhIxNAQWjTcq2LZgFrPK34S6yUE0myW11
	poRiBwLV4NGFVl2Pn1GHnC7GTwgpd1DUVn7nv+hUIXsjMz7jBTD+xG2Tw85hOmUakCzwtFet2vG
	C4ghi0JOdDSKr/XS79OQoo9dEN5kYuovj429QMyFROIY+1b4cshdLUaiWZrxxWr6OHfG5vfI+r/
	p8RwQvdrLdmSPbtfW2XS0sDqPov51cwjZYMhfu3Q+gBqFwjmtzBm/+ZhZSHZQ1Wrkrf6x/DJR6U
	TPXh5vSeD77JyDf3Uk2zWQ162rgvdURXIIqyd5Cbbu6ZnLixyuqztjRE6cObYxpU0e7Yg9n2Kes
	WyRoRm2tVO87kF+dfTER30Kv0lra4JH256bzCZhzx0VPwlotx1wfsu2xR3ZG4Fesq
X-Received: by 2002:a05:7300:e430:b0:2c1:558c:16e1 with SMTP id 5a478bee46e88-303982865cfmr10691289eec.4.1779272317888;
        Wed, 20 May 2026 03:18:37 -0700 (PDT)
X-Received: by 2002:a05:7300:e430:b0:2c1:558c:16e1 with SMTP id 5a478bee46e88-303982865cfmr10691266eec.4.1779272317278;
        Wed, 20 May 2026 03:18:37 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3041ab8282bsm1006139eec.31.2026.05.20.03.18.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 03:18:36 -0700 (PDT)
Date: Wed, 20 May 2026 18:18:29 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
Subject: Re: [PATCH v6 5/6] remoteproc: qcom: pas: Add late attach support
 for subsystems
Message-ID: <ag2KdR9ljtpEsmUa@QCOM-aGQu4IUr3Y>
References: <20260519-knp-soccp-v6-0-cf5d0e194b5f@oss.qualcomm.com>
 <20260519-knp-soccp-v6-5-cf5d0e194b5f@oss.qualcomm.com>
 <20260520082747.7seyyua4gfv256ev@hu-mojha-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260520082747.7seyyua4gfv256ev@hu-mojha-hyd.qualcomm.com>
X-Proofpoint-GUID: lcNij0O4EqHj24fkL7xkWpvVyX8tIsOK
X-Proofpoint-ORIG-GUID: lcNij0O4EqHj24fkL7xkWpvVyX8tIsOK
X-Authority-Analysis: v=2.4 cv=UuJT8ewB c=1 sm=1 tr=0 ts=6a0d8a7e cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=aI_LCnMVjoIqU1kGItIA:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDA5OCBTYWx0ZWRfX4UADDFOuIGsQ
 vaPZfG5mfMsNiPyazJNZGDS7pCsmdmJoc1R6TU7pPycwG9EK5cXQ37xaGmPVgrQjBuAATcwpwnD
 qEilg4qATRL80iHdV2pLYG0YDEqYEw+ND6SuGxG1QYH7iQcMxZZsVqMn/ACeO5vn6ZJtvy3oaYa
 KM59EqWqSi59QKz2bVrd10fcFLdZCnNr0BuFGlGRlTrYUXRKqk0Ieo6sDHTzAOqhf3t6kAsVD2o
 LyDDg3YpoQLGViZncDuBmvQSWXvrI4XkVEYXwU/YahDoBIJZzYvk7vbSkHmf9aq5b1vLboL+BhH
 cOfSHc5B26PY3RJtR2OrbWgTpjOCfv6YBT+L2XM7SGXEvUEzAc46Kywb23Wy2fIGlsargNfnwRe
 XbN/luzMaFUhCQvbC7kml4gJ6nI7J8CW2VUI+11GBpvlNEm8iBhsWWpoIcazKlSMkcwUEZGc29O
 SsHBYP0ah9olaxeadpg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 spamscore=0 malwarescore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605200098

On Wed, May 20, 2026 at 01:57:47PM +0530, Mukesh Ojha wrote:
> On Tue, May 19, 2026 at 12:24:23AM -0700, Jingyi Wang wrote:
> > Subsystems can be brought out of reset by entities such as bootloaders.
> > As the irq enablement could be later than subsystem bring up, the state
> > of subsystem should be checked by reading SMP2P bits.
> > 
> > A new qcom_pas_attach() function is introduced. if a crash state is
> > detected for the subsystem, rproc_report_crash() is called. If the ready
> > state is detected, it will be marked as "attached", otherwise it could
> > be the early boot feature is not supported by other entities. In this
> > case, the state will be marked as RPROC_OFFLINE so that the PAS driver
> > can load the firmware and start the remoteproc.
> > 
> > Co-developed-by: Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
> > Signed-off-by: Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
> > Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> > ---
> >  drivers/remoteproc/qcom_q6v5_pas.c | 58 ++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 58 insertions(+)
> > 
> > diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> > index da27d1d3c9da..ac2a00aacd2e 100644
> > --- a/drivers/remoteproc/qcom_q6v5_pas.c
> > +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> > @@ -60,6 +60,7 @@ struct qcom_pas_data {
> >  	int region_assign_count;
> >  	bool region_assign_shared;
> >  	int region_assign_vmid;
> > +	bool early_boot;
> >  };
> >  
> >  struct qcom_pas {
> > @@ -510,6 +511,57 @@ static unsigned long qcom_pas_panic(struct rproc *rproc)
> >  	return qcom_q6v5_panic(&pas->q6v5);
> >  }
> >  
> > +static int qcom_pas_attach(struct rproc *rproc)
> > +{
> > +	int ret;
> > +	struct qcom_pas *pas = rproc->priv;
> > +	bool ready_state;
> > +	bool crash_state;
> > +
> > +	pas->q6v5.handover_issued = true;
> > +	enable_irq(pas->q6v5.handover_irq);
> > +
> > +	pas->q6v5.running = true;
> > +	ret = irq_get_irqchip_state(pas->q6v5.fatal_irq,
> > +				    IRQCHIP_STATE_LINE_LEVEL, &crash_state);
> > +
> > +	if (ret)
> > +		goto disable_running;
> > +
> > +	if (crash_state) {
> > +		dev_err(pas->dev, "Subsystem has crashed before driver probe\n");
> > +		rproc_report_crash(rproc, RPROC_FATAL_ERROR);
> 
> I am not sure if this is already discussed, but what if it is the first
> crash with recovery and coredump enabled? What would be in the dump,
> nothing? As there is no segment, is it expected since Linux did not load
> this?
> 
> This is even true if it is a crash after a successful attach.

Good point, Mukesh!

I guess we can have a check in qcom_pas_minidump() to do nothing 
in case state is RPROC_ATTACHED?

Shawn
