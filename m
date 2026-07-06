Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FC473AA4E7
	for <linux-remoteproc@vger.kernel.org>; Mon,  6 Jul 2026 17:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783359124; cv=none; b=JEpRK/ECi50RZ7MRXJH3xKhL7kRVjTcJM6hAWgeFHzMExFjUd1e5+DKppqbiDM8HjwkgZETOH/N2yNHseIaRgMC5qmIRoGJLzZeySv25dqxN2JpBM40ir1bNt2UJZ5t5X9/F+vKwOxUqLtNfMLoirVHQFJ/WSj3y11ogGtMiXeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783359124; c=relaxed/simple;
	bh=XE18ZsxjLi84XUKQEP8W66jJbMRQO4F1YjAnbU0F+RA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SE8FYe7S7UVV60Lj+XYk8cD5LhufDXCLw4lnlxHah+D48wnsdw5r8E/846Fpm1enVWi9sYPspGb//oZ+VUDTpSBq1pxt1hjijU+PmD/g1DbuMMywfVwUpDINdiVtZMDNZihDt7o7kBFChix7LN+h5aMCS/e99hlg/H2y8NiIFI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IMzSRlpG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ht4NWo/5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IMzSRlpG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ht4NWo/5"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FFASO833222
	for <linux-remoteproc@vger.kernel.org>; Mon, 6 Jul 2026 17:32:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bH7ft7EpbgAlMoerwx6sDZPk
	Lvb5tLjWY/Dxs8VQ1tk=; b=IMzSRlpG4SLSd7P4qGK2S3t8cRMUQsWf9CwWZIX/
	kMt/NM4hOBSN1Kq621neogdkBl7620Dwx4eQ3/o9EvCAvRX1sG4JM7giiyzw4gBw
	8cK1ovnYiZz1qTZJMy87uFP+Se0oCv2tY/SkK5HPhFJxajVZlr0n/TEV83i4bhOK
	gU5KRezQ0jFo13q4Qs0ECGKUmrUIYjQp6CeGNKRLy9zznk/e5Xz6c1/WA0TVds4m
	9mqpLZExUjc2B1ABRNmuehZaUhtvZsVemjFAPCuUMyA/hGEm/4j72+NDErSOiT0e
	LCByZEtwR/nHuOJ9yRmFW8QvjdF65FGF/TwHjiTfmrl06g==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a98j29t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 06 Jul 2026 17:32:02 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c9aa197d5easo46004a12.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 06 Jul 2026 10:32:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783359121; x=1783963921; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bH7ft7EpbgAlMoerwx6sDZPkLvb5tLjWY/Dxs8VQ1tk=;
        b=Ht4NWo/5LG/y9cqE/AS8/gqZ4FZmQp2Jhan90w92pFZCUAOBJWKGAb1rtPq9gHOH97
         tBLf/t3poFgvJVfSYa40FoknVohFnwMGXDLNp8q+KONM2ZCHdw2AtZZnEgR1tHUPlH1x
         YkexmAbqZUDDnckyICL7w6qnHzH1Io/ZT2zDJZAOcpn4j63JCcSJRdKNh6vlyJC5Vj0C
         RZ8oWauJ96T1DzeBWkLMRcdLAsy/LuDe4CV5jJGRZH/JAlULhFsXRsWa/UjhbEnTUgRD
         vpzspgeswZMi4cXr5ZoGCNT7TUWwSaU+XxuSCINTEuVDw59eX0DPRVj8JBovEy84E6qS
         ohOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783359121; x=1783963921;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bH7ft7EpbgAlMoerwx6sDZPkLvb5tLjWY/Dxs8VQ1tk=;
        b=EbnN+PU8bnOyOcJLhi5CnJwzoNo7CJYeK+oUymlTsdIizJ9hW3ENoSK98lvvlv9w8D
         J4CDj2l17VOVbx79ma3AOWVVgMV5L3KcrbCQosPGHvJGE7h2aIidA0z84i6OT5romLUe
         erAmsoJxd0P1YZ3TEAZAtG+cHuI9G9uJXZOfRJIjt1DBBelKWDdRcHiupHgVNlxMBSFq
         VhIdySp+1l6SzXN5MgR3TGP+t3vodnBii/KM3t/rzsI3G00ym8ztPKqKJPNh1aCunHbI
         qyqe6iJmsrIbHzf7472ofUEacnpwnP+e1nyG1Qcoat6PwNjeGnVWjNocVkW91rVMULC+
         Tazg==
