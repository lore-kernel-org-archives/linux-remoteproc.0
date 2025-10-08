Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88A8B2BFC8F
	for <linux-remoteproc@vger.kernel.org>; Wed,  8 Oct 2025 07:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759908932; cv=none; b=PeXWmMSgDRDBsdGGq6J+J55W+gIQ+tZYBUHOpEo7H1lel39xZ15R5yxB6g6yIqmz5hO6iyAmSzV6UYiMoJnuvQJa4Qw+dcmdMMKcC1V511QkihbirNaQetitI12+T7setrdGnVBg1JQf6bLqqzSfVn+FSJNYTjUvMWVPRUFZpec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759908932; c=relaxed/simple;
	bh=F4Jf3/Jx2Wrf9ObJ98QM9rPrenllrUtXKxkbFh2XhXQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PbdvPkroYHsxbL/r+Iy3R9Z66u4dyvLwgbHqq+bnMKcRCIv9UXOGyWrmZMGF/DIOS/Y4MofAl4kvupXpAHaJLY1Y+RA+nOQa1p3meCwzuueCq2HN3HqruHCk2zF6sHGq96JaJbfaz4d/X3+oQd3sLP57L7EoPzunCgP0b6NDxXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cV2xWan2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cV2xWan2"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59803kcL026455
	for <linux-remoteproc@vger.kernel.org>; Wed, 8 Oct 2025 07:35:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iiYKnuUQureOztNmxjz+R23v+NHrM5vRIegiMWn4T4g=; b=cV2xWan2lpcGhei+
	S2278UgtDFr6SN4gmmI/rpGUbpYCIIrxysHH0c/NZ6nfB0iXlaTkXkWbz4AlamlN
	IrBi4dRtWQze9TZUcnZ8jSrsQocbbRQdQxh7V4PE2mRXvc8tyAtQFSVwCCqVMcvw
	cV4uj206WqbYSK8/U/8XGPrLdZg1mK4/ws3BmONyB+8jORgwbtDLeCWG3yITPeis
	c43d/Hr3pmCAi3ytoso3tZi6gMp1g4i5ZCDaseUOVpakaOD4B9a+UyW/bFvRM+lE
	ZsLenuunxelrpQMYFIC8NMw8jSefUGckMzYDgw1gkz8VMbhsHplYxgmJ5iWHGpxW
	ItYwXw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jut1smev-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 08 Oct 2025 07:35:29 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-780f914b5a4so6644526b3a.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 08 Oct 2025 00:35:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759908929; x=1760513729;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iiYKnuUQureOztNmxjz+R23v+NHrM5vRIegiMWn4T4g=;
        b=a3j6FnO1Vxe1nwE3vGxGB+2pqZYBCNvmH6bf1FAk8LO6mXJkTnCCQj95X/h72nxq1b
         p/WZadv8GpQvMuvocsjQuWRKPMy8xvwx23as7O/NpwAaz3/pOSL5Ya1QMIo+ejk+peUZ
         zn/j7pOFDe1KdixEQHindrbZatJl7ayB5V1JkgmerfFt7KyY0T6wSp6h8uiMhnWU0wcJ
         9oijWaJ3XNqOdHf2SigxGMTpuOK4faXnmF4C43/ZgDhYvzNCrLELA+XBq7uYAR1BGHGW
         yN7VFRRIF55PbsPDG95cOseTP6nLr1+VcvvktfSDOgmgYOcXpY0FKYRPnULmOhLAhZ0U
         cSKQ==
X-Forwarded-Encrypted: i=1; AJvYcCWC01aVQ5YwYnOVbOtuxrleUdegw53QO0FQL8tHZqnXfWpQgRhw0Sf5UzNRAa6G3jIZmXyKQRD2V/qHDORucxai@vger.kernel.org
X-Gm-Message-State: AOJu0YzPc0usFWz4qcRP/81lliYiuEV6Gt1pvgLrbWnyc4kNZwFSQxW8
	cisXbK9qQWdFGSM2ndsfnO627XFOBliD/T3vmUApKObj4j6v2CyA2uMtRlMSmrnbgq/NQsiTAm4
	QfunMvNEWX4ULr/xsuKmzx+BA32zSlIlMK//XqshLLZb922b5Oy7s5sqDJXOoDgF3eMAwyPkj
