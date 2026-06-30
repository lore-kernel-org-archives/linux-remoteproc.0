Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DBC23FBB72
	for <linux-remoteproc@vger.kernel.org>; Tue, 30 Jun 2026 11:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782818110; cv=none; b=PkpCsQFpzGAqxP7NvuriaPsvGmjSRLg+dcr5epOz9hTENczke7bxXKL6ZqsOVO1KH9i5JcJKV+LbITV8WSBlA2DeAeHi8xyBCJsOFMhXwegdgMLipI7JXQucwrpku0uq/6uYD0iiY4ShDAk/3vWxkl92Wn/QLUE++ot8KC2pQQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782818110; c=relaxed/simple;
	bh=7NL/V1SsEEcWKSm+JySMjBwNLAfTuRvaVXdqxtgovWA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bWOe2nNJ+4rUoUY7/sv1PXVZ8TQsYG1zhus1wpPqorSKPK0t4XTtexngfHMfLF08F/ZmzLl9pBSRyFM5fwrbpIhHFf3rKL2jYXHi1DzsAPzrftAHoEbNd6Wx3HnYeHBy+AOmLvOwsUN03cLN0CcwZgTr2XSnuXDqnEhXYRxYkR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ov4UA8+0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M24rmP8t; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ov4UA8+0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M24rmP8t"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9mxDg1604773
	for <linux-remoteproc@vger.kernel.org>; Tue, 30 Jun 2026 11:15:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A2niZoUyL87/GipTAKtDhFFkWKTWM1CnEJqXzl+Bo9k=; b=Ov4UA8+0az/3k522
	DWPGh4nVrJ8pg0FI7rRtes2sGZuM7rSAk6sdUEBWtgwBCjdbAKI+aKBVUxGeOrvN
	rBC+Ak2yfmhutJZt2vXhme3s3XwrZgWEZbk+KhqGIFag1DoMDzRo243F89wUSIGZ
	ewCBiWz/X72JgaaaRZvgJFhaKBSiP50ndSnaoLGNtuLFExEmMKlZeMg6zKWJ1Jmn
	qYT1d9QLZ7/9VLoC8avHcholf9rWqxRhfohczxfu7uP83Ot9yC27c0AFq7i5nn21
	4PilovXly75h4+XgzdXtWSGBmjhzvebhRn8Or/5ZaOu2u/g1jRVYfcPP3LQ1iVjt
	q2USNg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f462fhvy1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 30 Jun 2026 11:15:06 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30eec544cc2so661914eec.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 30 Jun 2026 04:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782818106; x=1783422906; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=A2niZoUyL87/GipTAKtDhFFkWKTWM1CnEJqXzl+Bo9k=;
        b=M24rmP8t1mUXxDmUbSIAurKEWBPDF0pVVsluBLGpRNm4/b9C6Vrd/YfO1cfSKgktyk
         L+c8vRV+cPeuPRAdrgDb+Mu0/Bm4pmLGoHpS3kt/b9WpucVSPtHl8Pu+X5sZr7M/fG/2
         9B0KlgCMuPC0T214lr8DPhkiWBvzoLN1izdqKVoXOKgFwrfQSnC7JrQ4HOQ2WsAE5Ng3
         JxbUv3qGFvntrY6HuHh7FyWpxPD57DTnweKdNewXi2KiBzlYemn9iu9ODGq7qWcAIwUR
         N/sSmsQdVeJPgz4hHnN8LsV14bkwaZ+Vdpg1AIySushNogzpZbOy3YMvjW5kVqbnq9vp
         Y8xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782818106; x=1783422906;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A2niZoUyL87/GipTAKtDhFFkWKTWM1CnEJqXzl+Bo9k=;
        b=Eq8XkIawA4Urxw6thQzbkysjSYye+cvHJriqr/LhabUFQ1H+4sl0Qq3Se2trh/DWmI
         3cC90F7pBQaoYp6CGUMxIro5pHnBzjvSHyk75BJUlSmVk/ZzDlrIaLGQdCQVbLHsXvsZ
         2qvSsXKZd2a0OXuvRO5TbrWIYNr744WiCy/CWI7PmuMD+ljoFcU95R3TpZtR8ses5WPP
         j/qdXFf1j/71lyGIRoGaWEaghglmz+SIIgssT954+5/d7qupspDcYE811SZO3/K23fWg
         Ww2GVNKzMLVKorxYC8UFVGg18kcVnNRnUknFuWOmcmEmHvPqrmEe4MSgA8DvaHNrojIR
         XmqQ==