X-Forwarded-Encrypted: i=1; AHgh+RoHU22im/hhoGzzAN08Ex5CLk7v5qmolCJtq7zvmLn7HIwk33kov2tL84ZHsJRtJjie9b4gz7K6eFCb3dDU/s6X@vger.kernel.org
X-Gm-Message-State: AOJu0YwMWA+aLSlDm4n1kgEmJloD5aW5896+M5WVmR8Gup5u5nlxpSV8
	5u+AR3ISOiZRv8sNZgAEd8/AM9CUdEhRny/ZXykwH31jew/kYAjU2qTSqVnZieyWZ9gbu5XitVX
	P+SqU25hLIq0xkfUb7xhyrZgcADvYelR6tMNALKwYetTxS6djhAuItpptzxe2vAjVHqzFlAi1u1
	dJUEXd
X-Gm-Gg: AfdE7cm46LiYNoLT2UT2JrepnDjPnEM6hHiXyxtTCHpCzUADR7tQ5yT+zk0FIa1GP2p
	ApIRxnux7/+2Kjpt+8f+E0Z9KTTqaBwyVE7TJA8C0m8urBsBnsE9NVP7Ng1KFPNeXVHMGPfKUre
	QM9TcQdrwxFpq9oI0RZWWKrCMboSk7frWiVwmmYUWfDvnK8cyEQyswfs1f4TW4pyl8bgQ4uduZF
	EIWVmhW6HtKvUFjpAJ3hlxJ26OYRt/jwYU0XlP9CLbnHmcNYfbsjM/r8zHjMBglVS56AtO/9SId
	8LEAglA+vaKylWFBDYMmswvzgTIX5Y1sBPBd+lvLKV4/8c1mfT5IWszRDftPcukaN9mFB25v4W8
	RrzIl4Wd8pA978cyBoeFNEqCVr+dqPs4T4vwiSQ==
X-Received: by 2002:a05:6a21:4d8b:b0:3b4:b259:74e3 with SMTP id adf61e73a8af0-3c01cb9c437mr16566250637.31.1783359121247;
        Mon, 06 Jul 2026 10:32:01 -0700 (PDT)
X-Received: by 2002:a05:6a21:4d8b:b0:3b4:b259:74e3 with SMTP id adf61e73a8af0-3c01cb9c437mr16566189637.31.1783359120524;
        Mon, 06 Jul 2026 10:32:00 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0b816a42sm88488369eec.9.2026.07.06.10.31.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 10:32:00 -0700 (PDT)
Date: Mon, 6 Jul 2026 23:01:54 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v4 1/6] remoteproc: qcom: fix sparse warnings for __iomem
 annotated mem_region
Message-ID: <20260706173154.g3vhb52tkjchftmu@hu-mojha-hyd.qualcomm.com>
References: <20260430191253.4052025-1-mukesh.ojha@oss.qualcomm.com>
 <20260430191253.4052025-2-mukesh.ojha@oss.qualcomm.com>
 <62c91b74-ca1b-44be-8771-669aa686ddbe@oss.qualcomm.com>
 <20260622155050.yvgffdapdjb5f4fh@hu-mojha-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260622155050.yvgffdapdjb5f4fh@hu-mojha-hyd.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=SpigLvO0 c=1 sm=1 tr=0 ts=6a4be692 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=Q2gTMR_NNKpv4EgecgIA:9 a=CjuIK1q_8ugA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE3NiBTYWx0ZWRfX+37vhmRmYtia
 9hLjxdEUDQrQuEf7OvLzNM410SOx/8msf3bV7XF1VDje04u/okWrm3Jq/Q9msOkBc5z+IckFz8G
 JH7ia2J6llmL7ENqIXpOb4gKUGLdbb3SElhE9HcHIdIUSS7fLhROf41p+ZwVreJlVMUiZh0ueN7
 jvm1rABQgRCLDuEF3i6BaRXWbDqkZzVOl9ccq29eK8h8SR9Dw93KeYGosYbQr7UKlD6l2GYFMU4
 jI3rGIv1QUABZ1lJrFDmYIy9NhDKGBu5ah+dNss6e6yoaOx6OKs1s2aDFdLHj0kr+rm8Kfp/owN
 lr1uC+NZ8vuf7Il1seIEeVLzvlVvB+vgrN/8RPX3+iNYDxQJwWdIpjcwsi3wTRzYNF7IcNZl6t8
 YMZiT+BnyrvXC1jZrU19tOXQiuDy+n17+YfnxXQM6qvSeMgZCXUR9BkUKnjyoEBPjcVFBV6tivx
 0WAGs1/IcBH/ObrEcdw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE3NiBTYWx0ZWRfX+9mDGNe6cpjc
 ESVkp6e6dA+LHHwOEa9ohp7tOysgPGj7YkOtpg9sTaKNNlLnC02DlYPJeLMVWYG4ZMYLpZtUp2x
 51D5egpUPzoTI3TaG+Zw84hFTCo8f5Q=