X-Gm-Gg: ASbGncsdFB60opMv4SVZWTyscIA2t/H1cTBccXMLjb6augmdtteauJUjCuESkauCfs3
	jF1hJMcx5GMWF4bgkwOstuamYbW/VFh7nuiuP2GNZhw1OFkaMH6i0kbfQVfNhnqCXrPItuZUuNc
	wm8V28yzzGScY5+xkbT8rvRAoi8bNM6QaxSQxtrB3DscH3jIdiIJHjvOxbiuhOcajhuhaHocitQ
	LXAv6P/kK3Aq443NqMvWWlQ9cYdXve8lFFZQVfD2QY8Ph3j0FnKOYpqILowiYhKoY3BKwrz5xgz
	WBh1bdBUSjQm7DIQfcgSvFKwvDqfVYDxJIzrb6Ctn/aWSVNPKd6W6iEjQaqwnYhkp9x5a7qt
X-Received: by 2002:a05:6a00:9298:b0:781:9a6:1175 with SMTP id d2e1a72fcca58-79387c17855mr2747282b3a.25.1759908928366;
        Wed, 08 Oct 2025 00:35:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEeZSMKoKEdQQfj+KuO8JF5SEBLYOmlTZtL7VL9jTiwIRBF7GJdJ3rVJjNWFYe4E2jpO7zRbQ==
X-Received: by 2002:a05:6a00:9298:b0:781:9a6:1175 with SMTP id d2e1a72fcca58-79387c17855mr2747235b3a.25.1759908927674;
        Wed, 08 Oct 2025 00:35:27 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78b01f9ced7sm17817725b3a.15.2025.10.08.00.35.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 00:35:27 -0700 (PDT)
Date: Wed, 8 Oct 2025 13:05:21 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 06/12] firmware: qcom_scm: Add a prep version of
 auth_and_reset function
Message-ID: <20251008073521.ky5cxxrxntundezl@hu-mojha-hyd.qualcomm.com>
References: <20251007-kvm_rprocv4_next-20251007-v4-0-de841623af3c@oss.qualcomm.com>
 <20251007-kvm_rprocv4_next-20251007-v4-6-de841623af3c@oss.qualcomm.com>
 <juirzpdb7ltx32fdiu37q3fd543fctvtssnro5qv4satninz2z@3bxup227lvvy>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <juirzpdb7ltx32fdiu37q3fd543fctvtssnro5qv4satninz2z@3bxup227lvvy>
X-Proofpoint-GUID: QkoU1ZSwHBJ3jBWlOLZT7hpuc1O8UPKu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAyNyBTYWx0ZWRfX2Rc8Pc3/uLdh
 BFKYQ1bBFDVIzTmk3V0Jk61aiW1Gl1UkGrXZBPwFPIcIjFAXk2EvSbMb7mZUZ66HNV7GppXd/eE
 5Q1Co3ZlGJYiGzFJLaMwxm2RvWqxBI1+vPRPFDnhf5cHWExIiKwxspwMtuR4Z0wUFNB3P4j0I/j
 AwvZ7R7TwaLoazm7V3ETwJ/b/Bd3JbkjQvUUTy5a+mb/DZgeldzPA8aaY2FbJnUA5PIoyiTYo/Z
 5vdMJy7qwNCpvv+dYFtYOaC8eC8WNw4HODG0QwVo/XncWY4KEK3dve3mD4ccOVpft+K5YQ0X5xD
 ToPGFB0PuGrsB2gJTdha8mVuj/Pat+dC+Yscvy7dWOUDmYod4pf72vTh9qOnYLAGiyq5KoAlbaD
 6/H62gSCCOwgjm/Uhhr1AzZ3oLsbEQ==
X-Authority-Analysis: v=2.4 cv=Vqcuwu2n c=1 sm=1 tr=0 ts=68e61441 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=H8e-7uY52fie2kMTd9UA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: QkoU1ZSwHBJ3jBWlOLZT7hpuc1O8UPKu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_01,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040027