X-Forwarded-Encrypted: i=1; AHgh+RpV6Aa2elywRrnZYfpWeV1aeHZaw8iM7GiC/x0uwIpzcqfK/W5G+29kEufOEXF1j4zyWIFark/agWJq6mYZoXbC@vger.kernel.org
X-Gm-Message-State: AOJu0YzlsTPwxLKewO6l5qBrUHHs1MuPA3Z+q7JSgLVmQwVJ7BqVbdA2
	9l+NBzQeJWhxAghCisonL9xkwvkamqkZLEHDPMusDCsQEslNJ5C5tkySlsq2UkrrrWuHtNZAjeZ
	tj9VFLtIr0jYEyACawYf1QJNjjYZUQUKecpa8kipkaP/Bume/0Hgdw8gTyq7hLnds1ubQveKx
X-Gm-Gg: AfdE7cmctfmftgCKelDg7d4rHdWDkvJr70XYfOlXK2DrR2hT4rQ38pEG4GcBU5Ndfbd
	9sdDjjSsD0W3Er/gRMUfiEiSCXYc4U/Oqn1r631GQvj1sop7lnzqo4Bv2wlXp06lSdzKwTPecWG
	PeAJ4jxt7uCGuG45pc66vsdSbT/ua8UvlxUk5bpo5cv0Mk5A2W2/vyMfH45MtB4HUVpKF7zgQfE
	pvB8hdeDfQTxbwx16DUGMC//tOER1/Oll8+T+0O6J1BSzQrDlnWhDOpn5R6FZKn/cGQA+WoCJop
	/FTZJN5i46vIANzws7QRHJUkfzVTX5cQ3LN45XzLWi6LX1KSutCVy72i3WSP9nJH5Hj3FYyecoV
	JHb5IFbvPTc7dTR3fXLaF28IeosAVqcCyQGROBw==
X-Received: by 2002:a05:7301:1010:b0:30c:536e:3a95 with SMTP id 5a478bee46e88-30ef080049amr146026eec.2.1782818105673;
        Tue, 30 Jun 2026 04:15:05 -0700 (PDT)
X-Received: by 2002:a05:7301:1010:b0:30c:536e:3a95 with SMTP id 5a478bee46e88-30ef080049amr145988eec.2.1782818105008;
        Tue, 30 Jun 2026 04:15:05 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ee2f5ed29sm8004479eec.1.2026.06.30.04.15.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 04:15:04 -0700 (PDT)
Date: Tue, 30 Jun 2026 16:44:59 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v4 6/6] firmware: qcom: scm: introduce keep_mdt_buf flag
 in PAS context
Message-ID: <20260630111459.x65njyw2bgx2tihn@hu-mojha-hyd.qualcomm.com>
References: <20260430191253.4052025-1-mukesh.ojha@oss.qualcomm.com>
 <20260430191253.4052025-7-mukesh.ojha@oss.qualcomm.com>
 <1c5c6399-e4cb-4d33-8fb7-fdfde0b33e19@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1c5c6399-e4cb-4d33-8fb7-fdfde0b33e19@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDEwMyBTYWx0ZWRfX9j6yvKmCrtQb
 bZPq6/+0YNRvlpFc+oPfDsgRE9hpu4ETezMDNEuPD/c3eGxh3d06vX6Z/caR8Ac4rUHPArnuCH1
 wCvk2PjciAwkI4e92bNKwlbHvxuEfOV+kUCpiYnGfQ8bWcot7wXmqSQY0QSufZBINJGUk9AEpWN
 w+99dhivhjJoqq19sA4p1PMKO4asvYC1+RX0cP9r+HWFCDGJD0j9gk5PYweQvkRiis05XQgQRnH
 CnVjxL7gXrdr0g36M7LVhB1zzNhGzuoM28kR6ndwJH8Bfo2fAl0eB1EMDyN3t2aOACwqcIW1Qz+
 UtbecfGqpfGSuFVpIUHRs+0EMWRMwQgPwoU2cky9TPHeUIDRs2ONJyWD9HdpGiliwH1Bn7kbWQh
 1q0FBJYGuel2hQv5gFvdjqM67wD/8NP22CmPIWr0H0Lsx6P+S/mn5JcAwFUPaTTADDXGrneOrVj
 9Xbh9ucVHWYLkvnZ4Hg==