X-Proofpoint-GUID: XLDKGxB9H6C8j_Fe_J_4amy2TU8trUdY
X-Proofpoint-ORIG-GUID: XLDKGxB9H6C8j_Fe_J_4amy2TU8trUdY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 clxscore=1015 phishscore=0
 bulkscore=0 adultscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060176

On Mon, Jun 22, 2026 at 09:20:50PM +0530, Mukesh Ojha wrote:
> On Thu, Jun 18, 2026 at 03:53:22PM +0200, Konrad Dybcio wrote:
> > On 4/30/26 9:12 PM, Mukesh Ojha wrote:
> > > The firmware memory regions in qcom_adsp, qcom_pas and qcom_wcnss are
> > > mapped using devm_ioremap_wc() / devm_ioremap_resource_wc(), which
> > > return void __iomem *. However, the mem_region (and dtb_mem_region)
> > > fields in the respective driver structs were declared as plain void *,
> > > causing sparse to flag address space mismatches:
> > > 
> > > qcom_q6v5_adsp.c:639:26: warning: incorrect type in assignment (different address spaces)
> > > qcom_q6v5_adsp.c:639:26:    expected void *mem_region
> > > qcom_q6v5_adsp.c:639:26:    got void [noderef] __iomem *
> > > qcom_q6v5_pas.c:141:45: warning: incorrect type in argument 2 (different address spaces)
> > > qcom_q6v5_pas.c:141:45:    expected void const volatile [noderef] __iomem *src
> > > qcom_q6v5_pas.c:141:45:    got void *
> > > qcom_q6v5_pas.c:637:25: warning: incorrect type in assignment (different address spaces)
> > > qcom_q6v5_pas.c:637:25:    expected void *mem_region
> > > qcom_q6v5_pas.c:637:25:    got void [noderef] __iomem *
> > > qcom_q6v5_pas.c:654:29: warning: incorrect type in assignment (different address spaces)
> > > qcom_q6v5_pas.c:654:29:    expected void *dtb_mem_region
> > > qcom_q6v5_pas.c:654:29:    got void [noderef] __iomem *
> > > qcom_wcnss.c:540:27: warning: incorrect type in assignment (different address spaces)
> > > qcom_wcnss.c:540:27:    expected void *mem_region
> > > qcom_wcnss.c:540:27:    got void [noderef] __iomem *
> > > 
> > > Fix this by annotating the struct fields with __iomem to correctly
> > > reflect the address space of the underlying mapping.
> > > 
> > > These regions are subsequently passed to qcom_mdt_load(),
> > > qcom_mdt_load_no_init() and qcom_mdt_pas_load(), all of which take
> > > void * and use plain memcpy()/memset() internally to write firmware
> > > segments into the region. This is intentional and safe: the mappings
> > > are write-combining (WC), which on arm64 permits bulk CPU stores
> > > without requiring the memcpy_toio()/memset_io() accessors. Changing
> > > the MDT loader API to accept void __iomem * would be a more invasive
> > > change and would affect callers.
> > 
> > Zooming out a bit more, should we even be ioremapping these regions
> > in the first place? Are they not just RAM/Normal Memory in arm parlance?
> 
> Yes, ioremap may not be required. Don't know why it was kept in the
> initial implementation, as for most Qualcomm SoCs this is going to be
> normal RAM and not SRAM or something, while other implementations like
> qcom_q6v5_mss still use memremap with MEMREMAP_WC.
> 
> > 
> > Would switching to devm_memremap(, MEMREMAP_WC) (like we do in RMTFS
> > today) be an even better solution here?
> 
> This looks fine and I do not see any immediate impact; however, I would
> like to hear from Bjorn on this, if there is any history..

Bjorn,

I was looking for your view on this before I work on its
revision.

-- 
-Mukesh Ojha