On Tue, Oct 07, 2025 at 02:37:40PM -0700, Manivannan Sadhasivam wrote:
> On Tue, Oct 07, 2025 at 10:18:51PM +0530, Mukesh Ojha wrote:
> > For memory passed to TrustZone (TZ), it must either be part of a pool
> > registered with TZ or explicitly registered via SHMbridge SMC calls.
> > When Gunyah hypervisor is present, PAS SMC calls from Linux running at
> > EL1 are trapped by Gunyah running @ EL2, which handles SHMbridge
> > creation for both metadata and remoteproc carveout memory before
> > invoking the calls to TZ.
> > 
> > On SoCs running with a non-Gunyah-based hypervisor, Linux must take
> > responsibility for creating the SHM bridge before invoking PAS SMC
> > calls. For the auth_and_reset() call, the remoteproc carveout memory
> > must first be registered with TZ via a SHMbridge SMC call and once
> > authentication and reset are complete, the SHMbridge memory can be
> > deregistered.
> > 
> > Introduce qcom_scm_pas_prepare_and_auth_reset(), which sets up the SHM
> > bridge over the remoteproc carveout memory when Linux operates at EL2.
> > This behavior is indicated by a new field added to the PAS context data
> > structure. The function then invokes the auth_and_reset SMC call.
> > 
> > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > ---
> >  drivers/firmware/qcom/qcom_scm.c       | 48 ++++++++++++++++++++++++++++++++++
> >  include/linux/firmware/qcom/qcom_scm.h |  2 ++
> >  2 files changed, 50 insertions(+)
> > 
> > diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> > index 7b4ff3cb26ed..ab2543d44097 100644
> > --- a/drivers/firmware/qcom/qcom_scm.c
> > +++ b/drivers/firmware/qcom/qcom_scm.c
> > @@ -791,6 +791,54 @@ int qcom_scm_pas_auth_and_reset(u32 pas_id)
> >  }
> >  EXPORT_SYMBOL_GPL(qcom_scm_pas_auth_and_reset);
> >  
> > +/**
> > + * qcom_scm_pas_prepare_and_auth_reset() - Prepare, authenticate, and reset the
> > + *					   remote processor
> > + *
> > + * @ctx:	Context saved during call to qcom_scm_pas_context_init()
> > + *
> > + * This function performs the necessary steps to prepare a PAS subsystem,
> > + * authenticate it using the provided metadata, and initiate a reset sequence.
> > + *
> > + * It should be used when Linux is in control setting up the IOMMU hardware
> > + * for remote subsystem during secure firmware loading processes. The preparation
> > + * step sets up a shmbridge over the firmware memory before TrustZone accesses the
> > + * firmware memory region for authentication. The authentication step verifies
> > + * the integrity and authenticity of the firmware or configuration using secure
> > + * metadata. Finally, the reset step ensures the subsystem starts in a clean and
> > + * sane state.
> > + *
> > + * Return: 0 on success, negative errno on failure.
> > + */
> > +int qcom_scm_pas_prepare_and_auth_reset(struct qcom_scm_pas_context *ctx)
> > +{
> > +	u64 handle;
> > +	int ret;
> > +
> > +	if (!ctx->has_iommu)
> > +		return qcom_scm_pas_auth_and_reset(ctx->pas_id);
> > +
> > +	/*
> > +	 * When Linux running @ EL1, Gunyah hypervisor running @ EL2 traps the
> > +	 * auth_and_reset call and create an shmbridge on the remote subsystem
> > +	 * memory region and then invokes a call to TrustZone to authenticate.
> > +	 * When Linux runs @ EL2 Linux must create the shmbridge itself and then
> > +	 * subsequently call TrustZone for authenticate and reset.
> > +	 */
> > +	ret = qcom_tzmem_shm_bridge_create(ctx->mem_phys, ctx->mem_size, &handle);
> > +	if (ret) {
> > +		dev_err(__scm->dev, "Failed to create shmbridge ret=%d %u\n",
> 
> 	"Failed to create shmbridge for PAS ID (%u): %d\n"

Will apply, Thanks.

> 
> > +			ret, ctx->pas_id);
> > +		return ret;
> > +	}
> > +
> > +	ret = qcom_scm_pas_auth_and_reset(ctx->pas_id);
> > +	qcom_tzmem_shm_bridge_delete(handle);
> > +
> > +	return ret;
> 
> 	return 0;
> 
> - Mani
> 
> -- 
> மணிவண்ணன் சதாசிவம்

-- 
-Mukesh Ojha