X-Proofpoint-ORIG-GUID: f-EAXXgF345YgqeI6pVH924FLOD35vpT
X-Authority-Analysis: v=2.4 cv=JqbBas4C c=1 sm=1 tr=0 ts=6a43a53a cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=bRAfPhM_wZvex4AwAJ4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: f-EAXXgF345YgqeI6pVH924FLOD35vpT
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDEwMyBTYWx0ZWRfX8R2I+lB0A+BU
 NfZ6s5k6XHUCQCXMGxzUwyeEUkAR2wOs7v8W+rr3ddFmeRmHz8HR6msiSTB8yJlXgwxVXXFgagO
 +3aeLfhLfLsfh2Fu8WB6ojSB+rk8R/Y=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 bulkscore=0 adultscore=0 impostorscore=0
 suspectscore=0 phishscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300103

On Tue, Jun 30, 2026 at 12:39:12PM +0200, Konrad Dybcio wrote:
> On 4/30/26 9:12 PM, Mukesh Ojha wrote:
> > The PAS image initialization path always retains the metadata buffer
> > when a valid qcom_scm_pas_context is provided, even if the caller does
> > not require it. This implicit behavior leads to unclear buffer ownership
> > and forces new users of qcom_mdt_pas_load() to manually release
> > metadata, which is error‑ prone and incorrect.
> > 
> > Add a keep_mdt_buf flag to struct qcom_scm_pas_context to make metadata
> > retention explicit.  Metadata buffers are now freed by default and are
> > only preserved when this flag is set. qcom_q6v5_pas enables this during
> > probe for contexts that require retained metadata for subsequent PAS
> > operations, while existing callers continue to work unchanged.
> > 
> > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > ---
> 
> [...]
> 
> >  	ret = __qcom_scm_pas_init_image(pas_id, mdata_phys, &res);
> > -	if (ret < 0 || !ctx) {
> > +
> > +	/*
> > +	 * Some clients still pass the PAS context as NULL. Until all clients
> > +	 * switch to qcom_mdt_pas_load() and provide a valid PAS context, check
> > +	 * for NULL before dereferencing it.
> > +	 *
> > +	 * When a valid context is provided, metadata handling differs across
> > +	 * clients. For example, modem clients pass metadata to TrustZone that
> > +	 * must not be freed until the authentication and reset SMCs are
> > +	 * invoked, as the buffers remain locked until then.
> > +	 *
> > +	 * Other clients free their metadata immediately after the PAS_INIT
> > +	 * SMC call. Therefore, keep_mdt_buf should be set to true for modem
> > +	 * clients and false for others.
> 
> You say this...
> 
> [...]
> 
> > --- a/drivers/remoteproc/qcom_q6v5_pas.c
> > +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> > @@ -669,6 +669,7 @@ static int qcom_pas_alloc_memory_region(struct qcom_pas *pas)
> >  		return PTR_ERR(pas->pas_ctx);
> >  
> >  	pas->pas_ctx->use_tzmem = rproc->has_iommu;
> > +	pas->pas_ctx->keep_mdt_buf = true;
> >  	if (!pas->dtb_pas_id)
> >  		return 0;
> >  
> > @@ -688,6 +689,7 @@ static int qcom_pas_alloc_memory_region(struct qcom_pas *pas)
> >  		return PTR_ERR(pas->dtb_pas_ctx);
> >  
> >  	pas->dtb_pas_ctx->use_tzmem = rproc->has_iommu;
> > +	pas->dtb_pas_ctx->keep_mdt_buf = true;
> 
> And you set it globally for all PAS rprocs

You are right, but in the upstream Qualcomm PAS driver as of
today, we do not differentiate the freeing of the metadata region
among various subsystems — ADSP, CDSP, MPSS — and it is true for
all: release metadata only once auth and reset is successful. And
I see no side effect even if you delay the metadata release from
PAS init to after auth and reset(). But all the non-remoteproc
subsystems like IRIS, IPA, etc., have their metadata released
right after a successful or failed PAS init call.

I could refine the above comment to reflect what is there today
in upstream.

-- 
-Mukesh Ojha
